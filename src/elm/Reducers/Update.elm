module Reducers.Update exposing (update)

import Actions.GenerateFood exposing (generateFood)
import Actions.Message exposing (Message(..))
import Actions.GenerateSnake exposing (generateSnake)
import Models.Direction exposing (preventBackwardsDirection)
import Models.Grid exposing (updateGrid, updateGridSnake, updateGridFood)
import Models.Snake exposing (newSnake, moveSnake, coordinateOverlapsSnake)
import Models.GameState exposing (GameState(StateGameStarted, StateGameOver))
import Models.Store exposing (Store, initialStore)
import Reducers.Helpers exposing (snakeExists, snakeAndFoodExists)


update : Message -> Store -> ( Store, Cmd Message )
update message store =
    case message of
        Default ->
            ( store, Cmd.none )

        NewGame ->
            ( { initialStore | gameState = StateGameStarted }, generateSnake )

        GenerateSnake coordinate ->
            let
                snake =
                    newSnake coordinate
            in
                ( { store | snake = Just snake, grid = updateGridSnake snake store.grid }, generateFood )

        GenerateFood food ->
            snakeExists store
                (\store snake ->
                    if coordinateOverlapsSnake snake food then
                        ( store, generateFood )
                    else
                        ( { store | food = Just food, grid = updateGridFood food store.grid, score = store.score + 1 }, Cmd.none )
                )

        TimeStep ->
            snakeAndFoodExists store
                (\store snake food ->
                    let
                        ( snake, cmd ) =
                            moveSnake store.currentDirection food snake
                    in
                        ( { store | snake = Just snake, grid = updateGrid snake food store.grid, lastMovedDirection = store.currentDirection }, cmd )
                )

        NewDirection direction ->
            ( { store | currentDirection = preventBackwardsDirection store.lastMovedDirection direction }, Cmd.none )

        GameOver ->
            ( { store | gameState = StateGameOver }, Cmd.none )
