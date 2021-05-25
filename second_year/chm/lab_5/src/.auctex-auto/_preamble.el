(TeX-add-style-hook
 "_preamble"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-class-options
                     '(("article" "12pt" "a4paper" "oneside")))
   (TeX-add-to-alist 'LaTeX-provided-package-options
                     '(("babel" "english" "russian")))
   (TeX-run-style-hooks
    "latex2e"
    "article"
    "art12"
    "fontspec"
    "babel"
    "titling"
    "amsmath"
    "geometry"
    "listings"
    "color"
    "graphicx"
    "float"))
 :latex)

