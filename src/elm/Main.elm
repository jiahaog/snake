module Main exposing (..)

import Html.App as App
import Components.View exposing (view)
import Models.Store exposing (init)
import Subscriptions exposing (subscriptions)
import Update exposing (update)


main : Program Never
main =
    App.program { init = init, view = view, update = update, subscriptions = subscriptions }
