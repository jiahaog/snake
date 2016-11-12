module Config exposing (..)

import Array exposing (Array)
import Time exposing (Time)


xSize : Int
xSize =
    16


ySize : Int
ySize =
    18


boundsArray : Array Int
boundsArray =
    Array.fromList [ xSize, ySize ]


initialSnakeLength : Int
initialSnakeLength =
    2


timeInterval : Time
timeInterval =
    100
