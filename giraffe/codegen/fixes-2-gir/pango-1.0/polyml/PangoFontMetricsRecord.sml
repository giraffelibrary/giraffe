structure PangoFontMetricsRecord :>
  sig
    include PANGO_FONT_METRICS_RECORD

    structure PolyML :
      sig
        val cPtr : C.notnull C.p PolyMLFFI.conversion
        val cOptPtr : unit C.p PolyMLFFI.conversion
      end
  end =
  struct
    type notnull = CPointer.notnull
    type 'a p = 'a CPointer.p

    val cPtr = CPointer.PolyML.cVal : notnull p PolyMLFFI.conversion
    val cOptPtr = CPointer.PolyML.cOptVal : unit p PolyMLFFI.conversion

    local
      open PolyMLFFI
    in
      val ref_ =
        call
          (load_sym libpango "pango_font_metrics_ref")
          (cPtr --> cPtr)

      val unref_ =
        call
          (load_sym libpango "pango_font_metrics_unref")
          (cPtr --> FFI.PolyML.cVoid)
    end

    type t = notnull p Finalizable.t

    structure C =
      struct
        structure Pointer = CPointer
        type notnull = notnull
        type 'a p = 'a p

        fun withPtr f ptr = Finalizable.withValue (ptr, Pointer.withVal f)

        fun withOptPtr f =
          fn
            SOME ptr => Finalizable.withValue (ptr, Pointer.withOptVal f o SOME)
          | NONE     => Pointer.withOptVal f NONE

        fun fromPtr transfer ptr =
          let
            val object =
              Finalizable.new (
                if transfer
                then ptr  (* take the existing reference *)
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
      end

    local
      open PolyMLFFI
    in
      val getType_ =
        call
          (load_sym libpango "pango_font_metrics_get_type")
          (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal);

      val getValue_ =
        call
          (load_sym libgobject "g_value_get_boxed")
          (GObjectValueRecord.PolyML.cPtr --> PolyML.cPtr);

      val getOptValue_ =
        call
          (load_sym libgobject "g_value_get_boxed")
          (GObjectValueRecord.PolyML.cPtr --> PolyML.cOptPtr);

      val setValue_ =
        call
          (load_sym libgobject "g_value_set_boxed")
          (GObjectValueRecord.PolyML.cPtr &&> PolyML.cPtr --> FFI.PolyML.cVoid);

      val setOptValue_ =
        call
          (load_sym libgobject "g_value_set_boxed")
          (GObjectValueRecord.PolyML.cPtr &&> PolyML.cOptPtr --> FFI.PolyML.cVoid);
    end

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
