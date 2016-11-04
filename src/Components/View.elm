module Components.View exposing (..)

import Html exposing (Html, div, span, button, text, input, select, option, Attribute)
import Html.Attributes exposing (value, classList)
import Html.Events exposing (onClick, onInput, on, keyCode)
import Model exposing (Model, Grid)
import Update exposing (Msg(..))
import Components.Events exposing (onEnter)


view : Model -> Html Msg
view model =
    div []
        [ text "Elm Snake"
        , div [ classList [ ( "grid-container", True ) ] ] [ renderGrid model.grid ]
        ]


renderGrid : Grid -> Html Msg
renderGrid grid =
    div [ classList [ ( "grid", True ) ] ] (List.map renderRow grid)


renderRow : List Bool -> Html Msg
renderRow row =
    div [ classList [ ( "grid-row", True ) ] ] (List.map (\n -> renderCell n) row)


renderCell : Bool -> Html Msg
renderCell cellValue =
    span [ classList [ ( "grid-cell", True ), ( "active", cellValue ) ] ] []
