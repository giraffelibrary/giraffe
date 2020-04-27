structure PangoFontFamily :>
  PANGO_FONT_FAMILY
    where type 'a class = 'a PangoFontFamilyClass.class
    where type font_face_class_c_ptr_array_n_t = PangoFontFaceClassCPtrArrayN.t =
  struct
    val getType_ = _import "pango_font_family_get_type" : unit -> GObjectType.FFI.val_;
    val getName_ = _import "pango_font_family_get_name" : PangoFontFamilyClass.FFI.notnull PangoFontFamilyClass.FFI.p -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val isMonospace_ = _import "pango_font_family_is_monospace" : PangoFontFamilyClass.FFI.notnull PangoFontFamilyClass.FFI.p -> GBool.FFI.val_;
    val listFaces_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_pango_font_family_list_faces" :
              PangoFontFamilyClass.FFI.notnull PangoFontFamilyClass.FFI.p
               * PangoFontFaceClassCPtrArrayN.MLton.r1
               * (unit, PangoFontFaceClassCPtrArrayN.FFI.notnull) PangoFontFaceClassCPtrArrayN.MLton.r2
               * GInt.FFI.ref_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    type 'a class = 'a PangoFontFamilyClass.class
    type font_face_class_c_ptr_array_n_t = PangoFontFaceClassCPtrArrayN.t
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
             &&&> PangoFontFaceClassCPtrArrayN.FFI.withRefOptPtr
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
        faces (LargeInt.toInt nFaces)
      end
  end
