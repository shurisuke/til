# build_body メソッドにおける nil 安全対策の実装

def build_body(controller)
    result = ''
  
    article_blocks.each do |article_block|
      if article_block.sentence?
        sentence = article_block.blockable
        next if sentence.body.nil?
        result << sentence.body
      elsif article_block.medium?
        medium = ActiveDecorator::Decorator.instance.decorate(article_block.blockable)
        result << controller.render_to_string("shared/_media_#{medium.media_type}", locals: { medium: medium }, layout: false)
      elsif article_block.embed?
        embed = ActiveDecorator::Decorator.instance.decorate(article_block.blockable)
        result << controller.render_to_string("shared/_embed_#{embed.embed_type}", locals: { embed: embed }, layout: false)
      end
    end
  
    result
  end