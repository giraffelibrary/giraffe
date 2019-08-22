structure PangoFontFace :>
  PANGO_FONT_FACE
    where type 'a class = 'a PangoFontFaceClass.class
    where type font_description_t = PangoFontDescriptionRecord.t =
  struct
    structure GIntCVectorNType =
      CValueCVectorNType(
        structure CElemType = GInt.C.ValueType
        structure ElemSequence = CValueVectorSequence(GInt.C.ValueType)
      )
    structure GIntCVectorN = CVectorN(GIntCVectorNType)
    val getType_ = _import "pango_font_face_get_type" : unit -> GObjectType.FFI.val_;
    val describe_ = _import "pango_font_face_describe" : PangoFontFaceClass.FFI.notnull PangoFontFaceClass.FFI.p -> PangoFontDescriptionRecord.FFI.notnull PangoFontDescriptionRecord.FFI.p;
    val getFaceName_ = _import "pango_font_face_get_face_name" : PangoFontFaceClass.FFI.notnull PangoFontFaceClass.FFI.p -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val isSynthesized_ = _import "pango_font_face_is_synthesized" : PangoFontFaceClass.FFI.notnull PangoFontFaceClass.FFI.p -> GBool.FFI.val_;
    val listSizes_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_pango_font_face_list_sizes" :
              PangoFontFaceClass.FFI.notnull PangoFontFaceClass.FFI.p
               * GIntCVectorN.MLton.r1
               * (unit, GIntCVectorN.FFI.notnull) GIntCVectorN.MLton.r2
               * GInt.FFI.ref_
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
    fun describe self = (PangoFontFaceClass.FFI.withPtr ---> PangoFontDescriptionRecord.FFI.fromPtr true) describe_ self
    fun getFaceName self = (PangoFontFaceClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getFaceName_ self
    fun isSynthesized self = (PangoFontFaceClass.FFI.withPtr ---> GBool.FFI.fromVal) isSynthesized_ self
    fun listSizes self =
      let
        val sizes
         & nSizes
         & () =
          (
            PangoFontFaceClass.FFI.withPtr
             &&&> GIntCVectorN.FFI.withRefOptPtr
             &&&> GInt.FFI.withRefVal
             ---> GIntCVectorN.FFI.fromPtr 1
                   && GInt.FFI.fromVal
                   && I
          )
            listSizes_
            (
              self
               & NONE
               & GInt.null
            )
      in
        sizes (LargeInt.toInt nSizes)
      end
  end
