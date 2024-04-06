const path = require('path');

module.exports = {
  entry: './app/assets/javascripts/packs/application.js', // エントリーポイントのパスを設定
  output: {
    filename: 'bundle.js', // バンドルされたJavaScriptファイルの名前
    path: path.resolve(__dirname, 'public/js'), // バンドルされたJavaScriptファイルの出力先ディレクトリ
  },
  module: {
    rules: [
      // ローダーの設定などが必要であればここに記述
    ],
  },
  // プラグインやその他の設定が必要であればここに記述
};
