module Models.Snake exposing (Snake, newSnake)

import Random exposing (Generator)
import Config exposing (config)
import Models.Geometry exposing (Coordinate, Direction, coordinateAbove)


type alias Snake =
    List Coordinate


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
        |> maybeGrowSnake snake coordinateAbove
