structure GtkPathType :> GTK_PATH_TYPE =
  struct
    datatype enum =
      WIDGET
    | WIDGET_CLASS
    | CLASS
    structure Enum =
      Enum(
        type enum = enum
        val null = WIDGET
        val toInt =
          fn
            WIDGET => 0
          | WIDGET_CLASS => 1
          | CLASS => 2
        exception Value of GInt32.t
        val fromInt =
          fn
            0 => WIDGET
          | 1 => WIDGET_CLASS
          | 2 => CLASS
          | n => raise Value n
      )
    open Enum
    val getType_ = _import "gtk_path_type_get_type" : unit -> GObjectType.FFI.val_;
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
