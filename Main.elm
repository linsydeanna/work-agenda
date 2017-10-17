module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)


type alias Model =
    { tasks : List Task
    , workStartTime : Maybe Int
    }


type alias Task =
    { name : String
    , id : Int
    , duration : Maybe Int
    , startTime : Maybe Int -- computed
    , endTime : Maybe Int -- computed
    }


emptyTask =
    { name = ""
    , id = 0
    , duration = Nothing
    , startTime = Nothing
    , endTime = Nothing
    }


initialModel : Model
initialModel =
    { tasks = [ emptyTask ]
    , workStartTime = Nothing
    }


type Msg
    = AddTask
    | TaskInput String
    | DurationInput String
    | TimeInput String
    | AddStart Int


update : Msg -> Model -> Model
update msg model =
    case msg of
        -- AddTask ->
        --     Debug.log "tasks"
        --         { model
        --             | tasks = ({ name = model.taskName, duration = 0, startTime = 0, endTime = 0 } :: model.tasks)
        --         }
        -- Input name ->
        --     Debug.log "taskName"
        --         { model | taskName = name }
        _ ->
            model


task : Model -> Html Msg
task model =
    input []
        [ input
            [ type_ "text"
            , onInput Input
            , value model.taskName
            ]
            []
        , button [ type_ "submit" ] [ text "Add Task" ]
        ]


view : Model -> Html Msg
view model =
    div []
        [ h1 [] [ text "Work Agenda" ]
        , taskForm model
        ]


main : Program Never Model Msg
main =
    Html.beginnerProgram
        { model = initialModel
        , update = update
        , view = view
        }
