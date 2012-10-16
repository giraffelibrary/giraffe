structure GtkPageOrientation :>
  sig
    include GTK_PAGE_ORIENTATION
  end =
  struct
    datatype t =
      PORTRAIT
    | LANDSCAPE
    | REVERSEPORTRAIT
    | REVERSELANDSCAPE
    structure C =
      struct
        type val_ = FFI.Enum.val_
        type ref_ = FFI.Enum.ref_
        exception Value of FFI.Enum.val_
        fun withVal f =
          fn
            PORTRAIT => f 0
          | LANDSCAPE => f 1
          | REVERSEPORTRAIT => f 2
          | REVERSELANDSCAPE => f 3
        fun withRefVal f = withVal (FFI.Enum.withRef f)
        val fromVal =
          fn
            0 => PORTRAIT
          | 1 => LANDSCAPE
          | 2 => REVERSEPORTRAIT
          | 3 => REVERSELANDSCAPE
          | n => raise Value n
      end
    val getType_ = _import "gtk_page_orientation_get_type" : unit -> GObjectType.C.val_;
    val getValue_ = _import "g_value_get_enum" : GObjectValueRecord.C.notnull GObjectValueRecord.C.p -> C.val_;
    val setValue_ = fn x1 & x2 => (_import "g_value_set_enum" : GObjectValueRecord.C.notnull GObjectValueRecord.C.p * C.val_ -> unit;) (x1, x2)
    val t =
      GObjectValue.C.createAccessor
        {
          getType = (I ---> GObjectType.C.fromVal) getType_,
          getValue = (I ---> C.fromVal) getValue_,
          setValue = (I &&&> C.withVal ---> I) setValue_
        }
    val null = PORTRAIT
    val getType = (I ---> GObjectType.C.fromVal) getType_
  end
