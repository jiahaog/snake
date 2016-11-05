module Models.Snake exposing (Snake, initSnake)

import Random exposing (Generator)


type alias Snake =
    List (List Int)


initSnakeLength : Int
initSnakeLength =
    2


dimensions : Int
dimensions =
    2


columns =
    10


initSnakeWithParams : Int -> Generator Snake
initSnakeWithParams columnSize =
    columnSize
        |> Random.int 0
        |> Random.list 2
        |> Random.list initSnakeLength


initSnake : Generator Snake
initSnake =
    initSnakeWithParams columns
