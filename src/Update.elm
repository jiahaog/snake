module Update exposing (update)

import Models.Store exposing (Store)
import Models.Snake exposing (newSnake)
import Models.Geometry exposing (Direction(..), randomSnakeInitCoordinate, randomDirection)
import Actions exposing (Msg(..))
import Random


update : Msg -> Store -> ( Store, Cmd Msg )
update msg store =
    case msg of
        Default ->
            ( store, Cmd.none )

        StartGame ->
            ( store, (Random.generate GenerateSnake (Random.map2 (,) randomSnakeInitCoordinate randomDirection)) )

        GenerateSnake ( coordinate, direction ) ->
            ( { store | snake = newSnake coordinate direction }, Cmd.none )



-- TODO: Abstract the ugly map2 away
