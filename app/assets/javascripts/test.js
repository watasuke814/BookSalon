var option = {
  section : '.js-section', // 対象を指定
  easing: "swing", // イージングをしてい(jQueryのanimation)
  scrollSpeed: 600, // スクロール時の速度
  scrollbars: true, // スクロールバーを表示するか
};

$(function() {
  $.scrollify(option); // scrollifyの実行
});
