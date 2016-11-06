module Models.Grid exposing (Grid, GridObject(..), gridWithSnakeAndFood)

import Models.Snake exposing (Snake)
import Models.Food exposing (Food)
import Set


type alias Grid =
    List (List GridObject)


type GridObject
    = Empty
    | SnakeCell
    | FoodCell


gridWithSnakeAndFood : Grid -> Snake -> Food -> Grid
gridWithSnakeAndFood grid snake food =
    let
        snakeSet =
            Set.fromList snake

        foodSet =
            Set.singleton food
    in
        List.indexedMap
            (\yIndex row ->
                List.indexedMap
                    (\xIndex cell ->
                        if Set.member [ xIndex, yIndex ] snakeSet then
                            SnakeCell
                        else if Set.member [ xIndex, yIndex ] foodSet then
                            FoodCell
                        else
                            Empty
                    )
                    row
            )
            grid
