# medium.image_url(:lg)のエラー対応の参考コード

.media-image
    = image_tag medium.image_url(:lg)

## image_url生成時にnilを返してエラーが出ないように、安全な分岐処理に変更

.media-image
  - if medium.image_url(:lg).present?
    = image_tag medium.image_url(:lg)