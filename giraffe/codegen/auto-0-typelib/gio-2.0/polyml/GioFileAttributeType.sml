structure GioFileAttributeType :>
  sig
    include GIO_FILE_ATTRIBUTE_TYPE
    structure PolyML :
      sig
        val cVal : C.val_ PolyMLFFI.conversion
        val cRef : C.ref_ PolyMLFFI.conversion
      end
  end =
  struct
    datatype t =
      INVALID
    | STRING
    | BYTE_STRING
    | BOOLEAN
    | UINT_32
    | INT_32
    | UINT_64
    | INT_64
    | OBJECT
    | STRINGV
    structure C =
      struct
        type val_ = FFI.Enum.C.val_
        type ref_ = FFI.Enum.C.ref_
        exception Value of FFI.Enum.C.val_
        fun withVal f =
          fn
            INVALID => f 0
          | STRING => f 1
          | BYTE_STRING => f 2
          | BOOLEAN => f 3
          | UINT_32 => f 4
          | INT_32 => f 5
          | UINT_64 => f 6
          | INT_64 => f 7
          | OBJECT => f 8
          | STRINGV => f 9
        fun withRefVal f = withVal (FFI.Enum.C.withRef f)
        val fromVal =
          fn
            0 => INVALID
          | 1 => STRING
          | 2 => BYTE_STRING
          | 3 => BOOLEAN
          | 4 => UINT_32
          | 5 => INT_32
          | 6 => UINT_64
          | 7 => INT_64
          | 8 => OBJECT
          | 9 => STRINGV
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
      val getType_ = call (load_sym libgio "g_file_attribute_type_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
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
    val null = INVALID
    val getType = (I ---> GObjectType.C.fromVal) getType_
  end
