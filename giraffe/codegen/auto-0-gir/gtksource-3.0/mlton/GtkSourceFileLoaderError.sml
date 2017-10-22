structure GtkSourceFileLoaderError :> GTK_SOURCE_FILE_LOADER_ERROR =
  struct
    datatype enum =
      TOO_BIG
    | ENCODING_AUTO_DETECTION_FAILED
    | CONVERSION_FALLBACK
    structure Enum =
      Enum(
        type enum = enum
        val null = TOO_BIG
        val toInt =
          fn
            TOO_BIG => 0
          | ENCODING_AUTO_DETECTION_FAILED => 1
          | CONVERSION_FALLBACK => 2
        exception Value of GInt.t
        val fromInt =
          fn
            0 => TOO_BIG
          | 1 => ENCODING_AUTO_DETECTION_FAILED
          | 2 => CONVERSION_FALLBACK
          | n => raise Value n
      )
    open Enum
    val getType_ = _import "gtk_source_file_loader_error_get_type" : unit -> GObjectType.FFI.val_;
    val getValue_ = _import "g_value_get_enum" : GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p -> FFI.val_;
    val setValue_ = fn x1 & x2 => (_import "g_value_set_enum" : GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p * FFI.val_ -> unit;) (x1, x2)
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
          "gtk-source-file-loader-error",
          FFI.fromVal,
          Error
        )
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
  end
exception GtkSourceFileLoaderError = GtkSourceFileLoaderError.Error
