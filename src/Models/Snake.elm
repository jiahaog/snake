module Models.Snake exposing (Snake, createSnake)


type alias Snake =
    List (List Int)

createSnake : Snake
createSnake =
    [[1, 2], [2, 2]]

-- initialSnakeSize : Int
-- initialSnakeSize =
--   2

-- snakeInitial : Snake
-- snakeInitial =
--     [[Random.int, Random.int]]



