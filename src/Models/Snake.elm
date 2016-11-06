module Models.Snake exposing (Snake, SnakeInitData, newSnake, snakeInitGenerator, moveSnake)

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


maybeCoordinate : Maybe Coordinate -> Coordinate
maybeCoordinate coordinate =
    case coordinate of
        Just coordinate ->
            coordinate

        Nothing ->
            []


growInDirection : Snake -> Direction -> Coordinate -> Snake
growInDirection snake direction head =
    (::) (coordinateOffset direction head) snake


growSnake : Direction -> Snake -> Snake
growSnake direction snake =
    List.head snake
        |> maybeCoordinate
        |> growInDirection snake direction


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
