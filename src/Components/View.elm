module Components.View exposing (..)

import Html exposing (Html, div, span, button, text, input, select, option, Attribute)
import Html.Attributes exposing (value)
import Html.Events exposing (onClick, onInput, on, keyCode)
import Model exposing (Model, Grid)
import Update exposing (Msg(..))
import Components.Events exposing (onEnter)

view : Model -> Html Msg
view model =
    div []
        [ text "Hello"
        , renderGrid model.grid
        ]


renderGrid : Grid -> Html Msg
renderGrid grid =
    div [] (List.map renderRow grid)


renderRow : List Bool -> Html Msg
renderRow row =
    div [] (List.map (\n -> renderCell n) row)

renderCell : Bool -> Html Msg
renderCell cellValue =
    span [] [ text (toString cellValue) ]
