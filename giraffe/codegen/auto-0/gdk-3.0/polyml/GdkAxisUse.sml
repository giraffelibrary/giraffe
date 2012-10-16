structure GdkAxisUse :>
  sig
    include GDK_AXIS_USE
    structure PolyML :
      sig
        val VAL : C.val_ CInterface.Conversion
        val REF : C.ref_ CInterface.Conversion
      end
  end =
  struct
    datatype t =
      IGNORE
    | X
    | Y
    | PRESSURE
    | XTILT
    | YTILT
    | WHEEL
    | LAST
    structure C =
      struct
        type val_ = FFI.Enum.val_
        type ref_ = FFI.Enum.ref_
        exception Value of FFI.Enum.val_
        fun withVal f =
          fn
            IGNORE => f 0
          | X => f 1
          | Y => f 2
          | PRESSURE => f 3
          | XTILT => f 4
          | YTILT => f 5
          | WHEEL => f 6
          | LAST => f 7
        fun withRefVal f = withVal (FFI.Enum.withRef f)
        val fromVal =
          fn
            0 => IGNORE
          | 1 => X
          | 2 => Y
          | 3 => PRESSURE
          | 4 => XTILT
          | 5 => YTILT
          | 6 => WHEEL
          | 7 => LAST
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
      val getType_ = call (load_sym libgdk "gdk_axis_use_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
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
    val null = IGNORE
    val getType = (I ---> GObjectType.C.fromVal) getType_
  end
