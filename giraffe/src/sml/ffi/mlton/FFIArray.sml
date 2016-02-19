(* Copyright (C) 2016 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

functor FFIArray (
  structure CArray : C_ARRAY
  type t
  val tabulate : int * (int -> CArray.elem) -> t
  val toVector : t -> CArray.vector
) :>
  F_F_I_ARRAY
    where type t = t
    where type 'a C.from_p = 'a CArray.C.from_p =
  struct
    type t = t
    val toC = CArray.fromVector o toVector

    structure C =
      struct
        type notnull = CArray.C.notnull
        type 'a out_p = 'a CArray.C.out_p
        type 'a in_p = 'a CArray.C.in_p
        type ('a, 'b) r = ('a, 'b) CArray.C.r
        type 'a from_p = 'a CArray.C.from_p

        val withNullRef = CArray.C.withNullRef

        fun withPtr f = CArray.C.withPtr f o toC
        fun withOptPtr f = CArray.C.withOptPtr f o Option.map toC

        fun withRefPtr f = CArray.C.withRefPtr f o toC
        fun withRefOptPtr f = CArray.C.withRefOptPtr f o Option.map toC

        fun withRefDupPtr f = CArray.C.withRefDupPtr ~1 f o toC
        fun withRefDupOptPtr f =
          CArray.C.withRefDupOptPtr ~1 f o Option.map toC

        fun fromPtr transfer =
          CArray.C.copyPtrWithTabulator tabulate
            (if transfer then ~1 else 0)
        fun fromOptPtr transfer =
          CArray.C.copyOptPtrWithTabulator tabulate
            (if transfer then ~1 else 0)
      end

    structure MLton = CArray.MLton
  end
