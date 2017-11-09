structure GtkCellRendererAccelMode :> GTK_CELL_RENDERER_ACCEL_MODE =
  struct
    datatype enum =
      GTK
    | OTHER
    structure Enum =
      Enum(
        type enum = enum
        val null = GTK
        val toInt =
          fn
            GTK => 0
          | OTHER => 1
        exception Value of GInt.t
        val fromInt =
          fn
            0 => GTK
          | 1 => OTHER
          | n => raise Value n
      )
    open Enum
    val getType_ = _import "gtk_cell_renderer_accel_mode_get_type" : unit -> GObjectType.FFI.val_;
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
