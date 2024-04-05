const { environment } = require('@rails/webpacker');
const webpack = require('webpack');

// エントリーポイントの設定
environment.entry.prepend('application', './app/assets/javascripts/packs/application.js');
environment.entry.prepend('application', './app/assets/javascripts/application.js');

// jQueryのプラグインを追加
environment.plugins.prepend('Provide',
    new webpack.ProvidePlugin({
        $: 'jquery/src/jquery',
        jQuery: 'jquery/src/jquery'
    })
);

module.exports = environment;
