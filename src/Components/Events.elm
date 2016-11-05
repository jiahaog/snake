module Components.Events exposing (onEnter)

import Html exposing (Attribute)
import Html.Events exposing (on, keyCode)
import Json.Decode as Json
import Actions exposing (Msg(..))


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
