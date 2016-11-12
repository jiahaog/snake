module Actions.GenerateSnake exposing (generateSnake)

import Random exposing (Generator)
import Actions.Message exposing (Message(GenerateSnake))
import Config
import Models.Geometry exposing (Coordinate, randomCoordinateOffset)


randomSnakeInitCoordinate : Generator Coordinate
randomSnakeInitCoordinate =
    randomCoordinateOffset (Config.initialSnakeLength - 1)


generateSnake : Cmd Message
generateSnake =
    Random.generate GenerateSnake randomSnakeInitCoordinate
