module Subscriptions exposing (subscriptions)

import Char
import Keyboard
import Platform.Sub
import Time
import Actions.Message exposing (Message(TimeStep, NewDirection, Default))
import Config
import Models.Direction exposing (Direction(..))
import Models.Store exposing (Store)


subscriptions : Store -> Sub Message
subscriptions model =
    Platform.Sub.batch
        [ timeStepSubscription
        , keyboardSubscription
        ]


keyboardSubscription : Sub Message
keyboardSubscription =
    Keyboard.ups
        (\keyCode ->
            if Char.fromCode keyCode == ' ' then
                TimeStep
            else if keyCode == 37 then
                NewDirection Left
            else if keyCode == 38 then
                NewDirection Up
            else if keyCode == 39 then
                NewDirection Right
            else if keyCode == 40 then
                NewDirection Down
            else
                Default
        )


timeStepSubscription : Sub Message
timeStepSubscription =
    Time.every Config.timeInterval (\time -> TimeStep)
