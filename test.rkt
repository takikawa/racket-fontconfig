#lang racket

(require "fontconfig.rkt")

(fc-config-get-fonts (fc-config-get-current)
                     'fc-set-application)

;; font from
;; https://github.com/google/fonts/blob/master/ofl/fjallaone/FjallaOne-Regular.ttf
(fc-config-app-font-add-file (fc-config-get-current)
                             "/tmp/FjallaOne-Regular.ttf")

(fc-font-set-print
 (fc-config-get-fonts (fc-config-get-current)
                      'fc-set-application))

(require racket/gui pict)
(show-pict (vl-append (text "foo" 'swiss 50)
                      (text "foo" "Fira Sans OT" 50)
                      ;; expect this to actually use the font
                      (text "foo" "Fjalla One" 50)))
