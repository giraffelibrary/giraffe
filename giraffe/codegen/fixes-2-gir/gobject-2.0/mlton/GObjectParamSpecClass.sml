(* Copyright (C) 2013, 2015-2020 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

structure GObjectParamSpecClass :>
  G_OBJECT_PARAM_SPEC_CLASS
    where type ('a, 'b) value_accessor_t = ('a, 'b) ValueAccessor.t =
  struct
    structure Pointer = CPointer(GMemory)
    type opt = Pointer.opt
    type non_opt = Pointer.non_opt
    type 'a p = 'a Pointer.p
    type ('a, 'b) r = ('a, 'b) Pointer.r

    val take_ = ignore

    val ref_ = _import "g_param_spec_ref_sink" : non_opt p -> non_opt p;

    val unref_ = _import "g_param_spec_unref" : non_opt p -> unit;

    structure C =
      struct
        structure Pointer = Pointer
        type opt = Pointer.opt
        type non_opt = Pointer.non_opt
        type 'a p = 'a Pointer.p
        type ('a, 'b) r = ('a, 'b) Pointer.r

        structure PointerType =
          struct
            structure Pointer = Pointer
            type opt = Pointer.opt
            type non_opt = Pointer.non_opt
            type 'a p = 'a Pointer.p

            type t = non_opt p Finalizable.t

            fun dup d = if d <> 0 then ref_ else Fn.id

            fun free d = if d <> 0 then unref_ else ignore

            fun toC p = (* FFI.withPtr (dup ~1) p *)
              Finalizable.withValue (p, Pointer.withVal ref_)

            fun fromC p = (* FFI.fromPtr false p *)
              let
                val object = Finalizable.new (ref_ p)
              in
                Finalizable.addFinalizer (object, unref_);
                object
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
      end

    type 'a class = non_opt p Finalizable.t
    type t = base class
    fun toBase obj = obj

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
            Finalizable.withValue (ptr, withDupPointer unref_ f o ref_)

          fun withOptPtr f =
            fn
              SOME ptr => Finalizable.withValue (ptr, withOptPointer f o SOME)
            | NONE     => withOptPointer f NONE

          fun withDupOptPtr f =
            fn
              SOME ptr => Finalizable.withValue (ptr, withDupOptPointer unref_ f o SOME o ref_)
            | NONE     => withDupOptPointer ignore f NONE
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
            Finalizable.withValue (ptr, withRefDupPointer unref_ f o ref_)

          fun withRefOptPtr f =
            fn
              SOME ptr => Finalizable.withValue (ptr, withRefOptPointer f o SOME)
            | NONE     => withRefOptPointer f NONE

          fun withRefDupOptPtr f =
            fn
              SOME ptr => Finalizable.withValue (ptr, withRefDupOptPointer unref_ f o SOME o ref_)
            | NONE     => withRefDupOptPointer ignore f NONE
        end

        fun fromPtr transfer ptr =
          let
            val object =
              Finalizable.new (
                if transfer
                then (take_ ptr; ptr)  (* take the existing reference *)
                else ref_ ptr
              )
          in
            Finalizable.addFinalizer (object, unref_);
            object
          end

        fun fromOptPtr transfer optptr =
          Option.map (fromPtr transfer) (Pointer.fromOptVal optptr)
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

    type ('a, 'b) value_accessor_t = ('a, 'b) ValueAccessor.t

    val t =
      ValueAccessor.C.createAccessor {
        getType  = GObjectType.param,
        getValue = (I ---> FFI.fromPtr false) getValue_,
        setValue = (I &&&> FFI.withPtr ---> I) setValue_
      }

    val tOpt =
      ValueAccessor.C.createAccessor {
        getType  = GObjectType.param,
        getValue = (I ---> FFI.fromOptPtr false) getOptValue_,
        setValue = (I &&&> FFI.withOptPtr ---> I) setOptValue_
      }

    val objectType_ = _import "giraffe_g_object_type" : non_opt p -> GObjectType.FFI.val_;

    fun objectType object = (FFI.withPtr ---> GObjectType.FFI.fromVal) objectType_ object

    fun toDerived subclass object = (
      let
        val objectType = objectType object
        val derivedType = ValueAccessor.gtype subclass
      in
        if GObjectType.isA (objectType, derivedType)
        then ()
        else
          GiraffeLog.critical (
            String.concat [
              "Invalid downcast to type ", GObjectType.name derivedType,
              " on object of type ",       GObjectType.name objectType
            ]
          )
      end;
      object
    )
  end
