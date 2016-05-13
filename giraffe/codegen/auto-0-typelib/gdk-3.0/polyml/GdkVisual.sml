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
      val getType_ = call (load_sym libgdk "gdk_visual_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val getBest_ = call (load_sym libgdk "gdk_visual_get_best") (PolyMLFFI.cVoid --> GdkVisualClass.PolyML.cPtr)
      val getBestDepth_ = call (load_sym libgdk "gdk_visual_get_best_depth") (PolyMLFFI.cVoid --> FFI.Int32.PolyML.cVal)
      val getBestType_ = call (load_sym libgdk "gdk_visual_get_best_type") (PolyMLFFI.cVoid --> GdkVisualType.PolyML.cVal)
      val getBestWithBoth_ = call (load_sym libgdk "gdk_visual_get_best_with_both") (FFI.Int32.PolyML.cVal &&> GdkVisualType.PolyML.cVal --> GdkVisualClass.PolyML.cPtr)
      val getBestWithDepth_ = call (load_sym libgdk "gdk_visual_get_best_with_depth") (FFI.Int32.PolyML.cVal --> GdkVisualClass.PolyML.cPtr)
      val getBestWithType_ = call (load_sym libgdk "gdk_visual_get_best_with_type") (GdkVisualType.PolyML.cVal --> GdkVisualClass.PolyML.cPtr)
      val getSystem_ = call (load_sym libgdk "gdk_visual_get_system") (PolyMLFFI.cVoid --> GdkVisualClass.PolyML.cPtr)
      val getBitsPerRgb_ = call (load_sym libgdk "gdk_visual_get_bits_per_rgb") (GdkVisualClass.PolyML.cPtr --> FFI.Int32.PolyML.cVal)
      val getBluePixelDetails_ =
        call (load_sym libgdk "gdk_visual_get_blue_pixel_details")
          (
            GdkVisualClass.PolyML.cPtr
             &&> FFI.UInt32.PolyML.cRef
             &&> FFI.Int32.PolyML.cRef
             &&> FFI.Int32.PolyML.cRef
             --> PolyMLFFI.cVoid
          )
      val getByteOrder_ = call (load_sym libgdk "gdk_visual_get_byte_order") (GdkVisualClass.PolyML.cPtr --> GdkByteOrder.PolyML.cVal)
      val getColormapSize_ = call (load_sym libgdk "gdk_visual_get_colormap_size") (GdkVisualClass.PolyML.cPtr --> FFI.Int32.PolyML.cVal)
      val getDepth_ = call (load_sym libgdk "gdk_visual_get_depth") (GdkVisualClass.PolyML.cPtr --> FFI.Int32.PolyML.cVal)
      val getGreenPixelDetails_ =
        call (load_sym libgdk "gdk_visual_get_green_pixel_details")
          (
            GdkVisualClass.PolyML.cPtr
             &&> FFI.UInt32.PolyML.cRef
             &&> FFI.Int32.PolyML.cRef
             &&> FFI.Int32.PolyML.cRef
             --> PolyMLFFI.cVoid
          )
      val getRedPixelDetails_ =
        call (load_sym libgdk "gdk_visual_get_red_pixel_details")
          (
            GdkVisualClass.PolyML.cPtr
             &&> FFI.UInt32.PolyML.cRef
             &&> FFI.Int32.PolyML.cRef
             &&> FFI.Int32.PolyML.cRef
             --> PolyMLFFI.cVoid
          )
      val getScreen_ = call (load_sym libgdk "gdk_visual_get_screen") (GdkVisualClass.PolyML.cPtr --> GdkScreenClass.PolyML.cPtr)
      val getVisualType_ = call (load_sym libgdk "gdk_visual_get_visual_type") (GdkVisualClass.PolyML.cPtr --> GdkVisualType.PolyML.cVal)
    end
    type 'a class = 'a GdkVisualClass.class
    type byte_order_t = GdkByteOrder.t
    type 'a screen_class = 'a GdkScreenClass.class
    type visual_type_t = GdkVisualType.t
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun getBest () = (I ---> GdkVisualClass.C.fromPtr false) getBest_ ()
    fun getBestDepth () = (I ---> FFI.Int32.C.fromVal) getBestDepth_ ()
    fun getBestType () = (I ---> GdkVisualType.C.fromVal) getBestType_ ()
    fun getBestWithBoth depth visualType = (FFI.Int32.C.withVal &&&> GdkVisualType.C.withVal ---> GdkVisualClass.C.fromPtr false) getBestWithBoth_ (depth & visualType)
    fun getBestWithDepth depth = (FFI.Int32.C.withVal ---> GdkVisualClass.C.fromPtr false) getBestWithDepth_ depth
    fun getBestWithType visualType = (GdkVisualType.C.withVal ---> GdkVisualClass.C.fromPtr false) getBestWithType_ visualType
    fun getSystem () = (I ---> GdkVisualClass.C.fromPtr false) getSystem_ ()
    fun getBitsPerRgb self = (GdkVisualClass.C.withPtr ---> FFI.Int32.C.fromVal) getBitsPerRgb_ self
    fun getBluePixelDetails self =
      let
        val mask
         & shift
         & precision
         & () =
          (
            GdkVisualClass.C.withPtr
             &&&> FFI.UInt32.C.withRefVal
             &&&> FFI.Int32.C.withRefVal
             &&&> FFI.Int32.C.withRefVal
             ---> FFI.UInt32.C.fromVal
                   && FFI.Int32.C.fromVal
                   && FFI.Int32.C.fromVal
                   && I
          )
            getBluePixelDetails_
            (
              self
               & FFI.UInt32.null
               & FFI.Int32.null
               & FFI.Int32.null
            )
      in
        (
          mask,
          shift,
          precision
        )
      end
    fun getByteOrder self = (GdkVisualClass.C.withPtr ---> GdkByteOrder.C.fromVal) getByteOrder_ self
    fun getColormapSize self = (GdkVisualClass.C.withPtr ---> FFI.Int32.C.fromVal) getColormapSize_ self
    fun getDepth self = (GdkVisualClass.C.withPtr ---> FFI.Int32.C.fromVal) getDepth_ self
    fun getGreenPixelDetails self =
      let
        val mask
         & shift
         & precision
         & () =
          (
            GdkVisualClass.C.withPtr
             &&&> FFI.UInt32.C.withRefVal
             &&&> FFI.Int32.C.withRefVal
             &&&> FFI.Int32.C.withRefVal
             ---> FFI.UInt32.C.fromVal
                   && FFI.Int32.C.fromVal
                   && FFI.Int32.C.fromVal
                   && I
          )
            getGreenPixelDetails_
            (
              self
               & FFI.UInt32.null
               & FFI.Int32.null
               & FFI.Int32.null
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
            GdkVisualClass.C.withPtr
             &&&> FFI.UInt32.C.withRefVal
             &&&> FFI.Int32.C.withRefVal
             &&&> FFI.Int32.C.withRefVal
             ---> FFI.UInt32.C.fromVal
                   && FFI.Int32.C.fromVal
                   && FFI.Int32.C.fromVal
                   && I
          )
            getRedPixelDetails_
            (
              self
               & FFI.UInt32.null
               & FFI.Int32.null
               & FFI.Int32.null
            )
      in
        (
          mask,
          shift,
          precision
        )
      end
    fun getScreen self = (GdkVisualClass.C.withPtr ---> GdkScreenClass.C.fromPtr false) getScreen_ self
    fun getVisualType self = (GdkVisualClass.C.withPtr ---> GdkVisualType.C.fromVal) getVisualType_ self
  end
