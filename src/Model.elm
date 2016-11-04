module Model exposing (Model, model, Grid)


type alias Snake =
    List (List Int)


type alias Grid =
    List (List Bool)


type alias Model =
    { snake : Snake
    , grid : Grid
    }


rows : Int
rows =
    50


columns : Int
columns =
    50


createRows : Int -> List Bool
createRows columns =
    1
    |> List.repeat columns
    |> List.map (\n -> False)


createGrid : Int -> Int -> List (List Bool)
createGrid rows columns =
    List.map (\n -> createRows columns) [1..rows]


model : Model
model =
    { snake = [ [ 1, 2 ] ]
    , grid = createGrid rows columns
    }
