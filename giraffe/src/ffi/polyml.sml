(* Copyright (C) 2012-2020 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

use "polyml/POLYML_F_F_I-sig.sml";
use (
  case Int.maxInt of
    NONE => "polyml/PolyMLFFIIntConvs-IntInfAsInt.sml"
  | _    => "polyml/PolyMLFFIIntConvs.sml"
);
use "polyml/PolyMLFFI.sml";
use "HighLevelFFI.sml";
use "FINALIZABLE-sig.sml";
use "C_VALUE-sig.sml";
use "polyml/C_VALUE-sig.sml";
use "C_VALUE_EQ-sig.sml";
use "polyml/C_VALUE_EQ-sig.sml";
use "C_VALUE_TYPE-sig.sml";
use "C_VALUE_NULL_TYPE-sig.sml";
use "C_VALUE_EQ_TYPE-sig.sml";
use "C_VALUE_EQ_NULL_TYPE-sig.sml";
use "FILE_DESC_TYPE-sig.sml";
use "C_REF-sig.sml";
use "polyml/C_REF-sig.sml";
use "C_POINTER-sig.sml";
use "polyml/C_POINTER-sig.sml";
use "C_TYPED_POINTER-sig.sml";
use "C_POINTER_TYPE-sig.sml";
use "C_SCALAR-sig.sml";
use "polyml/C_SCALAR-sig.sml";
use "C_SCALAR_NULL-sig.sml";
use "polyml/C_SCALAR_NULL-sig.sml";
use "C_SCALAR_EQ-sig.sml";
use "polyml/C_SCALAR_EQ-sig.sml";
use "C_SCALAR_EQ_NULL-sig.sml";
use "polyml/C_SCALAR_EQ_NULL-sig.sml";
use "SEQUENCE-sig.sml";
use "MONO_SEQUENCE-sig.sml";
use "C_ARRAY_TYPE-sig.sml";
use "C_ARRAY-sig.sml";
use "polyml/C_ARRAY-sig.sml";
use "C_ARRAY_N-sig.sml";
use "polyml/Finalizable.sml";
use "polyml/CRef-fun.sml";
use "polyml/CPointerInternal.sml";
use "CTypedPointer-fun.sml";
use "CPointer.sml";
use "polyml/CScalar-fun.sml";
use "polyml/CScalarNull-fun.sml";
use "polyml/CScalarEq-fun.sml";
use "polyml/CScalarEqNull-fun.sml";
use "polyml/VectorCArray-fun.sml";
use "polyml/VectorCArrayN-fun.sml";
use "polyml/CArray-fun.sml";
use "polyml/CArrayN-fun.sml";
use "polyml/CValueCArrayType-fun.sml";
use "polyml/CValueCArrayNType-fun.sml";
use "polyml/CPointerCArrayType-fun.sml";
use "polyml/CPointerCArrayNType-fun.sml";
use "polyml/GCharType.sml";
use "polyml/GShortType.sml";
use "polyml/GUShortType.sml";
use "polyml/GIntType.sml";
use "polyml/GUIntType.sml";
use "polyml/GLongType.sml";
use "polyml/GULongType.sml";
use "polyml/GBoolType.sml";
use "polyml/GInt8Type.sml";
use "polyml/GUInt8Type.sml";
use "polyml/GInt16Type.sml";
use "polyml/GUInt16Type.sml";
use "polyml/GInt32Type.sml";
use "polyml/GUInt32Type.sml";
use "polyml/GInt64Type.sml";
use "polyml/GUInt64Type.sml";
use "polyml/GSSizeType.sml";
use "polyml/GSizeType.sml";
use "polyml/GFloatType.sml";
use "polyml/GDoubleType.sml";
use "polyml/FileDescType.sml";
use "CScalars.sml";
use "MonoVectorSequence-fun.sml";
use "CValueVector-fun.sml";
use "CValueVectorSequence-fun.sml";
use "ListSequence.sml";
use "VectorSequence.sml";
use "UTF8-sig.sml";
use "Utf8.sml";
use "CLASS-sig.sml";
use "polyml/CLASS-sig.sml";
use "UNION-sig.sml";
use "polyml/UNION-sig.sml";
use "RECORD-sig.sml";
use "polyml/RECORD-sig.sml";
use "VALUE_RECORD-sig.sml";
use "polyml/VALUE_RECORD-sig.sml";
use "CALLBACK-sig.sml";
use "polyml/CALLBACK-sig.sml";
use "NOTIFIED_CALLBACK-sig.sml";
use "polyml/NOTIFIED_CALLBACK-sig.sml";
use "FLAGS-sig.sml";
use "polyml/FLAGS-sig.sml";
use "ENUM-sig.sml";
use "polyml/ENUM-sig.sml";
use "polyml/PointerRecord-fun.sml";
use "polyml/BoxedRecord-fun.sml";
use "polyml/BoxedValueRecord-fun.sml";
use "polyml/Flags-fun.sml";
use "polyml/Enum-fun.sml";
