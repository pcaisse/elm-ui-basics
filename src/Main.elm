module Main exposing (..)

import Element exposing (Element, alignBottom, alignLeft, alignRight, alignTop, centerX, centerY, column, el, fill, padding, rgb255, row, spacing, text, width)
import Element.Background as Background
import Element.Border as Border
import Element.Font as Font


main =
    Element.layout []
        (Element.column
            [ width fill ]
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
        , padding 100
        ]
        (text "body")


footer =
    Element.el
        [ Background.color (rgb255 240 0 0)
        , width fill
        , padding 30
        ]
        Element.none
