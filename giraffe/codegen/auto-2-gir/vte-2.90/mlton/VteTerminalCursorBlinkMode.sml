structure VteTerminalCursorBlinkMode :>
  sig
    include VTE_TERMINAL_CURSOR_BLINK_MODE
  end =
  struct
    datatype t =
      SYSTEM
    | ON
    | OFF
    structure C =
      struct
        type val_ = FFI.Enum.C.val_
        type ref_ = FFI.Enum.C.ref_
        exception Value of FFI.Enum.C.val_
        fun withVal f =
          fn
            SYSTEM => f 0
          | ON => f 1
          | OFF => f 2
        fun withRefVal f = withVal (FFI.Enum.C.withRef f)
        val fromVal =
          fn
            0 => SYSTEM
          | 1 => ON
          | 2 => OFF
          | n => raise Value n
      end
    val getType_ = _import "vte_terminal_cursor_blink_mode_get_type" : unit -> GObjectType.C.val_;
    val getValue_ = _import "g_value_get_enum" : GObjectValueRecord.C.notnull GObjectValueRecord.C.p -> C.val_;
    val setValue_ = fn x1 & x2 => (_import "g_value_set_enum" : GObjectValueRecord.C.notnull GObjectValueRecord.C.p * C.val_ -> unit;) (x1, x2)
    val t =
      GObjectValue.C.createAccessor
        {
          getType = (I ---> GObjectType.C.fromVal) getType_,
          getValue = (I ---> C.fromVal) getValue_,
          setValue = (I &&&> C.withVal ---> I) setValue_
        }
    val null = SYSTEM
    val getType = (I ---> GObjectType.C.fromVal) getType_
  end
