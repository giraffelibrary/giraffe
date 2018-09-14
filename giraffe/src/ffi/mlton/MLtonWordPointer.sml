(* Copyright (C) 2016 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

functor MLtonWordPointer(CWord : WORD) :
  sig
    val size : int
    val get : MLton.Pointer.t * int -> CWord.word
    val set : MLton.Pointer.t * int * CWord.word -> unit
  end
=
  struct
    val size = CWord.wordSize

    open MLton.Pointer

    val get =
      case size of
        8  => CWord.fromLarge o Word8.toLarge  o getWord8
      | 16 => CWord.fromLarge o Word16.toLarge o getWord16
      | 32 => CWord.fromLarge o Word32.toLarge o getWord32
      | 64 => CWord.fromLarge o Word64.toLarge o getWord64
      | _  =>
          raise Fail ("word size " ^ Int.toString size ^ " not supported")

    val set =
      case size of
        8  => (fn (p, n, x) => setWord8  (p, n, Word8.fromLarge  (CWord.toLarge x)))
      | 16 => (fn (p, n, x) => setWord16 (p, n, Word16.fromLarge (CWord.toLarge x)))
      | 32 => (fn (p, n, x) => setWord32 (p, n, Word32.fromLarge (CWord.toLarge x)))
      | 64 => (fn (p, n, x) => setWord64 (p, n, Word64.fromLarge (CWord.toLarge x)))
      | _  =>
          raise Fail ("word size " ^ Int.toString size ^ " not supported")
  end
