structure GtkJustification :> GTK_JUSTIFICATION =
  struct
    datatype enum =
      LEFT
    | RIGHT
    | CENTER
    | FILL
    structure Enum =
      Enum(
        type enum = enum
        val null = LEFT
        val toInt =
          fn
            LEFT => 0
          | RIGHT => 1
          | CENTER => 2
          | FILL => 3
        exception Value of GInt32.t
        val fromInt =
          fn
            0 => LEFT
          | 1 => RIGHT
          | 2 => CENTER
          | 3 => FILL
          | n => raise Value n
      )
    open Enum
    val getType_ = _import "gtk_justification_get_type" : unit -> GObjectType.FFI.val_;
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
