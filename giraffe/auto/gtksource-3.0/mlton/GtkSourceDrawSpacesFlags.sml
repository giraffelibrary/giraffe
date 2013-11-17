structure GtkSourceDrawSpacesFlags :>
  sig
    include GTK_SOURCE_DRAW_SPACES_FLAGS
  end =
  struct
    val SPACE = 0w1
    val TAB = 0w2
    val NEWLINE = 0w4
    val NBSP = 0w8
    val LEADING = 0w16
    val TEXT = 0w32
    val TRAILING = 0w64
    val ALL = 0w127
    val allFlags =
      [
        SPACE,
        TAB,
        NEWLINE,
        NBSP,
        LEADING,
        TEXT,
        TRAILING,
        ALL
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
    val getType_ = _import "gtk_source_draw_spaces_flags_get_type" : unit -> GObjectType.C.val_;
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
