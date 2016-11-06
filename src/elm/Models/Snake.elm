module Models.Snake exposing (Snake, newSnake, moveSnake)

import Set
import Models.Direction exposing (Direction, randomDirection)
import Models.Food exposing (Food)
import Models.Geometry exposing (Coordinate, coordinateOffset, randomCoordinateOffset, maybeWrapAroundOutsideCoordinate)
import Actions exposing (Msg(..), generateFood)


type alias Snake =
    List Coordinate


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


moveSnake : Direction -> Food -> Snake -> ( Snake, Cmd Msg )
moveSnake direction food snake =
    snake
        |> growSnake direction
        |> (\snake ->
                if snakeHeadOnFood food snake then
                    ( snake, generateFood )
                else
                    ( removeSnakeTail snake, Cmd.none )
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
