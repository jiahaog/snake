require('./styles/styles.css');

var Elm = require('./../elm/Main.elm');

var container = document.getElementById('main');

Elm.Main.embed(container);
