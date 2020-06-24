structure GtkSelectionMode :> GTK_SELECTION_MODE =
  struct
    datatype enum =
      NONE
    | SINGLE
    | BROWSE
    | MULTIPLE
    structure Enum =
      Enum(
        type enum = enum
        val null = NONE
        val toInt =
          fn
            NONE => 0
          | SINGLE => 1
          | BROWSE => 2
          | MULTIPLE => 3
        exception Value of GInt.t
        val fromInt =
          fn
            0 => NONE
          | 1 => SINGLE
          | 2 => BROWSE
          | 3 => MULTIPLE
          | n => raise Value n
      )
    open Enum
    val getType_ = _import "gtk_selection_mode_get_type" : unit -> GObjectType.FFI.val_;
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
