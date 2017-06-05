structure GioFileAttributeStatus :> GIO_FILE_ATTRIBUTE_STATUS =
  struct
    datatype enum =
      UNSET
    | SET
    | ERROR_SETTING
    structure Enum =
      Enum(
        type enum = enum
        val null = UNSET
        val toInt =
          fn
            UNSET => 0
          | SET => 1
          | ERROR_SETTING => 2
        exception Value of GInt32.t
        val fromInt =
          fn
            0 => UNSET
          | 1 => SET
          | 2 => ERROR_SETTING
          | n => raise Value n
      )
    open Enum
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_file_attribute_status_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val getValue_ = call (load_sym libgobject "g_value_get_enum") (GObjectValueRecord.PolyML.cPtr --> PolyML.cVal)
      val setValue_ = call (load_sym libgobject "g_value_set_enum") (GObjectValueRecord.PolyML.cPtr &&> PolyML.cVal --> PolyMLFFI.cVoid)
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
