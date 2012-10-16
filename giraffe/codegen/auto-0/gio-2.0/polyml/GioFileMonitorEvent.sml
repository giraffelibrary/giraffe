structure GioFileMonitorEvent :>
  sig
    include GIO_FILE_MONITOR_EVENT
    structure PolyML :
      sig
        val VAL : C.val_ CInterface.Conversion
        val REF : C.ref_ CInterface.Conversion
      end
  end =
  struct
    datatype t =
      CHANGED
    | CHANGESDONEHINT
    | DELETED
    | CREATED
    | ATTRIBUTECHANGED
    | PREUNMOUNT
    | UNMOUNTED
    | MOVED
    structure C =
      struct
        type val_ = FFI.Enum.val_
        type ref_ = FFI.Enum.ref_
        exception Value of FFI.Enum.val_
        fun withVal f =
          fn
            CHANGED => f 0
          | CHANGESDONEHINT => f 1
          | DELETED => f 2
          | CREATED => f 3
          | ATTRIBUTECHANGED => f 4
          | PREUNMOUNT => f 5
          | UNMOUNTED => f 6
          | MOVED => f 7
        fun withRefVal f = withVal (FFI.Enum.withRef f)
        val fromVal =
          fn
            0 => CHANGED
          | 1 => CHANGESDONEHINT
          | 2 => DELETED
          | 3 => CREATED
          | 4 => ATTRIBUTECHANGED
          | 5 => PREUNMOUNT
          | 6 => UNMOUNTED
          | 7 => MOVED
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
      val getType_ = call (load_sym libgio "g_file_monitor_event_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
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
    val null = CHANGED
    val getType = (I ---> GObjectType.C.fromVal) getType_
  end
