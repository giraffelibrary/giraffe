structure AtkLayer :> ATK_LAYER =
  struct
    datatype enum =
      INVALID
    | BACKGROUND
    | CANVAS
    | WIDGET
    | MDI
    | POPUP
    | OVERLAY
    | WINDOW
    structure Enum =
      Enum(
        type enum = enum
        val null = INVALID
        val toInt =
          fn
            INVALID => 0
          | BACKGROUND => 1
          | CANVAS => 2
          | WIDGET => 3
          | MDI => 4
          | POPUP => 5
          | OVERLAY => 6
          | WINDOW => 7
        exception Value of GInt.t
        val fromInt =
          fn
            0 => INVALID
          | 1 => BACKGROUND
          | 2 => CANVAS
          | 3 => WIDGET
          | 4 => MDI
          | 5 => POPUP
          | 6 => OVERLAY
          | 7 => WINDOW
          | n => raise Value n
      )
    open Enum
    val getType_ = _import "atk_layer_get_type" : unit -> GObjectType.FFI.val_;
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
