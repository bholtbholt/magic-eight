module Types exposing (..)

import Array exposing (..)


type alias Model =
    { response : Response
    , otherResponses : Responses
    }


type alias Responses =
    Array Response


type alias Response =
    String


type alias ResponseIndex =
    Int


type Msg
    = RequestResponse
    | ReturnResponse ResponseIndex
