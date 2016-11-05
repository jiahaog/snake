module Actions exposing (Msg(..))

import Models.Snake exposing (Snake)


type Msg
    = Default
    | StartGame
    | GenerateSnake Snake
