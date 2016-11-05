module Models.Snake exposing (Snake, SnakeInitData, newSnake, snakeInitGenerator)

import Random exposing (Generator)
import Config exposing (config)
import Models.Geometry exposing (Coordinate, Direction, coordinateOffset, randomCoordinateOffset, randomDirection)


type alias Snake =
    List Coordinate


type alias SnakeInitData =
    ( Coordinate, Direction )


randomSnakeInitCoordinate : Random.Generator Coordinate
randomSnakeInitCoordinate =
    randomCoordinateOffset config.initialSnakeLength


snakeInitGenerator : Generator SnakeInitData
snakeInitGenerator =
    Random.map2 (,) randomSnakeInitCoordinate randomDirection


newSnake : Coordinate -> Direction -> Snake
newSnake head direction =
    growSnake [ head ] direction


maybeGrowSnake : Snake -> (Coordinate -> Coordinate) -> Maybe Coordinate -> Snake
maybeGrowSnake snake whereToPut maybeHead =
    case maybeHead of
        Just head ->
            (::) (whereToPut head) snake

        Nothing ->
            []


growSnake : Snake -> Direction -> Snake
growSnake snake direction =
    List.head snake
        |> maybeGrowSnake snake (coordinateOffset direction)
