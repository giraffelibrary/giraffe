structure GtkFileChooserConfirmation :> GTK_FILE_CHOOSER_CONFIRMATION =
  struct
    datatype enum =
      CONFIRM
    | ACCEPT_FILENAME
    | SELECT_AGAIN
    structure Enum =
      Enum(
        type enum = enum
        val null = CONFIRM
        val toInt =
          fn
            CONFIRM => 0
          | ACCEPT_FILENAME => 1
          | SELECT_AGAIN => 2
        exception Value of GInt.t
        val fromInt =
          fn
            0 => CONFIRM
          | 1 => ACCEPT_FILENAME
          | 2 => SELECT_AGAIN
          | n => raise Value n
      )
    open Enum
    val getType_ = _import "gtk_file_chooser_confirmation_get_type" : unit -> GObjectType.FFI.val_;
    val getValue_ = _import "g_value_get_enum" : GObjectValueRecord.FFI.non_opt GObjectValueRecord.FFI.p -> FFI.val_;
    val setValue_ = fn x1 & x2 => (_import "g_value_set_enum" : GObjectValueRecord.FFI.non_opt GObjectValueRecord.FFI.p * FFI.val_ -> unit;) (x1, x2)
    val t =
      ValueAccessor.C.createAccessor
        {
          getType = (I ---> GObjectType.FFI.fromVal) getType_,
          getValue = (I ---> FFI.fromVal) getValue_,
          setValue = (I &&&> FFI.withVal ---> I) setValue_
        }
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
  end
