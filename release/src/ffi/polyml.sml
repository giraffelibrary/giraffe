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
use "C_MEMORY-sig.sml";
use "polyml/C_MEMORY-sig.sml";
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
use "polyml/CMemory.sml";
use "polyml/CRef-fun.sml";
use "polyml/CPointerInternal-fun.sml";
use "CPointer-fun.sml";
use "CTypedPointer-fun.sml";
use "polyml/CScalar-fun.sml";
use "polyml/CScalarNull-fun.sml";
use "polyml/CScalarEq-fun.sml";
use "polyml/CScalarEqNull-fun.sml";
use "polyml/CArrayCommon-fun.sml";
use "polyml/CArray-fun.sml";
use "polyml/ConstCArray-fun.sml";
use "polyml/VectorCArray-fun.sml";
use "polyml/CArrayNCommon-fun.sml";
use "polyml/CArrayN-fun.sml";
use "polyml/ConstCArrayN-fun.sml";
use "polyml/VectorCArrayN-fun.sml";
use "polyml/CValueCArrayType-fun.sml";
use "polyml/CValueCArrayNType-fun.sml";
use "polyml/CPointerCArrayType-fun.sml";
use "polyml/CPointerCArrayNType-fun.sml";
use "polyml/CharType-fun.sml";
use "polyml/ShortType-fun.sml";
use "polyml/UShortType-fun.sml";
use "polyml/IntType-fun.sml";
use "polyml/UIntType-fun.sml";
use "polyml/LongType-fun.sml";
use "polyml/ULongType-fun.sml";
use "polyml/BoolType-fun.sml";
use "polyml/Int8Type-fun.sml";
use "polyml/UInt8Type-fun.sml";
use "polyml/Int16Type-fun.sml";
use "polyml/UInt16Type-fun.sml";
use "polyml/Int32Type-fun.sml";
use "polyml/UInt32Type-fun.sml";
use "polyml/Int64Type-fun.sml";
use "polyml/UInt64Type-fun.sml";
use "polyml/SSizeType-fun.sml";
use "polyml/SizeType-fun.sml";
use "polyml/FloatType-fun.sml";
use "polyml/DoubleType-fun.sml";
use "polyml/FileDescType-fun.sml";
use "MonoVectorSequence-fun.sml";
use "CValueVector-fun.sml";
use "CValueVectorSequence-fun.sml";
use "ListSequence.sml";
use "VectorSequence.sml";
