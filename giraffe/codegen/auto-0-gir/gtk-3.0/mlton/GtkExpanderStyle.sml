structure GtkExpanderStyle :> GTK_EXPANDER_STYLE =
  struct
    datatype enum =
      COLLAPSED
    | SEMI_COLLAPSED
    | SEMI_EXPANDED
    | EXPANDED
    structure Enum =
      Enum(
        type enum = enum
        val null = COLLAPSED
        val toInt =
          fn
            COLLAPSED => 0
          | SEMI_COLLAPSED => 1
          | SEMI_EXPANDED => 2
          | EXPANDED => 3
        exception Value of GInt.t
        val fromInt =
          fn
            0 => COLLAPSED
          | 1 => SEMI_COLLAPSED
          | 2 => SEMI_EXPANDED
          | 3 => EXPANDED
          | n => raise Value n
      )
    open Enum
    val getType_ = _import "gtk_expander_style_get_type" : unit -> GObjectType.FFI.val_;
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
