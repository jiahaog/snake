module Actions exposing (Msg(..), generateFood, generateSnake)

import Random exposing (Generator)
import Config
import Models.Direction exposing (Direction, randomDirection)
import Models.Food exposing (Food, foodGenerator)
import Models.Geometry exposing (Coordinate, randomCoordinateOffset)


type Msg
    = Default
    | StartGame
    | GenerateSnake ( Coordinate, Direction )
    | GenerateFood Food
    | TimeStep
    | NewDirection Direction


generateFood : Cmd Msg
generateFood =
    Random.generate GenerateFood foodGenerator


randomSnakeInitCoordinate : Generator Coordinate
randomSnakeInitCoordinate =
    randomCoordinateOffset (Config.initialSnakeLength - 1)


snakeInitGenerator : Generator ( Coordinate, Direction )
snakeInitGenerator =
    Random.map2 (,) randomSnakeInitCoordinate randomDirection


generateSnake : Cmd Msg
generateSnake =
    Random.generate GenerateSnake snakeInitGenerator
