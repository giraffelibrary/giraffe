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
             &&> GInt32.PolyML.cRef
             &&> GInt32.PolyML.cRef
             &&> AtkCoordType.PolyML.cVal
             --> cVoid
          )
      val getImageSize_ =
        call (getSymbol "atk_image_get_image_size")
          (
            AtkImageClass.PolyML.cPtr
             &&> GInt32.PolyML.cRef
             &&> GInt32.PolyML.cRef
             --> cVoid
          )
      val setImageDescription_ = call (getSymbol "atk_image_set_image_description") (AtkImageClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GBool.PolyML.cVal)
    end
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
             &&&> GInt32.FFI.withRefVal
             &&&> GInt32.FFI.withRefVal
             &&&> AtkCoordType.FFI.withVal
             ---> GInt32.FFI.fromVal
                   && GInt32.FFI.fromVal
                   && I
          )
            getImagePosition_
            (
              self
               & GInt32.null
               & GInt32.null
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
             &&&> GInt32.FFI.withRefVal
             &&&> GInt32.FFI.withRefVal
             ---> GInt32.FFI.fromVal
                   && GInt32.FFI.fromVal
                   && I
          )
            getImageSize_
            (
              self
               & GInt32.null
               & GInt32.null
            )
      in
        (width, height)
      end
    fun setImageDescription self description = (AtkImageClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> GBool.FFI.fromVal) setImageDescription_ (self & description)
  end
