structure GtkTextWindowType :>
  sig
    include GTK_TEXT_WINDOW_TYPE
    structure PolyML :
      sig
        val VAL : C.val_ PolyMLFFI.conversion
        val REF : C.ref_ PolyMLFFI.conversion
      end
  end =
  struct
    datatype t =
      PRIVATE
    | WIDGET
    | TEXT
    | LEFT
    | RIGHT
    | TOP
    | BOTTOM
    structure C =
      struct
        type val_ = FFI.Enum.C.val_
        type ref_ = FFI.Enum.C.ref_
        exception Value of FFI.Enum.C.val_
        fun withVal f =
          fn
            PRIVATE => f 0
          | WIDGET => f 1
          | TEXT => f 2
          | LEFT => f 3
          | RIGHT => f 4
          | TOP => f 5
          | BOTTOM => f 6
        fun withRefVal f = withVal (FFI.Enum.C.withRef f)
        val fromVal =
          fn
            0 => PRIVATE
          | 1 => WIDGET
          | 2 => TEXT
          | 3 => LEFT
          | 4 => RIGHT
          | 5 => TOP
          | 6 => BOTTOM
          | n => raise Value n
      end
    structure PolyML =
      struct
        val VAL = FFI.Enum.PolyML.VAL
        val REF = FFI.Enum.PolyML.REF
      end
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_text_window_type_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
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
    val null = PRIVATE
    val getType = (I ---> GObjectType.C.fromVal) getType_
  end
