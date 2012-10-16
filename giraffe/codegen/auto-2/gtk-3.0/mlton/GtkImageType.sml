structure GtkImageType :>
  sig
    include GTK_IMAGE_TYPE
  end =
  struct
    datatype t =
      EMPTY
    | PIXBUF
    | STOCK
    | ICONSET
    | ANIMATION
    | ICONNAME
    | GICON
    structure C =
      struct
        type val_ = FFI.Enum.val_
        type ref_ = FFI.Enum.ref_
        exception Value of FFI.Enum.val_
        fun withVal f =
          fn
            EMPTY => f 0
          | PIXBUF => f 1
          | STOCK => f 2
          | ICONSET => f 3
          | ANIMATION => f 4
          | ICONNAME => f 5
          | GICON => f 6
        fun withRefVal f = withVal (FFI.Enum.withRef f)
        val fromVal =
          fn
            0 => EMPTY
          | 1 => PIXBUF
          | 2 => STOCK
          | 3 => ICONSET
          | 4 => ANIMATION
          | 5 => ICONNAME
          | 6 => GICON
          | n => raise Value n
      end
    val getType_ = _import "gtk_image_type_get_type" : unit -> GObjectType.C.val_;
    val getValue_ = _import "g_value_get_enum" : GObjectValueRecord.C.notnull GObjectValueRecord.C.p -> C.val_;
    val setValue_ = fn x1 & x2 => (_import "g_value_set_enum" : GObjectValueRecord.C.notnull GObjectValueRecord.C.p * C.val_ -> unit;) (x1, x2)
    val t =
      GObjectValue.C.createAccessor
        {
          getType = (I ---> GObjectType.C.fromVal) getType_,
          getValue = (I ---> C.fromVal) getValue_,
          setValue = (I &&&> C.withVal ---> I) setValue_
        }
    val null = EMPTY
    val getType = (I ---> GObjectType.C.fromVal) getType_
  end
