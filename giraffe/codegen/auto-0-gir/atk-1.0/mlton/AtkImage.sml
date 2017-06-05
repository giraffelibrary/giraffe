structure AtkImage :>
  ATK_IMAGE
    where type 'a class = 'a AtkImageClass.class =
  struct
    val getType_ = _import "atk_image_get_type" : unit -> GObjectType.FFI.val_;
    val getImageDescription_ = _import "atk_image_get_image_description" : AtkImageClass.FFI.notnull AtkImageClass.FFI.p -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val getImageLocale_ = _import "atk_image_get_image_locale" : AtkImageClass.FFI.notnull AtkImageClass.FFI.p -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val setImageDescription_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_atk_image_set_image_description" :
              AtkImageClass.FFI.notnull AtkImageClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    type 'a class = 'a AtkImageClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun getImageDescription self = (AtkImageClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getImageDescription_ self
    fun getImageLocale self = (AtkImageClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getImageLocale_ self
    fun setImageDescription self description = (AtkImageClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> GBool.FFI.fromVal) setImageDescription_ (self & description)
  end
