structure GdkPropertyState :> GDK_PROPERTY_STATE =
  struct
    datatype enum =
      NEW_VALUE
    | DELETE
    structure Enum =
      Enum(
        type enum = enum
        val null = NEW_VALUE
        val toInt =
          fn
            NEW_VALUE => 0
          | DELETE => 1
        exception Value of GInt32.t
        val fromInt =
          fn
            0 => NEW_VALUE
          | 1 => DELETE
          | n => raise Value n
      )
    open Enum
    val getType_ = _import "gdk_property_state_get_type" : unit -> GObjectType.FFI.val_;
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
