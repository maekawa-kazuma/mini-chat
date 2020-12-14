const { environment } = require('@rails/webpacker')

// jqueryの導入
const webpack = require('webpack');

environment.plugins.append('Provide',
  new webpack.ProvidePlugin({
    $: 'jquery/src/jquery',
    jQuery: 'jquery/src/jquery'
  })
);

// jqueryの導入おわり

module.exports = environment
