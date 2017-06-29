structure GioFileType :> GIO_FILE_TYPE =
  struct
    datatype enum =
      UNKNOWN
    | REGULAR
    | DIRECTORY
    | SYMBOLIC_LINK
    | SPECIAL
    | SHORTCUT
    | MOUNTABLE
    structure Enum =
      Enum(
        type enum = enum
        val null = UNKNOWN
        val toInt =
          fn
            UNKNOWN => 0
          | REGULAR => 1
          | DIRECTORY => 2
          | SYMBOLIC_LINK => 3
          | SPECIAL => 4
          | SHORTCUT => 5
          | MOUNTABLE => 6
        exception Value of GInt32.t
        val fromInt =
          fn
            0 => UNKNOWN
          | 1 => REGULAR
          | 2 => DIRECTORY
          | 3 => SYMBOLIC_LINK
          | 4 => SPECIAL
          | 5 => SHORTCUT
          | 6 => MOUNTABLE
          | n => raise Value n
      )
    open Enum
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_file_type_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
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
