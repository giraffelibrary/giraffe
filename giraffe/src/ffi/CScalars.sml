(* Copyright (C) 2016 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

structure GChar = CScalarEqNull(structure CValueType = GCharType val null = #"\000")
structure GBool = CScalarEq(structure CValueType = GBoolType val null = false)
structure GShort  = CScalarEqNull(structure CValueType = GShortType  val null = 0)
structure GUShort = CScalarEqNull(structure CValueType = GUShortType val null = 0)
structure GInt    = CScalarEqNull(structure CValueType = GIntType    val null = 0)
structure GUInt   = CScalarEqNull(structure CValueType = GUIntType   val null = 0)
structure GLong   = CScalarEqNull(structure CValueType = GLongType   val null = 0)
structure GULong  = CScalarEqNull(structure CValueType = GULongType  val null = 0)
structure GInt8   = CScalarEqNull(structure CValueType = GInt8Type   val null = 0)
structure GUInt8  = CScalarEqNull(structure CValueType = GUInt8Type  val null = 0w0)
structure GInt16  = CScalarEqNull(structure CValueType = GInt16Type  val null = 0)
structure GUInt16 = CScalarEqNull(structure CValueType = GUInt16Type val null = 0)
structure GInt32  = CScalarEqNull(structure CValueType = GInt32Type  val null = 0)
structure GUInt32 = CScalarEqNull(structure CValueType = GUInt32Type val null = 0)
structure GInt64  = CScalarEqNull(structure CValueType = GInt64Type  val null = 0)
structure GUInt64 = CScalarEqNull(structure CValueType = GUInt64Type val null = 0)
structure GSSize  = CScalarEqNull(structure CValueType = GSSizeType  val null = 0)
structure GSize   = CScalarEqNull(structure CValueType = GSizeType   val null = 0)
structure GFloat  = CScalar(structure CValueType = GFloatType  val null = 0.0)
structure GDouble = CScalar(structure CValueType = GDoubleType val null = 0.0)
structure FileDesc =
  CScalarEq(
    structure CValueType = FileDescType
    val null = Posix.FileSys.wordToFD 0w0
  )
