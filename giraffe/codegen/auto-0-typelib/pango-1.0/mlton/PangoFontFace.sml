structure PangoFontFace :>
  PANGO_FONT_FACE
    where type 'a class = 'a PangoFontFaceClass.class
    where type font_description_t = PangoFontDescriptionRecord.t =
  struct
    val getType_ = _import "pango_font_face_get_type" : unit -> GObjectType.FFI.val_;
    val describe_ = _import "pango_font_face_describe" : PangoFontFaceClass.FFI.notnull PangoFontFaceClass.FFI.p -> PangoFontDescriptionRecord.FFI.notnull PangoFontDescriptionRecord.FFI.p;
    val getFaceName_ = _import "pango_font_face_get_face_name" : PangoFontFaceClass.FFI.notnull PangoFontFaceClass.FFI.p -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val isSynthesized_ = _import "pango_font_face_is_synthesized" : PangoFontFaceClass.FFI.notnull PangoFontFaceClass.FFI.p -> GBool.FFI.val_;
    type 'a class = 'a PangoFontFaceClass.class
    type font_description_t = PangoFontDescriptionRecord.t
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun describe self = (PangoFontFaceClass.FFI.withPtr ---> PangoFontDescriptionRecord.FFI.fromPtr true) describe_ self
    fun getFaceName self = (PangoFontFaceClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getFaceName_ self
    fun isSynthesized self = (PangoFontFaceClass.FFI.withPtr ---> GBool.FFI.fromVal) isSynthesized_ self
  end
