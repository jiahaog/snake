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
    randomCoordinateOffset (config.initialSnakeLength - 1)


snakeInitGenerator : Generator SnakeInitData
snakeInitGenerator =
    Random.map2 (,) randomSnakeInitCoordinate randomDirection


newSnake : Coordinate -> Direction -> Snake
newSnake head direction =
    growSnake direction [ head ]


maybeGrowSnake : Snake -> (Coordinate -> Coordinate) -> Maybe Coordinate -> Snake
maybeGrowSnake snake whereToPut maybeHead =
    case maybeHead of
        Just head ->
            (::) (whereToPut head) snake

        Nothing ->
            []


growSnake : Direction -> Snake -> Snake
growSnake direction snake =
    List.head snake
        |> maybeGrowSnake snake (coordinateOffset direction)


maybeWithoutTail : Maybe Snake -> Snake
maybeWithoutTail maybeSnake =
    case maybeSnake of
        Just withoutTail ->
            List.reverse withoutTail

        Nothing ->
            []


removeSnakeTail : Snake -> Snake
removeSnakeTail snake =
    snake
        |> List.reverse
        |> List.tail
        |> maybeWithoutTail


moveSnake : Direction -> Snake -> Snake
moveSnake direction snake =
    snake
        |> removeSnakeTail
        |> growSnake direction
