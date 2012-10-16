structure GtkPrintQuality :>
  sig
    include GTK_PRINT_QUALITY
  end =
  struct
    datatype t =
      LOW
    | NORMAL
    | HIGH
    | DRAFT
    structure C =
      struct
        type val_ = FFI.Enum.val_
        type ref_ = FFI.Enum.ref_
        exception Value of FFI.Enum.val_
        fun withVal f =
          fn
            LOW => f 0
          | NORMAL => f 1
          | HIGH => f 2
          | DRAFT => f 3
        fun withRefVal f = withVal (FFI.Enum.withRef f)
        val fromVal =
          fn
            0 => LOW
          | 1 => NORMAL
          | 2 => HIGH
          | 3 => DRAFT
          | n => raise Value n
      end
    val getType_ = _import "gtk_print_quality_get_type" : unit -> GObjectType.C.val_;
    val getValue_ = _import "g_value_get_enum" : GObjectValueRecord.C.notnull GObjectValueRecord.C.p -> C.val_;
    val setValue_ = fn x1 & x2 => (_import "g_value_set_enum" : GObjectValueRecord.C.notnull GObjectValueRecord.C.p * C.val_ -> unit;) (x1, x2)
    val t =
      GObjectValue.C.createAccessor
        {
          getType = (I ---> GObjectType.C.fromVal) getType_,
          getValue = (I ---> C.fromVal) getValue_,
          setValue = (I &&&> C.withVal ---> I) setValue_
        }
    val null = LOW
    val getType = (I ---> GObjectType.C.fromVal) getType_
  end
