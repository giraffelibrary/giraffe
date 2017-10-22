structure PangoFontFace :>
  PANGO_FONT_FACE
    where type 'a class = 'a PangoFontFaceClass.class
    where type font_description_t = PangoFontDescriptionRecord.t =
  struct
    structure GIntCVectorNType =
      CValueCVectorNType(
        structure CElemType = GIntType
        structure ElemSequence = CValueVectorSequence(GIntType)
      )
    structure GIntCVectorN = CVectorN(GIntCVectorNType)
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "pango_font_face_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val describe_ = call (getSymbol "pango_font_face_describe") (PangoFontFaceClass.PolyML.cPtr --> PangoFontDescriptionRecord.PolyML.cPtr)
      val getFaceName_ = call (getSymbol "pango_font_face_get_face_name") (PangoFontFaceClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val isSynthesized_ = call (getSymbol "pango_font_face_is_synthesized") (PangoFontFaceClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val listSizes_ =
        call (getSymbol "pango_font_face_list_sizes")
          (
            PangoFontFaceClass.PolyML.cPtr
             &&> GIntCVectorN.PolyML.cOutRef
             &&> GInt.PolyML.cRef
             --> cVoid
          )
    end
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
