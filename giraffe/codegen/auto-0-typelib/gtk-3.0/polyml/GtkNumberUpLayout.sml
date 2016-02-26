structure GtkNumberUpLayout :>
  sig
    include GTK_NUMBER_UP_LAYOUT
    structure PolyML :
      sig
        val cVal : C.val_ PolyMLFFI.conversion
        val cRef : C.ref_ PolyMLFFI.conversion
      end
  end =
  struct
    datatype t =
      LRTB
    | LRBT
    | RLTB
    | RLBT
    | TBLR
    | TBRL
    | BTLR
    | BTRL
    structure C =
      struct
        type val_ = FFI.Enum.C.val_
        type ref_ = FFI.Enum.C.ref_
        exception Value of FFI.Enum.C.val_
        fun withVal f =
          fn
            LRTB => f 0
          | LRBT => f 1
          | RLTB => f 2
          | RLBT => f 3
          | TBLR => f 4
          | TBRL => f 5
          | BTLR => f 6
          | BTRL => f 7
        fun withRefVal f = withVal (FFI.Enum.C.withRef f)
        val fromVal =
          fn
            0 => LRTB
          | 1 => LRBT
          | 2 => RLTB
          | 3 => RLBT
          | 4 => TBLR
          | 5 => TBRL
          | 6 => BTLR
          | 7 => BTRL
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
      val getType_ = call (load_sym libgtk "gtk_number_up_layout_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
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
    val null = LRTB
    val getType = (I ---> GObjectType.C.fromVal) getType_
  end
