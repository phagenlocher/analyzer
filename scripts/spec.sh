# print all states the parser goes through
#export OCAMLRUNPARAM='p'
bin=src/mainspec.native
spec=${1-"tests/regression/18-file/file.spec"}
ocamlbuild -yaccflag -v -X webapp -no-links -use-ocamlfind $bin \
    && (./_build/$bin $spec \
        || (echo "$spec failed, running interactive now...";
            rlwrap ./_build/$bin
           )
       )
