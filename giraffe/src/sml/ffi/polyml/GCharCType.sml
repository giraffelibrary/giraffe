(* Copyright (C) 2016 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

structure GCharCType :> C_TYPE where type t = char =
  struct
    type t = char
    val null = #"\000"
    val size = 0w1
    type p = PolyMLFFI.Memory.Pointer.t
    fun get (p, n) =
      Byte.byteToChar (PolyMLFFI.Memory.getWord8 (p, Word.fromInt n))
    fun set (p, n, e) =
      PolyMLFFI.Memory.setWord8 (p, Word.fromInt n, Byte.charToByte e)

    local
      open PolyMLFFI
    in
      val g_malloc_sym = getSymbol libglib "g_malloc"
      val g_free_sym = getSymbol libglib "g_free"
      val malloc = call g_malloc_sym (cUlong --> cPointer)
      val free = call g_free_sym (cPointer --> cVoid)
    end
  end
