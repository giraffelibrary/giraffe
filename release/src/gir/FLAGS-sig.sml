(* Copyright (C) 2016 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

signature FLAGS =
  sig
    eqtype t
    include BIT_FLAGS where type flags = t

    structure C :
      sig
        structure ValueType : C_VALUE_EQ_TYPE where type t = t
      end

    val null : t

    structure FFI :
      sig
        type val_ (* = C.ValueType.v *)
        type ref_
        val withVal : (val_ -> 'a) -> t -> 'a
        val fromVal : val_ -> t
        val withRefVal : (ref_ -> 'a) -> t -> (val_, 'a) pair
      end
  end
