module Actions.Message exposing (Message(..))

import Models.Direction exposing (Direction)
import Models.Food exposing (Food)
import Models.Geometry exposing (Coordinate)


type Message
    = Default
    | StartGame
    | GenerateSnake ( Coordinate, Direction )
    | GenerateFood Food
    | TimeStep
    | NewDirection Direction