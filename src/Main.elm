module Main exposing (main)

import Html exposing (..)
import Types exposing (..)
import Update exposing (update)


init : ( Model, Cmd Msg )
init =
    ( { randNum = 0
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
        , button [] [ text "Ask the Magic Eight" ]
        ]
