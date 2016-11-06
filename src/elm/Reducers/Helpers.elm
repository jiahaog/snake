module Reducers.Helpers exposing (snakeExists, snakeAndFoodExists)

import Actions.Message exposing (Message(..))
import Models.Store exposing (Store)
import Models.Snake exposing (Snake)
import Models.Food exposing (Food)


snakeExists : Store -> (Store -> Snake -> ( Store, Cmd Message )) -> ( Store, Cmd Message )
snakeExists store func =
    case store.snake of
        Nothing ->
            ( store, Cmd.none )

        Just snake ->
            func store snake


snakeAndFoodExists : Store -> (Store -> Snake -> Food -> ( Store, Cmd Message )) -> ( Store, Cmd Message )
snakeAndFoodExists store func =
    case store.snake of
        Nothing ->
            ( store, Cmd.none )

        Just snake ->
            case store.food of
                Nothing ->
                    ( store, Cmd.none )

                Just food ->
                    func store snake food
