structure PangoFontFace :>
  PANGO_FONT_FACE
    where type 'a class = 'a PangoFontFaceClass.class
    where type font_description_t = PangoFontDescriptionRecord.t =
  struct
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
             &&> GInt32CArrayN.PolyML.cOutRef
             &&> GInt32.PolyML.cRef
             --> cVoid
          )
    end
    type 'a class = 'a PangoFontFaceClass.class
    type font_description_t = PangoFontDescriptionRecord.t
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun describe self = (PangoFontFaceClass.FFI.withPtr false ---> PangoFontDescriptionRecord.FFI.fromPtr true) describe_ self
    fun getFaceName self = (PangoFontFaceClass.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getFaceName_ self
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
