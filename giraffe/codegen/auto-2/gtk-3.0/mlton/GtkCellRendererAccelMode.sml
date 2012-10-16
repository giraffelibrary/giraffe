structure GtkCellRendererAccelMode :>
  sig
    include GTK_CELL_RENDERER_ACCEL_MODE
  end =
  struct
    datatype t =
      GTK
    | OTHER
    structure C =
      struct
        type val_ = FFI.Enum.val_
        type ref_ = FFI.Enum.ref_
        exception Value of FFI.Enum.val_
        fun withVal f =
          fn
            GTK => f 0
          | OTHER => f 1
        fun withRefVal f = withVal (FFI.Enum.withRef f)
        val fromVal =
          fn
            0 => GTK
          | 1 => OTHER
          | n => raise Value n
      end
    val getType_ = _import "gtk_cell_renderer_accel_mode_get_type" : unit -> GObjectType.C.val_;
    val getValue_ = _import "g_value_get_enum" : GObjectValueRecord.C.notnull GObjectValueRecord.C.p -> C.val_;
    val setValue_ = fn x1 & x2 => (_import "g_value_set_enum" : GObjectValueRecord.C.notnull GObjectValueRecord.C.p * C.val_ -> unit;) (x1, x2)
    val t =
      GObjectValue.C.createAccessor
        {
          getType = (I ---> GObjectType.C.fromVal) getType_,
          getValue = (I ---> C.fromVal) getValue_,
          setValue = (I &&&> C.withVal ---> I) setValue_
        }
    val null = GTK
    val getType = (I ---> GObjectType.C.fromVal) getType_
  end
