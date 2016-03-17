structure PangoFontFace :>
  PANGO_FONT_FACE
    where type 'a class = 'a PangoFontFaceClass.class
    where type font_description_t = PangoFontDescriptionRecord.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libpango "pango_font_face_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val describe_ = call (load_sym libpango "pango_font_face_describe") (GObjectObjectClass.PolyML.cPtr --> PangoFontDescriptionRecord.PolyML.cPtr)
      val getFaceName_ = call (load_sym libpango "pango_font_face_get_face_name") (GObjectObjectClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val isSynthesized_ = call (load_sym libpango "pango_font_face_is_synthesized") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
    end
    type 'a class = 'a PangoFontFaceClass.class
    type font_description_t = PangoFontDescriptionRecord.t
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun describe self = (GObjectObjectClass.C.withPtr ---> PangoFontDescriptionRecord.C.fromPtr true) describe_ self
    fun getFaceName self = (GObjectObjectClass.C.withPtr ---> Utf8.C.fromPtr false) getFaceName_ self
    fun isSynthesized self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) isSynthesized_ self
  end
