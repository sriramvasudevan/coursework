if [[ -d $1 ]]
then
    cd $1
    file=${1::-1}
    pandoc -s $file.markdown -o $file.tex -V geometry:margin=0.8in
    pdflatex $file.tex
    rm *.aux *.log *~ *.out -rf
else
    echo Please pass a directory as an argument
fi

