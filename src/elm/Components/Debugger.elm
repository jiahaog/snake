module Components.Debugger exposing (debuggerView)

import Html exposing (Html, div, text)
import Actions.Message exposing (Message)


debuggerView : a -> Html Message
debuggerView inp =
    div
        []
        [ text (toString inp) ]
