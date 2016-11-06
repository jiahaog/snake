module Models.Food exposing (Food, foodGenerator)

import Models.Geometry exposing (Coordinate, randomCoordinate)
import Random


type alias Food =
    Coordinate


foodGenerator : Random.Generator Coordinate
foodGenerator =
    randomCoordinate
