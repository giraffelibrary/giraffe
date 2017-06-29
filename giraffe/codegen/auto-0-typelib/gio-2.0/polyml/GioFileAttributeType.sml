structure GioFileAttributeType :> GIO_FILE_ATTRIBUTE_TYPE =
  struct
    datatype enum =
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
    structure Enum =
      Enum(
        type enum = enum
        val null = INVALID
        val toInt =
          fn
            INVALID => 0
          | STRING => 1
          | BYTE_STRING => 2
          | BOOLEAN => 3
          | UINT_32 => 4
          | INT_32 => 5
          | UINT_64 => 6
          | INT_64 => 7
          | OBJECT => 8
          | STRINGV => 9
        exception Value of GInt32.t
        val fromInt =
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
      )
    open Enum
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_file_attribute_type_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val getValue_ = call (getSymbol "g_value_get_enum") (GObjectValueRecord.PolyML.cPtr --> PolyML.cVal)
      val setValue_ = call (getSymbol "g_value_set_enum") (GObjectValueRecord.PolyML.cPtr &&> PolyML.cVal --> PolyMLFFI.cVoid)
    end
    val t =
      GObjectValue.C.createAccessor
        {
          getType = (I ---> GObjectType.FFI.fromVal) getType_,
          getValue = (I ---> FFI.fromVal) getValue_,
          setValue = (I &&&> FFI.withVal ---> I) setValue_
        }
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
  end
