module Actions.Message exposing (Message(..), messageToCmd)

import Task
import Models.Direction exposing (Direction)
import Models.Food exposing (Food)
import Models.Geometry exposing (Coordinate)


type Message
    = Default
    | NewGame
    | GenerateSnake Coordinate
    | GenerateFood Food
    | TimeStep
    | NewDirection Direction
    | GameOver


messageToCmd : Message -> Cmd Message
messageToCmd message =
    Task.perform (always message) (always message) (Task.succeed ())
