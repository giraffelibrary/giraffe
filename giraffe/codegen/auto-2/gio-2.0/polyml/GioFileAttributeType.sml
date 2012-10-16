structure GioFileAttributeType :>
  sig
    include GIO_FILE_ATTRIBUTE_TYPE
    structure PolyML :
      sig
        val VAL : C.val_ CInterface.Conversion
        val REF : C.ref_ CInterface.Conversion
      end
  end =
  struct
    datatype t =
      INVALID
    | STRING
    | BYTESTRING
    | BOOLEAN
    | UINT32
    | INT32
    | UINT64
    | INT64
    | OBJECT
    | STRINGV
    structure C =
      struct
        type val_ = FFI.Enum.val_
        type ref_ = FFI.Enum.ref_
        exception Value of FFI.Enum.val_
        fun withVal f =
          fn
            INVALID => f 0
          | STRING => f 1
          | BYTESTRING => f 2
          | BOOLEAN => f 3
          | UINT32 => f 4
          | INT32 => f 5
          | UINT64 => f 6
          | INT64 => f 7
          | OBJECT => f 8
          | STRINGV => f 9
        fun withRefVal f = withVal (FFI.Enum.withRef f)
        val fromVal =
          fn
            0 => INVALID
          | 1 => STRING
          | 2 => BYTESTRING
          | 3 => BOOLEAN
          | 4 => UINT32
          | 5 => INT32
          | 6 => UINT64
          | 7 => INT64
          | 8 => OBJECT
          | 9 => STRINGV
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
      val getType_ = call (load_sym libgio "g_file_attribute_type_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
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
    val null = INVALID
    val getType = (I ---> GObjectType.C.fromVal) getType_
  end
