structure GtkDebugFlag :>
  sig
    include GTK_DEBUG_FLAG
  end =
  struct
    val MISC = 0w1
    val PLUGSOCKET = 0w2
    val TEXT = 0w4
    val TREE = 0w8
    val UPDATES = 0w16
    val KEYBINDINGS = 0w32
    val MULTIHEAD = 0w64
    val MODULES = 0w128
    val GEOMETRY = 0w256
    val ICONTHEME = 0w512
    val PRINTING = 0w1024
    val BUILDER = 0w2048
    val SIZEREQUEST = 0w4096
    val allFlags =
      [
        MISC,
        PLUGSOCKET,
        TEXT,
        TREE,
        UPDATES,
        KEYBINDINGS,
        MULTIHEAD,
        MODULES,
        GEOMETRY,
        ICONTHEME,
        PRINTING,
        BUILDER,
        SIZEREQUEST
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
    val getType_ = _import "gtk_debug_flag_get_type" : unit -> GObjectType.C.val_;
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
