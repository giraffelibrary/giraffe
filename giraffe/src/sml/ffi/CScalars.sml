(* Copyright (C) 2016 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

structure GChar = CScalar(structure CValueType = GCharType val null = #"\000")
structure GBool = CScalar(structure CValueType = GBoolType val null = false)
structure GShort  = CScalar(structure CValueType = GShortType  val null = 0)
structure GUShort = CScalar(structure CValueType = GUShortType val null = 0)
structure GInt    = CScalar(structure CValueType = GIntType    val null = 0)
structure GUInt   = CScalar(structure CValueType = GUIntType   val null = 0)
structure GLong   = CScalar(structure CValueType = GLongType   val null = 0)
structure GULong  = CScalar(structure CValueType = GULongType  val null = 0)
structure GInt8   = CScalar(structure CValueType = GInt8Type   val null = 0)
structure GUInt8  = CScalar(structure CValueType = GUInt8Type  val null = 0w0)
structure GInt16  = CScalar(structure CValueType = GInt16Type  val null = 0)
structure GUInt16 = CScalar(structure CValueType = GUInt16Type val null = 0)
structure GInt32  = CScalar(structure CValueType = GInt32Type  val null = 0)
structure GUInt32 = CScalar(structure CValueType = GUInt32Type val null = 0)
structure GInt64  = CScalar(structure CValueType = GInt64Type  val null = 0)
structure GUInt64 = CScalar(structure CValueType = GUInt64Type val null = 0)
structure GSSize  = CScalar(structure CValueType = GSSizeType  val null = 0)
structure GSize   = CScalar(structure CValueType = GSizeType   val null = 0)
structure GFloat  = CScalar(structure CValueType = GFloatType  val null = 0.0)
structure GDouble = CScalar(structure CValueType = GDoubleType val null = 0.0)
structure FileDesc =
  CScalar(
    structure CValueType = FileDescType
    val null = Posix.FileSys.wordToFD 0w0
  )
