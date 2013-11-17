structure GtkPrintPages :>
  sig
    include GTK_PRINT_PAGES
  end =
  struct
    datatype t =
      ALL
    | CURRENT
    | RANGES
    | SELECTION
    structure C =
      struct
        type val_ = FFI.Enum.C.val_
        type ref_ = FFI.Enum.C.ref_
        exception Value of FFI.Enum.C.val_
        fun withVal f =
          fn
            ALL => f 0
          | CURRENT => f 1
          | RANGES => f 2
          | SELECTION => f 3
        fun withRefVal f = withVal (FFI.Enum.C.withRef f)
        val fromVal =
          fn
            0 => ALL
          | 1 => CURRENT
          | 2 => RANGES
          | 3 => SELECTION
          | n => raise Value n
      end
    val getType_ = _import "gtk_print_pages_get_type" : unit -> GObjectType.C.val_;
    val getValue_ = _import "g_value_get_enum" : GObjectValueRecord.C.notnull GObjectValueRecord.C.p -> C.val_;
    val setValue_ = fn x1 & x2 => (_import "g_value_set_enum" : GObjectValueRecord.C.notnull GObjectValueRecord.C.p * C.val_ -> unit;) (x1, x2)
    val t =
      GObjectValue.C.createAccessor
        {
          getType = (I ---> GObjectType.C.fromVal) getType_,
          getValue = (I ---> C.fromVal) getValue_,
          setValue = (I &&&> C.withVal ---> I) setValue_
        }
    val null = ALL
    val getType = (I ---> GObjectType.C.fromVal) getType_
  end
