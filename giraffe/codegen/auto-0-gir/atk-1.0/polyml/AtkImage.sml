structure AtkImage :>
  ATK_IMAGE
    where type 'a class = 'a AtkImageClass.class
    where type coord_type_t = AtkCoordType.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "atk_image_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val getImageDescription_ = call (getSymbol "atk_image_get_image_description") (AtkImageClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getImageLocale_ = call (getSymbol "atk_image_get_image_locale") (AtkImageClass.PolyML.cPtr --> Utf8.PolyML.cOutOptPtr)
      val getImagePosition_ =
        call (getSymbol "atk_image_get_image_position")
          (
            AtkImageClass.PolyML.cPtr
             &&> GInt.PolyML.cRef
             &&> GInt.PolyML.cRef
             &&> AtkCoordType.PolyML.cVal
             --> cVoid
          )
      val getImageSize_ =
        call (getSymbol "atk_image_get_image_size")
          (
            AtkImageClass.PolyML.cPtr
             &&> GInt.PolyML.cRef
             &&> GInt.PolyML.cRef
             --> cVoid
          )
      val setImageDescription_ = call (getSymbol "atk_image_set_image_description") (AtkImageClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GBool.PolyML.cVal)
    end
    type 'a class = 'a AtkImageClass.class
    type coord_type_t = AtkCoordType.t
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun getImageDescription self = (AtkImageClass.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getImageDescription_ self
    fun getImageLocale self = (AtkImageClass.FFI.withPtr false ---> Utf8.FFI.fromOptPtr 0) getImageLocale_ self
    fun getImagePosition self coordType =
      let
        val x
         & y
         & () =
          (
            AtkImageClass.FFI.withPtr false
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
            AtkImageClass.FFI.withPtr false
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
    fun setImageDescription self description = (AtkImageClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> GBool.FFI.fromVal) setImageDescription_ (self & description)
  end
