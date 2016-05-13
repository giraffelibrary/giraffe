structure GObjectObjectClass :>
  G_OBJECT_OBJECT_CLASS
    where type ('a, 'b) value_accessor = ('a, 'b) GObjectValue.accessor =
  struct
    type notnull = CPointer.notnull
    type 'a p = 'a CPointer.p
    type ('a, 'b) r = ('a, 'b) CPointer.r

    val cPtr = CPointer.PolyML.cVal : notnull p PolyMLFFI.conversion
    val cOptPtr = CPointer.PolyML.cOptVal : unit p PolyMLFFI.conversion
    val cOutRef = CPointer.PolyML.cRef : (unit, notnull) r PolyMLFFI.conversion
    val cOutOptRef = CPointer.PolyML.cOptOutRef : (unit, unit) r PolyMLFFI.conversion
    val cInOutRef = CPointer.PolyML.cInRef : (notnull, notnull) r PolyMLFFI.conversion
    val cInOutOptRef = CPointer.PolyML.cOptOutRef : (unit, unit) r PolyMLFFI.conversion

    fun initDebugFlags () =
      if GiraffeDebug.isEnabled
      then
        let
          open PolyMLFFI
          val debugClosureSym = load_sym libgiraffegobject "giraffe_debug_closure"
          val debugRefCountSym = load_sym libgiraffegobject "giraffe_debug_ref_count"
          fun set sym conv x =
            ignore (#store (breakConversion conv) x (symbolAsAddress sym))
          fun setBool sym x = FFI.Bool.C.withVal (set sym FFI.Bool.PolyML.cVal) x
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
            (cPtr --> PolyMLFFI.cVoid)
        else
          ignore

      val ref_ =
        if GiraffeDebug.isEnabled
        then 
          call
            (load_sym libgiraffegobject "giraffe_debug_g_object_ref_sink")
            (cPtr --> cPtr)
        else
          call
            (load_sym libgobject "g_object_ref_sink")
            (cPtr --> cPtr)

      val unref_ =
        if GiraffeDebug.isEnabled
        then
          call
            (load_sym libgiraffegobject "giraffe_debug_g_object_unref")
            (cPtr --> PolyMLFFI.cVoid)
        else
          call
            (load_sym libgobject "g_object_unref")
            (cPtr --> PolyMLFFI.cVoid)
    end

    type 'a class = notnull p Finalizable.t
    type t = base class
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
          (load_sym libgobject "g_object_get_type")
          (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal);

      val getValue_ =
        call
          (load_sym libgobject "g_value_get_object")
          (GObjectValueRecord.PolyML.cPtr --> PolyML.cPtr);

      val getOptValue_ =
        call
          (load_sym libgobject "g_value_get_object")
          (GObjectValueRecord.PolyML.cPtr --> PolyML.cOptPtr);

      val setValue_ =
        call
          (load_sym libgobject "g_value_set_object")
          (GObjectValueRecord.PolyML.cPtr &&> PolyML.cPtr --> PolyMLFFI.cVoid);

      val setOptValue_ =
        call
          (load_sym libgobject "g_value_set_object")
          (GObjectValueRecord.PolyML.cPtr &&> PolyML.cOptPtr --> PolyMLFFI.cVoid);
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
