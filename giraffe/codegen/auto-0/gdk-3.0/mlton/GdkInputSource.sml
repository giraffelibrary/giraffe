structure GdkInputSource :>
  sig
    include GDK_INPUT_SOURCE
  end =
  struct
    datatype t =
      MOUSE
    | PEN
    | ERASER
    | CURSOR
    | KEYBOARD
    structure C =
      struct
        type val_ = FFI.Enum.val_
        type ref_ = FFI.Enum.ref_
        exception Value of FFI.Enum.val_
        fun withVal f =
          fn
            MOUSE => f 0
          | PEN => f 1
          | ERASER => f 2
          | CURSOR => f 3
          | KEYBOARD => f 4
        fun withRefVal f = withVal (FFI.Enum.withRef f)
        val fromVal =
          fn
            0 => MOUSE
          | 1 => PEN
          | 2 => ERASER
          | 3 => CURSOR
          | 4 => KEYBOARD
          | n => raise Value n
      end
    val getType_ = _import "gdk_input_source_get_type" : unit -> GObjectType.C.val_;
    val getValue_ = _import "g_value_get_enum" : GObjectValueRecord.C.notnull GObjectValueRecord.C.p -> C.val_;
    val setValue_ = fn x1 & x2 => (_import "g_value_set_enum" : GObjectValueRecord.C.notnull GObjectValueRecord.C.p * C.val_ -> unit;) (x1, x2)
    val t =
      GObjectValue.C.createAccessor
        {
          getType = (I ---> GObjectType.C.fromVal) getType_,
          getValue = (I ---> C.fromVal) getValue_,
          setValue = (I &&&> C.withVal ---> I) setValue_
        }
    val null = MOUSE
    val getType = (I ---> GObjectType.C.fromVal) getType_
  end
