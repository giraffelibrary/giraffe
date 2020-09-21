structure CairoFontFace :>
  CAIRO_FONT_FACE
    where type t = CairoFontFaceRecord.t =
  struct
    val getType_ = _import "cairo_gobject_font_face_get_type" : unit -> GObjectType.FFI.val_;
    type t = CairoFontFaceRecord.t
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
  end
