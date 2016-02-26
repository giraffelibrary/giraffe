structure GtkScrollStep :>
  sig
    include GTK_SCROLL_STEP
    structure PolyML :
      sig
        val cVal : C.val_ PolyMLFFI.conversion
        val cRef : C.ref_ PolyMLFFI.conversion
      end
  end =
  struct
    datatype t =
      STEPS
    | PAGES
    | ENDS
    | HORIZONTAL_STEPS
    | HORIZONTAL_PAGES
    | HORIZONTAL_ENDS
    structure C =
      struct
        type val_ = FFI.Enum.C.val_
        type ref_ = FFI.Enum.C.ref_
        exception Value of FFI.Enum.C.val_
        fun withVal f =
          fn
            STEPS => f 0
          | PAGES => f 1
          | ENDS => f 2
          | HORIZONTAL_STEPS => f 3
          | HORIZONTAL_PAGES => f 4
          | HORIZONTAL_ENDS => f 5
        fun withRefVal f = withVal (FFI.Enum.C.withRef f)
        val fromVal =
          fn
            0 => STEPS
          | 1 => PAGES
          | 2 => ENDS
          | 3 => HORIZONTAL_STEPS
          | 4 => HORIZONTAL_PAGES
          | 5 => HORIZONTAL_ENDS
          | n => raise Value n
      end
    structure PolyML =
      struct
        val cVal = FFI.Enum.PolyML.cVal
        val cRef = FFI.Enum.PolyML.cRef
      end
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_scroll_step_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val getValue_ = call (load_sym libgobject "g_value_get_enum") (GObjectValueRecord.PolyML.cPtr --> PolyML.cVal)
      val setValue_ = call (load_sym libgobject "g_value_set_enum") (GObjectValueRecord.PolyML.cPtr &&> PolyML.cVal --> FFI.PolyML.cVoid)
    end
    val t =
      GObjectValue.C.createAccessor
        {
          getType = (I ---> GObjectType.C.fromVal) getType_,
          getValue = (I ---> C.fromVal) getValue_,
          setValue = (I &&&> C.withVal ---> I) setValue_
        }
    val null = STEPS
    val getType = (I ---> GObjectType.C.fromVal) getType_
  end
