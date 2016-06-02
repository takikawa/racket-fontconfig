#lang racket/base

(require ffi/unsafe
         ffi/unsafe/define)

(provide fc-font-set-print
         
         fc-config-get-current
         fc-config-get-fonts
         fc-config-app-font-add-file)

(define fc-lib (ffi-lib "libfontconfig"))

(define-ffi-definer define-fc fc-lib)

(define-cpointer-type _FcConfig)
(define-cpointer-type _FcFontSet)
(define _FcSetName (_enum '(fc-set-system = 0
                            fc-set-application)))

(define-fc fc-font-set-print (_fun _FcFontSet -> _void)
           #:c-id FcFontSetPrint)

(define-fc fc-config-get-current (_fun -> _FcConfig)
           #:c-id FcConfigGetCurrent)
(define-fc fc-config-get-fonts (_fun _FcConfig _FcSetName -> _FcFontSet/null)
           #:c-id FcConfigGetFonts)
(define-fc fc-config-app-font-add-file (_fun _FcConfig _path -> _bool)
           #:c-id FcConfigAppFontAddFile)
