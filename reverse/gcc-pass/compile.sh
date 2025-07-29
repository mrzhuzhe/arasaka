export CXX_FLAGS="-O3 -fopt-info-vec-all=test.txt -msse2 -g"

rm test.txt
g++ -S main.c ${CXX_FLAGS} -o bad.s