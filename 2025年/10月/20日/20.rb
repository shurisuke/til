# views/admin/articles/edit.html.slim

= content_for 'scripts' do
    = javascript_include_tag 'edit_article' # ← これが scripts に差し込まれる


# layouts/admin.html.slim（レイアウト側）

...
= yield 'scripts'

✅ content_for 'scripts' で指定された内容（JSタグなど）がここに出力される。



# edit_article.js

require('./articleBlockEditor')

# Webpackが自動的に、同ディレクトリ内の articleBlockEditor/index.js を読み込む。


# articleBlockEditor/index.js

import React from 'react'
import { render } from 'react-dom'
import Editor from './editor'

(function ($, undefined) {
  $.fn.articleBlockEditor = function () {
    this.each((i, elm) => {
      const editorBody = elm.querySelector('.editor-body')
      const textarea = elm.querySelector('textarea')

      const onChange = value => {
        textarea.value = value
      }

      render(
        <Editor
          value={textarea.value}
          onChange={onChange}
        />,
        editorBody
      )
    })
  }
})(jQuery)

# jQuery.fn.articleBlockEditor を定義し、Reactエディタを textarea の横に描画。
# ./editor.js を import して利用している。


#editor.js（Reactコンポーネント）

import React, { Component } from 'react'
import PropTypes from 'prop-types'
import RichTextEditor from 'react-rte'

export default class Editor extends Component {
  static propTypes = {
    value: PropTypes.string,
    onChange: PropTypes.func
  }

  constructor (props) {
    super(props)
    this.state = {
      value: RichTextEditor.createValueFromString(props.value, 'html')
    }
  }

  onChange = (value) => {
    this.setState({ value })
    if (this.props.onChange) {
      this.props.onChange(value.toString('html'))
    }
  }

  render () {
    return (
      <RichTextEditor
        value={this.state.value}
        onChange={this.onChange}
        toolbarConfig={...}
      />
    )
  }