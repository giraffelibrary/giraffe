structure PangoFontFamily :>
  PANGO_FONT_FAMILY
    where type 'a class = 'a PangoFontFamilyClass.class
    where type 'a font_face_class = 'a PangoFontFaceClass.class =
  struct
    structure PangoFontFaceClassCVectorNType =
      CPointerCVectorNType(
        structure CElemType = PangoFontFaceClass.C.PointerType
        structure Sequence = VectorSequence
      )
    structure PangoFontFaceClassCVectorN = CVectorN(PangoFontFaceClassCVectorNType)
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "pango_font_family_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val getName_ = call (getSymbol "pango_font_family_get_name") (PangoFontFamilyClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val isMonospace_ = call (getSymbol "pango_font_family_is_monospace") (PangoFontFamilyClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val listFaces_ =
        call (getSymbol "pango_font_family_list_faces")
          (
            PangoFontFamilyClass.PolyML.cPtr
             &&> PangoFontFaceClassCVectorN.PolyML.cOutRef
             &&> GInt32.PolyML.cRef
             --> cVoid
          )
    end
    type 'a class = 'a PangoFontFamilyClass.class
    type 'a font_face_class = 'a PangoFontFaceClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun getName self = (PangoFontFamilyClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getName_ self
    fun isMonospace self = (PangoFontFamilyClass.FFI.withPtr ---> GBool.FFI.fromVal) isMonospace_ self
    fun listFaces self =
      let
        val faces
         & nFaces
         & () =
          (
            PangoFontFamilyClass.FFI.withPtr
             &&&> PangoFontFaceClassCVectorN.FFI.withRefOptPtr
             &&&> GInt32.FFI.withRefVal
             ---> PangoFontFaceClassCVectorN.FFI.fromPtr 2
                   && GInt32.FFI.fromVal
                   && I
          )
            listFaces_
            (
              self
               & NONE
               & GInt32.null
            )
      in
        faces (LargeInt.toInt nFaces)
      end
  end
