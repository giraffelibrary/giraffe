structure PangoFontFamily :>
  PANGO_FONT_FAMILY
    where type 'a class = 'a PangoFontFamilyClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libpango "pango_font_family_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val getName_ = call (load_sym libpango "pango_font_family_get_name") (PangoFontFamilyClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val isMonospace_ = call (load_sym libpango "pango_font_family_is_monospace") (PangoFontFamilyClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
    end
    type 'a class = 'a PangoFontFamilyClass.class
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun getName self = (PangoFontFamilyClass.C.withPtr ---> Utf8.C.fromPtr false) getName_ self
    fun isMonospace self = (PangoFontFamilyClass.C.withPtr ---> FFI.Bool.C.fromVal) isMonospace_ self
  end
