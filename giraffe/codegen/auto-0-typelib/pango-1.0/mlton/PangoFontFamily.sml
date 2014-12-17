structure PangoFontFamily :>
  PANGO_FONT_FAMILY
    where type 'a class_t = 'a PangoFontFamilyClass.t =
  struct
    val getType_ = _import "pango_font_family_get_type" : unit -> GObjectType.C.val_;
    val getName_ = _import "pango_font_family_get_name" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.String.C.notnull FFI.String.C.out_p;
    val isMonospace_ = _import "pango_font_family_is_monospace" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    type 'a class_t = 'a PangoFontFamilyClass.t
    type t = base class_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun getName self = (GObjectObjectClass.C.withPtr ---> FFI.String.C.fromPtr false) getName_ self
    fun isMonospace self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) isMonospace_ self
  end
