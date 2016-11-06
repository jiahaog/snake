module Models.Snake exposing (Snake, SnakeInitData, newSnake, snakeInitGenerator, moveSnake)

import Random exposing (Generator)
import Config
import Models.Food exposing (Food)
import Models.Geometry exposing (Coordinate, Direction, coordinateOffset, randomCoordinateOffset, randomDirection, maybeWrapAroundOutsideCoordinate)
import Array
import Debug
import Set


type alias Snake =
    List Coordinate


type alias SnakeInitData =
    ( Coordinate, Direction )


randomSnakeInitCoordinate : Random.Generator Coordinate
randomSnakeInitCoordinate =
    randomCoordinateOffset (Config.initialSnakeLength - 1)


snakeInitGenerator : Generator SnakeInitData
snakeInitGenerator =
    Random.map2 (,) randomSnakeInitCoordinate randomDirection


newSnake : Coordinate -> Direction -> Snake
newSnake head direction =
    growSnake direction [ head ]


getSnakeHead : Snake -> Coordinate
getSnakeHead snake =
    snake
        |> List.head
        |> Maybe.withDefault []


growInDirection : Snake -> Direction -> Coordinate -> Snake
growInDirection snake direction head =
    head
        |> coordinateOffset direction
        |> maybeWrapAroundOutsideCoordinate
        |> (\newHead -> (::) newHead snake)


growSnake : Direction -> Snake -> Snake
growSnake direction snake =
    snake
        |> getSnakeHead
        |> growInDirection snake direction


removeSnakeTail : Snake -> Snake
removeSnakeTail snake =
    snake
        |> List.reverse
        |> List.tail
        |> Maybe.withDefault []
        |> List.reverse


moveSnake : Direction -> Food -> Snake -> Snake
moveSnake direction food snake =
    snake
        |> growSnake direction
        |> (\snake ->
                if snakeHeadOnFood food snake then
                    snake
                else
                    removeSnakeTail snake
           )


snakeHeadOnFood : Food -> Snake -> Bool
snakeHeadOnFood food snake =
    snake
        |> getSnakeHead
        |> (\head ->
                food
                    |> Set.singleton
                    |> Set.member head
           )
