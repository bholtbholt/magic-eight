module Update exposing (update)

import Types exposing (..)
import Random exposing (..)
import Array exposing (..)


responseSize : Responses -> Int
responseSize responses =
    Array.length responses
        - 1


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        RequestResponse ->
            ( model
            , Random.generate ReturnResponse <|
                Random.int 0 (responseSize model.otherResponses)
            )

        ReturnResponse responseIndex ->
            let
                response =
                    Array.get responseIndex model.otherResponses
                        |> Maybe.withDefault ""
            in
                ( { model
                    | response = response
                    , responseIndex = responseIndex
                  }
                , Cmd.none
                )
