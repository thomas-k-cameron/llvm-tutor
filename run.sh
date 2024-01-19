export LLVM_DIR="/usr/bin/opt"
mkdir build || cd build

cmake \
    -DCMAKE_EXPORT_COMPILE_COMMANDS=1 \
    -DLT_LLVM_INSTALL_DIR=$LLVM_DIR \
    /workspaces/llvm-tutor/HelloWorld/ChangeLoadTiminig.cpp

make

$LLVM_DIR -load-pass-plugin ./libChangeLoadTiminig.so \
    -passes=ChangeLoadTiminig \
    -disable-output \
    ../assets/o3-input_for_mba.ll