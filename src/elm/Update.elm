module Update exposing (update)

import Random
import Actions exposing (Msg(..), generateFood, generateSnake)
import Models.Direction exposing (preventBackwardsDirection)
import Models.Grid exposing (updateGrid, foodOverlapsSnake)
import Models.Snake exposing (newSnake, moveSnake)
import Models.Store exposing (Store)


update : Msg -> Store -> ( Store, Cmd Msg )
update msg store =
    case msg of
        Default ->
            ( store, Cmd.none )

        StartGame ->
            ( store, generateSnake )

        GenerateSnake ( coordinate, direction ) ->
            let
                snake =
                    newSnake coordinate direction
            in
                ( { store | snake = snake, grid = updateGrid store.grid snake store.food }, generateFood )

        GenerateFood food ->
            if foodOverlapsSnake store.snake food then
                ( store, generateFood )
            else
                ( { store | food = food, grid = updateGrid store.grid store.snake food }, Cmd.none )

        TimeStep ->
            let
                ( snake, cmd ) =
                    moveSnake store.lastDirection store.food store.snake
            in
                ( { store | snake = snake, grid = updateGrid store.grid snake store.food }, cmd )

        NewDirection direction ->
            ( { store | lastDirection = preventBackwardsDirection store.lastDirection direction }, Cmd.none )
