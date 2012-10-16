structure GtkScrollType :>
  sig
    include GTK_SCROLL_TYPE
    structure PolyML :
      sig
        val VAL : C.val_ CInterface.Conversion
        val REF : C.ref_ CInterface.Conversion
      end
  end =
  struct
    datatype t =
      NONE
    | JUMP
    | STEPBACKWARD
    | STEPFORWARD
    | PAGEBACKWARD
    | PAGEFORWARD
    | STEPUP
    | STEPDOWN
    | PAGEUP
    | PAGEDOWN
    | STEPLEFT
    | STEPRIGHT
    | PAGELEFT
    | PAGERIGHT
    | START
    | END
    structure C =
      struct
        type val_ = FFI.Enum.val_
        type ref_ = FFI.Enum.ref_
        exception Value of FFI.Enum.val_
        fun withVal f =
          fn
            NONE => f 0
          | JUMP => f 1
          | STEPBACKWARD => f 2
          | STEPFORWARD => f 3
          | PAGEBACKWARD => f 4
          | PAGEFORWARD => f 5
          | STEPUP => f 6
          | STEPDOWN => f 7
          | PAGEUP => f 8
          | PAGEDOWN => f 9
          | STEPLEFT => f 10
          | STEPRIGHT => f 11
          | PAGELEFT => f 12
          | PAGERIGHT => f 13
          | START => f 14
          | END => f 15
        fun withRefVal f = withVal (FFI.Enum.withRef f)
        val fromVal =
          fn
            0 => NONE
          | 1 => JUMP
          | 2 => STEPBACKWARD
          | 3 => STEPFORWARD
          | 4 => PAGEBACKWARD
          | 5 => PAGEFORWARD
          | 6 => STEPUP
          | 7 => STEPDOWN
          | 8 => PAGEUP
          | 9 => PAGEDOWN
          | 10 => STEPLEFT
          | 11 => STEPRIGHT
          | 12 => PAGELEFT
          | 13 => PAGERIGHT
          | 14 => START
          | 15 => END
          | n => raise Value n
      end
    structure PolyML =
      struct
        val VAL = FFI.PolyML.Enum.VAL
        val REF = FFI.PolyML.Enum.REF
      end
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_scroll_type_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val getValue_ = call (load_sym libgobject "g_value_get_enum") (GObjectValueRecord.PolyML.PTR --> PolyML.VAL)
      val setValue_ = call (load_sym libgobject "g_value_set_enum") (GObjectValueRecord.PolyML.PTR &&> PolyML.VAL --> FFI.PolyML.VOID)
    end
    val t =
      GObjectValue.C.createAccessor
        {
          getType = (I ---> GObjectType.C.fromVal) getType_,
          getValue = (I ---> C.fromVal) getValue_,
          setValue = (I &&&> C.withVal ---> I) setValue_
        }
    val null = NONE
    val getType = (I ---> GObjectType.C.fromVal) getType_
  end
