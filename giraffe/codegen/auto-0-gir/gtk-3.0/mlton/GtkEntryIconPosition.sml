structure GtkEntryIconPosition :> GTK_ENTRY_ICON_POSITION =
  struct
    datatype enum =
      PRIMARY
    | SECONDARY
    structure Enum =
      Enum(
        type enum = enum
        val null = PRIMARY
        val toInt =
          fn
            PRIMARY => 0
          | SECONDARY => 1
        exception Value of GInt.t
        val fromInt =
          fn
            0 => PRIMARY
          | 1 => SECONDARY
          | n => raise Value n
      )
    open Enum
    val getType_ = _import "gtk_entry_icon_position_get_type" : unit -> GObjectType.FFI.val_;
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
