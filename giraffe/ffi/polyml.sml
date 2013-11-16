val libc = CInterface.load_lib "libc.so.6"
val libglib = CInterface.load_lib "libglib-2.0.so.0"
;
use "polyml/POLY_M_L_F_F_I.sml";
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
use "polyml/F_F_I_SCALAR.sml";
use "polyml/F_F_I_ARRAY.sml";
use "polyml/F_F_I_FLAGS_ENUM.sml";
use "polyml/F_F_I.sml";
use "polyml/FFI.sml";
use "polyml/Pid.sml";
use "polyml/FileDesc.sml";
