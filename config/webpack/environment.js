const { environment } = require('@rails/webpacker')
const webpack = require('webpack')

// ProvidePluginを追加
environment.plugins.prepend('Provide',
    new webpack.ProvidePlugin({
        $: 'jquery/src/jquery',
        jQuery: 'jquery/src/jquery'
    })
)

environment.entry.set('application', './app/assets/javascripts/application.js')

module.exports = environment
