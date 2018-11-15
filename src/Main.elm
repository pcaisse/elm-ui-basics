module Main exposing (..)

import Element exposing (Element, alignBottom, alignLeft, alignRight, alignTop, centerX, centerY, column, el, fill, height, padding, paragraph, rgb255, row, spacing, text, width)
import Element.Background as Background
import Element.Border as Border
import Element.Font as Font


-- text
-- Element.el takes a single child element
-- padding
-- spacing
-- Element.rows
-- Element.cols


main =
    Element.layout []
        (Element.column
            [ width fill, height fill ]
            [ header, body, footer ]
        )


header =
    Element.el
        [ Background.color (rgb255 0 0 0)
        , Font.color (rgb255 255 255 255)
        , padding 30
        , width fill
        ]
        (Element.el [ centerX ]
            (Element.column
                []
                [ Element.link []
                    { url = "https://package.elm-lang.org/packages/mdgriffith/elm-ui/1.1.0/"
                    , label = text "elm-ui"
                    }
                , el [ Font.color (rgb255 128 128 128) ] (text "a whirlwind tour")
                ]
            )
        )



-- TODO: Add subheading "a whirlwind tour of the Element module"


body =
    Element.el
        [ Background.color (rgb255 255 255 255)
        , width fill
        , height fill
        , padding 100
        ]
        (Element.column
            [ width fill ]
            [ -- text
              content
                (Element.row []
                    [ text "1. "
                    , Element.el [ padding 5, Background.color (rgb255 220 220 220) ] (text "text")
                    , text " is used to display text"
                    ]
                )
                "Element.text \"hi\""
                (text "hi")
            , horizontalRule

            -- el
            , content
                (Element.row []
                    [ text "2. "
                    , Element.el [ padding 5, Background.color (rgb255 220 220 220) ] (text "el")
                    , text " is an element that takes attributes and has a single child"
                    ]
                )
                "Element.el [ Background.color (rgb255 255 255 0) ] (Element.text \"highlight me\")"
                (el [ Background.color (rgb255 255 255 0) ] (Element.text "highlight me"))
            ]
        )


horizontalRule =
    Element.el
        [ Element.paddingEach
            { top = 100
            , right = 0
            , bottom = 80
            , left = 0
            }
        , width fill
        ]
    <|
        Element.el
            [ width fill
            , Border.color (rgb255 128 128 128)
            , Border.dashed
            , Border.width 1
            ]
            Element.none


content description codeTextString codeText =
    Element.column [ centerX ]
        [ Element.el [ padding 20 ] description
        , Element.row [ centerX ] [ code codeTextString, display codeText ]
        ]


code codeTextString =
    Element.el
        [ Background.color (rgb255 128 128 128)
        , Font.color (rgb255 255 255 255)
        , Font.family [ Font.typeface "Monospace" ]
        , padding 15
        , width fill
        ]
        (paragraph [] [ text <| codeTextString ])


display codeText =
    Element.el
        [ padding 15
        , width fill
        ]
    <|
        codeText


footer =
    Element.el
        [ Background.color (rgb255 240 0 0)
        , width fill
        , padding 30
        ]
    <|
        Element.row
            [ width fill, Font.color (rgb255 255 255 255) ]
            [ Element.el [ alignLeft ] (text "Peter Caisse")
            , Element.el [ alignRight ] (text "Lightning Talk 2018")
            ]
