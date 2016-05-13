structure GtkPrintStatus :>
  sig
    include GTK_PRINT_STATUS
    structure PolyML :
      sig
        val cVal : C.val_ PolyMLFFI.conversion
        val cRef : C.ref_ PolyMLFFI.conversion
      end
  end =
  struct
    datatype t =
      INITIAL
    | PREPARING
    | GENERATING_DATA
    | SENDING_DATA
    | PENDING
    | PENDING_ISSUE
    | PRINTING
    | FINISHED
    | FINISHED_ABORTED
    structure C =
      struct
        type val_ = FFI.Enum.C.val_
        type ref_ = FFI.Enum.C.ref_
        exception Value of FFI.Enum.C.val_
        fun withVal f =
          fn
            INITIAL => f 0
          | PREPARING => f 1
          | GENERATING_DATA => f 2
          | SENDING_DATA => f 3
          | PENDING => f 4
          | PENDING_ISSUE => f 5
          | PRINTING => f 6
          | FINISHED => f 7
          | FINISHED_ABORTED => f 8
        fun withRefVal f = withVal (FFI.Enum.C.withRef f)
        val fromVal =
          fn
            0 => INITIAL
          | 1 => PREPARING
          | 2 => GENERATING_DATA
          | 3 => SENDING_DATA
          | 4 => PENDING
          | 5 => PENDING_ISSUE
          | 6 => PRINTING
          | 7 => FINISHED
          | 8 => FINISHED_ABORTED
          | n => raise Value n
      end
    structure PolyML =
      struct
        val cVal = FFI.Enum.PolyML.cVal
        val cRef = FFI.Enum.PolyML.cRef
      end
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_print_status_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val getValue_ = call (load_sym libgobject "g_value_get_enum") (GObjectValueRecord.PolyML.cPtr --> PolyML.cVal)
      val setValue_ = call (load_sym libgobject "g_value_set_enum") (GObjectValueRecord.PolyML.cPtr &&> PolyML.cVal --> PolyMLFFI.cVoid)
    end
    val t =
      GObjectValue.C.createAccessor
        {
          getType = (I ---> GObjectType.C.fromVal) getType_,
          getValue = (I ---> C.fromVal) getValue_,
          setValue = (I &&&> C.withVal ---> I) setValue_
        }
    val null = INITIAL
    val getType = (I ---> GObjectType.C.fromVal) getType_
  end
