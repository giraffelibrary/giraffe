(* Copyright (C) 2016 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

functor MLtonIntPointer(CInt : INTEGER) :
  sig
    val size : int
    val get : MLton.Pointer.t * int -> CInt.int
    val set : MLton.Pointer.t * int * CInt.int -> unit
  end
=
  struct
    val size =
      case CInt.precision of
        SOME n => n
      | NONE   => raise Fail "non-finite int precision not supported"

    open MLton.Pointer

    val get =
      case size of
        8  => CInt.fromLarge o Int8.toLarge  o getInt8
      | 16 => CInt.fromLarge o Int16.toLarge o getInt16
      | 32 => CInt.fromLarge o Int32.toLarge o getInt32
      | 64 => CInt.fromLarge o Int64.toLarge o getInt64
      | _  =>
          raise Fail ("int precision " ^ Int.toString size ^ " not supported")

    val set =
      case size of
        8  => (fn (p, n, x) => setInt8  (p, n, Int8.fromLarge  (CInt.toLarge x)))
      | 16 => (fn (p, n, x) => setInt16 (p, n, Int16.fromLarge (CInt.toLarge x)))
      | 32 => (fn (p, n, x) => setInt32 (p, n, Int32.fromLarge (CInt.toLarge x)))
      | 64 => (fn (p, n, x) => setInt64 (p, n, Int64.fromLarge (CInt.toLarge x)))
      | _  =>
          raise Fail ("int precision " ^ Int.toString size ^ " not supported")
  end
