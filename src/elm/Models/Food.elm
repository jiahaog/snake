module Models.Food exposing (Food, foodGenerator)

import Random
import Models.Geometry exposing (Coordinate, randomCoordinate)


type alias Food =
    Coordinate


foodGenerator : Random.Generator Coordinate
foodGenerator =
    randomCoordinate
