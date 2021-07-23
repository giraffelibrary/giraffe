(* Copyright (C) 2017-2021 Phil Clayton <phil.clayton@veonix.com>
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
    val malloc0_ = Pointer.Memory.malloc0
    val free_ = Pointer.Memory.free
    val new0_ = malloc0_ o size_
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

    type t = non_opt p Finalizable.t

    structure C =
      struct
        structure Pointer = Pointer
        type opt = Pointer.opt
        type non_opt = Pointer.non_opt
        type 'a p = 'a Pointer.p

        type v = non_opt p

        structure ValueType =
          struct
            type t = non_opt p Finalizable.t
            type v = non_opt p
            type p = non_opt p

            structure MLtonVector =
              struct
                val e = Finalizable.new Pointer.null
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

            structure Memory = Pointer.Memory
          end

        type 'a from_p = 'a

        structure PointerType =
          struct
            structure Pointer = Pointer
            type opt = Pointer.opt
            type non_opt = Pointer.non_opt
            type 'a p = 'a Pointer.p

            type t = non_opt p Finalizable.t

            type 'a from_p = 'a from_p

            fun dup d = if d <> 0 then dup_ else Fn.id

            fun free d = if d <> 0 then free_ else ignore

            fun toC t = (* giveDupPtr Fn.id t *)
              Finalizable.withValue (t, Pointer.withVal dup_)

            fun fromC p = (* takePtr (dup_ p) *)
              let
                val t = Finalizable.new (dup_ p)
                val () = Finalizable.addFinalizer (t, fn ptr => (clear_ ptr; free_ ptr));
              in
                t
              end

            structure CVector =
              struct
                type cvector = non_opt p
                val v = Pointer.null
                val free = free ~1
                val fromPointer = dup ~1
                val toPointer = dup ~1
                val fromVal = toC
                val toVal = fromC
              end
          end

        fun takePtr p =
          let
            val t = Finalizable.new p
            val () = Finalizable.addFinalizer (t, free_)
          in
            t
          end

        fun withPtr f t = Finalizable.withValue (t, f)

        fun giveDupPtr f =
          let
            fun check f p = f p handle e => (free_ p; raise e)
          in
            fn t => Finalizable.withValue (t, check f o dup_)
          end

        val touchPtr = Finalizable.touch
      end

    structure FFI =
      struct
        structure Pointer = C.Pointer
        type opt = Pointer.opt
        type non_opt = Pointer.non_opt
        type 'a p = 'a Pointer.p
        type ('a, 'b) r = ('a, 'b) Pointer.r

        local
          fun withPointer free f p =
            Pointer.withVal f p handle e => (free p; raise e)

          fun withOptPointer free f optp =
            Pointer.withOptVal f optp
              handle e => (Option.app free optp; raise e)

          fun withDupPointer free f p =
            p & withPointer free f p

          fun withDupOptPointer free f optp =
            Pointer.fromOpt optp & withOptPointer free f optp
        in
          fun withPtr transfer =
            if not transfer
            then
              fn f =>
              fn
                ptr => Finalizable.withValue (ptr, withPointer ignore f)
            else
              fn f =>
              fn
                ptr => Finalizable.withValue (ptr, withPointer free_ f o dup_)

          fun withDupPtr transfer =
            if not transfer
            then
              fn f =>
              fn
                ptr => Finalizable.withValue (ptr, withDupPointer ignore f)
            else
              fn f =>
              fn
                ptr => Finalizable.withValue (ptr, withDupPointer free_ f o dup_)


          fun withOptPtr transfer =
            if not transfer
            then
              fn f =>
              fn
                SOME ptr => Finalizable.withValue (ptr, withOptPointer ignore f o SOME)
              | NONE     => withOptPointer ignore f NONE
            else
              fn f =>
              fn
                SOME ptr => Finalizable.withValue (ptr, withOptPointer free_ f o SOME o dup_)
              | NONE     => withOptPointer ignore f NONE

          fun withDupOptPtr transfer =
            if not transfer
            then
              fn f =>
              fn
                SOME ptr => Finalizable.withValue (ptr, withDupOptPointer ignore f o SOME)
              | NONE     => withDupOptPointer ignore f NONE
            else
              fn f =>
              fn
                SOME ptr => Finalizable.withValue (ptr, withDupOptPointer free_ f o SOME o dup_)
              | NONE     => withDupOptPointer ignore f NONE
        end

        fun withNewPtr f () =
          let
            val p = new0_ ()
          in
            p & f p
          end

        local
          fun withRefPointer free f p =
            Pointer.withRefVal f p handle e => (free p; raise e)

          fun withRefOptPointer free f optptr =
            Pointer.withRefOptVal f optptr
              handle e => (Option.app free optptr; raise e)
        in
          fun withRefPtr transfer =
            if not transfer
            then
              fn f =>
              fn
                ptr => Finalizable.withValue (ptr, withRefPointer ignore f)
            else
              fn f =>
              fn
                ptr => Finalizable.withValue (ptr, withRefPointer free_ f o dup_)

          fun withRefOptPtr transfer =
            if not transfer
            then
              fn f =>
              fn
                SOME ptr => Finalizable.withValue (ptr, withRefOptPointer ignore f o SOME)
              | NONE     => withRefOptPointer ignore f NONE
            else
              fn f =>
              fn
                SOME ptr => Finalizable.withValue (ptr, withRefOptPointer free_ f o SOME o dup_)
              | NONE     => withRefOptPointer ignore f NONE
        end

        fun fromPtr transfer ptr =
          let
            val t =
              Finalizable.new (
                if transfer
                then (take_ ptr; ptr)  (* take the existing reference *)
                else dup_ ptr
              )
            val () = Finalizable.addFinalizer (t, fn ptr => (clear_ ptr; free_ ptr))
          in
            t
          end

        fun fromOptPtr transfer optptr =
          Option.map (fromPtr transfer) (Pointer.fromOptVal optptr)

        val touchPtr = Finalizable.touch

        fun touchOptPtr t = Option.app touchPtr t
      end
  end
