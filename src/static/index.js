require('./../../node_modules/normalize.css/normalize.css')
require('./styles/styles.css');

var Elm = require('./../elm/Main.elm');
var ZingTouch = require('zingtouch');

var DIRECTIONS = {
  up: 'up',
  right: 'right',
  down: 'down',
  left: 'left'
}

var container = document.getElementById('main');

var app = Elm.Main.embed(container);

function inRange(number, lowerBound, upperBound) {
  return number >= lowerBound && number < upperBound;
}

var zt = new ZingTouch.Region(document.body);
zt.bind(container, 'swipe', function(event){
  // offset by 45 so we just deal with multiples of 90
  var angle = (event.detail.data[0].currentDirection + 45) % 360;

  var swipeDirection;

  if (inRange(angle, 0, 90)) {
    swipeDirection = DIRECTIONS.right;
  } else if (inRange(angle, 90, 180)) {
    swipeDirection = DIRECTIONS.up;
  } else if (inRange(angle, 180, 270)) {
    swipeDirection = DIRECTIONS.left;
  } else {
    swipeDirection = DIRECTIONS.down;
  }

  app.ports.swipePort.send(swipeDirection);
});
