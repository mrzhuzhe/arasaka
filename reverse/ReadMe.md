
# GCC-debug


1. gcc not vectorized  gather scatter
https://stackoverflow.com/questions/17567029/not-vectorized-not-suitable-for-gather-d-32476-34-d-32475-33

2. https://gcc.gnu.org/onlinedocs/gcc/Developer-Options.html
-fopt-info-vec
-fopt-info-vec-missed 

http://gcc.gnu.org/onlinedocs/gcc/Debugging-Options.html


3. Godot vectorization

https://godbolt.org/#g:!((g:!((g:!((h:codeEditor,i:(j:1,lang:c%2B%2B,source:'%23define+DATA_SIZE+2048%0A%0Aint+a%5BDATA_SIZE%5D,+b%5BDATA_SIZE%5D,+c%5BDATA_SIZE%5D%3B%0A%0Avoid+vec_test1()+%7B%0A++for+(int+i+%3D+0%3B+i+%3C+DATA_SIZE%3B+i%2B%2B)+%7B%0A++++a%5Bi%5D+%3D+b%5Bi%5D+%2B+c%5Bi%5D%3B%0A++%7D%0A%7D%0A%0Avoid+vec_test2()+%7B%0A++for+(int+i+%3D+0%3B+i+%3C+DATA_SIZE%3B+i%2B%2B)+%7B%0A++++a%5Bi%5D+%3D+b%5Bi%5D+%5E+c%5Bi%5D%3B%0A++%7D%0A%7D%0A%0Avoid+vec_test3()+%7B%0A++for+(int+i+%3D+0%3B+i+%3C+DATA_SIZE%3B+i%2B%2B)+%7B%0A++++a%5Bi%5D+%3D+b%5Bi%5D+*+c%5Bi%5D%3B%0A++%7D%0A%7D'),l:'5',n:'0',o:'C%2B%2B+source+%231',t:'0')),k:30.79526488886219,l:'4',n:'0',o:'',s:0,t:'0'),(g:!((h:compiler,i:(compiler:g72,filters:(b:'0',binary:'1',commentOnly:'0',demangle:'0',directives:'0',execute:'1',intel:'0',trim:'0'),lang:c%2B%2B,libs:!(),options:'-ftree-vectorize+-O1',source:1),l:'5',n:'0',o:'x86-64+gcc+7.2+(Editor+%231,+Compiler+%231)+C%2B%2B',t:'0')),k:33.80183088383581,l:'4',n:'0',o:'',s:0,t:'0'),(g:!((h:compiler,i:(compiler:g485,filters:(b:'0',binary:'1',commentOnly:'0',demangle:'0',directives:'0',execute:'1',intel:'0',trim:'0'),lang:c%2B%2B,libs:!(),options:'-ftree-vectorize+-O1',source:1),l:'5',n:'0',o:'x86-64+gcc+4.8.5+(Editor+%231,+Compiler+%233)+C%2B%2B',t:'0')),k:35.40290422730199,l:'4',n:'0',o:'',s:0,t:'0')),l:'2',n:'0',o:'',t:'0')),version:4

4. gcc code tree-vectorizer.h

5. llvm test-suite
 https://llvm.org/docs/TestSuiteGuide.html
 https://github.com/mollybuild/RISCV-Measurement/blob/master/Build-RISCV-LLVM-and-run-testsuite.md

6. llvm-lit

# Done

https://0xinfection.github.io/reversing/pages/part-12-instruction-pointer-register.html