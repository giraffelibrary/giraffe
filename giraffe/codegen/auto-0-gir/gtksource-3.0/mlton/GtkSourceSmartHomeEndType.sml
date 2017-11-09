structure GtkSourceSmartHomeEndType :> GTK_SOURCE_SMART_HOME_END_TYPE =
  struct
    datatype enum =
      DISABLED
    | BEFORE
    | AFTER
    | ALWAYS
    structure Enum =
      Enum(
        type enum = enum
        val null = DISABLED
        val toInt =
          fn
            DISABLED => 0
          | BEFORE => 1
          | AFTER => 2
          | ALWAYS => 3
        exception Value of GInt.t
        val fromInt =
          fn
            0 => DISABLED
          | 1 => BEFORE
          | 2 => AFTER
          | 3 => ALWAYS
          | n => raise Value n
      )
    open Enum
    val getType_ = _import "gtk_source_smart_home_end_type_get_type" : unit -> GObjectType.FFI.val_;
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
