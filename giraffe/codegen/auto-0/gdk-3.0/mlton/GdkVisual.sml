structure GdkVisual :>
  GDK_VISUAL
    where type 'a class_t = 'a GdkVisualClass.t
    where type byteorder_t = GdkByteOrder.t
    where type 'a screenclass_t = 'a GdkScreenClass.t
    where type visualtype_t = GdkVisualType.t =
  struct
    val getType_ = _import "gdk_visual_get_type" : unit -> GObjectType.C.val_;
    val getBest_ = _import "gdk_visual_get_best" : unit -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val getBestDepth_ = _import "gdk_visual_get_best_depth" : unit -> FFI.Int32.val_;
    val getBestType_ = _import "gdk_visual_get_best_type" : unit -> GdkVisualType.C.val_;
    val getBestWithBoth_ = fn x1 & x2 => (_import "gdk_visual_get_best_with_both" : FFI.Int32.val_ * GdkVisualType.C.val_ -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;) (x1, x2)
    val getBestWithDepth_ = _import "gdk_visual_get_best_with_depth" : FFI.Int32.val_ -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val getBestWithType_ = _import "gdk_visual_get_best_with_type" : GdkVisualType.C.val_ -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val getSystem_ = _import "gdk_visual_get_system" : unit -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val getBitsPerRgb_ = _import "gdk_visual_get_bits_per_rgb" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Int32.val_;
    val getBluePixelDetails_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "gdk_visual_get_blue_pixel_details" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.UInt32.ref_
               * FFI.Int32.ref_
               * FFI.Int32.ref_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val getByteOrder_ = _import "gdk_visual_get_byte_order" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GdkByteOrder.C.val_;
    val getColormapSize_ = _import "gdk_visual_get_colormap_size" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Int32.val_;
    val getDepth_ = _import "gdk_visual_get_depth" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Int32.val_;
    val getGreenPixelDetails_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "gdk_visual_get_green_pixel_details" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.UInt32.ref_
               * FFI.Int32.ref_
               * FFI.Int32.ref_
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.UInt32.ref_
               * FFI.Int32.ref_
               * FFI.Int32.ref_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val getScreen_ = _import "gdk_visual_get_screen" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val getVisualType_ = _import "gdk_visual_get_visual_type" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GdkVisualType.C.val_;
    type 'a class_t = 'a GdkVisualClass.t
    type byteorder_t = GdkByteOrder.t
    type 'a screenclass_t = 'a GdkScreenClass.t
    type visualtype_t = GdkVisualType.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun getBest () = (I ---> GdkVisualClass.C.fromPtr false) getBest_ ()
    fun getBestDepth () = (I ---> FFI.Int32.fromVal) getBestDepth_ ()
    fun getBestType () = (I ---> GdkVisualType.C.fromVal) getBestType_ ()
    fun getBestWithBoth depth visualType = (FFI.Int32.withVal &&&> GdkVisualType.C.withVal ---> GdkVisualClass.C.fromPtr false) getBestWithBoth_ (depth & visualType)
    fun getBestWithDepth depth = (FFI.Int32.withVal ---> GdkVisualClass.C.fromPtr false) getBestWithDepth_ depth
    fun getBestWithType visualType = (GdkVisualType.C.withVal ---> GdkVisualClass.C.fromPtr false) getBestWithType_ visualType
    fun getSystem () = (I ---> GdkVisualClass.C.fromPtr false) getSystem_ ()
    fun getBitsPerRgb self = (GObjectObjectClass.C.withPtr ---> FFI.Int32.fromVal) getBitsPerRgb_ self
    fun getBluePixelDetails self =
      let
        val mask
         & shift
         & precision
         & () =
          (
            GObjectObjectClass.C.withPtr
             &&&> FFI.UInt32.withRefVal
             &&&> FFI.Int32.withRefVal
             &&&> FFI.Int32.withRefVal
             ---> FFI.UInt32.fromVal
                   && FFI.Int32.fromVal
                   && FFI.Int32.fromVal
                   && I
          )
            getBluePixelDetails_
            (
              self
               & 0
               & 0
               & 0
            )
      in
        (
          mask,
          shift,
          precision
        )
      end
    fun getByteOrder self = (GObjectObjectClass.C.withPtr ---> GdkByteOrder.C.fromVal) getByteOrder_ self
    fun getColormapSize self = (GObjectObjectClass.C.withPtr ---> FFI.Int32.fromVal) getColormapSize_ self
    fun getDepth self = (GObjectObjectClass.C.withPtr ---> FFI.Int32.fromVal) getDepth_ self
    fun getGreenPixelDetails self =
      let
        val mask
         & shift
         & precision
         & () =
          (
            GObjectObjectClass.C.withPtr
             &&&> FFI.UInt32.withRefVal
             &&&> FFI.Int32.withRefVal
             &&&> FFI.Int32.withRefVal
             ---> FFI.UInt32.fromVal
                   && FFI.Int32.fromVal
                   && FFI.Int32.fromVal
                   && I
          )
            getGreenPixelDetails_
            (
              self
               & 0
               & 0
               & 0
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
            GObjectObjectClass.C.withPtr
             &&&> FFI.UInt32.withRefVal
             &&&> FFI.Int32.withRefVal
             &&&> FFI.Int32.withRefVal
             ---> FFI.UInt32.fromVal
                   && FFI.Int32.fromVal
                   && FFI.Int32.fromVal
                   && I
          )
            getRedPixelDetails_
            (
              self
               & 0
               & 0
               & 0
            )
      in
        (
          mask,
          shift,
          precision
        )
      end
    fun getScreen self = (GObjectObjectClass.C.withPtr ---> GdkScreenClass.C.fromPtr false) getScreen_ self
    fun getVisualType self = (GObjectObjectClass.C.withPtr ---> GdkVisualType.C.fromVal) getVisualType_ self
  end
