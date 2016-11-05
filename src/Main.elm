module Main exposing (..)

import Html.App as App
import Models.Store exposing (init)
import Update exposing (update)
import Components.View exposing (view)
import Subscriptions exposing (subscriptions)


main : Program Never
main =
    App.program { init = init, view = view, update = update, subscriptions = subscriptions }
