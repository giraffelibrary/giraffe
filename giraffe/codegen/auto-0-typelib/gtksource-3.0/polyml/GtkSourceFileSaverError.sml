structure GtkSourceFileSaverError :> GTK_SOURCE_FILE_SAVER_ERROR =
  struct
    datatype enum =
      INVALID_CHARS
    | EXTERNALLY_MODIFIED
    structure Enum =
      Enum(
        type enum = enum
        val null = INVALID_CHARS
        val toInt =
          fn
            INVALID_CHARS => 0
          | EXTERNALLY_MODIFIED => 1
        exception Value of GInt32.t
        val fromInt =
          fn
            0 => INVALID_CHARS
          | 1 => EXTERNALLY_MODIFIED
          | n => raise Value n
      )
    open Enum
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_source_file_saver_error_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val getValue_ = call (getSymbol "g_value_get_enum") (GObjectValueRecord.PolyML.cPtr --> PolyML.cVal)
      val setValue_ = call (getSymbol "g_value_set_enum") (GObjectValueRecord.PolyML.cPtr &&> PolyML.cVal --> cVoid)
    end
    val t =
      ValueAccessor.C.createAccessor
        {
          getType = (I ---> GObjectType.FFI.fromVal) getType_,
          getValue = (I ---> FFI.fromVal) getValue_,
          setValue = (I &&&> FFI.withVal ---> I) setValue_
        }
    exception Error of t
    val handler =
      GLibErrorRecord.makeHandler
        (
          "gtk-source-file-saver-error",
          FFI.fromVal,
          Error
        )
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
  end
exception GtkSourceFileSaverError = GtkSourceFileSaverError.Error
