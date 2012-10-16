structure AtkImage :>
  ATK_IMAGE
    where type 'a class_t = 'a AtkImageClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libatk "atk_image_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val getImageDescription_ = call (load_sym libatk "atk_image_get_image_description") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.String.RETPTR)
      val getImageLocale_ = call (load_sym libatk "atk_image_get_image_locale") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.String.RETPTR)
      val setImageDescription_ = call (load_sym libatk "atk_image_set_image_description") (GObjectObjectClass.PolyML.PTR &&> FFI.PolyML.String.INPTR --> FFI.PolyML.Bool.VAL)
    end
    type 'a class_t = 'a AtkImageClass.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun getImageDescription self = (GObjectObjectClass.C.withPtr ---> FFI.String.fromPtr false) getImageDescription_ self
    fun getImageLocale self = (GObjectObjectClass.C.withPtr ---> FFI.String.fromPtr false) getImageLocale_ self
    fun setImageDescription self description = (GObjectObjectClass.C.withPtr &&&> FFI.String.withConstPtr ---> FFI.Bool.fromVal) setImageDescription_ (self & description)
  end
