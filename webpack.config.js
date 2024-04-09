module.exports = {
  entry: {
    application: './app/javascript/packs/application.js',
    menus: './app/javascript/packs/menus.js',
  },
  module: {
    rules: [
      {
        test: /\.(js|jsx)$/,
        exclude: /node_modules/,
        use: {
          loader: 'babel-loader',
        },
      },
      // 他のローダーの設定...
    ],
  },
};
