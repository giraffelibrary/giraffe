structure GtkLicense :>
  sig
    include GTK_LICENSE
    structure PolyML :
      sig
        val VAL : C.val_ CInterface.Conversion
        val REF : C.ref_ CInterface.Conversion
      end
  end =
  struct
    datatype t =
      UNKNOWN
    | CUSTOM
    | GPL20
    | GPL30
    | LGPL21
    | LGPL30
    | BSD
    | MITX11
    | ARTISTIC
    structure C =
      struct
        type val_ = FFI.Enum.val_
        type ref_ = FFI.Enum.ref_
        exception Value of FFI.Enum.val_
        fun withVal f =
          fn
            UNKNOWN => f 0
          | CUSTOM => f 1
          | GPL20 => f 2
          | GPL30 => f 3
          | LGPL21 => f 4
          | LGPL30 => f 5
          | BSD => f 6
          | MITX11 => f 7
          | ARTISTIC => f 8
        fun withRefVal f = withVal (FFI.Enum.withRef f)
        val fromVal =
          fn
            0 => UNKNOWN
          | 1 => CUSTOM
          | 2 => GPL20
          | 3 => GPL30
          | 4 => LGPL21
          | 5 => LGPL30
          | 6 => BSD
          | 7 => MITX11
          | 8 => ARTISTIC
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
      val getType_ = call (load_sym libgtk "gtk_license_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
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
    val null = UNKNOWN
    val getType = (I ---> GObjectType.C.fromVal) getType_
  end
