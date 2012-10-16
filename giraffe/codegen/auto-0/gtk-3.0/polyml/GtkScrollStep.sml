structure GtkScrollStep :>
  sig
    include GTK_SCROLL_STEP
    structure PolyML :
      sig
        val VAL : C.val_ CInterface.Conversion
        val REF : C.ref_ CInterface.Conversion
      end
  end =
  struct
    datatype t =
      STEPS
    | PAGES
    | ENDS
    | HORIZONTALSTEPS
    | HORIZONTALPAGES
    | HORIZONTALENDS
    structure C =
      struct
        type val_ = FFI.Enum.val_
        type ref_ = FFI.Enum.ref_
        exception Value of FFI.Enum.val_
        fun withVal f =
          fn
            STEPS => f 0
          | PAGES => f 1
          | ENDS => f 2
          | HORIZONTALSTEPS => f 3
          | HORIZONTALPAGES => f 4
          | HORIZONTALENDS => f 5
        fun withRefVal f = withVal (FFI.Enum.withRef f)
        val fromVal =
          fn
            0 => STEPS
          | 1 => PAGES
          | 2 => ENDS
          | 3 => HORIZONTALSTEPS
          | 4 => HORIZONTALPAGES
          | 5 => HORIZONTALENDS
          | n => raise Value n
      end
    structure PolyML =
      struct
        val VAL = FFI.PolyML.Enum.VAL
        val REF = FFI.PolyML.Enum.REF
      end
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_scroll_step_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val getValue_ = call (load_sym libgobject "g_value_get_enum") (GObjectValueRecord.PolyML.PTR --> PolyML.VAL)
      val setValue_ = call (load_sym libgobject "g_value_set_enum") (GObjectValueRecord.PolyML.PTR &&> PolyML.VAL --> FFI.PolyML.VOID)
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
