module Update exposing (update)

import Models.Store exposing (Store)
import Models.Snake exposing (newSnake, snakeInitGenerator, moveSnake)
import Models.Food exposing (foodGenerator)
import Models.Grid exposing (updateGrid, foodOverlapsSnake)
import Actions exposing (Msg(..))
import Random


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

        MoveSnake direction ->
            let
                snake =
                    moveSnake direction store.food store.snake
            in
                ( { store | snake = snake, grid = updateGrid store.grid snake store.food }, Cmd.none )
