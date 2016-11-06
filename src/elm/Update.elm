module Update exposing (update)

import Actions.GenerateFood exposing (generateFood)
import Actions.Message exposing (Message(..))
import Actions.GenerateSnake exposing (generateSnake)
import Models.Direction exposing (preventBackwardsDirection)
import Models.Grid exposing (updateGrid, foodOverlapsSnake)
import Models.Snake exposing (newSnake, moveSnake)
import Models.Store exposing (Store, initialStore)


update : Message -> Store -> ( Store, Cmd Message )
update message store =
    case message of
        Default ->
            ( store, Cmd.none )

        NewGame ->
            ( initialStore, generateSnake )

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
                ( { store | food = food, grid = updateGrid store.grid store.snake food, score = store.score + 1 }, Cmd.none )

        TimeStep ->
            let
                ( snake, cmd ) =
                    moveSnake store.lastDirection store.food store.snake
            in
                ( { store | snake = snake, grid = updateGrid store.grid snake store.food }, cmd )

        NewDirection direction ->
            ( { store | lastDirection = preventBackwardsDirection store.lastDirection direction }, Cmd.none )
