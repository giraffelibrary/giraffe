structure AtkImage :>
  ATK_IMAGE
    where type 'a class = 'a AtkImageClass.class =
  struct
    val getType_ = _import "atk_image_get_type" : unit -> GObjectType.C.val_;
    val getImageDescription_ = _import "atk_image_get_image_description" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> Utf8.C.notnull Utf8.C.out_p;
    val getImageLocale_ = _import "atk_image_get_image_locale" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> Utf8.C.notnull Utf8.C.out_p;
    val setImageDescription_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_atk_image_set_image_description" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3
            )
    type 'a class = 'a AtkImageClass.class
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun getImageDescription self = (GObjectObjectClass.C.withPtr ---> Utf8.C.fromPtr false) getImageDescription_ self
    fun getImageLocale self = (GObjectObjectClass.C.withPtr ---> Utf8.C.fromPtr false) getImageLocale_ self
    fun setImageDescription self description = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withPtr ---> FFI.Bool.C.fromVal) setImageDescription_ (self & description)
  end
