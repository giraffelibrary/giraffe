structure GtkDebugFlag :>
  sig
    include GTK_DEBUG_FLAG
    structure PolyML :
      sig
        val VAL : C.val_ CInterface.Conversion
        val REF : C.ref_ CInterface.Conversion
      end
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
    structure PolyML =
      struct
        val VAL = FFI.PolyML.Flags.VAL
        val REF = FFI.PolyML.Flags.REF
      end
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_debug_flag_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val getValue_ = call (load_sym libgobject "g_value_get_flags") (GObjectValueRecord.PolyML.PTR --> PolyML.VAL)
      val setValue_ = call (load_sym libgobject "g_value_set_flags") (GObjectValueRecord.PolyML.PTR &&> PolyML.VAL --> FFI.PolyML.VOID)
    end
    val t =
      GObjectValue.C.createAccessor
        {
          getType = (I ---> GObjectType.C.fromVal) getType_,
          getValue = (I ---> C.fromVal) getValue_,
          setValue = (I &&&> C.withVal ---> I) setValue_
        }
    val getType = (I ---> GObjectType.C.fromVal) getType_
  end
