module Actions exposing (Msg(..))

import Models.Snake exposing (SnakeInitData)
import Models.Food exposing (Food)
import Models.Geometry exposing (Direction)


type Msg
    = Default
    | StartGame
    | GenerateSnake SnakeInitData
    | GenerateFood Food
    | MoveSnake Direction
