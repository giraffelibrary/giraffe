structure PangoFontFamily :>
  PANGO_FONT_FAMILY
    where type 'a class = 'a PangoFontFamilyClass.class
    where type font_face_class_c_ptr_array_n_t = PangoFontFaceClassCPtrArrayN.t =
  struct
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
             &&> PangoFontFaceClassCPtrArrayN.PolyML.cOutRef
             &&> GInt.PolyML.cRef
             --> cVoid
          )
    end
    type 'a class = 'a PangoFontFamilyClass.class
    type font_face_class_c_ptr_array_n_t = PangoFontFaceClassCPtrArrayN.t
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun getName self = (PangoFontFamilyClass.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getName_ self before PangoFontFamilyClass.FFI.touchPtr self
    fun isMonospace self = (PangoFontFamilyClass.FFI.withPtr false ---> GBool.FFI.fromVal) isMonospace_ self
    fun listFaces self =
      let
        val faces
         & nFaces
         & () =
          (
            PangoFontFamilyClass.FFI.withPtr false
             &&&> PangoFontFaceClassCPtrArrayN.FFI.withRefOptPtr 0
             &&&> GInt.FFI.withRefVal
             ---> PangoFontFaceClassCPtrArrayN.FFI.fromPtr 1
                   && GInt.FFI.fromVal
                   && I
          )
            listFaces_
            (
              self
               & NONE
               & GInt.null
            )
      in
        faces (LargeInt.toInt nFaces) before PangoFontFamilyClass.FFI.touchPtr self
      end
  end
