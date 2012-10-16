structure GtkArrowType :>
  sig
    include GTK_ARROW_TYPE
  end =
  struct
    datatype t =
      UP
    | DOWN
    | LEFT
    | RIGHT
    | NONE
    structure C =
      struct
        type val_ = FFI.Enum.val_
        type ref_ = FFI.Enum.ref_
        exception Value of FFI.Enum.val_
        fun withVal f =
          fn
            UP => f 0
          | DOWN => f 1
          | LEFT => f 2
          | RIGHT => f 3
          | NONE => f 4
        fun withRefVal f = withVal (FFI.Enum.withRef f)
        val fromVal =
          fn
            0 => UP
          | 1 => DOWN
          | 2 => LEFT
          | 3 => RIGHT
          | 4 => NONE
          | n => raise Value n
      end
    val getType_ = _import "gtk_arrow_type_get_type" : unit -> GObjectType.C.val_;
    val getValue_ = _import "g_value_get_enum" : GObjectValueRecord.C.notnull GObjectValueRecord.C.p -> C.val_;
    val setValue_ = fn x1 & x2 => (_import "g_value_set_enum" : GObjectValueRecord.C.notnull GObjectValueRecord.C.p * C.val_ -> unit;) (x1, x2)
    val t =
      GObjectValue.C.createAccessor
        {
          getType = (I ---> GObjectType.C.fromVal) getType_,
          getValue = (I ---> C.fromVal) getValue_,
          setValue = (I &&&> C.withVal ---> I) setValue_
        }
    val null = UP
    val getType = (I ---> GObjectType.C.fromVal) getType_
  end
