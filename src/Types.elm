module Types exposing (..)


type alias Model =
    { randNum : Int }


type Msg
    = BasicUpdate
    | GetNumber
    | NewNumber Int
