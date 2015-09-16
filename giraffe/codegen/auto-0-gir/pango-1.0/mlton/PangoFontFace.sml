structure PangoFontFace :>
  PANGO_FONT_FACE
    where type 'a class_t = 'a PangoFontFaceClass.t
    where type font_description_record_t = PangoFontDescriptionRecord.t =
  struct
    val getType_ = _import "pango_font_face_get_type" : unit -> GObjectType.C.val_;
    val describe_ = _import "pango_font_face_describe" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> PangoFontDescriptionRecord.C.notnull PangoFontDescriptionRecord.C.p;
    val getFaceName_ = _import "pango_font_face_get_face_name" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.String.C.notnull FFI.String.C.out_p;
    val isSynthesized_ = _import "pango_font_face_is_synthesized" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    type 'a class_t = 'a PangoFontFaceClass.t
    type font_description_record_t = PangoFontDescriptionRecord.t
    type t = base class_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun describe self = (GObjectObjectClass.C.withPtr ---> PangoFontDescriptionRecord.C.fromPtr true) describe_ self
    fun getFaceName self = (GObjectObjectClass.C.withPtr ---> FFI.String.C.fromPtr false) getFaceName_ self
    fun isSynthesized self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) isSynthesized_ self
  end
