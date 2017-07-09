structure GioFilesystemPreviewType :> GIO_FILESYSTEM_PREVIEW_TYPE =
  struct
    datatype enum =
      IF_ALWAYS
    | IF_LOCAL
    | NEVER
    structure Enum =
      Enum(
        type enum = enum
        val null = IF_ALWAYS
        val toInt =
          fn
            IF_ALWAYS => 0
          | IF_LOCAL => 1
          | NEVER => 2
        exception Value of GInt32.t
        val fromInt =
          fn
            0 => IF_ALWAYS
          | 1 => IF_LOCAL
          | 2 => NEVER
          | n => raise Value n
      )
    open Enum
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_filesystem_preview_type_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val getValue_ = call (getSymbol "g_value_get_enum") (GObjectValueRecord.PolyML.cPtr --> PolyML.cVal)
      val setValue_ = call (getSymbol "g_value_set_enum") (GObjectValueRecord.PolyML.cPtr &&> PolyML.cVal --> cVoid)
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
