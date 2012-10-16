structure GdkWindowAttributesType :>
  sig
    include GDK_WINDOW_ATTRIBUTES_TYPE
  end =
  struct
    val TITLE = 0w2
    val X = 0w4
    val Y = 0w8
    val CURSOR = 0w16
    val VISUAL = 0w32
    val WMCLASS = 0w64
    val NOREDIR = 0w128
    val TYPEHINT = 0w256
    val allFlags =
      [
        TITLE,
        X,
        Y,
        CURSOR,
        VISUAL,
        WMCLASS,
        NOREDIR,
        TYPEHINT
      ]
    structure BitFlags =
      Word32BitFlags (
        val allFlags = allFlags
      )
    open BitFlags
    type t = flags
    structure C =
      struct
        type val_ = FFI.Flags.val_
        type ref_ = FFI.Flags.ref_
        fun withVal f = f
        fun withRefVal f = withVal (FFI.Flags.withRef f)
        fun fromVal w = w
      end
    val getType_ = _import "gdk_window_attributes_type_get_type" : unit -> GObjectType.C.val_;
    val getValue_ = _import "g_value_get_flags" : GObjectValueRecord.C.notnull GObjectValueRecord.C.p -> C.val_;
    val setValue_ = fn x1 & x2 => (_import "g_value_set_flags" : GObjectValueRecord.C.notnull GObjectValueRecord.C.p * C.val_ -> unit;) (x1, x2)
    val t =
      GObjectValue.C.createAccessor
        {
          getType = (I ---> GObjectType.C.fromVal) getType_,
          getValue = (I ---> C.fromVal) getValue_,
          setValue = (I &&&> C.withVal ---> I) setValue_
        }
    val getType = (I ---> GObjectType.C.fromVal) getType_
  end
