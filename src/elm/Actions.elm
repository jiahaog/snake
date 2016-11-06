module Actions exposing (generateFood, generateSnake)

import Random exposing (Generator)
import Config
import Actions.Message exposing (Message(GenerateFood, GenerateSnake))
import Models.Direction exposing (Direction, randomDirection)
import Models.Food exposing (Food, foodGenerator)
import Models.Geometry exposing (Coordinate, randomCoordinateOffset)


generateFood : Cmd Message
generateFood =
    Random.generate GenerateFood foodGenerator


randomSnakeInitCoordinate : Generator Coordinate
randomSnakeInitCoordinate =
    randomCoordinateOffset (Config.initialSnakeLength - 1)


snakeInitGenerator : Generator ( Coordinate, Direction )
snakeInitGenerator =
    Random.map2 (,) randomSnakeInitCoordinate randomDirection


generateSnake : Cmd Message
generateSnake =
    Random.generate GenerateSnake snakeInitGenerator
