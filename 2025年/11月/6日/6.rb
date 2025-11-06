# Swiperの導入方法（基本）
###CDNから導入する方法
#####CSSとJSをそれぞれCDNで読み込む。
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css">
<script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>

### JavaScriptでSwiperを初期化する
##### ページ読み込み後に以下のコードを実行してSwiperを起動。
const swiper = new Swiper('.swiper', {
  loop: true,
  pagination: {
    el: '.swiper-pagination',
  },
  navigation: {
    nextEl: '.swiper-button-next',
    prevEl: '.swiper-button-prev',
  },
});