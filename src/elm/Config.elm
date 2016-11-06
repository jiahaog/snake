module Config exposing (..)

import Array


xSize : Int
xSize =
    5


ySize : Int
ySize =
    5


dimensions : Int
dimensions =
    2


boundsArray : Array.Array Int
boundsArray =
    Array.fromList [ xSize, ySize ]


initialSnakeLength : Int
initialSnakeLength =
    2
