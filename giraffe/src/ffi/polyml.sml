(* Copyright (C) 2012-2013, 2016-2017 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

use "polyml/POLYML_F_F_I.sml";
use (
  case Int.maxInt of
    NONE => "polyml/PolyMLFFIIntConvs-IntInfAsInt.sml"
  | _    => "polyml/PolyMLFFIIntConvs.sml"
);
use "polyml/PolyMLFFI.sml";
use "HighLevelFFI.sml";
use "FINALIZABLE.sml";
use "C_VALUE.sml";
use "polyml/C_VALUE.sml";
use "C_VALUE_EQ.sml";
use "polyml/C_VALUE_EQ.sml";
use "C_VALUE_TYPE.sml";
use "C_VALUE_NULL_TYPE.sml";
use "C_VALUE_EQ_TYPE.sml";
use "C_VALUE_EQ_NULL_TYPE.sml";
use "FILE_DESC_TYPE.sml";
use "C_REF.sml";
use "polyml/C_REF.sml";
use "C_POINTER.sml";
use "polyml/C_POINTER.sml";
use "C_TYPED_POINTER.sml";
use "C_POINTER_TYPE.sml";
use "C_SCALAR.sml";
use "polyml/C_SCALAR.sml";
use "SEQUENCE.sml";
use "MONO_SEQUENCE.sml";
use "C_ARRAY_TYPE.sml";
use "C_ARRAY.sml";
use "polyml/C_ARRAY.sml";
use "C_ARRAY_LOW_LEVEL.sml";
use "polyml/Finalizable.sml";

use "polyml/CRef.sml";
use "polyml/CPointerInternal.sml";
use "CTypedPointer.sml";
use "CPointer.sml";
use "polyml/CScalar.sml";
use "polyml/CVectorLowLevel.sml";
use "polyml/CVector.sml";
use "polyml/CVectorNLowLevel.sml";
use "polyml/CVectorN.sml";
use "polyml/CValueCVectorType.sml";
use "polyml/CValueCVectorNType.sml";
use "polyml/CPointerCVectorType.sml";
use "polyml/CPointerCVectorNType.sml";
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
use "MonoVectorSequence.sml";
use "CValueVector.sml";
use "CValueVectorSequence.sml";
use "ListSequence.sml";
use "VectorSequence.sml";
use "UTF8.sml";
use "Utf8.sml";
use "CLASS.sml";
use "polyml/CLASS.sml";
use "UNION.sml";
use "polyml/UNION.sml";
use "RECORD.sml";
use "polyml/RECORD.sml";
use "VALUE_RECORD.sml";
use "polyml/VALUE_RECORD.sml";
use "CALLBACK.sml";
use "polyml/CALLBACK.sml";
use "NOTIFIED_CALLBACK.sml";
use "polyml/NOTIFIED_CALLBACK.sml";
use "FLAGS.sml";
use "polyml/FLAGS.sml";
use "ENUM.sml";
use "polyml/ENUM.sml";
use "polyml/PointerRecord.sml";
use "polyml/BoxedRecord.sml";
use "polyml/BoxedValueRecord.sml";
use "polyml/Flags.sml";
use "polyml/Enum.sml";
