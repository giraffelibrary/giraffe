(* Copyright (C) 2013, 2016-2021 Phil Clayton <phil.clayton@veonix.com>
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

    val cPtr = Pointer.PolyML.cVal : non_opt p PolyMLFFI.conversion
    val cOptPtr = Pointer.PolyML.cOptVal : opt p PolyMLFFI.conversion
    val cOutRef = Pointer.PolyML.cRef : ('a, non_opt) r PolyMLFFI.conversion
    val cOutOptRef = Pointer.PolyML.cOptOutRef : ('a, opt) r PolyMLFFI.conversion
    val cInOutRef = Pointer.PolyML.cInRef : (non_opt, non_opt) r PolyMLFFI.conversion
    val cInOutOptRef = Pointer.PolyML.cOptOutRef : (opt, opt) r PolyMLFFI.conversion

    local
      open PolyMLFFI
      val debugClosureSym = externalDataSymbol "giraffe_debug_closure"
      val debugRefCountSym = externalDataSymbol "giraffe_debug_ref_count"
      fun set sym conv x =
        ignore (#store (breakConversion conv) x (symbolAsAddress sym))
      fun setDebugClosure x = GBool.FFI.withVal (set debugClosureSym GBool.PolyML.cVal) x
      fun setDebugRefCount x = GBool.FFI.withVal (set debugRefCountSym GBool.PolyML.cVal) x

      fun initDebugFlags () =
        if GiraffeDebug.isEnabled
        then
          let
            val () = setDebugClosure (GiraffeDebug.getClosure ());
            val () = setDebugRefCount (GiraffeDebug.getRefCount ())
          in
            ()
          end
        else ()
    in
      val () = PolyML.onEntry initDebugFlags
    end

    local
      open PolyMLFFI
    in
      val isFloating_ =
        call
          (externalFunctionSymbol "g_object_is_floating")
          (cPtr --> GBool.PolyML.cVal)

      val take_ =
        if GiraffeDebug.isEnabled
        then
          call
            (externalFunctionSymbol "giraffe_debug_object_take")
            (cPtr --> cVoid)
        else
          ignore

      val dup_ =
        if GiraffeDebug.isEnabled
        then 
          call
            (externalFunctionSymbol "giraffe_debug_g_object_ref_sink")
            (cPtr --> cPtr)
        else
          call
            (externalFunctionSymbol "g_object_ref_sink")
            (cPtr --> cPtr)

      val free_ =
        if GiraffeDebug.isEnabled
        then
          call
            (externalFunctionSymbol "giraffe_debug_g_object_unref")
            (cPtr --> cVoid)
        else
          call
            (externalFunctionSymbol "g_object_unref")
            (cPtr --> cVoid)
    end

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
                  if GBool.FFI.fromVal (isFloating_ ptr)
                  then GiraffeLog.critical "taking ownership of floating reference"
                  else ();
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

    structure PolyML =
      struct
        val cPtr = cPtr
        val cOptPtr = cOptPtr
        val cOutRef = cOutRef
        val cOutOptRef = cOutOptRef
        val cInOutRef = cInOutRef
        val cInOutOptRef = cInOutOptRef
      end

    local
      open PolyMLFFI
    in
      val getType_ =
        call
          (externalFunctionSymbol "g_object_get_type")
          (cVoid --> GObjectType.PolyML.cVal);

      val getValue_ =
        call
          (externalFunctionSymbol "g_value_get_object")
          (GObjectValueRecord.PolyML.cPtr --> PolyML.cPtr);

      val getOptValue_ =
        call
          (externalFunctionSymbol "g_value_get_object")
          (GObjectValueRecord.PolyML.cPtr --> PolyML.cOptPtr);

      val setValue_ =
        call
          (externalFunctionSymbol "g_value_set_object")
          (GObjectValueRecord.PolyML.cPtr &&> PolyML.cPtr --> cVoid);

      val setOptValue_ =
        call
          (externalFunctionSymbol "g_value_set_object")
          (GObjectValueRecord.PolyML.cPtr &&> PolyML.cOptPtr --> cVoid);

      val instanceType_ =
        call
          (externalFunctionSymbol "giraffe_g_object_type")
          (cPtr --> GObjectType.PolyML.cVal)
    end

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
