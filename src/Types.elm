module Types exposing (..)

import Array exposing (..)


type alias Model =
    { randNum : Int
    , response : String
    , otherResponses : Array String
    }


type Msg
    = BasicUpdate
    | GetNumber
    | NewNumber Int
