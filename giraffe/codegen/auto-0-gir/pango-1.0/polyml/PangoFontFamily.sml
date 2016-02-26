structure PangoFontFamily :>
  PANGO_FONT_FAMILY
    where type 'a class_t = 'a PangoFontFamilyClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libpango "pango_font_family_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val getName_ = call (load_sym libpango "pango_font_family_get_name") (GObjectObjectClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val isMonospace_ = call (load_sym libpango "pango_font_family_is_monospace") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
    end
    type 'a class_t = 'a PangoFontFamilyClass.t
    type t = base class_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun getName self = (GObjectObjectClass.C.withPtr ---> Utf8.C.fromPtr false) getName_ self
    fun isMonospace self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) isMonospace_ self
  end
