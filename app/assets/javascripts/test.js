$(document).on('turbolinks:load', function() {

    if ($(".section").length) { // そのページにboxクラスの要素が存在するならscrollifyを有効にする
      $.scrollify.enable();
      $.scrollify({
        section: ".section",
        // 各設定
      });

    } else { // 存在しないなら無効化する
      $.scrollify.disable();
    }

  });
