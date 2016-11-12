module Models.Store exposing (Store, initialStore, appStoreInit)

import Actions.Message exposing (Message)
import Config
import Models.Direction exposing (Direction(Right))
import Models.Food exposing (Food)
import Models.GameState exposing (GameState(StateGameWaiting))
import Models.Grid exposing (Grid, GridObject(Empty))
import Models.Snake exposing (Snake)


type alias Store =
    { snake : Maybe Snake
    , grid : Grid
    , food : Maybe Food
    , currentDirection : Direction
    , lastMovedDirection : Direction
    , score : Int
    , gameState : GameState
    }


createRows : Int -> List GridObject
createRows xSize =
    1
        |> List.repeat xSize
        |> List.map (\n -> Empty)


createGrid : Int -> Int -> List (List GridObject)
createGrid xSize ySize =
    List.map (\n -> createRows xSize) [1..ySize]


initialStore : Store
initialStore =
    { snake = Maybe.Nothing
    , grid = createGrid Config.xSize Config.ySize
    , food = Maybe.Nothing
    , currentDirection = Right
    , lastMovedDirection = Right
    , score = -1
    , gameState = StateGameWaiting
    }


appStoreInit : ( Store, Cmd Message )
appStoreInit =
    ( initialStore, Cmd.none )
