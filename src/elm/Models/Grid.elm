module Models.Grid exposing (Grid, GridObject(..), createGrid, updateGrid, updateGridFood, updateGridSnake)

import Set exposing (Set)
import Models.Food exposing (Food)
import Models.Geometry exposing (Coordinate)
import Models.Snake exposing (Snake)


type alias Grid =
    List (List GridObject)


type GridObject
    = Empty
    | SnakeCell
    | FoodCell


createRows : Int -> List GridObject
createRows xSize =
    1
        |> List.repeat xSize
        |> List.map (\n -> Empty)


createGrid : Int -> Int -> List (List GridObject)
createGrid xSize ySize =
    List.map (\n -> createRows xSize) [1..ySize]


updateGridFromSet : Grid -> Set Coordinate -> GridObject -> Grid
updateGridFromSet grid set gridObject =
    List.indexedMap
        (\yIndex row ->
            List.indexedMap
                (\xIndex cell ->
                    if Set.member [ xIndex, yIndex ] set then
                        gridObject
                    else if cell == gridObject then
                        -- Don't touch cells of other types
                        Empty
                    else
                        cell
                )
                row
        )
        grid


updateGridSnake : Snake -> Grid -> Grid
updateGridSnake snake grid =
    updateGridFromSet grid (Set.fromList snake) SnakeCell


updateGridFood : Food -> Grid -> Grid
updateGridFood food grid =
    updateGridFromSet grid (Set.singleton food) FoodCell


updateGrid : Snake -> Food -> Grid -> Grid
updateGrid snake food grid =
    grid
        |> updateGridFood food
        |> updateGridSnake snake
