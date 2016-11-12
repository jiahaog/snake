import './../../node_modules/normalize.css/normalize.css'
import './styles/styles.css';

import Elm from './../elm/Main.elm';
import ZingTouch from 'zingtouch';

const DIRECTIONS = {
  up: 'up',
  right: 'right',
  down: 'down',
  left: 'left'
}

const container = document.getElementById('main');

const app = Elm.Main.embed(container);

const inRange = (number, lowerBound, upperBound) => {
  return number >= lowerBound && number < upperBound;
};

const touchRegion = new ZingTouch.Region(document.body, false, false);

touchRegion.bind(container, 'swipe', (event) => {
  // offset by 45 so we just deal with multiples of 90
  const angle = (event.detail.data[0].currentDirection + 45) % 360;

  let swipeDirection;

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
