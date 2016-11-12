module Main exposing (..)

import Html.App as App
import Components.View exposing (view)
import Models.Store exposing (appStoreInit)
import Subscriptions.Subscriptions exposing (subscriptions)
import Reducers.Update exposing (update)


main : Program Never
main =
    App.program { init = appStoreInit, view = view, update = update, subscriptions = subscriptions }
