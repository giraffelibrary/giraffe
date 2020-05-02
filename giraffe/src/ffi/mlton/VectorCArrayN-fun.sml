(* Copyright (C) 2016-2020 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

functor VectorCArrayN(CArray : C_ARRAY where type 'a C.ArrayType.from_p = int -> 'a) :>
  C_ARRAY
    where type t = CArray.sequence
    where type elem = CArray.elem
    where type sequence = CArray.sequence
    where type 'a C.ArrayType.from_p = 'a CArray.C.ArrayType.from_p
    where type 'a C.p = 'a CArray.C.p
    where type C.notnull = CArray.C.notnull =
  struct
    type t = CArray.sequence
    type elem = CArray.elem

    val length = CArray.C.ArrayType.length
    val sub = CArray.C.ArrayType.sub
    val tabulate = CArray.C.ArrayType.tabulate

    type sequence = CArray.sequence
    val fromSequence = Fn.id
    val toSequence = Fn.id

    structure C = CArray.C

    structure FFI =
      struct
        val toC = CArray.fromSequence

        type notnull = CArray.FFI.notnull
        type 'a from_p = 'a CArray.FFI.from_p
        type 'a tabulator = 'a CArray.FFI.tabulator

        type 'a out_p = 'a CArray.FFI.out_p
        fun fromPtr d = CArray.FFI.copyPtr C.ArrayType.tabulate d
        fun fromDupPtr d = CArray.FFI.copyPtr C.ArrayType.tabulate d
        val copyPtr = CArray.FFI.copyPtr
        fun fromOptPtr d = CArray.FFI.copyOptPtr C.ArrayType.tabulate d
        fun fromDupOptPtr d = CArray.FFI.copyOptPtr C.ArrayType.tabulate d
        val copyOptPtr = CArray.FFI.copyOptPtr

        type 'a in_p = 'a CArray.FFI.in_p
        fun withPtr f = CArray.FFI.withPtr f o toC
        fun withDupPtr d f = CArray.FFI.withDupPtr d f o toC
        fun withOptPtr f = CArray.FFI.withOptPtr f o Option.map toC
        fun withDupOptPtr d f = CArray.FFI.withDupOptPtr d f o Option.map toC

        type ('a, 'b) r = ('a, 'b) CArray.FFI.r
        val withNullRef = CArray.FFI.withNullRef
        fun withRefPtr f = CArray.FFI.withRefPtr f o toC
        fun withRefOptPtr f = CArray.FFI.withRefOptPtr f o Option.map toC
        fun withRefDupPtr d f = CArray.FFI.withRefDupPtr d f o toC
        fun withRefDupOptPtr d f =
          CArray.FFI.withRefDupOptPtr d f o Option.map toC
      end

    structure MLton = CArray.MLton
  end
