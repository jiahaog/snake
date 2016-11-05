module Actions exposing (Msg(..))

import Models.Snake exposing (SnakeInitData)


type Msg
    = Default
    | StartGame
    | GenerateSnake SnakeInitData
