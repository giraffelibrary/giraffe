structure GtkMenuDirectionType :> GTK_MENU_DIRECTION_TYPE =
  struct
    datatype enum =
      PARENT
    | CHILD
    | NEXT
    | PREV
    structure Enum =
      Enum(
        type enum = enum
        val null = PARENT
        val toInt =
          fn
            PARENT => 0
          | CHILD => 1
          | NEXT => 2
          | PREV => 3
        exception Value of GInt.t
        val fromInt =
          fn
            0 => PARENT
          | 1 => CHILD
          | 2 => NEXT
          | 3 => PREV
          | n => raise Value n
      )
    open Enum
    val getType_ = _import "gtk_menu_direction_type_get_type" : unit -> GObjectType.FFI.val_;
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
