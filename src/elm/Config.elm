module Config exposing (..)

import Array exposing (Array)
import Time exposing (Time)


xSize : Int
xSize =
    10


ySize : Int
ySize =
    10


dimensions : Int
dimensions =
    2


boundsArray : Array Int
boundsArray =
    Array.fromList [ xSize, ySize ]


initialSnakeLength : Int
initialSnakeLength =
    2


timeInterval : Time
timeInterval =
    200
