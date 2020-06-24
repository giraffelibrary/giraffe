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
    val getType_ = _import "gtk_source_file_saver_error_get_type" : unit -> GObjectType.FFI.val_;
    val getValue_ = _import "g_value_get_enum" : GObjectValueRecord.FFI.non_opt GObjectValueRecord.FFI.p -> FFI.val_;
    val setValue_ = fn x1 & x2 => (_import "g_value_set_enum" : GObjectValueRecord.FFI.non_opt GObjectValueRecord.FFI.p * FFI.val_ -> unit;) (x1, x2)
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
