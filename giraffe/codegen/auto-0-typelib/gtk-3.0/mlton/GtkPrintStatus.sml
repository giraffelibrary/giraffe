structure GtkPrintStatus :> GTK_PRINT_STATUS =
  struct
    datatype enum =
      INITIAL
    | PREPARING
    | GENERATING_DATA
    | SENDING_DATA
    | PENDING
    | PENDING_ISSUE
    | PRINTING
    | FINISHED
    | FINISHED_ABORTED
    structure Enum =
      Enum(
        type enum = enum
        val null = INITIAL
        val toInt =
          fn
            INITIAL => 0
          | PREPARING => 1
          | GENERATING_DATA => 2
          | SENDING_DATA => 3
          | PENDING => 4
          | PENDING_ISSUE => 5
          | PRINTING => 6
          | FINISHED => 7
          | FINISHED_ABORTED => 8
        exception Value of GInt32.t
        val fromInt =
          fn
            0 => INITIAL
          | 1 => PREPARING
          | 2 => GENERATING_DATA
          | 3 => SENDING_DATA
          | 4 => PENDING
          | 5 => PENDING_ISSUE
          | 6 => PRINTING
          | 7 => FINISHED
          | 8 => FINISHED_ABORTED
          | n => raise Value n
      )
    open Enum
    val getType_ = _import "gtk_print_status_get_type" : unit -> GObjectType.FFI.val_;
    val getValue_ = _import "g_value_get_enum" : GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p -> FFI.val_;
    val setValue_ = fn x1 & x2 => (_import "g_value_set_enum" : GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p * FFI.val_ -> unit;) (x1, x2)
    val t =
      ValueAccessor.C.createAccessor
        {
          getType = (I ---> GObjectType.FFI.fromVal) getType_,
          getValue = (I ---> FFI.fromVal) getValue_,
          setValue = (I &&&> FFI.withVal ---> I) setValue_
        }
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
  end
