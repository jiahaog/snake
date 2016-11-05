module Actions exposing (Msg(..))

import Models.Geometry exposing (Coordinate, Direction)


type Msg
    = Default
    | StartGame
    | GenerateSnake ( Coordinate, Direction )
