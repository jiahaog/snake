module Components.Events exposing (onEnter)

import Update exposing (Msg)
import Html exposing (Attribute)
import Html.Events exposing (on, keyCode)
import Json.Decode as Json
import Update exposing (Msg(..))


onEnter : Msg -> Attribute Msg
onEnter msg =
    let
        tagger code =
            if code == 13 then
                msg
            else
                Default
    in
        on "keydown" (Json.map tagger keyCode)
