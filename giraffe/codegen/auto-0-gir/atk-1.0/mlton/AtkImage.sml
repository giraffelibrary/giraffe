structure AtkImage :>
  ATK_IMAGE
    where type 'a class = 'a AtkImageClass.class
    where type coord_type_t = AtkCoordType.t =
  struct
    val getType_ = _import "atk_image_get_type" : unit -> GObjectType.FFI.val_;
    val getImageDescription_ = _import "atk_image_get_image_description" : AtkImageClass.FFI.non_opt AtkImageClass.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val getImageLocale_ = _import "atk_image_get_image_locale" : AtkImageClass.FFI.non_opt AtkImageClass.FFI.p -> Utf8.FFI.opt Utf8.FFI.out_p;
    val getImagePosition_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "atk_image_get_image_position" :
              AtkImageClass.FFI.non_opt AtkImageClass.FFI.p
               * GInt.FFI.ref_
               * GInt.FFI.ref_
               * AtkCoordType.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val getImageSize_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "atk_image_get_image_size" :
              AtkImageClass.FFI.non_opt AtkImageClass.FFI.p
               * GInt.FFI.ref_
               * GInt.FFI.ref_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setImageDescription_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_atk_image_set_image_description" :
              AtkImageClass.FFI.non_opt AtkImageClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    type 'a class = 'a AtkImageClass.class
    type coord_type_t = AtkCoordType.t
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun getImageDescription self = (AtkImageClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getImageDescription_ self
    fun getImageLocale self = (AtkImageClass.FFI.withPtr ---> Utf8.FFI.fromOptPtr 0) getImageLocale_ self
    fun getImagePosition self coordType =
      let
        val x
         & y
         & () =
          (
            AtkImageClass.FFI.withPtr
             &&&> GInt.FFI.withRefVal
             &&&> GInt.FFI.withRefVal
             &&&> AtkCoordType.FFI.withVal
             ---> GInt.FFI.fromVal
                   && GInt.FFI.fromVal
                   && I
          )
            getImagePosition_
            (
              self
               & GInt.null
               & GInt.null
               & coordType
            )
      in
        (x, y)
      end
    fun getImageSize self =
      let
        val width
         & height
         & () =
          (
            AtkImageClass.FFI.withPtr
             &&&> GInt.FFI.withRefVal
             &&&> GInt.FFI.withRefVal
             ---> GInt.FFI.fromVal
                   && GInt.FFI.fromVal
                   && I
          )
            getImageSize_
            (
              self
               & GInt.null
               & GInt.null
            )
      in
        (width, height)
      end
    fun setImageDescription self description = (AtkImageClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> GBool.FFI.fromVal) setImageDescription_ (self & description)
  end
