(* Copyright (C) 2016-2021, 2025 Phil Clayton <phil.clayton@veonix.com>
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
    open CArray

    type t = sequence
    type elem = elem

    type 'a update = 'a

    val length = C.ArrayType.ElemSequence.length
    val get = C.ArrayType.ElemSequence.get
    val sub = C.ArrayType.ElemSequence.sub
    val set = C.ArrayType.ElemSequence.set
    val update = C.ArrayType.ElemSequence.update
    val tabulate = C.ArrayType.ElemSequence.tabulate

    val fromList = C.ArrayType.ElemSequence.fromList
    val toList = C.ArrayType.ElemSequence.toList

    structure C =
      struct
        open C

        val takePtr = FFI.copyPtr ArrayType.ElemSequence.tabulate ~1
        fun giveDupPtr f t =
          let
            fun check f p = f p handle e => (PointerType.free ~1 p; raise e)
          in
            check f (PointerType.toC t)
          end
        val touchPtr = ignore
      end

    structure FFI =
      struct
        val toC = fromSequence

        type opt = FFI.opt
        type non_opt = FFI.non_opt
        type 'a p = 'a FFI.p
        type 'a from_p = 'a FFI.from_p
        type 'a tabulator = 'a FFI.tabulator

        val touchPtr = ignore
        val touchOptPtr = ignore

        type 'a out_p = 'a FFI.out_p
        fun fromPtr d = FFI.copyPtr C.ArrayType.ElemSequence.tabulate d
        val copyPtr = FFI.copyPtr
        fun fromOptPtr d = FFI.copyOptPtr C.ArrayType.ElemSequence.tabulate d
        val copyOptPtr = FFI.copyOptPtr

        type 'a in_p = 'a FFI.in_p
        fun withPtr d f = FFI.withPtr d f o toC
        fun withDupPtr d f = FFI.withDupPtr d f o toC
        fun withOptPtr d f = FFI.withOptPtr d f o Option.map toC
        fun withDupOptPtr d f = FFI.withDupOptPtr d f o Option.map toC
        fun withNewPtr f n = FFI.withNewPtr f n

        type ('a, 'b) r = ('a, 'b) FFI.r
        val withNullRef = FFI.withNullRef
        fun withRefPtr d f = FFI.withRefPtr d f o toC
        fun withRefOptPtr d f = FFI.withRefOptPtr d f o Option.map toC
      end

    type sequence = sequence
    val fromSequence = Fn.id
    val toSequence = Fn.id
  end
