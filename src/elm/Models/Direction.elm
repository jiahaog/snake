module Models.Direction exposing (Direction(..), randomDirection, preventBackwardsDirection)

import Random


type Direction
    = Up
    | Right
    | Down
    | Left


randomDirection : Random.Generator Direction
randomDirection =
    Random.map
        (\n ->
            case n of
                0 ->
                    Up

                1 ->
                    Right

                2 ->
                    Down

                _ ->
                    Left
        )
        (Random.int 0 3)


directionToInt : Direction -> Int
directionToInt direction =
    case direction of
        Up ->
            0

        Right ->
            1

        Down ->
            2

        Left ->
            3


intToDirection : Int -> Direction
intToDirection int =
    case int of
        0 ->
            Up

        1 ->
            Right

        2 ->
            Down

        _ ->
            Left


backwardsDirection : Direction -> Direction
backwardsDirection direction =
    direction
        |> directionToInt
        |> (+) 2
        |> (\number -> number % 4)
        |> intToDirection


preventBackwardsDirection : Direction -> Direction -> Direction
preventBackwardsDirection lastDirection newDirection =
    if newDirection == backwardsDirection lastDirection then
        lastDirection
    else
        newDirection
