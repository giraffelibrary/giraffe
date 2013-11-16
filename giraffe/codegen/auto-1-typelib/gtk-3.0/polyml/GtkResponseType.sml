structure GtkResponseType :>
  sig
    include GTK_RESPONSE_TYPE
    structure PolyML :
      sig
        val VAL : C.val_ CInterface.Conversion
        val REF : C.ref_ CInterface.Conversion
      end
  end =
  struct
    datatype t =
      NONE
    | REJECT
    | ACCEPT
    | DELETEEVENT
    | OK
    | CANCEL
    | CLOSE
    | YES
    | NO
    | APPLY
    | HELP
    structure C =
      struct
        type val_ = FFI.Enum.C.val_
        type ref_ = FFI.Enum.C.ref_
        exception Value of FFI.Enum.C.val_
        fun withVal f =
          fn
            NONE => f ~1
          | REJECT => f ~2
          | ACCEPT => f ~3
          | DELETEEVENT => f ~4
          | OK => f ~5
          | CANCEL => f ~6
          | CLOSE => f ~7
          | YES => f ~8
          | NO => f ~9
          | APPLY => f ~10
          | HELP => f ~11
        fun withRefVal f = withVal (FFI.Enum.C.withRef f)
        val fromVal =
          fn
            ~1 => NONE
          | ~2 => REJECT
          | ~3 => ACCEPT
          | ~4 => DELETEEVENT
          | ~5 => OK
          | ~6 => CANCEL
          | ~7 => CLOSE
          | ~8 => YES
          | ~9 => NO
          | ~10 => APPLY
          | ~11 => HELP
          | n => raise Value n
      end
    structure PolyML =
      struct
        val VAL = FFI.Enum.PolyML.VAL
        val REF = FFI.Enum.PolyML.REF
      end
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_response_type_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
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
