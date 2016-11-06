module Models.Store exposing (Store, init)

import Actions.Message exposing (Message)
import Config
import Models.Direction exposing (Direction(Right))
import Models.Food exposing (Food)
import Models.Grid exposing (Grid, GridObject(Empty))
import Models.Snake exposing (Snake)


type alias Store =
    { snake : Snake
    , grid : Grid
    , food : Food
    , lastDirection : Direction
    }


createRows : Int -> List GridObject
createRows columns =
    1
        |> List.repeat columns
        |> List.map (\n -> Empty)


createGrid : Int -> Int -> List (List GridObject)
createGrid rows columns =
    List.map (\n -> createRows columns) [1..rows]


store : Store
store =
    { snake = [ [ 1, 2 ] ]
    , grid = createGrid Config.xSize Config.ySize
    , food = []
    , lastDirection = Right
    }


init : ( Store, Cmd Message )
init =
    ( store, Cmd.none )
