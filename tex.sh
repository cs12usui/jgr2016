#!/bin/bash

# default file name
filename="eps.v2"

# get file name from parameter
if [ $1 ]; then
    filename=$1
fi

sed -e 's/¥/\\/g' -e 's/‾/~/g' $filename.tex > tmp_out.tex

# make .dvi and .pdf file
/Library/TeX/texbin/platex tmp_out.tex
/Library/TeX/texbin/pbibtex tmp_out.aux
/Library/TeX/texbin/platex tmp_out.tex
/Library/TeX/texbin/dvipdfmx -p a4 tmp_out.dvi

# preview
open tmp_out.pdf
