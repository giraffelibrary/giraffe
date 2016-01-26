(* Copyright (C) 2013, 2016 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

signature F_F_I =
  sig
    structure Flags : F_F_I_FLAGS_ENUM where type t = Word32.word
    structure Enum : F_F_I_FLAGS_ENUM where type t = Int32.int
    structure OptPointer : F_F_I_SCALAR where type t = unit CPointer.p
    structure Char : F_F_I_SCALAR where type t = char
    structure Short : F_F_I_SCALAR where type t = LargeInt.int
    structure UShort : F_F_I_SCALAR where type t = LargeInt.int
    structure Int : F_F_I_SCALAR where type t = LargeInt.int
    structure UInt : F_F_I_SCALAR where type t = LargeInt.int
    structure Long : F_F_I_SCALAR where type t = LargeInt.int
    structure ULong : F_F_I_SCALAR where type t = LargeInt.int
    structure Bool : F_F_I_SCALAR where type t = bool
    structure Int8 : F_F_I_SCALAR where type t = LargeInt.int
    structure UInt8 : F_F_I_SCALAR where type t = LargeInt.int
    structure Int16 : F_F_I_SCALAR where type t = LargeInt.int
    structure UInt16 : F_F_I_SCALAR where type t = LargeInt.int
    structure Int32 : F_F_I_SCALAR where type t = LargeInt.int
    structure UInt32 : F_F_I_SCALAR where type t = LargeInt.int
    structure Int64 : F_F_I_SCALAR where type t = LargeInt.int
    structure UInt64 : F_F_I_SCALAR where type t = LargeInt.int
    structure Size : F_F_I_SCALAR where type t = LargeInt.int
    structure SSize : F_F_I_SCALAR where type t = LargeInt.int
    structure Float : F_F_I_SCALAR where type t = real
    structure Double : F_F_I_SCALAR where type t = real
    structure String :
      F_F_I_ARRAY
        where type t = string
        where type 'a C.in_p = GCharVec.MLton.p1 * 'a GCharVec.MLton.p2
        where type ('a, 'b) C.r = GCharVec.MLton.r1 * ('a, 'b) GCharVec.MLton.r2
    structure StringVector :
      F_F_I_ARRAY
        where type t = string list
        where
          type 'a C.in_p =
            GCharVecVec.MLton.p1
             * GCharVecVec.MLton.p2
             * 'a GCharVecVec.MLton.p3
        where
          type ('a, 'b) C.r =
            GCharVecVec.MLton.r1
             * GCharVecVec.MLton.r2
             * ('a, 'b) GCharVecVec.MLton.r3
  end
