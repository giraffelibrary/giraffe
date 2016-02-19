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
use "C_TYPE.sml";
use "polyml/C_TYPE.sml";
use "C_POINTER.sml";
use "polyml/C_POINTER.sml";
use "C_TYPED_POINTER.sml";
use "C_ARRAY.sml";
use "polyml/C_ARRAY.sml";
use "C_ARRAY_TYPE.sml";
use "FILE_DESC";
use "polyml/Finalizable.sml";

val libc = PolyMLFFI.load_lib ""
val libglib = PolyMLFFI.load_lib ""
;
use "polyml/CPointer.sml";
use "CTypedPointer.sml";
use "CPointer";
use "polyml/CVector.sml";
use "polyml/CVectorN.sml";
use "polyml/CVectorType.sml";
use "polyml/CVectorVectorType.sml";
use "polyml/CVectorVectorNType.sml";
use "polyml/GCharCType";
use "GCharCVectorType.sml";
use "GCharCVectorVectorType.sml";
use "GCharCVectorVectorNType.sml";
use "GCharCVector.sml";
use "GCharCVectorVector.sml";
use "GCharCVectorVectorN.sml";
use "F_F_I_SCALAR.sml";
use "polyml/F_F_I_SCALAR.sml";
use "polyml/F_F_I_ARRAY.sml";
use "polyml/FFIArray.sml";
use "polyml/F_F_I_FLAGS_ENUM.sml";
use "polyml/F_F_I.sml";
use "polyml/FFI.sml";
use "UTF8.sml";
use "UTF8_C_VECTOR.sml";
use "UTF8_C_VECTOR_N.sml";
use "Utf8.sml";
use "Utf8CVector.sml";
use "Utf8CVectorN.sml";
use "polyml/FileDesc.sml";
