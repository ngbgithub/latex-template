# Macro definitions:

# Look for Python.
AC_DEFUN([AC_PROG_PYTHON],[
if test -z "${PYTHON}"; then
   AC_PATH_PROGS(PYTHON,[python],no)
else
   AC_PATH_PROGS(PYTHON,[$PYTHON, python],no)
fi
if test $PYTHON = "no" ;
then
   AC_MSG_ERROR([Unable to find python]);
fi
AC_SUBST(PYTHON)
])


# Look for a Python library.
AC_DEFUN([AC_PYTHON_MODULE],
	[AC_MSG_CHECKING([for Python module $1])
$PYTHON -c "import $1"
if test $? -ne 0 ; then
   AC_MSG_RESULT([not found])
   AC_MSG_ERROR([The $1 Python module is a requirement for this package.  \
Note: If it is installed, make sure e.g. the module is discoverable using a \
mechanism like the PYTHONPATH environment variable])
fi
AC_MSG_RESULT(found)
])


# Look for a font.
AC_DEFUN([AC_FONT],
	[AC_MSG_CHECKING([for font $1])
fc-list | grep $1 > /dev/null
if test $? -ne 0 ; then
   AC_MSG_RESULT([not found])
   AC_MSG_WARN([************************************************************])
   AC_MSG_WARN([The $1 font is missing.  Bokeh plots will look a little \
screwy.  Hint: Try installing the fonts-cmu package.])
   AC_MSG_WARN([************************************************************])
else
   AC_MSG_RESULT(found)
fi
])


# Look for a LaTeX package.
AC_DEFUN([AC_LATEX_PACKAGE],
	[AC_MSG_CHECKING([for LaTeX package $1])
base=ac_tmp_tex
printf '\\documentclass{article}
\\usepackage{'"$1"'}
\\begin{document}
x
\\end{document}' > $base.tex
latex --halt-on-error -interaction=nonstopmode $base.tex \
      > /dev/null
rc=$?
for ext in tex aux dvi log ; do
   rm -f $base.$ext
done
if test "$rc" -ne 0 ; then
   AC_MSG_RESULT([not found])
   AC_MSG_ERROR([The $1 LaTeX is a requirement for this package.  Note: In \
Linux, try installing texlive-latex-extra.])
fi
AC_MSG_RESULT(found)
])


# Look for latex.
AC_DEFUN([AC_PROG_LATEX],[
if test -z "${LATEX}"; then
   AC_PATH_PROGS(LATEX,[latex],no)
else
   AC_PATH_PROGS(LATEX,[$LATEX, latex],no)
fi
if test $LATEX = "no" ;
then
   AC_MSG_ERROR([Unable to find latex]);
fi
AC_SUBST(LATEX)
])

# Look for latexmk.
AC_DEFUN([AC_PROG_LATEXMK],[
if test -z "${LATEXMK}"; then
   AC_PATH_PROGS(LATEXMK,[latexmk],no)
else
   AC_PATH_PROGS(LATEXMK,[$LATEXMK, latexmk],no)
fi
if test $LATEXMK = "no" ;
then
   AC_MSG_ERROR([Unable to find latexmk]);
fi
AC_SUBST(LATEXMK)
])


# Look for dvipng.
AC_DEFUN([AC_PROG_DVIPNG],[
if test -z "${DVIPNG}"; then
   AC_PATH_PROGS(DVIPNG,[dvipng],no)
else
   AC_PATH_PROGS(DVIPNG,[$DVIPNG, dvipng],no)
fi
if test $DVIPNG = "no" ;
then
   AC_MSG_WARN([************************************************************])
   AC_MSG_WARN([Unable to find dvipng binary.  You will not be
                 able to create png files from dvi.]);
   AC_MSG_WARN([************************************************************])
fi
AC_SUBST(DVIPNG)
])


# Look for dvips.
AC_DEFUN([AC_PROG_DVIPS],[
if test -z "${DVIPS}"; then
   AC_PATH_PROGS(DVIPS,[dvips],no)
else
   AC_PATH_PROGS(DVIPS,[$DVIPS, dvips],no)
fi
if test $DVIPS = "no" ;
then
   AC_MSG_WARN([************************************************************])
   AC_MSG_WARN([Unable to find dvips binary.  You will not be
                 able to create ps files from dvi.]);
   AC_MSG_WARN([************************************************************])
fi
AC_SUBST(DVIPS)
])


# Look for convert.
AC_DEFUN([AC_PROG_CONVERT],[
if test -z "${CONVERT}"; then
   AC_PATH_PROGS(CONVERT,[convert],no)
else
   AC_PATH_PROGS(CONVERT,[$CONVERT, convert],no)
fi
if test $CONVERT = "no" ;
then
   AC_MSG_WARN([************************************************************])
   AC_MSG_WARN([Unable to find convert binary.  You will not be
                 able to create png files from postscript.]);
   AC_MSG_WARN([************************************************************])
fi
AC_SUBST(CONVERT)
])


# Look for phantomjs.
AC_DEFUN([AC_PROG_PHANTOMJS],[
if test -z "${PHANTOMJS}"; then
   AC_PATH_PROGS(PHANTOMJS,[phantomjs],no)
else
   AC_PATH_PROGS(PHANTOMJS,[$PHANTOMJS, phantomjs],no)
fi
if test $PHANTOMJS = "no" ;
then
   AC_MSG_WARN([************************************************************])
   AC_MSG_WARN([Unable to find phantomjs binary.  You will not be
                 able to create color matrix svg files.]);
   AC_MSG_WARN([************************************************************])
fi
AC_SUBST(PHANTOMJS)
])


# Look for inkscape.
AC_DEFUN([AC_PROG_INKSCAPE],[
if test -z "${INKSCAPE}"; then
   AC_PATH_PROGS(INKSCAPE,[inkscape],no)
else
   AC_PATH_PROGS(INKSCAPE,[$INKSCAPE, inkscape],no)
fi
if test $INKSCAPE = "no" ;
then
   AC_MSG_WARN([Unable to find inkscape binary.  You will not be
   		  able to create color matrix svg files.]);
fi
AC_SUBST(INKSCAPE)
])


