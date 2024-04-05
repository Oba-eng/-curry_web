<<<<<<< HEAD
const { environment } = require('@rails/webpacker');
const webpack = require('webpack');

// エントリーポイントの設定
environment.entry.prepend('application', './app/assets/javascripts/packs/application.js');
environment.entry.prepend('application', './app/assets/javascripts/application.js');

// jQueryのプラグインを追加
=======
const { environment } = require('@rails/webpacker')
const webpack = require('webpack')

// ProvidePluginを追加
>>>>>>> bd3727c4ebfd5de6a15a5430f43aca8b26bbe085
environment.plugins.prepend('Provide',
    new webpack.ProvidePlugin({
        $: 'jquery/src/jquery',
        jQuery: 'jquery/src/jquery'
    })
);

<<<<<<< HEAD
module.exports = environment;
=======
environment.entry.set('application', './app/assets/javascripts/application.js')

module.exports = environment
>>>>>>> bd3727c4ebfd5de6a15a5430f43aca8b26bbe085
