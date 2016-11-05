module Actions exposing (Msg(..))

import Models.Geometry exposing (Coordinate)


type Msg
    = Default
    | StartGame
    | GenerateSnake Coordinate
