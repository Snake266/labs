(TeX-add-style-hook
 "_preamble"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-class-options
                     '(("article" "12pt" "a4paper" "oneside")))
   (add-to-list 'LaTeX-verbatim-environments-local "lstlisting")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "lstinline")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "lstinline")
   (TeX-run-style-hooks
    "latex2e"
    "article"
    "art12"
    "fontspec"
    "titling"
    "amsmath"
    "geometry"
    "listings"
    "color")
   (LaTeX-add-color-definecolors
    "backcolor"))
 :latex)

