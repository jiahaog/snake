module Models.Store exposing (Store, init, Grid)

import Models.Snake exposing (Snake)
import Actions exposing (Msg)


type alias Grid =
    List (List Bool)


type alias Store =
    { snake : Snake
    , grid : Grid
    }


rows : Int
rows =
    50


columns : Int
columns =
    50


createRows : Int -> List Bool
createRows columns =
    1
        |> List.repeat columns
        |> List.map (\n -> False)


createGrid : Int -> Int -> List (List Bool)
createGrid rows columns =
    List.map (\n -> createRows columns) [1..rows]


store : Store
store =
    { snake = [ [ 1, 2 ] ]
    , grid = createGrid rows columns
    }


init : ( Store, Cmd Msg )
init =
    ( store, Cmd.none )
