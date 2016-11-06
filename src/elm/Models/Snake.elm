module Models.Snake exposing (Snake, newSnake, moveSnake, coordinateOverlapsSnake)

import Set
import Models.Direction exposing (Direction)
import Models.Food exposing (Food)
import Models.Geometry exposing (Coordinate, coordinateOffset, randomCoordinateOffset, maybeWrapAroundOutsideCoordinate)
import Actions.GenerateFood exposing (generateFood)
import Actions.Message exposing (Message(GameOver), messageToCmd)


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


moveSnake : Direction -> Food -> Snake -> ( Snake, Cmd Message )
moveSnake direction food snake =
    snake
        |> growSnake direction
        |> (\snake ->
                if snakeHeadOnSelf snake then
                    ( snake, messageToCmd GameOver )
                else if snakeHeadOnFood food snake then
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


withoutSnakeHead : Snake -> Snake
withoutSnakeHead snake =
    snake
        |> List.tail
        |> Maybe.withDefault []


snakeHeadOnSelf : Snake -> Bool
snakeHeadOnSelf snake =
    snake
        |> getSnakeHead
        |> coordinateOverlapsSnake (withoutSnakeHead snake)


coordinateOverlapsSnake : Snake -> Coordinate -> Bool
coordinateOverlapsSnake snake coordinate =
    Set.fromList snake
        |> Set.member coordinate
