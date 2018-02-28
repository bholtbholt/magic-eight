module Main exposing (main)

import Html exposing (..)
import Types exposing (..)
import Update exposing (update)


init : Model
init =
    { text = "Hello World"
    }


main : Program Never Model Msg
main =
    Html.beginnerProgram
        { view = view
        , update = update
        , model = init
        }


view : Model -> Html Msg
view model =
    div []
        [ button [] [ text "Ask the Magic Eight" ]
        ]
