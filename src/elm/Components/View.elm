module Components.View exposing (..)

import Html exposing (Html, h1, div, span, a, button, text, input, select, option, Attribute)
import Html.Attributes exposing (class, value, classList, attribute)
import Html.Events exposing (onClick, onInput, on, keyCode)
import Models.GameState exposing (GameState(StateGameOver))
import Actions.Message exposing (Message(NewGame))
import Models.Grid exposing (Grid, GridObject(..))
import Models.Store exposing (Store)


view : Store -> Html Message
view model =
    div [ class "wrapper" ]
        [ renderHeader
        , div [ classList [ ( "grid-container", True ) ] ] [ renderGrid model ]
        , renderFooter
        ]


renderHeader : Html Message
renderHeader =
    div []
        [ h1 [ class "title" ] [ text "Snake" ]
        ]


renderFooter : Html Message
renderFooter =
    div []
        [ div [ class "footer" ] [ text "Built with ", a [ attribute "href" "http://elm-lang.org/" ] [ text "Elm" ] ]
        ]


renderGrid : Store -> Html Message
renderGrid model =
    div [ classList [ ( "grid", True ), ( "game-over-overlay", model.gameState == StateGameOver ) ], onClick NewGame ] (List.append (List.map renderRow model.grid) [ renderScore model.score ])


renderRow : List GridObject -> Html Message
renderRow row =
    div [ classList [ ( "grid-row", True ) ] ] (List.map (\n -> renderCell n) row)


renderCell : GridObject -> Html Message
renderCell gridObject =
    span [ classList [ ( "grid-cell", True ), ( gridCellClass gridObject, True ) ] ] []


renderScore : Int -> Html Message
renderScore score =
    if score < 0 then
        div [] []
    else
        div [ class "score" ] [ text (toString score) ]


gridCellClass : GridObject -> String
gridCellClass gridObject =
    case gridObject of
        Empty ->
            "cell-empty"

        SnakeCell ->
            "cell-snake bg-blue"

        FoodCell ->
            "cell-food bg-light-red"
