val libc = CInterface.load_lib "libc.so.6"
val libglib = CInterface.load_lib "libglib-2.0.so.0"
;
use "polyml/POLYML_FFI.sml";
use "polyml/PolyMLFFI.sml";
use "HighLevelFFI.sml";
use "POINTER.sml";
use "C_ARRAY.sml";
use "PID.sml";
use "FILE_DESC";
use "polyml/CPointer.sml";
use "polyml/Finalizable.sml";
use "polyml/GCharVec.sml";
use "polyml/GCharVecVec.sml";
use "polyml/FFI.sml";
use "polyml/Pid.sml";
use "polyml/FileDesc.sml";
