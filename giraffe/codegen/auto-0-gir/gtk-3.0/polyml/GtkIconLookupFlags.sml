structure GtkIconLookupFlags :> GTK_ICON_LOOKUP_FLAGS =
  struct
    val NO_SVG = 0w1
    val FORCE_SVG = 0w2
    val USE_BUILTIN = 0w4
    val GENERIC_FALLBACK = 0w8
    val FORCE_SIZE = 0w16
    val FORCE_REGULAR = 0w32
    val FORCE_SYMBOLIC = 0w64
    val DIR_LTR = 0w128
    val DIR_RTL = 0w256
    val allFlags =
      [
        NO_SVG,
        FORCE_SVG,
        USE_BUILTIN,
        GENERIC_FALLBACK,
        FORCE_SIZE,
        FORCE_REGULAR,
        FORCE_SYMBOLIC,
        DIR_LTR,
        DIR_RTL
      ]
    structure Flags =
      Flags(
        val allFlags = allFlags
      )
    open Flags
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_icon_lookup_flags_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val getValue_ = call (getSymbol "g_value_get_flags") (GObjectValueRecord.PolyML.cPtr --> PolyML.cVal)
      val setValue_ = call (getSymbol "g_value_set_flags") (GObjectValueRecord.PolyML.cPtr &&> PolyML.cVal --> cVoid)
    end
    val t =
      ValueAccessor.C.createAccessor
        {
          getType = (I ---> GObjectType.FFI.fromVal) getType_,
          getValue = (I ---> FFI.fromVal) getValue_,
          setValue = (I &&&> FFI.withVal ---> I) setValue_
        }
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
  end
