module Main exposing (..)

import Html exposing (program)
import Components.View exposing (view)
import Models.Store exposing (appStoreInit)
import Subscriptions.Subscriptions exposing (subscriptions)
import Reducers.Update exposing (update)
import Actions.Message exposing (Message)


main : Program Never Models.Store.Store Actions.Message.Message
main =
    program { init = appStoreInit, view = view, update = update, subscriptions = subscriptions }
