(* Copyright (C) 2013, 2016-2020 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

structure GObjectObjectClass :>
  G_OBJECT_OBJECT_CLASS
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

    fun initDebugFlags () =
      if GiraffeDebug.isEnabled
      then
        let
          open PolyMLFFI
          val debugClosureSym = getSymbol "giraffe_debug_closure"
          val debugRefCountSym = getSymbol "giraffe_debug_ref_count"
          fun set sym conv x =
            ignore (#store (breakConversion conv) x (symbolAsAddress sym))
          fun setBool sym x = GBool.FFI.withVal (set sym GBool.PolyML.cVal) x
        in
          setBool debugClosureSym (GiraffeDebug.getClosure ());
          setBool debugRefCountSym (GiraffeDebug.getRefCount ())
        end
      else ()
    val () = PolyML.onEntry initDebugFlags

    local
      open PolyMLFFI
    in
      val isFloating_ =
        call
          (getSymbol "g_object_is_floating")
          (cPtr --> GBool.PolyML.cVal)

      val take_ =
        if GiraffeDebug.isEnabled
        then
          call
            (getSymbol "giraffe_debug_object_take")
            (cPtr --> cVoid)
        else
          ignore

      val ref_ =
        if GiraffeDebug.isEnabled
        then 
          call
            (getSymbol "giraffe_debug_g_object_ref_sink")
            (cPtr --> cPtr)
        else
          call
            (getSymbol "g_object_ref_sink")
            (cPtr --> cPtr)

      val unref_ =
        if GiraffeDebug.isEnabled
        then
          call
            (getSymbol "giraffe_debug_g_object_unref")
            (cPtr --> cVoid)
        else
          call
            (getSymbol "g_object_unref")
            (cPtr --> cVoid)
    end

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
                then (
                  if GBool.FFI.fromVal (isFloating_ ptr)
                  then GiraffeLog.critical "taking ownership of floating reference"
                  else ();
                  take_ ptr; ptr  (* take the existing reference *)
                )
                else ref_ ptr
              )
          in
            Finalizable.addFinalizer (object, unref_);
            object
          end

        fun fromOptPtr transfer optptr =
          Option.map (fromPtr transfer) (Pointer.fromOptVal optptr)
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
          (getSymbol "g_object_get_type")
          (cVoid --> GObjectType.PolyML.cVal);

      val getValue_ =
        call
          (getSymbol "g_value_get_object")
          (GObjectValueRecord.PolyML.cPtr --> PolyML.cPtr);

      val getOptValue_ =
        call
          (getSymbol "g_value_get_object")
          (GObjectValueRecord.PolyML.cPtr --> PolyML.cOptPtr);

      val setValue_ =
        call
          (getSymbol "g_value_set_object")
          (GObjectValueRecord.PolyML.cPtr &&> PolyML.cPtr --> cVoid);

      val setOptValue_ =
        call
          (getSymbol "g_value_set_object")
          (GObjectValueRecord.PolyML.cPtr &&> PolyML.cOptPtr --> cVoid);
    end

    type ('a, 'b) value_accessor_t = ('a, 'b) ValueAccessor.t

    val t =
      ValueAccessor.C.createAccessor {
        getType  = (I ---> GObjectType.FFI.fromVal) getType_,
        getValue = (I ---> FFI.fromPtr false) getValue_,
        setValue = (I &&&> FFI.withPtr ---> I) setValue_
      }

    val tOpt =
      ValueAccessor.C.createAccessor {
        getType  = (I ---> GObjectType.FFI.fromVal) getType_,
        getValue = (I ---> FFI.fromOptPtr false) getOptValue_,
        setValue = (I &&&> FFI.withOptPtr ---> I) setOptValue_
      }

    local
      open PolyMLFFI
    in
      val objectType_ =
        call
          (getSymbol "giraffe_g_object_type")
          (cPtr --> GObjectType.PolyML.cVal)
    end

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
