structure AtkImage :>
  ATK_IMAGE
    where type 'a class = 'a AtkImageClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "atk_image_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val getImageDescription_ = call (getSymbol "atk_image_get_image_description") (AtkImageClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getImageLocale_ = call (getSymbol "atk_image_get_image_locale") (AtkImageClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val setImageDescription_ = call (getSymbol "atk_image_set_image_description") (AtkImageClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GBool.PolyML.cVal)
    end
    type 'a class = 'a AtkImageClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun getImageDescription self = (AtkImageClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getImageDescription_ self
    fun getImageLocale self = (AtkImageClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getImageLocale_ self
    fun setImageDescription self description = (AtkImageClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> GBool.FFI.fromVal) setImageDescription_ (self & description)
  end
