module Main exposing (..)

import Element exposing (Element, alignBottom, alignLeft, alignRight, alignTop, centerX, centerY, column, el, fill, fillPortion, height, minimum, padding, paragraph, px, rgb255, row, spacing, text, width)
import Element.Background as Background
import Element.Border as Border
import Element.Font as Font


-- text
-- Element.el takes a single child element
-- padding
-- Element.rows
-- Element.cols
-- spacing
-- centering
-- alignment
-- width & height


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


body =
    Element.el
        [ Background.color (rgb255 255 255 255)
        , width fill
        , height fill
        , padding 100
        ]
        (Element.column
            [ width fill ]
         <|
            List.intersperse
                horizontalRule
                [ -- text
                  content
                    "text"
                    (Element.row []
                        [ inlineCode "text"
                        , text " is used to display text"
                        ]
                    )
                    [ text "text \"hi\"" ]
                    (text "hi")

                -- el
                , content
                    "el"
                    (Element.row []
                        [ inlineCode "el"
                        , text " is an element that takes attributes and has a single child"
                        ]
                    )
                    [ paragraph [] [ text "el" ]
                    , paragraph [] [ text "[ Background.color (rgb255 255 255 0) ]" ]
                    , paragraph [] [ text "(text \"highlight me\")" ]
                    ]
                    (el [ Background.color (rgb255 255 255 0) ] (Element.text "highlight me"))

                -- padding
                , content
                    "padding"
                    (Element.row []
                        [ inlineCode "padding"
                        , text " adds space inside an element"
                        ]
                    )
                    [ paragraph [] [ text "el [ padding 10, Background.color (rgb255 255 255 0) ] (text \"highlight me\")" ]
                    ]
                    (el [ padding 10, Background.color (rgb255 255 255 0) ] (Element.text "highlight me"))

                -- row
                , content
                    "row"
                    (Element.row []
                        [ inlineCode "row"
                        , text " groups elements together in a row"
                        ]
                    )
                    [ paragraph [] [ text "row [] [ el [ Border.width 1 ] (text \"A\"), el [ Border.width 1 ] (text \"B\"), el [ Border.width 1 ] (text \"C\")]" ]
                    ]
                    (row []
                        [ el [ Border.width 1 ] (text "A")
                        , el [ Border.width 1 ] (text "B")
                        , el [ Border.width 1 ] (text "C")
                        ]
                    )

                -- spacing
                , content
                    "spacing"
                    (Element.row []
                        [ inlineCode "spacing"
                        , text " adds space between child elements"
                        ]
                    )
                    [ paragraph [] [ text "row [ spacing 20 ] [ el [ Border.width 1 ] (text \"A\"), el [ Border.width 1 ] (text \"B\"), el [ Border.width 1 ] (text \"C\")]" ]
                    ]
                    (row [ spacing 20 ]
                        [ el [ Border.width 1 ] (text "A")
                        , el [ Border.width 1 ] (text "B")
                        , el [ Border.width 1 ] (text "C")
                        ]
                    )

                -- column
                , content
                    "column"
                    (Element.row []
                        [ inlineCode "column"
                        , text " groups elements together in a column"
                        ]
                    )
                    [ paragraph [] [ text "column [ spacing 20 ] [ el [ Border.width 1 ] (text \"A\"), el [ Border.width 1 ] (text \"B\"), el [ Border.width 1 ] (text \"C\")]" ]
                    ]
                    (column [ spacing 20 ]
                        [ el [ Border.width 1 ] (text "A")
                        , el [ Border.width 1 ] (text "B")
                        , el [ Border.width 1 ] (text "C")
                        ]
                    )

                -- width & height
                , content
                    "width & height"
                    (Element.row []
                        [ inlineCode "width"
                        , text " & "
                        , inlineCode "height"
                        ]
                    )
                    [ paragraph [] [ text "el [ Border.width 1, width (px 200), height (px 200) ] (text \"200x200\")" ]
                    ]
                    (el [ Border.width 1, width (px 200), height (px 200) ]
                        (text "200x200")
                    )

                -- centering
                , content
                    "centering"
                    (Element.row []
                        [ inlineCode "centerX"
                        , text " and "
                        , inlineCode "centerY"
                        , text " center horizontally and vertically"
                        ]
                    )
                    [ paragraph [] [ text "el [ Border.width 1, width (px 200), height (px 200) ] (el [ centerX, centerY ] (text \"middle\"))" ]
                    ]
                    (el [ Border.width 1, width (px 200), height (px 200) ] <|
                        el [ centerX, centerY ] (text "middle")
                    )

                -- alignment
                , content
                    "alignment"
                    (Element.row []
                        [ inlineCode "alignLeft"
                        , text ", "
                        , inlineCode "alignRight"
                        , text ", "
                        , inlineCode "alignTop"
                        , text ", "
                        , inlineCode "alignBottom"
                        ]
                    )
                    [ paragraph [] [ text "row [ Border.width 1, width (px 200), height (px 200) ] [ el [ alignLeft, alignTop ] (text \"top-left\"), el [ alignRight, alignBottom ] (text \"bottom-right\") ]" ]
                    ]
                    (row [ Border.width 1, width (px 200), height (px 200) ]
                        [ el [ alignLeft, alignTop ] (text "top-left")
                        , el [ alignRight, alignBottom ] (text "bottom-right")
                        ]
                    )
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


inlineCode codeText =
    Element.el
        [ padding 5
        , Background.color (rgb255 220 220 220)
        , Font.family [ Font.typeface "Monospace" ]
        ]
        (text codeText)


content label description codeText code =
    Element.row [ width fill ]
        [ el
            [ width (fillPortion 1)
            , Font.size 32
            , padding 20
            , Font.family [ Font.typeface "Monospace" ]
            ]
            (text label)
        , Element.column [ width (fillPortion 4) ]
            [ Element.el [ padding 20 ] description
            , Element.row [] [ codeBlock codeText, display code ]
            ]
        ]


codeBlock codeText =
    Element.el
        [ Background.color (rgb255 128 128 128)
        , Font.color (rgb255 255 255 255)
        , Font.family [ Font.typeface "Monospace" ]
        , padding 15
        , width (px 300)
        ]
        (paragraph [] codeText)


display code =
    Element.el
        [ padding 15
        , width fill
        ]
    <|
        code


footer =
    Element.el
        [ Background.color (rgb255 240 0 0)
        , width fill
        , padding 30
        ]
    <|
        Element.el [ centerX ] <|
            paragraph
                []
                [ text "Want to learn more? "
                , Element.link
                    [ Font.color (rgb255 255 255 255)
                    ]
                    { url = "https://package.elm-lang.org/packages/mdgriffith/elm-ui/1.1.0/"
                    , label = text "Read the docs!"
                    }
                ]
