module Main exposing (main)

import Html exposing (..)
import Html.Keyed as Keyed
import Html.Attributes exposing (class)
import Html.Events exposing (..)
import Types exposing (..)
import Update exposing (update)
import Array exposing (..)


initResponses : Array Response
initResponses =
    Array.fromList
        [ "No, never"
        , "No no no no no no no"
        , "It's not the best time"
        , "Unfortunately, no"
        , "No thank you"
        , "Nah"
        , "uhh…"
        , "wut"
        , "lol"
        , "Meh"
        , "Tough to say"
        , "I dno, thinkin about it"
        , "I guess so, yeah"
        , "Probs, ya"
        , "Yes, now leave me alone"
        , "No question"
        , "Yep"
        , "For sure"
        , "Definitely"
        , "YAAAAAS"
        ]


init : ( Model, Cmd Msg )
init =
    ( { response = ""
      , otherResponses = initResponses
      , responseIndex = 0
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
    let
        showMessage =
            if model.response /= "" then
                div
                    [ class "triangle" ]
                    [ div [ class "triangle__message" ] [ text model.response ] ]
            else
                text ""
    in
        div []
            [ div
                [ class "eight-ball" ]
                [ Keyed.node "div"
                    [ class "window" ]
                    [ ( toString model.responseIndex, showMessage ) ]
                ]
            , button
                [ onClick RequestResponse ]
                [ text "Ask the Magic Eight" ]
            ]
