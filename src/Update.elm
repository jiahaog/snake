module Update exposing (update)

import Models.Store exposing (Store)
import Actions exposing (Msg(..))


update : Msg -> Store -> ( Store, Cmd Msg )
update msg store =
    case msg of
        Default ->
            ( store, Cmd.none )

        CreateSnake snake ->
            ( { store | snake = snake }, Cmd.none )
