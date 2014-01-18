structure GdkCrossingMode :>
  sig
    include GDK_CROSSING_MODE
    structure PolyML :
      sig
        val VAL : C.val_ CInterface.Conversion
        val REF : C.ref_ CInterface.Conversion
      end
  end =
  struct
    datatype t =
      NORMAL
    | GRAB
    | UNGRAB
    | GTKGRAB
    | GTKUNGRAB
    | STATECHANGED
    structure C =
      struct
        type val_ = FFI.Enum.C.val_
        type ref_ = FFI.Enum.C.ref_
        exception Value of FFI.Enum.C.val_
        fun withVal f =
          fn
            NORMAL => f 0
          | GRAB => f 1
          | UNGRAB => f 2
          | GTKGRAB => f 3
          | GTKUNGRAB => f 4
          | STATECHANGED => f 5
        fun withRefVal f = withVal (FFI.Enum.C.withRef f)
        val fromVal =
          fn
            0 => NORMAL
          | 1 => GRAB
          | 2 => UNGRAB
          | 3 => GTKGRAB
          | 4 => GTKUNGRAB
          | 5 => STATECHANGED
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
      val getType_ = call (load_sym libgdk "gdk_crossing_mode_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
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
    val null = NORMAL
    val getType = (I ---> GObjectType.C.fromVal) getType_
  end