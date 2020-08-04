structure GdkVisual :>
  GDK_VISUAL
    where type 'a class = 'a GdkVisualClass.class
    where type byte_order_t = GdkByteOrder.t
    where type 'a screen_class = 'a GdkScreenClass.class
    where type visual_type_t = GdkVisualType.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gdk_visual_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val getBest_ = call (getSymbol "gdk_visual_get_best") (cVoid --> GdkVisualClass.PolyML.cPtr)
      val getBestDepth_ = call (getSymbol "gdk_visual_get_best_depth") (cVoid --> GInt32.PolyML.cVal)
      val getBestType_ = call (getSymbol "gdk_visual_get_best_type") (cVoid --> GdkVisualType.PolyML.cVal)
      val getBestWithBoth_ = call (getSymbol "gdk_visual_get_best_with_both") (GInt32.PolyML.cVal &&> GdkVisualType.PolyML.cVal --> GdkVisualClass.PolyML.cOptPtr)
      val getBestWithDepth_ = call (getSymbol "gdk_visual_get_best_with_depth") (GInt32.PolyML.cVal --> GdkVisualClass.PolyML.cPtr)
      val getBestWithType_ = call (getSymbol "gdk_visual_get_best_with_type") (GdkVisualType.PolyML.cVal --> GdkVisualClass.PolyML.cPtr)
      val getSystem_ = call (getSymbol "gdk_visual_get_system") (cVoid --> GdkVisualClass.PolyML.cPtr)
      val getBitsPerRgb_ = call (getSymbol "gdk_visual_get_bits_per_rgb") (GdkVisualClass.PolyML.cPtr --> GInt32.PolyML.cVal)
      val getBluePixelDetails_ =
        call (getSymbol "gdk_visual_get_blue_pixel_details")
          (
            GdkVisualClass.PolyML.cPtr
             &&> GUInt32.PolyML.cRef
             &&> GInt32.PolyML.cRef
             &&> GInt32.PolyML.cRef
             --> cVoid
          )
      val getByteOrder_ = call (getSymbol "gdk_visual_get_byte_order") (GdkVisualClass.PolyML.cPtr --> GdkByteOrder.PolyML.cVal)
      val getColormapSize_ = call (getSymbol "gdk_visual_get_colormap_size") (GdkVisualClass.PolyML.cPtr --> GInt32.PolyML.cVal)
      val getDepth_ = call (getSymbol "gdk_visual_get_depth") (GdkVisualClass.PolyML.cPtr --> GInt32.PolyML.cVal)
      val getGreenPixelDetails_ =
        call (getSymbol "gdk_visual_get_green_pixel_details")
          (
            GdkVisualClass.PolyML.cPtr
             &&> GUInt32.PolyML.cRef
             &&> GInt32.PolyML.cRef
             &&> GInt32.PolyML.cRef
             --> cVoid
          )
      val getRedPixelDetails_ =
        call (getSymbol "gdk_visual_get_red_pixel_details")
          (
            GdkVisualClass.PolyML.cPtr
             &&> GUInt32.PolyML.cRef
             &&> GInt32.PolyML.cRef
             &&> GInt32.PolyML.cRef
             --> cVoid
          )
      val getScreen_ = call (getSymbol "gdk_visual_get_screen") (GdkVisualClass.PolyML.cPtr --> GdkScreenClass.PolyML.cPtr)
      val getVisualType_ = call (getSymbol "gdk_visual_get_visual_type") (GdkVisualClass.PolyML.cPtr --> GdkVisualType.PolyML.cVal)
    end
    type 'a class = 'a GdkVisualClass.class
    type byte_order_t = GdkByteOrder.t
    type 'a screen_class = 'a GdkScreenClass.class
    type visual_type_t = GdkVisualType.t
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun getBest () = (I ---> GdkVisualClass.FFI.fromPtr false) getBest_ ()
    fun getBestDepth () = (I ---> GInt32.FFI.fromVal) getBestDepth_ ()
    fun getBestType () = (I ---> GdkVisualType.FFI.fromVal) getBestType_ ()
    fun getBestWithBoth (depth, visualType) = (GInt32.FFI.withVal &&&> GdkVisualType.FFI.withVal ---> GdkVisualClass.FFI.fromOptPtr false) getBestWithBoth_ (depth & visualType)
    fun getBestWithDepth depth = (GInt32.FFI.withVal ---> GdkVisualClass.FFI.fromPtr false) getBestWithDepth_ depth
    fun getBestWithType visualType = (GdkVisualType.FFI.withVal ---> GdkVisualClass.FFI.fromPtr false) getBestWithType_ visualType
    fun getSystem () = (I ---> GdkVisualClass.FFI.fromPtr false) getSystem_ ()
    fun getBitsPerRgb self = (GdkVisualClass.FFI.withPtr false ---> GInt32.FFI.fromVal) getBitsPerRgb_ self
    fun getBluePixelDetails self =
      let
        val mask
         & shift
         & precision
         & () =
          (
            GdkVisualClass.FFI.withPtr false
             &&&> GUInt32.FFI.withRefVal
             &&&> GInt32.FFI.withRefVal
             &&&> GInt32.FFI.withRefVal
             ---> GUInt32.FFI.fromVal
                   && GInt32.FFI.fromVal
                   && GInt32.FFI.fromVal
                   && I
          )
            getBluePixelDetails_
            (
              self
               & GUInt32.null
               & GInt32.null
               & GInt32.null
            )
      in
        (
          mask,
          shift,
          precision
        )
      end
    fun getByteOrder self = (GdkVisualClass.FFI.withPtr false ---> GdkByteOrder.FFI.fromVal) getByteOrder_ self
    fun getColormapSize self = (GdkVisualClass.FFI.withPtr false ---> GInt32.FFI.fromVal) getColormapSize_ self
    fun getDepth self = (GdkVisualClass.FFI.withPtr false ---> GInt32.FFI.fromVal) getDepth_ self
    fun getGreenPixelDetails self =
      let
        val mask
         & shift
         & precision
         & () =
          (
            GdkVisualClass.FFI.withPtr false
             &&&> GUInt32.FFI.withRefVal
             &&&> GInt32.FFI.withRefVal
             &&&> GInt32.FFI.withRefVal
             ---> GUInt32.FFI.fromVal
                   && GInt32.FFI.fromVal
                   && GInt32.FFI.fromVal
                   && I
          )
            getGreenPixelDetails_
            (
              self
               & GUInt32.null
               & GInt32.null
               & GInt32.null
            )
      in
        (
          mask,
          shift,
          precision
        )
      end
    fun getRedPixelDetails self =
      let
        val mask
         & shift
         & precision
         & () =
          (
            GdkVisualClass.FFI.withPtr false
             &&&> GUInt32.FFI.withRefVal
             &&&> GInt32.FFI.withRefVal
             &&&> GInt32.FFI.withRefVal
             ---> GUInt32.FFI.fromVal
                   && GInt32.FFI.fromVal
                   && GInt32.FFI.fromVal
                   && I
          )
            getRedPixelDetails_
            (
              self
               & GUInt32.null
               & GInt32.null
               & GInt32.null
            )
      in
        (
          mask,
          shift,
          precision
        )
      end
    fun getScreen self = (GdkVisualClass.FFI.withPtr false ---> GdkScreenClass.FFI.fromPtr false) getScreen_ self
    fun getVisualType self = (GdkVisualClass.FFI.withPtr false ---> GdkVisualType.FFI.fromVal) getVisualType_ self
  end
