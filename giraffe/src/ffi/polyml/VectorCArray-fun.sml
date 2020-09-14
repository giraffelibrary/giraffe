(* Copyright (C) 2016-2020 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

functor VectorCArray(CArray : C_ARRAY where type 'a C.ArrayType.from_p = 'a) :>
  C_ARRAY
    where type t = CArray.sequence
    where type elem = CArray.elem
    where type sequence = CArray.sequence
    where type 'a update = 'a  (* immutable *)
    where type 'a C.ArrayType.from_p = 'a CArray.C.ArrayType.from_p
    where type C.e = CArray.C.e
    where type C.opt = CArray.C.opt
    where type C.non_opt = CArray.C.non_opt
    where type 'a C.p = 'a CArray.C.p
    where type ('a, 'b) C.r = ('a, 'b) CArray.C.r =
  struct
    type t = CArray.sequence
    type elem = CArray.elem

    type 'a update = 'a

    val length = CArray.C.ArrayType.ElemSequence.length
    val get = CArray.C.ArrayType.ElemSequence.get
    val sub = CArray.C.ArrayType.ElemSequence.sub
    val set = CArray.C.ArrayType.ElemSequence.set
    val update = CArray.C.ArrayType.ElemSequence.update
    val tabulate = CArray.C.ArrayType.ElemSequence.tabulate

    val fromList = CArray.C.ArrayType.ElemSequence.fromList
    val toList = CArray.C.ArrayType.ElemSequence.toList

    type sequence = CArray.sequence
    val fromSequence = Fn.id
    val toSequence = Fn.id

    structure C = CArray.C

    structure FFI =
      struct
        val toC = CArray.fromSequence

        type opt = CArray.FFI.opt
        type non_opt = CArray.FFI.non_opt
        type 'a from_p = 'a CArray.FFI.from_p
        type 'a tabulator = 'a CArray.FFI.tabulator

        type 'a out_p = 'a CArray.FFI.out_p
        fun fromPtr d = CArray.FFI.copyPtr C.ArrayType.ElemSequence.tabulate d
        val copyPtr = CArray.FFI.copyPtr
        fun fromOptPtr d = CArray.FFI.copyOptPtr C.ArrayType.ElemSequence.tabulate d
        val copyOptPtr = CArray.FFI.copyOptPtr

        type 'a in_p = 'a CArray.FFI.in_p
        fun withPtr d f = CArray.FFI.withPtr d f o toC
        fun withDupPtr d f = CArray.FFI.withDupPtr d f o toC
        fun withOptPtr d f = CArray.FFI.withOptPtr d f o Option.map toC
        fun withDupOptPtr d f = CArray.FFI.withDupOptPtr d f o Option.map toC
        fun withNewPtr f n = CArray.FFI.withNewPtr f n

        type ('a, 'b) r = ('a, 'b) CArray.FFI.r
        val withNullRef = CArray.FFI.withNullRef
        fun withRefPtr d f = CArray.FFI.withRefPtr d f o toC
        fun withRefOptPtr d f = CArray.FFI.withRefOptPtr d f o Option.map toC
      end

    structure PolyML = CArray.PolyML
  end
