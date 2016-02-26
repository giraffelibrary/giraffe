structure GtkIconSetRecord :>
  sig
    include GTK_ICON_SET_RECORD

    structure PolyML :
      sig
        val cPtr : C.notnull C.p PolyMLFFI.conversion
        val cOptPtr : unit C.p PolyMLFFI.conversion
        val cOutRef : (unit, C.notnull) C.r PolyMLFFI.conversion
        val cOutOptRef : (unit, unit) C.r PolyMLFFI.conversion
        val cInOutRef : (C.notnull, C.notnull) C.r PolyMLFFI.conversion
        val cInOutOptRef : (unit, unit) C.r PolyMLFFI.conversion
      end
  end =
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
      val new_ =
        call
          (load_sym libgtk "gtk_icon_set_new")
          (FFI.PolyML.cVoid --> cPtr)

      val copy_ =
        call
          (load_sym libgtk "gtk_icon_set_copy")
          (cPtr --> cPtr)

      val free_ =
        call
          (load_sym libgtk "gtk_icon_set_free")
          (cPtr --> FFI.PolyML.cVoid)
    end

    type t = notnull p Finalizable.t

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

        fun withNewPtr f () =
          let
            val ptr = new_ ()
          in
            ptr & f ptr
          end

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
                then ptr  (* take the existing reference *)
                else copy_ ptr
              )
          in
            Finalizable.addFinalizer (object, free_);
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
          (load_sym libgtk "gtk_icon_set_get_type")
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
