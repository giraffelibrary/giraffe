(* Copyright (C) 2017-2020 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

functor BoxedValueRecord(
  structure Pointer : C_POINTER
  type opt = Pointer.opt
  type non_opt = Pointer.non_opt
  type 'a p = 'a Pointer.p
  val copy_ : (non_opt p, non_opt p) pair -> unit
  val clear_ : non_opt p -> unit
  val size_ : unit -> GSize.FFI.val_
) :>
  VALUE_RECORD
    where type C.Pointer.opt = Pointer.opt
    where type C.Pointer.non_opt = Pointer.non_opt
    where type 'a C.Pointer.p = 'a Pointer.p
    where type ('a, 'b) C.Pointer.r = ('a, 'b) Pointer.r =
  struct
    val malloc0_ = Pointer.malloc0
    val free_ = Pointer.free
    val new0_ = malloc0_ o Word.fromInt o GSize.FFI.fromVal o size_
    fun dup_ ptr =
      let
        (* Ensure allocated memory is set to 0 in case `copy_` is a function
         * that checks the destination, e.g. giraffe_g_value_copy (which
         * first calls g_value_init. *)
        val ptrNew = new0_ ()
        val () = copy_ (ptr & ptrNew)
      in
        ptrNew
      end
    val take_ = Fn.ignore

    structure C =
      struct
        structure Pointer = Pointer
        type opt = Pointer.opt
        type non_opt = Pointer.non_opt
        type 'a p = 'a Pointer.p
        type ('a, 'b) r = ('a, 'b) Pointer.r

        structure ValueType =
          struct
            type t = non_opt p Finalizable.t
            type v = non_opt p
            type p = non_opt p

            structure PolyML =
              struct
                val cVal = Pointer.PolyML.cVal
                val cPtr = Pointer.PolyML.cVal
              end

            val isRef = true
            val size = Fn.lazy (Word.fromInt o GSize.FFI.fromVal o size_)

            fun toC _ = Pointer.null  (* acceptable because `isRef = true` *)
            fun updateC t dest = Finalizable.withValue (t, fn src => copy_ (src & dest))
            fun fromC v =
              let
                val object = Finalizable.new (dup_ v)
              in
                Finalizable.addFinalizer (object, fn ptr => (clear_ ptr; free_ ptr));
                object
              end

            val new = new0_
            val delete = free_
            val clear = clear_

            fun get p = p
            fun set (p, v) = copy_ (v & p)

            structure Memory = Pointer.NonOptValueType.Memory
          end

        structure PointerType =
          struct
            structure Pointer = Pointer
            type opt = Pointer.opt
            type non_opt = Pointer.non_opt
            type 'a p = 'a Pointer.p

            type t = non_opt p Finalizable.t

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

    type t = C.non_opt C.p Finalizable.t

    structure FFI =
      struct
        structure Pointer = C.Pointer
        type opt = Pointer.opt
        type non_opt = Pointer.non_opt
        type 'a p = 'a Pointer.p
        type ('a, 'b) r = ('a, 'b) Pointer.r

        local
          fun withPointer f = Pointer.withVal f

          fun withOptPointer f = Pointer.withOptVal f

          fun withDupPointer free f p =
            withPointer f p handle e => (free p; raise e)

          fun withDupOptPointer free f optptr =
            withOptPointer f optptr
              handle e => (Option.app free optptr; raise e)
        in
          fun withPtr f ptr =
            Finalizable.withValue (ptr, withPointer f)

          fun withDupPtr f ptr =
            Finalizable.withValue (ptr, withDupPointer free_ f o dup_)

          fun withOptPtr f =
            fn
              SOME ptr => Finalizable.withValue (ptr, withOptPointer f o SOME)
            | NONE     => withOptPointer f NONE

          fun withDupOptPtr f =
            fn
              SOME ptr => Finalizable.withValue (ptr, withDupOptPointer free_ f o SOME o dup_)
            | NONE     => withDupOptPointer ignore f NONE
        end

        fun withNewPtr f () =
          let
            val ptr = new0_ ()
          in
            ptr & f ptr
          end

        fun withNewDupPtr f ptr =
          let
            val p = Finalizable.withValue (ptr, dup_)
          in
            p & f p
          end

        local
          fun withRefPointer f = Pointer.withRefVal f

          fun withRefOptPointer f = Pointer.withRefOptVal f

          fun withRefDupPointer free f p =
            withRefPointer f p handle e => (free p; raise e)

          fun withRefDupOptPointer free f optptr =
            withRefOptPointer f optptr
              handle e => (Option.app free optptr; raise e)
        in
          fun withRefPtr f ptr =
            Finalizable.withValue (ptr, withRefPointer f)

          fun withRefDupPtr f ptr =
            Finalizable.withValue (ptr, withRefDupPointer free_ f o dup_)

          fun withRefOptPtr f =
            fn
              SOME ptr => Finalizable.withValue (ptr, withRefOptPointer f o SOME)
            | NONE     => withRefOptPointer f NONE

          fun withRefDupOptPtr f =
            fn
              SOME ptr => Finalizable.withValue (ptr, withRefDupOptPointer free_ f o SOME o dup_)
            | NONE     => withRefDupOptPointer ignore f NONE
        end

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
