module Actions.GenerateFood exposing (generateFood)

import Random
import Actions.Message exposing (Message(GenerateFood))
import Models.Food exposing (foodGenerator)


generateFood : Cmd Message
generateFood =
    Random.generate GenerateFood foodGenerator
