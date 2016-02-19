structure GObjectObjectClass :>
  sig
    include G_OBJECT_OBJECT_CLASS
      where type ('a, 'b) value_accessor = ('a, 'b) GObjectValue.accessor

    structure PolyML :
      sig
        val PTR : C.notnull C.p PolyMLFFI.conversion
        val OPTPTR : unit C.p PolyMLFFI.conversion
        val OUTREF : (unit, C.notnull) C.r PolyMLFFI.conversion
        val INOUTREF : (C.notnull, C.notnull) C.r PolyMLFFI.conversion
      end
  end =
  struct
    type notnull = CPointer.notnull
    type 'a p = 'a CPointer.p
    type ('a, 'b) r = ('a, 'b) CPointer.r

    val PTR = CPointer.PolyML.cVal : notnull p PolyMLFFI.conversion
    val OPTPTR = CPointer.PolyML.cOptVal : unit p PolyMLFFI.conversion
    val OUTREF = CPointer.PolyML.cRef : (unit, notnull) r PolyMLFFI.conversion
    val INOUTREF = CPointer.PolyML.cInRef : (notnull, notnull) r PolyMLFFI.conversion

    fun initDebugFlags () =
      if GiraffeDebug.isEnabled
      then
        let
          open PolyMLFFI
          val debugClosureSym = load_sym libgiraffegobject "giraffe_debug_closure"
          val debugRefCountSym = load_sym libgiraffegobject "giraffe_debug_ref_count"
          fun set sym conv x =
            ignore (#store (breakConversion conv) x (symbolAsAddress sym))
          fun setBool sym x = FFI.Bool.C.withVal (set sym FFI.Bool.PolyML.VAL) x
        in
          setBool debugClosureSym (GiraffeDebug.getClosure ());
          setBool debugRefCountSym (GiraffeDebug.getRefCount ())
        end
      else ()
    val () = PolyML.onEntry initDebugFlags

    local
      open PolyMLFFI
    in
      val take_ =
        if GiraffeDebug.isEnabled
        then
          call
            (load_sym libgiraffegobject "giraffe_debug_object_take")
            (PTR --> FFI.PolyML.VOID)
        else
          ignore

      val refSink_ =
        if GiraffeDebug.isEnabled
        then 
          call
            (load_sym libgiraffegobject "giraffe_debug_g_object_ref_sink")
            (PTR --> PTR)
        else
          call
            (load_sym libgobject "g_object_ref_sink")
            (PTR --> PTR)

      val unref_ =
        if GiraffeDebug.isEnabled
        then
          call
            (load_sym libgiraffegobject "giraffe_debug_g_object_unref")
            (PTR --> FFI.PolyML.VOID)
        else
          call
            (load_sym libgobject "g_object_unref")
            (PTR --> FFI.PolyML.VOID)
    end

    type 'a t = notnull p Finalizable.t
    fun toBase obj = obj

    structure C =
      struct
        structure Pointer = CPointer
        type notnull = notnull
        type 'a p = 'a p
        type ('a, 'b) r = ('a, 'b) r

        fun withPtr f ptr = Finalizable.withValue (ptr, Pointer.withVal f)

        fun withOptPtr f =
          fn
            SOME ptr => Finalizable.withValue (ptr, Pointer.withOptVal f o SOME)
          | NONE     => Pointer.withOptVal f NONE

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
                else refSink_ ptr
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
        val PTR = PTR
        val OPTPTR = OPTPTR
        val OUTREF = OUTREF
        val INOUTREF = INOUTREF
      end

    local
      open PolyMLFFI
    in
      val getType_ =
        call
          (load_sym libgobject "g_object_get_type")
          (FFI.PolyML.VOID --> GObjectType.PolyML.VAL);

      val getValue_ =
        call
          (load_sym libgobject "g_value_get_object")
          (GObjectValueRecord.PolyML.PTR --> PolyML.PTR);

      val getOptValue_ =
        call
          (load_sym libgobject "g_value_get_object")
          (GObjectValueRecord.PolyML.PTR --> PolyML.OPTPTR);

      val setValue_ =
        call
          (load_sym libgobject "g_value_set_object")
          (GObjectValueRecord.PolyML.PTR &&> PolyML.PTR --> FFI.PolyML.VOID);

      val setOptValue_ =
        call
          (load_sym libgobject "g_value_set_object")
          (GObjectValueRecord.PolyML.PTR &&> PolyML.OPTPTR --> FFI.PolyML.VOID);
    end

    type ('a, 'b) value_accessor = ('a, 'b) GObjectValue.accessor

    val t =
      GObjectValue.C.createAccessor {
        getType  = (I ---> GObjectType.C.fromVal) getType_,
        getValue = (I ---> C.fromPtr false) getValue_,
        setValue = (I &&&> C.withPtr ---> I) setValue_
      }

    val tOpt =
      GObjectValue.C.createAccessor {
        getType  = (I ---> GObjectType.C.fromVal) getType_,
        getValue = (I ---> C.fromOptPtr false) getOptValue_,
        setValue = (I &&&> C.withOptPtr ---> I) setOptValue_
      }
  end
