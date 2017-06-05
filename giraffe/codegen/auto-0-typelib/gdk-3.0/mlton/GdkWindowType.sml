structure GdkWindowType :> GDK_WINDOW_TYPE =
  struct
    datatype enum =
      ROOT
    | TOPLEVEL
    | CHILD
    | TEMP
    | FOREIGN
    | OFFSCREEN
    structure Enum =
      Enum(
        type enum = enum
        val null = ROOT
        val toInt =
          fn
            ROOT => 0
          | TOPLEVEL => 1
          | CHILD => 2
          | TEMP => 3
          | FOREIGN => 4
          | OFFSCREEN => 5
        exception Value of GInt32.t
        val fromInt =
          fn
            0 => ROOT
          | 1 => TOPLEVEL
          | 2 => CHILD
          | 3 => TEMP
          | 4 => FOREIGN
          | 5 => OFFSCREEN
          | n => raise Value n
      )
    open Enum
    val getType_ = _import "gdk_window_type_get_type" : unit -> GObjectType.FFI.val_;
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
