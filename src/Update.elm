module Update exposing (update)

import Models.Store exposing (Store)
import Models.Snake exposing (newSnake)
import Models.Geometry exposing (Direction(..), randomSnakeInitCoordinate)
import Actions exposing (Msg(..))
import Random


update : Msg -> Store -> ( Store, Cmd Msg )
update msg store =
    case msg of
        Default ->
            ( store, Cmd.none )

        StartGame ->
            ( store, (Random.generate GenerateSnake randomSnakeInitCoordinate) )

        GenerateSnake coordinate ->
            ( { store | snake = newSnake coordinate Down }, Cmd.none )
