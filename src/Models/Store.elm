module Models.Store exposing (Store, init)

import Models.Snake exposing (Snake)
import Models.Food exposing (Food)
import Models.Grid exposing (Grid, GridObject(Empty))
import Actions exposing (Msg)
import Config exposing (config)


type alias Store =
    { snake : Snake
    , grid : Grid
    , food : Food
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
    , grid = createGrid config.xSize config.ySize
    , food = [ 2, 3 ]
    }


init : ( Store, Cmd Msg )
init =
    ( store, Cmd.none )
