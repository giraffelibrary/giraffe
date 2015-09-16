structure GdkWindowHints :>
  sig
    include GDK_WINDOW_HINTS
  end =
  struct
    val POS = 0w1
    val MIN_SIZE = 0w2
    val MAX_SIZE = 0w4
    val BASE_SIZE = 0w8
    val ASPECT = 0w16
    val RESIZE_INC = 0w32
    val WIN_GRAVITY = 0w64
    val USER_POS = 0w128
    val USER_SIZE = 0w256
    val allFlags =
      [
        POS,
        MIN_SIZE,
        MAX_SIZE,
        BASE_SIZE,
        ASPECT,
        RESIZE_INC,
        WIN_GRAVITY,
        USER_POS,
        USER_SIZE
      ]
    structure BitFlags =
      Word32BitFlags (
        val allFlags = allFlags
      )
    open BitFlags
    type t = flags
    structure C =
      struct
        type val_ = FFI.Flags.C.val_
        type ref_ = FFI.Flags.C.ref_
        fun withVal f = f
        fun withRefVal f = withVal (FFI.Flags.C.withRef f)
        fun fromVal w = w
      end
    val getType_ = _import "gdk_window_hints_get_type" : unit -> GObjectType.C.val_;
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
