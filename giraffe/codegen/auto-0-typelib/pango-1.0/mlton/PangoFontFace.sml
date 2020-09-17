structure PangoFontFace :>
  PANGO_FONT_FACE
    where type 'a class = 'a PangoFontFaceClass.class
    where type font_description_t = PangoFontDescriptionRecord.t =
  struct
    val getType_ = _import "pango_font_face_get_type" : unit -> GObjectType.FFI.val_;
    val describe_ = _import "pango_font_face_describe" : PangoFontFaceClass.FFI.non_opt PangoFontFaceClass.FFI.p -> PangoFontDescriptionRecord.FFI.non_opt PangoFontDescriptionRecord.FFI.p;
    val getFaceName_ = _import "pango_font_face_get_face_name" : PangoFontFaceClass.FFI.non_opt PangoFontFaceClass.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val isSynthesized_ = _import "pango_font_face_is_synthesized" : PangoFontFaceClass.FFI.non_opt PangoFontFaceClass.FFI.p -> GBool.FFI.val_;
    val listSizes_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_pango_font_face_list_sizes" :
              PangoFontFaceClass.FFI.non_opt PangoFontFaceClass.FFI.p
               * GInt32CArrayN.MLton.r1
               * (GInt32CArrayN.FFI.opt, GInt32CArrayN.FFI.non_opt) GInt32CArrayN.MLton.r2
               * GInt32.FFI.ref_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    type 'a class = 'a PangoFontFaceClass.class
    type font_description_t = PangoFontDescriptionRecord.t
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun describe self = (PangoFontFaceClass.FFI.withPtr false ---> PangoFontDescriptionRecord.FFI.fromPtr true) describe_ self
    fun getFaceName self = (PangoFontFaceClass.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getFaceName_ self before PangoFontFaceClass.FFI.touchPtr self
    fun isSynthesized self = (PangoFontFaceClass.FFI.withPtr false ---> GBool.FFI.fromVal) isSynthesized_ self
    fun listSizes self =
      let
        val sizes
         & nSizes
         & () =
          (
            PangoFontFaceClass.FFI.withPtr false
             &&&> GInt32CArrayN.FFI.withRefOptPtr 0
             &&&> GInt32.FFI.withRefVal
             ---> GInt32CArrayN.FFI.fromPtr ~1
                   && GInt32.FFI.fromVal
                   && I
          )
            listSizes_
            (
              self
               & NONE
               & GInt32.null
            )
      in
        sizes (LargeInt.toInt nSizes)
      end
  end
