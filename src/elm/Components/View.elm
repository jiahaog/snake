module Components.View exposing (..)

import Html exposing (Html, div, span, button, text, input, select, option, Attribute)
import Html.Attributes exposing (value, classList)
import Html.Events exposing (onClick, onInput, on, keyCode)
import Actions.Message exposing (Message(..))
import Components.Debugger exposing (debuggerView)
import Models.Grid exposing (Grid, GridObject(..))
import Models.Store exposing (Store)


view : Store -> Html Message
view model =
    div []
        [ text "Elm Snake"
        , div [ classList [ ( "grid-container", True ) ] ] [ renderGrid model.grid ]
        , renderButtons
        , debuggerView model
        ]


renderGrid : Grid -> Html Message
renderGrid grid =
    div [ classList [ ( "grid", True ) ] ] (List.map renderRow grid)


renderRow : List GridObject -> Html Message
renderRow row =
    div [ classList [ ( "grid-row", True ) ] ] (List.map (\n -> renderCell n) row)


renderCell : GridObject -> Html Message
renderCell gridObject =
    span [ classList [ ( "grid-cell", True ), ( gridCellClass gridObject, True ) ] ] []


gridCellClass : GridObject -> String
gridCellClass gridObject =
    case gridObject of
        Empty ->
            "cell-empty"

        SnakeCell ->
            "cell-snake"

        FoodCell ->
            "cell-food"


renderButtons : Html Message
renderButtons =
    div []
        [ button [ onClick StartGame ] [ text "Start Game" ]
        , button [ onClick (TimeStep) ] [ text "TimeStep" ]
        ]
