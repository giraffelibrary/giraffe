structure GObjectParamSpecClass :>
  G_OBJECT_PARAM_SPEC_CLASS
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

    local
      open PolyMLFFI
    in
      val take_ = ignore

      val ref_ =
        call
          (getSymbol "g_param_spec_ref_sink")
          (cPtr --> cPtr)

      val unref_ =
        call
          (getSymbol "g_param_spec_unref")
          (cPtr --> PolyMLFFI.cVoid)
    end

    structure C =
      struct
        structure Pointer = CPointer
        type notnull = notnull
        type 'a p = 'a p
        type ('a, 'b) r = ('a, 'b) Pointer.r

        structure PointerType =
          struct
            structure Pointer = Pointer
            type notnull = Pointer.notnull
            type 'a p = 'a Pointer.p

            type t = notnull p Finalizable.t

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

    type 'a class = notnull p Finalizable.t
    type t = base class
    fun toBase obj = obj

    structure FFI =
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
          (getSymbol "giraffe_g_param_get_type")
          (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal);

      val getValue_ =
        call
          (getSymbol "g_value_get_param")
          (GObjectValueRecord.PolyML.cPtr --> PolyML.cPtr);

      val getOptValue_ =
        call
          (getSymbol "g_value_get_param")
          (GObjectValueRecord.PolyML.cPtr --> PolyML.cOptPtr);

      val setValue_ =
        call
          (getSymbol "g_value_set_param")
          (GObjectValueRecord.PolyML.cPtr &&> PolyML.cPtr --> PolyMLFFI.cVoid);

      val setOptValue_ =
        call
          (getSymbol "g_value_set_param")
          (GObjectValueRecord.PolyML.cPtr &&> PolyML.cOptPtr --> PolyMLFFI.cVoid);
    end

    type ('a, 'b) value_accessor = ('a, 'b) GObjectValue.accessor

    val t =
      GObjectValue.C.createAccessor {
        getType  = (I ---> GObjectType.FFI.fromVal) getType_,
        getValue = (I ---> FFI.fromPtr false) getValue_,
        setValue = (I &&&> FFI.withPtr ---> I) setValue_
      }

    val tOpt =
      GObjectValue.C.createAccessor {
        getType  = (I ---> GObjectType.FFI.fromVal) getType_,
        getValue = (I ---> FFI.fromOptPtr false) getOptValue_,
        setValue = (I &&&> FFI.withOptPtr ---> I) setOptValue_
      }
  end
