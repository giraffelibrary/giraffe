structure AtkImage :>
  ATK_IMAGE
    where type 'a class_t = 'a AtkImageClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libatk "atk_image_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val getImageDescription_ = call (load_sym libatk "atk_image_get_image_description") (GObjectObjectClass.PolyML.PTR --> Utf8.PolyML.RETPTR)
      val getImageLocale_ = call (load_sym libatk "atk_image_get_image_locale") (GObjectObjectClass.PolyML.PTR --> Utf8.PolyML.RETPTR)
      val setImageDescription_ = call (load_sym libatk "atk_image_set_image_description") (GObjectObjectClass.PolyML.PTR &&> Utf8.PolyML.INPTR --> FFI.Bool.PolyML.VAL)
    end
    type 'a class_t = 'a AtkImageClass.t
    type t = base class_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun getImageDescription self = (GObjectObjectClass.C.withPtr ---> Utf8.C.fromPtr false) getImageDescription_ self
    fun getImageLocale self = (GObjectObjectClass.C.withPtr ---> Utf8.C.fromPtr false) getImageLocale_ self
    fun setImageDescription self description = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withPtr ---> FFI.Bool.C.fromVal) setImageDescription_ (self & description)
  end
