module Config exposing (config)

import Array


config =
    { xSize = 5, ySize = 5, dimensions = 2, initialSnakeLength = 2, boundsArray = Array.fromList [ 5, 5 ] }
