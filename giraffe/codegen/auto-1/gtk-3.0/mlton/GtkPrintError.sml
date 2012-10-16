structure GtkPrintError :>
  sig
    include GTK_PRINT_ERROR
  end =
  struct
    datatype t =
      GENERAL
    | INTERNALERROR
    | NOMEM
    | INVALIDFILE
    structure C =
      struct
        type val_ = FFI.Enum.val_
        type ref_ = FFI.Enum.ref_
        exception Value of FFI.Enum.val_
        fun withVal f =
          fn
            GENERAL => f 0
          | INTERNALERROR => f 1
          | NOMEM => f 2
          | INVALIDFILE => f 3
        fun withRefVal f = withVal (FFI.Enum.withRef f)
        val fromVal =
          fn
            0 => GENERAL
          | 1 => INTERNALERROR
          | 2 => NOMEM
          | 3 => INVALIDFILE
          | n => raise Value n
      end
    val getType_ = _import "gtk_print_error_get_type" : unit -> GObjectType.C.val_;
    val getValue_ = _import "g_value_get_enum" : GObjectValueRecord.C.notnull GObjectValueRecord.C.p -> C.val_;
    val setValue_ = fn x1 & x2 => (_import "g_value_set_enum" : GObjectValueRecord.C.notnull GObjectValueRecord.C.p * C.val_ -> unit;) (x1, x2)
    val t =
      GObjectValue.C.createAccessor
        {
          getType = (I ---> GObjectType.C.fromVal) getType_,
          getValue = (I ---> C.fromVal) getValue_,
          setValue = (I &&&> C.withVal ---> I) setValue_
        }
    exception Error of t
    val handler =
      GLibErrorRecord.makeHandler
        (
          "gtk-print-error-quark",
          C.fromVal,
          Error
        )
    val getType = (I ---> GObjectType.C.fromVal) getType_
  end
exception GtkPrintError = GtkPrintError.Error
