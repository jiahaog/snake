const webpack = require('webpack');
const HtmlWebpackPlugin = require('html-webpack-plugin');
const path = require('path');

module.exports = {
  context: __dirname + '/src',

  entry: {
    app: './static/index.js',
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
        test: /\.js$/,
        use: ['babel-loader']
      },
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
      template: 'static/index.tpl.html',
      inject: 'body',
      filename: 'index.html'
    })
  ]
}
