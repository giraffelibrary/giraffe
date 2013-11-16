structure GtkUnit :>
  sig
    include GTK_UNIT
  end =
  struct
    datatype t =
      PIXEL
    | POINTS
    | INCH
    | MM
    structure C =
      struct
        type val_ = FFI.Enum.C.val_
        type ref_ = FFI.Enum.C.ref_
        exception Value of FFI.Enum.C.val_
        fun withVal f =
          fn
            PIXEL => f 0
          | POINTS => f 1
          | INCH => f 2
          | MM => f 3
        fun withRefVal f = withVal (FFI.Enum.C.withRef f)
        val fromVal =
          fn
            0 => PIXEL
          | 1 => POINTS
          | 2 => INCH
          | 3 => MM
          | n => raise Value n
      end
    val getType_ = _import "gtk_unit_get_type" : unit -> GObjectType.C.val_;
    val getValue_ = _import "g_value_get_enum" : GObjectValueRecord.C.notnull GObjectValueRecord.C.p -> C.val_;
    val setValue_ = fn x1 & x2 => (_import "g_value_set_enum" : GObjectValueRecord.C.notnull GObjectValueRecord.C.p * C.val_ -> unit;) (x1, x2)
    val t =
      GObjectValue.C.createAccessor
        {
          getType = (I ---> GObjectType.C.fromVal) getType_,
          getValue = (I ---> C.fromVal) getValue_,
          setValue = (I &&&> C.withVal ---> I) setValue_
        }
    val null = PIXEL
    val getType = (I ---> GObjectType.C.fromVal) getType_
  end
