module Components.Debugger exposing (debuggerView)

import Html exposing (Html, div, text)
import Actions exposing (Msg)


debuggerView : a -> Html Msg
debuggerView inp =
    div
        []
        [ text (toString inp) ]
