(* Copyright (C) 2013, 2016, 2019 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

signature C_SCALAR_EQ_NULL =
  sig
    eqtype t

    (**
     * `null` is passed to `withRefVal` as an initial value for 'out'
     * parameters.
     *)
    val null : t

    structure C :
      sig
        eqtype v

        structure ValueType :
          C_VALUE_EQ_NULL_TYPE
            where type t = t
            where type v = v
      end

    structure FFI :
      sig
        type val_ = C.v
        type ref_
        val withVal : (val_ -> 'a) -> t -> 'a
        val withRefVal : (ref_ -> 'a) -> t -> (val_, 'a) pair
        val fromVal : val_ -> t
      end
  end
