module Main exposing (..)

import Element exposing (Element, alignBottom, alignLeft, alignRight, alignTop, centerX, centerY, column, el, fill, height, padding, paragraph, rgb255, row, spacing, text, width)
import Element.Background as Background
import Element.Border as Border
import Element.Font as Font


dummyText =
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."


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
        (Element.el [ centerX ] (text "elm-ui basics"))


body =
    Element.el
        [ Background.color (rgb255 255 255 255)
        , width fill
        , height fill
        , padding 100
        ]
        content


content =
    Element.el
        [ Border.color (rgb255 128 128 128)
        , Border.width 5
        , padding 20
        , Border.rounded 5
        , Border.glow (rgb255 100 100 100) 3
        , centerX
        ]
        (paragraph [] [ text dummyText ])


footer =
    Element.el
        [ Background.color (rgb255 240 0 0)
        , width fill
        , padding 30
        ]
        Element.none
