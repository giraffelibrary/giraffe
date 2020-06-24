structure GdkVisual :>
  GDK_VISUAL
    where type 'a class = 'a GdkVisualClass.class
    where type byte_order_t = GdkByteOrder.t
    where type 'a screen_class = 'a GdkScreenClass.class
    where type visual_type_t = GdkVisualType.t =
  struct
    val getType_ = _import "gdk_visual_get_type" : unit -> GObjectType.FFI.val_;
    val getBest_ = _import "gdk_visual_get_best" : unit -> GdkVisualClass.FFI.non_opt GdkVisualClass.FFI.p;
    val getBestDepth_ = _import "gdk_visual_get_best_depth" : unit -> GInt.FFI.val_;
    val getBestType_ = _import "gdk_visual_get_best_type" : unit -> GdkVisualType.FFI.val_;
    val getBestWithBoth_ = fn x1 & x2 => (_import "gdk_visual_get_best_with_both" : GInt.FFI.val_ * GdkVisualType.FFI.val_ -> GdkVisualClass.FFI.opt GdkVisualClass.FFI.p;) (x1, x2)
    val getBestWithDepth_ = _import "gdk_visual_get_best_with_depth" : GInt.FFI.val_ -> GdkVisualClass.FFI.non_opt GdkVisualClass.FFI.p;
    val getBestWithType_ = _import "gdk_visual_get_best_with_type" : GdkVisualType.FFI.val_ -> GdkVisualClass.FFI.non_opt GdkVisualClass.FFI.p;
    val getSystem_ = _import "gdk_visual_get_system" : unit -> GdkVisualClass.FFI.non_opt GdkVisualClass.FFI.p;
    val getBitsPerRgb_ = _import "gdk_visual_get_bits_per_rgb" : GdkVisualClass.FFI.non_opt GdkVisualClass.FFI.p -> GInt.FFI.val_;
    val getBluePixelDetails_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "gdk_visual_get_blue_pixel_details" :
              GdkVisualClass.FFI.non_opt GdkVisualClass.FFI.p
               * GUInt32.FFI.ref_
               * GInt.FFI.ref_
               * GInt.FFI.ref_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val getByteOrder_ = _import "gdk_visual_get_byte_order" : GdkVisualClass.FFI.non_opt GdkVisualClass.FFI.p -> GdkByteOrder.FFI.val_;
    val getColormapSize_ = _import "gdk_visual_get_colormap_size" : GdkVisualClass.FFI.non_opt GdkVisualClass.FFI.p -> GInt.FFI.val_;
    val getDepth_ = _import "gdk_visual_get_depth" : GdkVisualClass.FFI.non_opt GdkVisualClass.FFI.p -> GInt.FFI.val_;
    val getGreenPixelDetails_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "gdk_visual_get_green_pixel_details" :
              GdkVisualClass.FFI.non_opt GdkVisualClass.FFI.p
               * GUInt32.FFI.ref_
               * GInt.FFI.ref_
               * GInt.FFI.ref_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val getRedPixelDetails_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "gdk_visual_get_red_pixel_details" :
              GdkVisualClass.FFI.non_opt GdkVisualClass.FFI.p
               * GUInt32.FFI.ref_
               * GInt.FFI.ref_
               * GInt.FFI.ref_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val getScreen_ = _import "gdk_visual_get_screen" : GdkVisualClass.FFI.non_opt GdkVisualClass.FFI.p -> GdkScreenClass.FFI.non_opt GdkScreenClass.FFI.p;
    val getVisualType_ = _import "gdk_visual_get_visual_type" : GdkVisualClass.FFI.non_opt GdkVisualClass.FFI.p -> GdkVisualType.FFI.val_;
    type 'a class = 'a GdkVisualClass.class
    type byte_order_t = GdkByteOrder.t
    type 'a screen_class = 'a GdkScreenClass.class
    type visual_type_t = GdkVisualType.t
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun getBest () = (I ---> GdkVisualClass.FFI.fromPtr false) getBest_ ()
    fun getBestDepth () = (I ---> GInt.FFI.fromVal) getBestDepth_ ()
    fun getBestType () = (I ---> GdkVisualType.FFI.fromVal) getBestType_ ()
    fun getBestWithBoth (depth, visualType) = (GInt.FFI.withVal &&&> GdkVisualType.FFI.withVal ---> GdkVisualClass.FFI.fromOptPtr false) getBestWithBoth_ (depth & visualType)
    fun getBestWithDepth depth = (GInt.FFI.withVal ---> GdkVisualClass.FFI.fromPtr false) getBestWithDepth_ depth
    fun getBestWithType visualType = (GdkVisualType.FFI.withVal ---> GdkVisualClass.FFI.fromPtr false) getBestWithType_ visualType
    fun getSystem () = (I ---> GdkVisualClass.FFI.fromPtr false) getSystem_ ()
    fun getBitsPerRgb self = (GdkVisualClass.FFI.withPtr ---> GInt.FFI.fromVal) getBitsPerRgb_ self
    fun getBluePixelDetails self =
      let
        val mask
         & shift
         & precision
         & () =
          (
            GdkVisualClass.FFI.withPtr
             &&&> GUInt32.FFI.withRefVal
             &&&> GInt.FFI.withRefVal
             &&&> GInt.FFI.withRefVal
             ---> GUInt32.FFI.fromVal
                   && GInt.FFI.fromVal
                   && GInt.FFI.fromVal
                   && I
          )
            getBluePixelDetails_
            (
              self
               & GUInt32.null
               & GInt.null
               & GInt.null
            )
      in
        (
          mask,
          shift,
          precision
        )
      end
    fun getByteOrder self = (GdkVisualClass.FFI.withPtr ---> GdkByteOrder.FFI.fromVal) getByteOrder_ self
    fun getColormapSize self = (GdkVisualClass.FFI.withPtr ---> GInt.FFI.fromVal) getColormapSize_ self
    fun getDepth self = (GdkVisualClass.FFI.withPtr ---> GInt.FFI.fromVal) getDepth_ self
    fun getGreenPixelDetails self =
      let
        val mask
         & shift
         & precision
         & () =
          (
            GdkVisualClass.FFI.withPtr
             &&&> GUInt32.FFI.withRefVal
             &&&> GInt.FFI.withRefVal
             &&&> GInt.FFI.withRefVal
             ---> GUInt32.FFI.fromVal
                   && GInt.FFI.fromVal
                   && GInt.FFI.fromVal
                   && I
          )
            getGreenPixelDetails_
            (
              self
               & GUInt32.null
               & GInt.null
               & GInt.null
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
            GdkVisualClass.FFI.withPtr
             &&&> GUInt32.FFI.withRefVal
             &&&> GInt.FFI.withRefVal
             &&&> GInt.FFI.withRefVal
             ---> GUInt32.FFI.fromVal
                   && GInt.FFI.fromVal
                   && GInt.FFI.fromVal
                   && I
          )
            getRedPixelDetails_
            (
              self
               & GUInt32.null
               & GInt.null
               & GInt.null
            )
      in
        (
          mask,
          shift,
          precision
        )
      end
    fun getScreen self = (GdkVisualClass.FFI.withPtr ---> GdkScreenClass.FFI.fromPtr false) getScreen_ self
    fun getVisualType self = (GdkVisualClass.FFI.withPtr ---> GdkVisualType.FFI.fromVal) getVisualType_ self
  end
