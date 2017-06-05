(* Copyright (C) 2017 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

functor BoxedValueRecord(
  structure Pointer : C_POINTER where type 'a p = PolyMLFFI.Memory.Pointer.t
  type notnull = Pointer.notnull
  type 'a p = 'a Pointer.p
  val new_ : unit -> notnull p
  val copy_ : (notnull p, notnull p) pair -> unit
  val take_ : notnull p -> unit
  val clear_ : notnull p -> unit
  val free_ : notnull p -> unit
  val size_ : unit -> GUInt.FFI.val_
) :>
  VALUE_RECORD
    where type C.Pointer.notnull = Pointer.notnull
    where type 'a C.Pointer.p = 'a Pointer.p
    where type ('a, 'b) C.Pointer.r = ('a, 'b) Pointer.r =
  struct
    fun dup_ ptr =
      let
        val ptrNew = new_ ()
        val () = copy_ (ptr & ptrNew)
      in
        ptrNew
      end

    structure C =
      struct
        structure Pointer = Pointer
        type notnull = Pointer.notnull
        type 'a p = 'a Pointer.p
        type ('a, 'b) r = ('a, 'b) Pointer.r

        structure ValueType =
          struct
            open PolyMLFFI

            type t = Memory.Pointer.t Finalizable.t
            type v = Memory.Pointer.t
            type p = Memory.Pointer.t

            structure PolyML =
              struct
                val cVal = cPointer
                val cPtr = cPointer
              end

            val isRef = true
            val size = Fn.lazy (Word.fromLargeInt o GUInt.FFI.fromVal o size_)

            fun toC _ = Memory.Pointer.null
            fun updateC t dest = Finalizable.withValue (t, fn src => copy_ (src & dest))
            fun fromC v =
              let
                val object = Finalizable.new (dup_ v)
              in
                Finalizable.addFinalizer (object, fn ptr => (clear_ ptr; free_ ptr));
                object
              end

            val new = new_
            val delete = free_
            val clear = clear_

            fun get p = p
            fun set (p, v) = copy_ (v & p)
            local
              val malloc_ = call (getSymbol libglib "g_malloc0") (GULong.PolyML.cVal --> cPointer)
              val free_ = call (getSymbol libglib "g_free") (cPointer --> cVoid)
            in
              fun malloc n = (GULong.FFI.withVal ---> I) malloc_ (Word.toLargeInt n)
              fun free p = (I ---> I) free_ p
            end
          end

        structure PointerType =
          struct
            structure Pointer = Pointer
            type notnull = Pointer.notnull
            type 'a p = 'a Pointer.p

            type t = notnull p Finalizable.t

            fun dup d = if d <> 0 then dup_ else Fn.id

            fun free d = if d <> 0 then free_ else ignore

            fun toC p = (* FFI.withPtr (dup ~1) p *)
              Finalizable.withValue (p, Pointer.withVal dup_)

            fun fromC p = (* FFI.fromPtr false p *)
              let
                val object = Finalizable.new (dup_ p)
              in
                Finalizable.addFinalizer (object, fn ptr => (clear_ ptr; free_ ptr));
                object
              end
          end
      end

    type t = C.notnull C.p Finalizable.t

    structure FFI =
      struct
        structure Pointer = C.Pointer
        type notnull = Pointer.notnull
        type 'a p = 'a Pointer.p
        type ('a, 'b) r = ('a, 'b) Pointer.r

        fun withPtr f ptr = Finalizable.withValue (ptr, Pointer.withVal f)

        fun withOptPtr f =
          fn
            SOME ptr => Finalizable.withValue (ptr, Pointer.withOptVal f o SOME)
          | NONE     => Pointer.withOptVal f NONE

        fun withNewPtr f () =
          let
            val ptr = new_ ()
          in
            ptr & f ptr
          end

        fun withRefPtr f ptr = Finalizable.withValue (ptr, Pointer.withRefVal f)

        fun withRefOptPtr f =
          fn
            SOME ptr => Finalizable.withValue (ptr, Pointer.withRefOptVal f o SOME)
          | NONE     => Pointer.withRefOptVal f NONE

        fun fromPtr transfer ptr =
          let
            val object =
              Finalizable.new (
                if transfer
                then (take_ ptr; ptr)  (* take the existing reference *)
                else dup_ ptr
              )
          in
            Finalizable.addFinalizer (object, fn ptr => (clear_ ptr; free_ ptr));
            object
          end

        fun fromOptPtr transfer optptr =
          Option.map (fromPtr transfer) (Pointer.fromOptVal optptr)
      end

    structure PolyML =
      struct
        val cPtr = C.Pointer.PolyML.cVal
        val cOptPtr = C.Pointer.PolyML.cOptVal
        val cOutRef = C.Pointer.PolyML.cRef
        val cOutOptRef = C.Pointer.PolyML.cOptOutRef
        val cInOutRef = C.Pointer.PolyML.cInRef
        val cInOutOptRef = C.Pointer.PolyML.cOptOutRef
      end
  end
