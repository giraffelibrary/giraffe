structure VteTerminalEraseBinding :>
  sig
    include VTE_TERMINAL_ERASE_BINDING
    structure PolyML :
      sig
        val VAL : C.val_ CInterface.Conversion
        val REF : C.ref_ CInterface.Conversion
      end
  end =
  struct
    datatype t =
      AUTO
    | ASCIIBACKSPACE
    | ASCIIDELETE
    | DELETESEQUENCE
    | TTY
    structure C =
      struct
        type val_ = FFI.Enum.val_
        type ref_ = FFI.Enum.ref_
        exception Value of FFI.Enum.val_
        fun withVal f =
          fn
            AUTO => f 0
          | ASCIIBACKSPACE => f 1
          | ASCIIDELETE => f 2
          | DELETESEQUENCE => f 3
          | TTY => f 4
        fun withRefVal f = withVal (FFI.Enum.withRef f)
        val fromVal =
          fn
            0 => AUTO
          | 1 => ASCIIBACKSPACE
          | 2 => ASCIIDELETE
          | 3 => DELETESEQUENCE
          | 4 => TTY
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
      val getType_ = call (load_sym libvte "vte_terminal_erase_binding_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
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
    val null = AUTO
    val getType = (I ---> GObjectType.C.fromVal) getType_
  end
