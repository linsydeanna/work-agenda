module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)


type alias Model =
    { tasks : List Task
    , taskName : String
    , workStartTime : Maybe Int
    }


type alias Task =
    { name : String
    , duration : Int
    , startTime : Int
    , endTime : Int
    }


initialModel : Model
initialModel =
    { tasks = []
    , taskName = ""
    , workStartTime = Nothing
    }


type Msg
    = AddTask
    | Input String
    | AddStart Int


update : Msg -> Model -> Model
update msg model =
    case msg of
        AddTask ->
            Debug.log "tasks"
                { model
                    | tasks = ({ name = model.taskName, duration = 0, startTime = 0, endTime = 0 } :: model.tasks)
                }

        Input name ->
            Debug.log "taskName"
                { model | taskName = name }

        _ ->
            model


view : Model -> Html Msg
view model =
    div []
        [ h1 [] [ text "Work Agenda" ]
        , Html.form [ onSubmit AddTask ]
            [ input
                [ type_ "text"
                , onInput Input
                , value model.taskName
                ]
                []
            , button [ type_ "submit" ] [ text "Add Task" ]
            ]
        ]


main : Program Never Model Msg
main =
    Html.beginnerProgram
        { model = initialModel
        , update = update
        , view = view
        }
