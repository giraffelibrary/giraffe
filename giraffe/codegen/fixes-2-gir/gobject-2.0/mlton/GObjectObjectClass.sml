(* Copyright (C) 2013, 2016-2020 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

structure GObjectObjectClass :>
  G_OBJECT_OBJECT_CLASS
    where type type_t = GObjectType.t
    where type ('a, 'b) value_accessor_t = ('a, 'b) ValueAccessor.t =
  struct
    structure Pointer = CPointer(GMemory)
    type opt = Pointer.opt
    type non_opt = Pointer.non_opt
    type 'a p = 'a Pointer.p
    type ('a, 'b) r = ('a, 'b) Pointer.r

    val () =
      if GiraffeDebug.isEnabled
      then
        let
          val (_, setDebugClosure) =
            _symbol "giraffe_debug_closure" external :
              (unit -> bool) * (bool -> unit);
          val (_, setDebugRefCount) =
            _symbol "giraffe_debug_ref_count" external :
              (unit -> bool) * (bool -> unit);
        in
          setDebugClosure (GiraffeDebug.getClosure ());
          setDebugRefCount (GiraffeDebug.getRefCount ())
        end
      else ()

    val isFloating_ = _import "g_object_is_floating" : non_opt p -> GBool.FFI.val_;

    val take_ =
      if GiraffeDebug.isEnabled
      then _import "giraffe_debug_object_take" : non_opt p -> unit;
      else ignore

    val dup_ =
      if GiraffeDebug.isEnabled
      then _import "giraffe_debug_g_object_ref_sink" : non_opt p -> non_opt p;
      else _import "g_object_ref_sink" : non_opt p -> non_opt p;

    val free_ =
      if GiraffeDebug.isEnabled
      then _import "giraffe_debug_g_object_unref" : non_opt p -> unit;
      else _import "g_object_unref" : non_opt p -> unit;

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

            fun dup d = if d <> 0 then dup_ else Fn.id

            fun free d = if d <> 0 then free_ else ignore

            fun toC p = (* FFI.withPtr false (dup ~1) p *)
              Finalizable.withValue (p, Pointer.withVal dup_)

            fun fromC p = (* FFI.fromPtr false p *)
              let
                val object = Finalizable.new (dup_ p)
              in
                Finalizable.addFinalizer (object, free_);
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
            val object =
              Finalizable.new (
                if transfer
                then (
                  if GBool.FFI.fromVal (isFloating_ ptr)
                  then GiraffeLog.critical "taking ownership of floating reference"
                  else ();
                  take_ ptr; ptr  (* take the existing reference *)
                )
                else dup_ ptr
              )
          in
            Finalizable.addFinalizer (object, free_);
            object
          end

        fun fromOptPtr transfer optptr =
          Option.map (fromPtr transfer) (Pointer.fromOptVal optptr)

        val touchPtr = Finalizable.touch

        fun touchOptPtr t = Option.app touchPtr t
      end

    val getType_ =
      _import "g_object_get_type" : unit -> GObjectType.FFI.val_;

    val getValue_ =
      _import "g_value_get_object" :
        GObjectValueRecord.FFI.non_opt GObjectValueRecord.FFI.p -> FFI.non_opt FFI.p;

    val getOptValue_ =
      _import "g_value_get_object" :
        GObjectValueRecord.FFI.non_opt GObjectValueRecord.FFI.p -> FFI.opt FFI.p;

    val setValue_ =
      fn x1 & x2 =>
        (_import "g_value_set_object" :
           GObjectValueRecord.FFI.non_opt GObjectValueRecord.FFI.p * FFI.non_opt FFI.p -> unit;)
        (x1, x2)

    val setOptValue_ =
      fn x1 & x2 =>
        (_import "g_value_set_object" :
           GObjectValueRecord.FFI.non_opt GObjectValueRecord.FFI.p * FFI.opt FFI.p -> unit;)
        (x1, x2)

    val instanceType_ = _import "giraffe_g_object_type" : non_opt p -> GObjectType.FFI.val_;

    type type_t = GObjectType.t
    type ('a, 'b) value_accessor_t = ('a, 'b) ValueAccessor.t

    val t =
      ValueAccessor.C.createAccessor {
        getType  = (I ---> GObjectType.FFI.fromVal) getType_,
        getValue = (I ---> FFI.fromPtr false) getValue_,
        setValue = (I &&&> FFI.withPtr false ---> I) setValue_
      }

    val tOpt =
      ValueAccessor.C.createAccessor {
        getType  = (I ---> GObjectType.FFI.fromVal) getType_,
        getValue = (I ---> FFI.fromOptPtr false) getOptValue_,
        setValue = (I &&&> FFI.withOptPtr false ---> I) setOptValue_
      }

    fun instanceType object = (FFI.withPtr false ---> GObjectType.FFI.fromVal) instanceType_ object

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
