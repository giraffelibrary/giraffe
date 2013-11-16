structure GioFileAttributeType :>
  sig
    include GIO_FILE_ATTRIBUTE_TYPE
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
        type val_ = FFI.Enum.C.val_
        type ref_ = FFI.Enum.C.ref_
        exception Value of FFI.Enum.C.val_
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
        fun withRefVal f = withVal (FFI.Enum.C.withRef f)
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
    val getType_ = _import "g_file_attribute_type_get_type" : unit -> GObjectType.C.val_;
    val getValue_ = _import "g_value_get_enum" : GObjectValueRecord.C.notnull GObjectValueRecord.C.p -> C.val_;
    val setValue_ = fn x1 & x2 => (_import "g_value_set_enum" : GObjectValueRecord.C.notnull GObjectValueRecord.C.p * C.val_ -> unit;) (x1, x2)
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
