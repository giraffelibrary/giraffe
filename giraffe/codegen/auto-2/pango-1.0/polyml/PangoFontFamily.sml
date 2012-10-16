structure PangoFontFamily :>
  PANGO_FONT_FAMILY
    where type 'a class_t = 'a PangoFontFamilyClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libpango "pango_font_family_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val getName_ = call (load_sym libpango "pango_font_family_get_name") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.String.RETPTR)
      val isMonospace_ = call (load_sym libpango "pango_font_family_is_monospace") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.Bool.VAL)
    end
    type 'a class_t = 'a PangoFontFamilyClass.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun getName self = (GObjectObjectClass.C.withPtr ---> FFI.String.fromPtr false) getName_ self
    fun isMonospace self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.fromVal) isMonospace_ self
  end
