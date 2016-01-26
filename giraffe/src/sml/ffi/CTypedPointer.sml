(* Copyright (C) 2016 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

functor CTypedPointer (CType : C_TYPE) :> C_TYPED_POINTER where type e = CType.t =
  struct
    open CPointer

    type e = CType.t

    fun offset (p, n) =
      case Int.compare (n, 0) of
        GREATER => add (p, Word.fromInt n * CType.size)
      | EQUAL   => p
      | LESS    => sub (p, Word.fromInt (~ n) * CType.size)

    val set = CType.set
    val get = CType.get
  end
