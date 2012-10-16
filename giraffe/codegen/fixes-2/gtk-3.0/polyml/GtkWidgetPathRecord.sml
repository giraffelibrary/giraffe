structure GtkWidgetPathRecord :>
  sig
    include GTK_WIDGET_PATH_RECORD

    structure PolyML :
      sig
        val PTR : C.notnull C.p CInterface.Conversion
        val OPTPTR : unit C.p CInterface.Conversion
        val OUTREF : (unit, C.notnull) C.r CInterface.Conversion
        val INOUTREF : (C.notnull, C.notnull) C.r CInterface.Conversion
      end
  end =
  struct
    type notnull = CPointer.notnull
    type 'a p = 'a CPointer.t
    val PTR = CPointer.PolyML.POINTER : notnull p CInterface.Conversion
    val OPTPTR = CPointer.PolyML.POINTER : unit p CInterface.Conversion

    local
      open PolyMLFFI
    in
      val ref_ =
        call
          (load_sym libgtk "gtk_widget_path_ref")
          (PTR --> PTR);

      val unref_sym = load_sym libgtk "gtk_widget_path_unref";
    end

    type t = notnull p Finalizable.t

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
                then ptr  (* take the existing reference *)
                else ref_ ptr
              )
          in
            Finalizable.addFinalizer (object, unref_sym);
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
          (load_sym libgtk "gtk_widget_path_get_type")
          (FFI.PolyML.VOID --> GObjectType.PolyML.VAL);

      val getValue_ =
        call
          (load_sym libgobject "g_value_get_boxed")
          (GObjectValueRecord.PolyML.PTR --> PolyML.PTR);

      val getOptValue_ =
        call
          (load_sym libgobject "g_value_get_boxed")
          (GObjectValueRecord.PolyML.PTR --> PolyML.OPTPTR);

      val setValue_ =
        call
          (load_sym libgobject "g_value_set_boxed")
          (GObjectValueRecord.PolyML.PTR &&> PolyML.PTR --> FFI.PolyML.VOID);

      val setOptValue_ =
        call
          (load_sym libgobject "g_value_set_boxed")
          (GObjectValueRecord.PolyML.PTR &&> PolyML.OPTPTR --> FFI.PolyML.VOID);
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
