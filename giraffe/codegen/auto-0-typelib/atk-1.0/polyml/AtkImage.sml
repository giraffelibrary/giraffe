structure AtkImage :>
  ATK_IMAGE
    where type 'a class = 'a AtkImageClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libatk "atk_image_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val getImageDescription_ = call (load_sym libatk "atk_image_get_image_description") (AtkImageClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getImageLocale_ = call (load_sym libatk "atk_image_get_image_locale") (AtkImageClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val setImageDescription_ = call (load_sym libatk "atk_image_set_image_description") (AtkImageClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> FFI.Bool.PolyML.cVal)
    end
    type 'a class = 'a AtkImageClass.class
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun getImageDescription self = (AtkImageClass.C.withPtr ---> Utf8.C.fromPtr false) getImageDescription_ self
    fun getImageLocale self = (AtkImageClass.C.withPtr ---> Utf8.C.fromPtr false) getImageLocale_ self
    fun setImageDescription self description = (AtkImageClass.C.withPtr &&&> Utf8.C.withPtr ---> FFI.Bool.C.fromVal) setImageDescription_ (self & description)
  end
