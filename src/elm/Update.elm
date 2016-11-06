module Update exposing (update)

import Random
import Actions exposing (Msg(..))
import Models.Direction exposing (preventBackwardsDirection)
import Models.Food exposing (foodGenerator)
import Models.Grid exposing (updateGrid, foodOverlapsSnake)
import Models.Snake exposing (newSnake, snakeInitGenerator, moveSnake)
import Models.Store exposing (Store)


update : Msg -> Store -> ( Store, Cmd Msg )
update msg store =
    case msg of
        Default ->
            ( store, Cmd.none )

        StartGame ->
            ( store, (Random.generate GenerateSnake snakeInitGenerator) )

        GenerateSnake ( coordinate, direction ) ->
            let
                snake =
                    newSnake coordinate direction
            in
                ( { store | snake = snake, grid = updateGrid store.grid snake store.food }, Random.generate GenerateFood foodGenerator )

        GenerateFood food ->
            if foodOverlapsSnake store.snake food then
                ( store, Random.generate GenerateFood foodGenerator )
            else
                ( { store | food = food, grid = updateGrid store.grid store.snake food }, Cmd.none )

        TimeStep ->
            let
                snake =
                    moveSnake store.lastDirection store.food store.snake
            in
                ( { store | snake = snake, grid = updateGrid store.grid snake store.food }, Cmd.none )

        NewDirection direction ->
            ( { store | lastDirection = preventBackwardsDirection store.lastDirection direction }, Cmd.none )
