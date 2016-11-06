module Actions exposing (Msg(..))

import Models.Snake exposing (SnakeInitData)
import Models.Food exposing (Food)
import Models.Direction exposing (Direction)


type Msg
    = Default
    | StartGame
    | GenerateSnake SnakeInitData
    | GenerateFood Food
    | TimeStep
    | NewDirection Direction
