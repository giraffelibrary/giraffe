structure GtkArrowType :> GTK_ARROW_TYPE =
  struct
    datatype enum =
      UP
    | DOWN
    | LEFT
    | RIGHT
    | NONE
    structure Enum =
      Enum(
        type enum = enum
        val null = UP
        val toInt =
          fn
            UP => 0
          | DOWN => 1
          | LEFT => 2
          | RIGHT => 3
          | NONE => 4
        exception Value of GInt32.t
        val fromInt =
          fn
            0 => UP
          | 1 => DOWN
          | 2 => LEFT
          | 3 => RIGHT
          | 4 => NONE
          | n => raise Value n
      )
    open Enum
    val getType_ = _import "gtk_arrow_type_get_type" : unit -> GObjectType.FFI.val_;
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
