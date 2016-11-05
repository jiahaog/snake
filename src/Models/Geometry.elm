module Models.Geometry exposing (Coordinate, Direction(..), randomSnakeInitCoordinate, coordinateOffset)

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
    config.xSize
        |> Random.int offset
        |> Random.list config.dimensions


randomSnakeInitCoordinate : Random.Generator Coordinate
randomSnakeInitCoordinate =
    randomCoordinateOffset config.initialSnakeLength


randomCoordinate : Random.Generator Coordinate
randomCoordinate =
    randomCoordinateOffset 0


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
        Up ->
            coordinateUp

        Right ->
            coordinateRight

        Down ->
            coordinateDown

        Left ->
            coordinateLeft
