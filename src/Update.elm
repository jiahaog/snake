module Update exposing (update)

import Models.Store exposing (Store)
import Models.Snake exposing (initSnake)
import Actions exposing (Msg(..))
import Random


update : Msg -> Store -> ( Store, Cmd Msg )
update msg store =
    case msg of
        Default ->
            ( store, Cmd.none )

        StartGame ->
            ( store, Random.generate GenerateSnake initSnake )

        GenerateSnake snake ->
            ( { store | snake = snake }, Cmd.none )
