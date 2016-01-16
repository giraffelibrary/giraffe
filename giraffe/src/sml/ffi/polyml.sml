(* Copyright (C) 2012-2013, 2016 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

use "polyml/POLYML_F_F_I.sml";
use "polyml/PolyMLFFI.sml";
use "HighLevelFFI.sml";
use "FINALIZABLE.sml";
use "POINTER.sml";
use "polyml/POINTER.sml";
use "C_ARRAY.sml";
use "FILE_DESC";
use "polyml/Finalizable.sml";
use "polyml/CPointer.sml";

val libc = PolyMLFFI.load_lib ""
val libglib = PolyMLFFI.load_lib ""
;
use "polyml/GCharVec.sml";
use "polyml/GCharVecVec.sml";
use "polyml/F_F_I_SCALAR.sml";
use "polyml/F_F_I_ARRAY.sml";
use "polyml/F_F_I_FLAGS_ENUM.sml";
use "polyml/F_F_I.sml";
use "polyml/FFI.sml";
use "polyml/FileDesc.sml";
