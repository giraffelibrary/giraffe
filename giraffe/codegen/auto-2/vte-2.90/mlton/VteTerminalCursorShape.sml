structure VteTerminalCursorShape :>
  sig
    include VTE_TERMINAL_CURSOR_SHAPE
  end =
  struct
    datatype t =
      BLOCK
    | IBEAM
    | UNDERLINE
    structure C =
      struct
        type val_ = FFI.Enum.C.val_
        type ref_ = FFI.Enum.C.ref_
        exception Value of FFI.Enum.C.val_
        fun withVal f =
          fn
            BLOCK => f 0
          | IBEAM => f 1
          | UNDERLINE => f 2
        fun withRefVal f = withVal (FFI.Enum.C.withRef f)
        val fromVal =
          fn
            0 => BLOCK
          | 1 => IBEAM
          | 2 => UNDERLINE
          | n => raise Value n
      end
    val getType_ = _import "vte_terminal_cursor_shape_get_type" : unit -> GObjectType.C.val_;
    val getValue_ = _import "g_value_get_enum" : GObjectValueRecord.C.notnull GObjectValueRecord.C.p -> C.val_;
    val setValue_ = fn x1 & x2 => (_import "g_value_set_enum" : GObjectValueRecord.C.notnull GObjectValueRecord.C.p * C.val_ -> unit;) (x1, x2)
    val t =
      GObjectValue.C.createAccessor
        {
          getType = (I ---> GObjectType.C.fromVal) getType_,
          getValue = (I ---> C.fromVal) getValue_,
          setValue = (I &&&> C.withVal ---> I) setValue_
        }
    val null = BLOCK
    val getType = (I ---> GObjectType.C.fromVal) getType_
  end
