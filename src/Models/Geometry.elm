module Models.Geometry exposing (Coordinate, Direction(..), randomDirection, randomCoordinateOffset, coordinateOffset)

import Random
import Config exposing (config)


type alias Coordinate =
    List Int


type Direction
    = Up
    | Right
    | Down
    | Left


randomCoordinateOffset : Int -> Random.Generator Coordinate
randomCoordinateOffset offset =
    (config.xSize
        -- first subtract 1 because Random.int is inclusive
        -
            1
        -- Then subtract the initial snake length away (excluding the head)
        -
            (config.initialSnakeLength - 1)
    )
        |> Random.int offset
        |> Random.list config.dimensions


randomCoordinate : Random.Generator Coordinate
randomCoordinate =
    randomCoordinateOffset 0


randomDirection : Random.Generator Direction
randomDirection =
    Random.map
        (\n ->
            case n of
                0 ->
                    Up

                1 ->
                    Right

                2 ->
                    Down

                _ ->
                    Left
        )
        (Random.int 0 3)


coordinateUp : Coordinate -> Coordinate
coordinateUp coordinate =
    List.indexedMap
        (\index value ->
            if index == 1 then
                value + 1
            else
                value
        )
        coordinate


coordinateRight : Coordinate -> Coordinate
coordinateRight coordinate =
    List.indexedMap
        (\index value ->
            if index == 0 then
                value + 1
            else
                value
        )
        coordinate


coordinateDown : Coordinate -> Coordinate
coordinateDown coordinate =
    List.indexedMap
        (\index value ->
            if index == 1 then
                value - 1
            else
                value
        )
        coordinate


coordinateLeft : Coordinate -> Coordinate
coordinateLeft coordinate =
    List.indexedMap
        (\index value ->
            if index == 0 then
                value - 1
            else
                value
        )
        coordinate


coordinateOffset : Direction -> (Coordinate -> Coordinate)
coordinateOffset direction =
    case direction of
        -- Up and Down coordinate functions are swapped because the y axis goes downwards
        Up ->
            coordinateDown

        Right ->
            coordinateRight

        Down ->
            coordinateUp

        Left ->
            coordinateLeft
