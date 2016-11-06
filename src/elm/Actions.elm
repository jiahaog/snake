module Actions exposing (Msg(..))

import Models.Direction exposing (Direction)
import Models.Food exposing (Food)
import Models.Snake exposing (SnakeInitData)


type Msg
    = Default
    | StartGame
    | GenerateSnake SnakeInitData
    | GenerateFood Food
    | TimeStep
    | NewDirection Direction
