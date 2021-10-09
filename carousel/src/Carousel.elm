module Carousel exposing (view)

import Array exposing (Array)
import Css exposing (..)
import Html.Styled exposing (Attribute, Html, button, div, img, li, span, text, ul)
import Html.Styled.Attributes exposing (attribute, css, src)
import Html.Styled.Events exposing (onClick)


view : List String -> Html msg
view images =
    div
        [ css
            [ width <| pct 100
            , height <| pct 100
            , property "scroll-snap-type" "y mandatory"
            , overflowX auto
            ]
        ]
        [ div
            [ css
                [ width <| pct 100
                , height <| pct 100
                , property "scroll-snap-align" "start"
                ]
            ]
            []
        , div
            [ css
                [ width <| pct 100
                , height <| pct 100
                , position relative
                , backgroundColor <| rgb 0 0 0
                , overflowX auto
                , property "scroll-snap-align" "start"
                , property "scroll-snap-type" "x mandatory"
                ]
            ]
            (images
                |> Array.fromList
                |> Array.indexedMap
                    (\i image ->
                        div
                            [ css
                                [ width <| pct 100
                                , height <| pct 100
                                , position absolute
                                , textAlign center
                                , verticalAlign middle
                                , backgroundColor <| rgb 30 30 30
                                , left <| pct (100 * toFloat i)
                                , property "scroll-snap-align" "start"
                                , before
                                    [ display inlineBlock
                                    , property "content" "''"
                                    , height <| pct 100
                                    , verticalAlign middle
                                    ]
                                ]
                            ]
                            [ img
                                [ src image
                                , css
                                    [ maxWidth <| pct 100
                                    , maxHeight <| pct 100
                                    , display inlineBlock
                                    , verticalAlign middle
                                    ]
                                ]
                                []
                            ]
                    )
                |> Array.toList
            )
        , div
            [ css
                [ width <| pct 100
                , height <| pct 100
                , property "scroll-snap-align" "start"
                ]
            ]
            []
        ]
