const webpack = require('webpack');
const HtmlWebpackPlugin = require('html-webpack-plugin');
const path = require('path');

module.exports = {
  context: __dirname + '/src',
  entry: {
    app: './app.js',
  },
  output: {
    filename: '[name].bundle.js',
    path: __dirname + '/dist'
  },
  devServer: {
    contentBase: __dirname + '/src',
  },
  module: {
    noParse: /\.elm$/,
    rules : [
      {
        test: /\.elm$/,
        use: ['elm-hot', 'elm-webpack'],
      },
      {
        test: /\.css$/,
        use: ["style-loader", "css-loader"],
      }
    ],
  },

  plugins: [
    new HtmlWebpackPlugin({
      template: 'index.tpl.html',
      inject: 'body',
      filename: 'index.html'
    })
  ]
}
