structure GtkDebugFlag :> GTK_DEBUG_FLAG =
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
    val SIZE_REQUEST = 0w4096
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
        SIZE_REQUEST
      ]
    structure Flags =
      Flags(
        val allFlags = allFlags
      )
    open Flags
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_debug_flag_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val getValue_ = call (getSymbol "g_value_get_flags") (GObjectValueRecord.PolyML.cPtr --> PolyML.cVal)
      val setValue_ = call (getSymbol "g_value_set_flags") (GObjectValueRecord.PolyML.cPtr &&> PolyML.cVal --> PolyMLFFI.cVoid)
    end
    val t =
      GObjectValue.C.createAccessor
        {
          getType = (I ---> GObjectType.FFI.fromVal) getType_,
          getValue = (I ---> FFI.fromVal) getValue_,
          setValue = (I &&&> FFI.withVal ---> I) setValue_
        }
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
  end
