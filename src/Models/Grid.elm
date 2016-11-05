module Models.Grid exposing (Grid, GridObject(..), gridWithSnake)

import Models.Snake exposing (Snake)
import Set


type alias Grid =
    List (List GridObject)


type GridObject
    = Empty
    | SnakeCell
    | Food


gridWithSnake : Grid -> Snake -> Grid
gridWithSnake grid snake =
    let
        snakeSet =
            Set.fromList snake
    in
        List.indexedMap
            (\yIndex row ->
                List.indexedMap
                    (\xIndex cell ->
                        if Set.member [ xIndex, yIndex ] snakeSet then
                            SnakeCell
                        else
                            Empty
                    )
                    row
            )
            grid
