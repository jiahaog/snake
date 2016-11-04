module Main exposing (..)

import Html.App as App
import Model exposing (model)
import Update exposing (update)
import Components.View exposing (view)


main : Program Never
main =
    App.beginnerProgram { model = model, view = view, update = update }
