module Models.Snake exposing (Snake, initSnake)

import Random exposing (Generator)
import Config exposing (config)


type alias Snake =
    List (List Int)


initSnakeWithParams : Int -> Generator Snake
initSnakeWithParams columnSize =
    columnSize
        |> Random.int 0
        |> Random.list config.dimensions
        |> Random.list config.initialSnakeLength


initSnake : Generator Snake
initSnake =
    initSnakeWithParams config.xSize
