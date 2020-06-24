structure GtkScrollStep :> GTK_SCROLL_STEP =
  struct
    datatype enum =
      STEPS
    | PAGES
    | ENDS
    | HORIZONTAL_STEPS
    | HORIZONTAL_PAGES
    | HORIZONTAL_ENDS
    structure Enum =
      Enum(
        type enum = enum
        val null = STEPS
        val toInt =
          fn
            STEPS => 0
          | PAGES => 1
          | ENDS => 2
          | HORIZONTAL_STEPS => 3
          | HORIZONTAL_PAGES => 4
          | HORIZONTAL_ENDS => 5
        exception Value of GInt32.t
        val fromInt =
          fn
            0 => STEPS
          | 1 => PAGES
          | 2 => ENDS
          | 3 => HORIZONTAL_STEPS
          | 4 => HORIZONTAL_PAGES
          | 5 => HORIZONTAL_ENDS
          | n => raise Value n
      )
    open Enum
    val getType_ = _import "gtk_scroll_step_get_type" : unit -> GObjectType.FFI.val_;
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
