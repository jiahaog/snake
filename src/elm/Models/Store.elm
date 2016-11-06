module Models.Store exposing (Store, initialStore, appStoreInit)

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
    , score : Int
    }


createRows : Int -> List GridObject
createRows columns =
    1
        |> List.repeat columns
        |> List.map (\n -> Empty)


createGrid : Int -> Int -> List (List GridObject)
createGrid rows columns =
    List.map (\n -> createRows columns) [1..rows]


initialStore : Store
initialStore =
    { snake = []
    , grid = createGrid Config.xSize Config.ySize
    , food = []
    , lastDirection = Right
    , score = -1
    }


appStoreInit : ( Store, Cmd Message )
appStoreInit =
    ( initialStore, Cmd.none )
