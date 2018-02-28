module Main exposing (main)

import Html exposing (..)
import Types exposing (..)
import Update exposing (update)


init : Model
init =
    { randNum = 0
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
        [ p [] [ text (toString model.randNum) ]
        , button [] [ text "Ask the Magic Eight" ]
        ]
