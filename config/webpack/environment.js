//  const{ environment } = require('@rails/webpacker')
 
//  const webpack = require('webpack')
// environment.plugins.prepend('Provide',
//     new webpack.ProvidePlugin({
//         $: 'jquery/src/jquery',
//         jQuery: 'jquery/src/jquery'
//     })
// )
// module.exports = environment


  // jquery: 'jquery',
  // 'window.jQuery': 'jquery',
  // Popper: ['popper.js', 'default']

// const { environment } = require('@rails/webpacker')

// const webpack = require('webpack')
// environment.plugins.prepend('Provide', new webpack.ProvidePlugin({
//   $: 'jquery/src/jquery',
//   jQuery: 'jquery/src/jquery',
//   jquery: 'jquery',
//   'window.jQuery': 'jquery',
//   Popper: ['popper.js', 'default']
// }))

// module.exports = environment

const webpack = require('webpack')
environment.plugins.prepend(
  'Provide',
  new webpack.ProvidePlugin({
    $: 'jquery/src/jquery',
    jQuery: 'jquery/src/jquery'
  })
)