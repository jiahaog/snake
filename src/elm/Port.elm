port module Port exposing (swipePort)


port swipePort : (String -> msg) -> Sub msg
