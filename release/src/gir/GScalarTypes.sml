(* Copyright (C) 2020 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

structure GCharType = CharType(GMemory)
structure GBoolType = BoolType(GMemory)
structure GShortType = ShortType(GMemory)
structure GUShortType = UShortType(GMemory)
structure GIntType = IntType(GMemory)
structure GUIntType = UIntType(GMemory)
structure GLongType = LongType(GMemory)
structure GULongType = ULongType(GMemory)
structure GInt8Type = Int8Type(GMemory)
structure GUInt8Type = UInt8Type(GMemory)
structure GInt16Type = Int16Type(GMemory)
structure GUInt16Type = UInt16Type(GMemory)
structure GInt32Type = Int32Type(GMemory)
structure GUInt32Type = UInt32Type(GMemory)
structure GInt64Type = Int64Type(GMemory)
structure GUInt64Type = UInt64Type(GMemory)
structure GSSizeType = SSizeType(GMemory)
structure GSizeType = SizeType(GMemory)
structure GFloatType = FloatType(GMemory)
structure GDoubleType = DoubleType(GMemory)
structure GFileDescType = FileDescType(GMemory)
