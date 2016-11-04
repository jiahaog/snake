module Update exposing (Msg(..), update)

import Model exposing (Model)


type Msg
    = Default


update : Msg -> Model -> Model
update msg model =
    case msg of
        Default ->
            model
