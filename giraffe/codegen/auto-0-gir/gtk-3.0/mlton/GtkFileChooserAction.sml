structure GtkFileChooserAction :> GTK_FILE_CHOOSER_ACTION =
  struct
    datatype enum =
      OPEN
    | SAVE
    | SELECT_FOLDER
    | CREATE_FOLDER
    structure Enum =
      Enum(
        type enum = enum
        val null = OPEN
        val toInt =
          fn
            OPEN => 0
          | SAVE => 1
          | SELECT_FOLDER => 2
          | CREATE_FOLDER => 3
        exception Value of GInt.t
        val fromInt =
          fn
            0 => OPEN
          | 1 => SAVE
          | 2 => SELECT_FOLDER
          | 3 => CREATE_FOLDER
          | n => raise Value n
      )
    open Enum
    val getType_ = _import "gtk_file_chooser_action_get_type" : unit -> GObjectType.FFI.val_;
    val getValue_ = _import "g_value_get_enum" : GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p -> FFI.val_;
    val setValue_ = fn x1 & x2 => (_import "g_value_set_enum" : GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p * FFI.val_ -> unit;) (x1, x2)
    val t =
      GObjectValue.C.createAccessor
        {
          getType = (I ---> GObjectType.FFI.fromVal) getType_,
          getValue = (I ---> FFI.fromVal) getValue_,
          setValue = (I &&&> FFI.withVal ---> I) setValue_
        }
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
  end
