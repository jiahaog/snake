module Actions exposing (Msg(..))

import Models.Snake exposing (SnakeInitData)
import Models.Geometry exposing (Direction)


type Msg
    = Default
    | StartGame
    | GenerateSnake SnakeInitData
    | MoveSnake Direction
