module Models.Grid exposing (Grid, GridObject(..), updateGrid, foodOverlapsSnake)

import Set
import Models.Food exposing (Food)
import Models.Snake exposing (Snake)


type alias Grid =
    List (List GridObject)


type GridObject
    = Empty
    | SnakeCell
    | FoodCell


updateGrid : Grid -> Snake -> Food -> Grid
updateGrid grid snake food =
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


foodOverlapsSnake : Snake -> Food -> Bool
foodOverlapsSnake snake food =
    Set.fromList snake
        |> Set.member food
