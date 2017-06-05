(* Copyright (C) 2016-2017 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

functor CVectorN(CVectorType : C_ARRAY_TYPE where type 'a from_p = int -> 'a) :>
  C_ARRAY
    where type elem = CVectorType.elem
    where type t = CVectorType.t
    where type C.ArrayType.elem = CVectorType.elem
    where type C.ArrayType.t = CVectorType.t
    where type 'a C.ArrayType.from_p = 'a CVectorType.from_p
    where type 'a C.p = 'a CVectorType.p
    where type C.notnull = CVectorType.notnull =
  struct
    structure LowLevel = CVectorNLowLevel(CVectorType)

    type elem = LowLevel.elem
    type t = LowLevel.vector

    val length = CVectorType.length

    structure C = LowLevel.C

    structure FFI =
      struct
        val toC = LowLevel.fromVector

        type notnull = LowLevel.FFI.notnull
        type 'a from_p = 'a LowLevel.FFI.from_p
        type 'a tabulator = 'a LowLevel.FFI.tabulator

        type 'a out_p = 'a LowLevel.FFI.out_p
        fun fromPtr d = LowLevel.FFI.copyPtr CVectorType.tabulate d
        fun fromDupPtr d = LowLevel.FFI.copyPtr CVectorType.tabulate d
        val copyPtr = LowLevel.FFI.copyPtr
        fun fromOptPtr d = LowLevel.FFI.copyOptPtr CVectorType.tabulate d
        fun fromDupOptPtr d = LowLevel.FFI.copyOptPtr CVectorType.tabulate d
        val copyOptPtr = LowLevel.FFI.copyOptPtr

        type 'a in_p = 'a LowLevel.FFI.in_p
        fun withPtr f = LowLevel.FFI.withPtr f o toC
        fun withDupPtr d f = LowLevel.FFI.withDupPtr d f o toC
        fun withOptPtr f = LowLevel.FFI.withOptPtr f o Option.map toC
        fun withDupOptPtr d f = LowLevel.FFI.withDupOptPtr d f o Option.map toC

        type ('a, 'b) r = ('a, 'b) LowLevel.FFI.r
        val withNullRef = LowLevel.FFI.withNullRef
        fun withRefPtr f = LowLevel.FFI.withRefPtr f o toC
        fun withRefOptPtr f = LowLevel.FFI.withRefOptPtr f o Option.map toC
        fun withRefDupPtr d f = LowLevel.FFI.withRefDupPtr d f o toC
        fun withRefDupOptPtr d f =
          LowLevel.FFI.withRefDupOptPtr d f o Option.map toC
      end

    structure MLton = LowLevel.MLton
  end
