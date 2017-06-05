structure GtkPrintOperationAction :> GTK_PRINT_OPERATION_ACTION =
  struct
    datatype enum =
      PRINT_DIALOG
    | PRINT
    | PREVIEW
    | EXPORT
    structure Enum =
      Enum(
        type enum = enum
        val null = PRINT_DIALOG
        val toInt =
          fn
            PRINT_DIALOG => 0
          | PRINT => 1
          | PREVIEW => 2
          | EXPORT => 3
        exception Value of GInt32.t
        val fromInt =
          fn
            0 => PRINT_DIALOG
          | 1 => PRINT
          | 2 => PREVIEW
          | 3 => EXPORT
          | n => raise Value n
      )
    open Enum
    val getType_ = _import "gtk_print_operation_action_get_type" : unit -> GObjectType.FFI.val_;
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
