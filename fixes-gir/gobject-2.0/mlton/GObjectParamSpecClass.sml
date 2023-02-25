(* Copyright (C) 2013, 2015-2021, 2023 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

structure GObjectParamSpecClass :>
  G_OBJECT_PARAM_SPEC_CLASS
    where type type_t = GObjectType.t =
  struct
    structure Pointer = CPointer(GMemory)
    type opt = Pointer.opt
    type non_opt = Pointer.non_opt
    type 'a p = 'a Pointer.p
    type ('a, 'b) r = ('a, 'b) Pointer.r

    val take_ = ignore

    val dup_ = _import "g_param_spec_ref_sink" : non_opt p -> non_opt p;

    val free_ = _import "g_param_spec_unref" : non_opt p -> unit;

    type 'a class = non_opt p Finalizable.t
    type t = base class
    fun toBase obj = obj

    structure C =
      struct
        structure Pointer = Pointer
        type opt = Pointer.opt
        type non_opt = Pointer.non_opt
        type 'a p = 'a Pointer.p

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
                val () = Finalizable.addFinalizer (t, free_)
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

          fun withOptPointer free f optptr =
            Pointer.withOptVal f optptr
              handle e => (Option.app free optptr; raise e)
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
                then (
                  take_ ptr; ptr  (* take the existing reference *)
                )
                else dup_ ptr
              )
            val () = Finalizable.addFinalizer (t, free_)
          in
            t
          end

        fun fromOptPtr transfer optptr =
          Option.map (fromPtr transfer) (Pointer.fromOptVal optptr)

        val touchPtr = Finalizable.touch

        fun touchOptPtr t = Option.app touchPtr t
      end

    val getValue_ =
      _import "g_value_get_param" :
        GObjectValueRecord.FFI.non_opt GObjectValueRecord.FFI.p -> FFI.non_opt FFI.p;

    val getOptValue_ =
      _import "g_value_get_param" :
        GObjectValueRecord.FFI.non_opt GObjectValueRecord.FFI.p -> FFI.opt FFI.p;

    val setValue_ =
      fn x1 & x2 =>
        (_import "g_value_set_param" :
           GObjectValueRecord.FFI.non_opt GObjectValueRecord.FFI.p * FFI.non_opt FFI.p -> unit;)
        (x1, x2)

    val setOptValue_ =
      fn x1 & x2 =>
        (_import "g_value_set_param" :
           GObjectValueRecord.FFI.non_opt GObjectValueRecord.FFI.p * FFI.opt FFI.p -> unit;)
        (x1, x2)

    val instanceType_ = _import "giraffe_g_param_spec_type" : non_opt p -> GObjectType.FFI.val_;

    type type_t = GObjectType.t

    val t =
      ValueAccessor.C.createAccessor {
        getType  = GObjectType.param,
        getValue = (I ---> FFI.fromPtr false) getValue_,
        setValue = (I &&&> FFI.withPtr false ---> I) setValue_
      }

    val tOpt =
      ValueAccessor.C.createAccessor {
        getType  = GObjectType.param,
        getValue = (I ---> FFI.fromOptPtr false) getOptValue_,
        setValue = (I &&&> FFI.withOptPtr false ---> I) setOptValue_
      }

    local
      val call = FFI.withPtr false ---> GObjectType.FFI.fromVal
    in
      fun instanceType object = call instanceType_ (toBase object)
    end

    fun toDerived subclass instance = (
      let
        val instanceType = instanceType instance
        val derivedType = ValueAccessor.gtype subclass
      in
        if GObjectType.isA (instanceType, derivedType)
        then ()
        else
          GiraffeLog.critical (
            String.concat [
              "Invalid downcast to type ", GObjectType.name derivedType,
              " on object of type ",       GObjectType.name instanceType
            ]
          )
      end;
      instance
    )
  end
