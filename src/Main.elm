module Main exposing (main)

import Html exposing (..)
import Html.Events exposing (..)
import Types exposing (..)
import Update exposing (update)
import Array exposing (..)


responses : Array String
responses =
    Array.fromList
        [ "Yes"
        , "Okay"
        , "No"
        ]


init : ( Model, Cmd Msg )
init =
    ( { randNum = 0
      , response = ""
      , otherResponses = responses
      }
    , Cmd.none
    )


main : Program Never Model Msg
main =
    Html.program
        { view = view
        , update = update
        , init = init
        , subscriptions = always Sub.none
        }


view : Model -> Html Msg
view model =
    div []
        [ p [] [ text (toString model.randNum) ]
        , button [ onClick GetNumber ] [ text "Ask the Magic Eight" ]
        ]
