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
    | TaskInput Int String
    | DurationInput String
    | TimeInput String
    | AddStart Int


update : Msg -> Model -> Model
update msg model =
    case msg of
        TaskInput id taskName ->
            let
                newTasks =
                    editTask model.tasks id taskName
            in
                { model | tasks = newTasks }

        _ ->
            model


editTask : List Task -> Int -> String -> List Task
editTask tasks id taskName =
    List.map
        (\task ->
            if task.id == id then
                { task | name = taskName }
            else
                task
        )
        tasks


columnHeader =
    div []
        [ div
            []
            []
        , div
            []
            []
        , div
            []
            []
        , div
            []
            []
        ]


taskRow : Task -> Html Msg
taskRow task =
    div []
        [ input
            [ onInput <| TaskInput task.id
            ]
            []
        , input
            []
            []
        , input
            []
            []
        , input
            []
            []
        ]


view : Model -> Html Msg
view model =
    div []
        [ h1 [] [ text "Work Agenda" ]
        , div [] <| List.map taskRow model.tasks
        ]


main : Program Never Model Msg
main =
    Html.beginnerProgram
        { model = initialModel
        , update = update
        , view = view
        }
