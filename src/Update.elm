module Update exposing (update)

import Types exposing (..)
import Random exposing (..)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        BasicUpdate ->
            ( model, Cmd.none )

        GetNumber ->
            ( model, Random.generate NewNumber (Random.int 1 100) )

        NewNumber number ->
            ( { model | randNum = number }, Cmd.none )
