structure GtkJunctionSides :>
  sig
    include GTK_JUNCTION_SIDES
  end =
  struct
    local
      fun NONE () = 0w0
    in
      val NONE = NONE ()
    end
    val CORNERTOPLEFT = 0w1
    val CORNERTOPRIGHT = 0w2
    val CORNERBOTTOMLEFT = 0w4
    val CORNERBOTTOMRIGHT = 0w8
    val TOP = 0w3
    val BOTTOM = 0w12
    val LEFT = 0w5
    val RIGHT = 0w10
    val allFlags =
      [
        NONE,
        CORNERTOPLEFT,
        CORNERTOPRIGHT,
        CORNERBOTTOMLEFT,
        CORNERBOTTOMRIGHT,
        TOP,
        BOTTOM,
        LEFT,
        RIGHT
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
    val getType_ = _import "gtk_junction_sides_get_type" : unit -> GObjectType.C.val_;
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
