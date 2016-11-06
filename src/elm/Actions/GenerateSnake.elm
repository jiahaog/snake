module Actions.GenerateSnake exposing (generateSnake)

import Random exposing (Generator)
import Actions.Message exposing (Message(GenerateSnake))
import Config
import Models.Direction exposing (Direction, randomDirection)
import Models.Geometry exposing (Coordinate, randomCoordinateOffset)


randomSnakeInitCoordinate : Generator Coordinate
randomSnakeInitCoordinate =
    randomCoordinateOffset (Config.initialSnakeLength - 1)


snakeInitGenerator : Generator ( Coordinate, Direction )
snakeInitGenerator =
    Random.map2 (,) randomSnakeInitCoordinate randomDirection


generateSnake : Cmd Message
generateSnake =
    Random.generate GenerateSnake snakeInitGenerator
