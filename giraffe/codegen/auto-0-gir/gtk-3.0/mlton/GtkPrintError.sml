structure GtkPrintError :>
  sig
    include GTK_PRINT_ERROR
  end =
  struct
    datatype t =
      GENERAL
    | INTERNAL_ERROR
    | NOMEM
    | INVALID_FILE
    structure C =
      struct
        type val_ = FFI.Enum.C.val_
        type ref_ = FFI.Enum.C.ref_
        exception Value of FFI.Enum.C.val_
        fun withVal f =
          fn
            GENERAL => f 0
          | INTERNAL_ERROR => f 1
          | NOMEM => f 2
          | INVALID_FILE => f 3
        fun withRefVal f = withVal (FFI.Enum.C.withRef f)
        val fromVal =
          fn
            0 => GENERAL
          | 1 => INTERNAL_ERROR
          | 2 => NOMEM
          | 3 => INVALID_FILE
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
