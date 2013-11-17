structure GtkPrintStatus :>
  sig
    include GTK_PRINT_STATUS
  end =
  struct
    datatype t =
      INITIAL
    | PREPARING
    | GENERATINGDATA
    | SENDINGDATA
    | PENDING
    | PENDINGISSUE
    | PRINTING
    | FINISHED
    | FINISHEDABORTED
    structure C =
      struct
        type val_ = FFI.Enum.C.val_
        type ref_ = FFI.Enum.C.ref_
        exception Value of FFI.Enum.C.val_
        fun withVal f =
          fn
            INITIAL => f 0
          | PREPARING => f 1
          | GENERATINGDATA => f 2
          | SENDINGDATA => f 3
          | PENDING => f 4
          | PENDINGISSUE => f 5
          | PRINTING => f 6
          | FINISHED => f 7
          | FINISHEDABORTED => f 8
        fun withRefVal f = withVal (FFI.Enum.C.withRef f)
        val fromVal =
          fn
            0 => INITIAL
          | 1 => PREPARING
          | 2 => GENERATINGDATA
          | 3 => SENDINGDATA
          | 4 => PENDING
          | 5 => PENDINGISSUE
          | 6 => PRINTING
          | 7 => FINISHED
          | 8 => FINISHEDABORTED
          | n => raise Value n
      end
    val getType_ = _import "gtk_print_status_get_type" : unit -> GObjectType.C.val_;
    val getValue_ = _import "g_value_get_enum" : GObjectValueRecord.C.notnull GObjectValueRecord.C.p -> C.val_;
    val setValue_ = fn x1 & x2 => (_import "g_value_set_enum" : GObjectValueRecord.C.notnull GObjectValueRecord.C.p * C.val_ -> unit;) (x1, x2)
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
