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
    type 'a p = 'a CPointer.t
    val PTR = CPointer.PolyML.POINTER : notnull p PolyMLFFI.conversion
    val OPTPTR = CPointer.PolyML.POINTER : unit p PolyMLFFI.conversion

    fun initDebugFlags () =
      if GiraffeDebug.isEnabled
      then
        let
          open CInterface
          val debugClosureSym = load_sym libgiraffegobject "giraffe_debug_closure"
          val debugRefCountSym = load_sym libgiraffegobject "giraffe_debug_ref_count"
        in
          setGlobal debugClosureSym CInterface.BOOL (GiraffeDebug.getClosure ());
          setGlobal debugRefCountSym CInterface.BOOL (GiraffeDebug.getRefCount ())
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

        fun withPtr f x = Finalizable.withValue (x, f)

        fun withOptPtr f =
          fn
            SOME ptr => withPtr (f o Pointer.toOptNull) ptr
          | NONE     => f Pointer.null


        type ('a, 'b) r = unit p

        fun withRef f x =
          let
            open CPointer
            open PolyML

            val v = toVol x
            val a = toOptNull (addressFromVol v)
            val r = f a
          in
            fromVol v & r
          end

        fun withRefPtr f = withPtr (withRef f)

        fun withRefOptPtr f = withOptPtr (withRef f)


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
          Option.map (fromPtr transfer) (Pointer.toOpt optptr)
      end

    structure PolyML =
      struct
        val PTR = PTR
        val OPTPTR = OPTPTR
        val OUTREF = OPTPTR
        val INOUTREF = OPTPTR
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
