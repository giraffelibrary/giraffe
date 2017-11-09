structure GtkPathPriorityType :> GTK_PATH_PRIORITY_TYPE =
  struct
    datatype enum =
      LOWEST
    | GTK
    | APPLICATION
    | THEME
    | RC
    | HIGHEST
    structure Enum =
      Enum(
        type enum = enum
        val null = LOWEST
        val toInt =
          fn
            LOWEST => 0
          | GTK => 4
          | APPLICATION => 8
          | THEME => 10
          | RC => 12
          | HIGHEST => 15
        exception Value of GInt.t
        val fromInt =
          fn
            0 => LOWEST
          | 4 => GTK
          | 8 => APPLICATION
          | 10 => THEME
          | 12 => RC
          | 15 => HIGHEST
          | n => raise Value n
      )
    open Enum
    val getType_ = _import "gtk_path_priority_type_get_type" : unit -> GObjectType.FFI.val_;
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
