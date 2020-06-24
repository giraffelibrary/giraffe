structure GtkFileChooserError :> GTK_FILE_CHOOSER_ERROR =
  struct
    datatype enum =
      NONEXISTENT
    | BAD_FILENAME
    | ALREADY_EXISTS
    | INCOMPLETE_HOSTNAME
    structure Enum =
      Enum(
        type enum = enum
        val null = NONEXISTENT
        val toInt =
          fn
            NONEXISTENT => 0
          | BAD_FILENAME => 1
          | ALREADY_EXISTS => 2
          | INCOMPLETE_HOSTNAME => 3
        exception Value of GInt32.t
        val fromInt =
          fn
            0 => NONEXISTENT
          | 1 => BAD_FILENAME
          | 2 => ALREADY_EXISTS
          | 3 => INCOMPLETE_HOSTNAME
          | n => raise Value n
      )
    open Enum
    val getType_ = _import "gtk_file_chooser_error_get_type" : unit -> GObjectType.FFI.val_;
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
          "gtk-file-chooser-error-quark",
          FFI.fromVal,
          Error
        )
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
  end
exception GtkFileChooserError = GtkFileChooserError.Error
