structure VteTerminalAntiAlias :>
  sig
    include VTE_TERMINAL_ANTI_ALIAS
  end =
  struct
    datatype t =
      USEDEFAULT
    | FORCEENABLE
    | FORCEDISABLE
    structure C =
      struct
        type val_ = FFI.Enum.C.val_
        type ref_ = FFI.Enum.C.ref_
        exception Value of FFI.Enum.C.val_
        fun withVal f =
          fn
            USEDEFAULT => f 0
          | FORCEENABLE => f 1
          | FORCEDISABLE => f 2
        fun withRefVal f = withVal (FFI.Enum.C.withRef f)
        val fromVal =
          fn
            0 => USEDEFAULT
          | 1 => FORCEENABLE
          | 2 => FORCEDISABLE
          | n => raise Value n
      end
    val getType_ = _import "vte_terminal_anti_alias_get_type" : unit -> GObjectType.C.val_;
    val getValue_ = _import "g_value_get_enum" : GObjectValueRecord.C.notnull GObjectValueRecord.C.p -> C.val_;
    val setValue_ = fn x1 & x2 => (_import "g_value_set_enum" : GObjectValueRecord.C.notnull GObjectValueRecord.C.p * C.val_ -> unit;) (x1, x2)
    val t =
      GObjectValue.C.createAccessor
        {
          getType = (I ---> GObjectType.C.fromVal) getType_,
          getValue = (I ---> C.fromVal) getValue_,
          setValue = (I &&&> C.withVal ---> I) setValue_
        }
    val null = USEDEFAULT
    val getType = (I ---> GObjectType.C.fromVal) getType_
  end
