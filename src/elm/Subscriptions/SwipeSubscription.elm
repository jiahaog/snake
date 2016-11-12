port module Subscriptions.SwipeSubscription exposing (swipeSubscription)

import Actions.Message exposing (Message(NewDirection))
import Models.Direction exposing (Direction(..))


port swipePort : (String -> msg) -> Sub msg


swipeSubscription : Sub Message
swipeSubscription =
    swipePort receiveSwipeString


receiveSwipeString : String -> Message
receiveSwipeString received =
    if received == "up" then
        NewDirection Up
    else if received == "right" then
        NewDirection Right
    else if received == "down" then
        NewDirection Down
    else
        NewDirection Left
