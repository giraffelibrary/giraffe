structure GioFileType :>
  sig
    include GIO_FILE_TYPE
    structure PolyML :
      sig
        val VAL : C.val_ CInterface.Conversion
        val REF : C.ref_ CInterface.Conversion
      end
  end =
  struct
    datatype t =
      UNKNOWN
    | REGULAR
    | DIRECTORY
    | SYMBOLICLINK
    | SPECIAL
    | SHORTCUT
    | MOUNTABLE
    structure C =
      struct
        type val_ = FFI.Enum.val_
        type ref_ = FFI.Enum.ref_
        exception Value of FFI.Enum.val_
        fun withVal f =
          fn
            UNKNOWN => f 0
          | REGULAR => f 1
          | DIRECTORY => f 2
          | SYMBOLICLINK => f 3
          | SPECIAL => f 4
          | SHORTCUT => f 5
          | MOUNTABLE => f 6
        fun withRefVal f = withVal (FFI.Enum.withRef f)
        val fromVal =
          fn
            0 => UNKNOWN
          | 1 => REGULAR
          | 2 => DIRECTORY
          | 3 => SYMBOLICLINK
          | 4 => SPECIAL
          | 5 => SHORTCUT
          | 6 => MOUNTABLE
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
      val getType_ = call (load_sym libgio "g_file_type_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
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
