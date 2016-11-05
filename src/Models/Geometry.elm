module Models.Geometry exposing (Coordinate, Direction(..), randomSnakeInitCoordinate, coordinateAbove)

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


coordinateAbove : Coordinate -> Coordinate
coordinateAbove coordinate =
    List.indexedMap
        (\index value ->
            if index == 1 then
                value + 1
            else
                value
        )
        coordinate
