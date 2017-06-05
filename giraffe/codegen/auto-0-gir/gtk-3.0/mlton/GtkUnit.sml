structure GtkUnit :> GTK_UNIT =
  struct
    datatype enum =
      PIXEL
    | POINTS
    | INCH
    | MM
    structure Enum =
      Enum(
        type enum = enum
        val null = PIXEL
        val toInt =
          fn
            PIXEL => 0
          | POINTS => 1
          | INCH => 2
          | MM => 3
        exception Value of GInt.t
        val fromInt =
          fn
            0 => PIXEL
          | 1 => POINTS
          | 2 => INCH
          | 3 => MM
          | n => raise Value n
      )
    open Enum
    val getType_ = _import "gtk_unit_get_type" : unit -> GObjectType.FFI.val_;
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
