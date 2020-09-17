structure GtkImage :>
  GTK_IMAGE
    where type 'a class = 'a GtkImageClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type icon_set_t = GtkIconSetRecord.t
    where type image_type_t = GtkImageType.t =
  struct
    val getType_ = _import "gtk_image_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "gtk_image_new" : unit -> GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p;
    val newFromAnimation_ = _import "gtk_image_new_from_animation" : GdkPixbufPixbufAnimationClass.FFI.non_opt GdkPixbufPixbufAnimationClass.FFI.p -> GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p;
    val newFromFile_ = _import "mlton_gtk_image_new_from_file" : Utf8.MLton.p1 * Utf8.FFI.non_opt Utf8.MLton.p2 -> GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p;
    val newFromGicon_ = fn x1 & x2 => (_import "gtk_image_new_from_gicon" : GioIconClass.FFI.non_opt GioIconClass.FFI.p * GInt.FFI.val_ -> GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p;) (x1, x2)
    val newFromIconName_ =
      fn
        (x1, x2) & x3 =>
          (
            _import "mlton_gtk_image_new_from_icon_name" :
              Utf8.MLton.p1
               * Utf8.FFI.opt Utf8.MLton.p2
               * GInt.FFI.val_
               -> GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    val newFromIconSet_ = fn x1 & x2 => (_import "gtk_image_new_from_icon_set" : GtkIconSetRecord.FFI.non_opt GtkIconSetRecord.FFI.p * GInt.FFI.val_ -> GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p;) (x1, x2)
    val newFromPixbuf_ = _import "gtk_image_new_from_pixbuf" : GdkPixbufPixbufClass.FFI.opt GdkPixbufPixbufClass.FFI.p -> GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p;
    val newFromResource_ = _import "mlton_gtk_image_new_from_resource" : Utf8.MLton.p1 * Utf8.FFI.non_opt Utf8.MLton.p2 -> GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p;
    val newFromStock_ =
      fn
        (x1, x2) & x3 =>
          (
            _import "mlton_gtk_image_new_from_stock" :
              Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GInt.FFI.val_
               -> GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    val newFromSurface_ = _import "gtk_image_new_from_surface" : CairoSurfaceRecord.FFI.opt CairoSurfaceRecord.FFI.p -> GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p;
    val clear_ = _import "gtk_image_clear" : GtkImageClass.FFI.non_opt GtkImageClass.FFI.p -> unit;
    val getAnimation_ = _import "gtk_image_get_animation" : GtkImageClass.FFI.non_opt GtkImageClass.FFI.p -> GdkPixbufPixbufAnimationClass.FFI.opt GdkPixbufPixbufAnimationClass.FFI.p;
    val getGicon_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_image_get_gicon" :
              GtkImageClass.FFI.non_opt GtkImageClass.FFI.p
               * (GioIconClass.FFI.opt, GioIconClass.FFI.non_opt) GioIconClass.FFI.r
               * GInt.FFI.ref_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val getIconName_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_gtk_image_get_icon_name" :
              GtkImageClass.FFI.non_opt GtkImageClass.FFI.p
               * Utf8.MLton.r1
               * (Utf8.FFI.opt, Utf8.FFI.non_opt) Utf8.MLton.r2
               * GInt.FFI.ref_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val getIconSet_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_image_get_icon_set" :
              GtkImageClass.FFI.non_opt GtkImageClass.FFI.p
               * (GtkIconSetRecord.FFI.opt, GtkIconSetRecord.FFI.non_opt) GtkIconSetRecord.FFI.r
               * GInt.FFI.ref_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val getPixbuf_ = _import "gtk_image_get_pixbuf" : GtkImageClass.FFI.non_opt GtkImageClass.FFI.p -> GdkPixbufPixbufClass.FFI.opt GdkPixbufPixbufClass.FFI.p;
    val getPixelSize_ = _import "gtk_image_get_pixel_size" : GtkImageClass.FFI.non_opt GtkImageClass.FFI.p -> GInt.FFI.val_;
    val getStock_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_gtk_image_get_stock" :
              GtkImageClass.FFI.non_opt GtkImageClass.FFI.p
               * Utf8.MLton.r1
               * (Utf8.FFI.opt, Utf8.FFI.non_opt) Utf8.MLton.r2
               * GInt.FFI.ref_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val getStorageType_ = _import "gtk_image_get_storage_type" : GtkImageClass.FFI.non_opt GtkImageClass.FFI.p -> GtkImageType.FFI.val_;
    val setFromAnimation_ = fn x1 & x2 => (_import "gtk_image_set_from_animation" : GtkImageClass.FFI.non_opt GtkImageClass.FFI.p * GdkPixbufPixbufAnimationClass.FFI.non_opt GdkPixbufPixbufAnimationClass.FFI.p -> unit;) (x1, x2)
    val setFromFile_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_image_set_from_file" :
              GtkImageClass.FFI.non_opt GtkImageClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.opt Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setFromGicon_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_image_set_from_gicon" :
              GtkImageClass.FFI.non_opt GtkImageClass.FFI.p
               * GioIconClass.FFI.non_opt GioIconClass.FFI.p
               * GInt.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setFromIconName_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_gtk_image_set_from_icon_name" :
              GtkImageClass.FFI.non_opt GtkImageClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.opt Utf8.MLton.p2
               * GInt.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val setFromIconSet_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_image_set_from_icon_set" :
              GtkImageClass.FFI.non_opt GtkImageClass.FFI.p
               * GtkIconSetRecord.FFI.non_opt GtkIconSetRecord.FFI.p
               * GInt.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setFromPixbuf_ = fn x1 & x2 => (_import "gtk_image_set_from_pixbuf" : GtkImageClass.FFI.non_opt GtkImageClass.FFI.p * GdkPixbufPixbufClass.FFI.opt GdkPixbufPixbufClass.FFI.p -> unit;) (x1, x2)
    val setFromResource_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_image_set_from_resource" :
              GtkImageClass.FFI.non_opt GtkImageClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.opt Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setFromStock_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_gtk_image_set_from_stock" :
              GtkImageClass.FFI.non_opt GtkImageClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GInt.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val setFromSurface_ = fn x1 & x2 => (_import "gtk_image_set_from_surface" : GtkImageClass.FFI.non_opt GtkImageClass.FFI.p * CairoSurfaceRecord.FFI.opt CairoSurfaceRecord.FFI.p -> unit;) (x1, x2)
    val setPixelSize_ = fn x1 & x2 => (_import "gtk_image_set_pixel_size" : GtkImageClass.FFI.non_opt GtkImageClass.FFI.p * GInt.FFI.val_ -> unit;) (x1, x2)
    type 'a class = 'a GtkImageClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type icon_set_t = GtkIconSetRecord.t
    type image_type_t = GtkImageType.t
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr false ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr false ---> GtkBuildableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkImageClass.FFI.fromPtr false) new_ ()
    fun newFromAnimation animation = (GdkPixbufPixbufAnimationClass.FFI.withPtr false ---> GtkImageClass.FFI.fromPtr false) newFromAnimation_ animation before GdkPixbufPixbufAnimationClass.FFI.touchPtr animation
    fun newFromFile filename = (Utf8.FFI.withPtr 0 ---> GtkImageClass.FFI.fromPtr false) newFromFile_ filename before Utf8.FFI.touchPtr filename
    fun newFromGicon (icon, size) = (GioIconClass.FFI.withPtr false &&&> GInt.FFI.withVal ---> GtkImageClass.FFI.fromPtr false) newFromGicon_ (icon & size) before GioIconClass.FFI.touchPtr icon
    fun newFromIconName (iconName, size) = (Utf8.FFI.withOptPtr 0 &&&> GInt.FFI.withVal ---> GtkImageClass.FFI.fromPtr false) newFromIconName_ (iconName & size) before Utf8.FFI.touchOptPtr iconName
    fun newFromIconSet (iconSet, size) = (GtkIconSetRecord.FFI.withPtr false &&&> GInt.FFI.withVal ---> GtkImageClass.FFI.fromPtr false) newFromIconSet_ (iconSet & size) before GtkIconSetRecord.FFI.touchPtr iconSet
    fun newFromPixbuf pixbuf = (GdkPixbufPixbufClass.FFI.withOptPtr false ---> GtkImageClass.FFI.fromPtr false) newFromPixbuf_ pixbuf before GdkPixbufPixbufClass.FFI.touchOptPtr pixbuf
    fun newFromResource resourcePath = (Utf8.FFI.withPtr 0 ---> GtkImageClass.FFI.fromPtr false) newFromResource_ resourcePath before Utf8.FFI.touchPtr resourcePath
    fun newFromStock (stockId, size) = (Utf8.FFI.withPtr 0 &&&> GInt.FFI.withVal ---> GtkImageClass.FFI.fromPtr false) newFromStock_ (stockId & size) before Utf8.FFI.touchPtr stockId
    fun newFromSurface surface = (CairoSurfaceRecord.FFI.withOptPtr false ---> GtkImageClass.FFI.fromPtr false) newFromSurface_ surface before CairoSurfaceRecord.FFI.touchOptPtr surface
    fun clear self = (GtkImageClass.FFI.withPtr false ---> I) clear_ self
    fun getAnimation self = (GtkImageClass.FFI.withPtr false ---> GdkPixbufPixbufAnimationClass.FFI.fromOptPtr false) getAnimation_ self before GtkImageClass.FFI.touchPtr self
    fun getGicon self =
      let
        val gicon
         & size
         & () =
          (
            GtkImageClass.FFI.withPtr false
             &&&> GioIconClass.FFI.withRefOptPtr false
             &&&> GInt.FFI.withRefVal
             ---> GioIconClass.FFI.fromPtr false
                   && GInt.FFI.fromVal
                   && I
          )
            getGicon_
            (
              self
               & NONE
               & GInt.null
            )
      in
        (gicon, size) before GtkImageClass.FFI.touchPtr self
      end
    fun getIconName self =
      let
        val iconName
         & size
         & () =
          (
            GtkImageClass.FFI.withPtr false
             &&&> Utf8.FFI.withRefOptPtr 0
             &&&> GInt.FFI.withRefVal
             ---> Utf8.FFI.fromPtr 0
                   && GInt.FFI.fromVal
                   && I
          )
            getIconName_
            (
              self
               & NONE
               & GInt.null
            )
      in
        (iconName, size) before GtkImageClass.FFI.touchPtr self
      end
    fun getIconSet self =
      let
        val iconSet
         & size
         & () =
          (
            GtkImageClass.FFI.withPtr false
             &&&> GtkIconSetRecord.FFI.withRefOptPtr false
             &&&> GInt.FFI.withRefVal
             ---> GtkIconSetRecord.FFI.fromPtr false
                   && GInt.FFI.fromVal
                   && I
          )
            getIconSet_
            (
              self
               & NONE
               & GInt.null
            )
      in
        (iconSet, size) before GtkImageClass.FFI.touchPtr self
      end
    fun getPixbuf self = (GtkImageClass.FFI.withPtr false ---> GdkPixbufPixbufClass.FFI.fromOptPtr false) getPixbuf_ self before GtkImageClass.FFI.touchPtr self
    fun getPixelSize self = (GtkImageClass.FFI.withPtr false ---> GInt.FFI.fromVal) getPixelSize_ self
    fun getStock self =
      let
        val stockId
         & size
         & () =
          (
            GtkImageClass.FFI.withPtr false
             &&&> Utf8.FFI.withRefOptPtr 0
             &&&> GInt.FFI.withRefVal
             ---> Utf8.FFI.fromPtr 0
                   && GInt.FFI.fromVal
                   && I
          )
            getStock_
            (
              self
               & NONE
               & GInt.null
            )
      in
        (stockId, size) before GtkImageClass.FFI.touchPtr self
      end
    fun getStorageType self = (GtkImageClass.FFI.withPtr false ---> GtkImageType.FFI.fromVal) getStorageType_ self
    fun setFromAnimation self animation = (GtkImageClass.FFI.withPtr false &&&> GdkPixbufPixbufAnimationClass.FFI.withPtr false ---> I) setFromAnimation_ (self & animation)
    fun setFromFile self filename = (GtkImageClass.FFI.withPtr false &&&> Utf8.FFI.withOptPtr 0 ---> I) setFromFile_ (self & filename)
    fun setFromGicon self (icon, size) =
      (
        GtkImageClass.FFI.withPtr false
         &&&> GioIconClass.FFI.withPtr false
         &&&> GInt.FFI.withVal
         ---> I
      )
        setFromGicon_
        (
          self
           & icon
           & size
        )
    fun setFromIconName self (iconName, size) =
      (
        GtkImageClass.FFI.withPtr false
         &&&> Utf8.FFI.withOptPtr 0
         &&&> GInt.FFI.withVal
         ---> I
      )
        setFromIconName_
        (
          self
           & iconName
           & size
        )
    fun setFromIconSet self (iconSet, size) =
      (
        GtkImageClass.FFI.withPtr false
         &&&> GtkIconSetRecord.FFI.withPtr false
         &&&> GInt.FFI.withVal
         ---> I
      )
        setFromIconSet_
        (
          self
           & iconSet
           & size
        )
    fun setFromPixbuf self pixbuf = (GtkImageClass.FFI.withPtr false &&&> GdkPixbufPixbufClass.FFI.withOptPtr false ---> I) setFromPixbuf_ (self & pixbuf)
    fun setFromResource self resourcePath = (GtkImageClass.FFI.withPtr false &&&> Utf8.FFI.withOptPtr 0 ---> I) setFromResource_ (self & resourcePath)
    fun setFromStock self (stockId, size) =
      (
        GtkImageClass.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         &&&> GInt.FFI.withVal
         ---> I
      )
        setFromStock_
        (
          self
           & stockId
           & size
        )
    fun setFromSurface self surface = (GtkImageClass.FFI.withPtr false &&&> CairoSurfaceRecord.FFI.withOptPtr false ---> I) setFromSurface_ (self & surface)
    fun setPixelSize self pixelSize = (GtkImageClass.FFI.withPtr false &&&> GInt.FFI.withVal ---> I) setPixelSize_ (self & pixelSize)
    local
      open ValueAccessor
    in
      val fileProp =
        {
          name = "file",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = fn x => C.set stringOpt x,
          init = fn x => C.set stringOpt x
        }
      val giconProp =
        {
          name = "gicon",
          gtype = fn () => C.gtype GioIconClass.tOpt (),
          get = fn x => fn () => C.get GioIconClass.tOpt x,
          set = fn x => C.set GioIconClass.tOpt x,
          init = fn x => C.set GioIconClass.tOpt x
        }
      val iconNameProp =
        {
          name = "icon-name",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = fn x => C.set stringOpt x,
          init = fn x => C.set stringOpt x
        }
      val iconSetProp =
        {
          name = "icon-set",
          gtype = fn () => C.gtype GtkIconSetRecord.tOpt (),
          get = fn x => fn () => C.get GtkIconSetRecord.tOpt x,
          set = fn x => C.set GtkIconSetRecord.tOpt x,
          init = fn x => C.set GtkIconSetRecord.tOpt x
        }
      val iconSizeProp =
        {
          name = "icon-size",
          gtype = fn () => C.gtype int (),
          get = fn x => fn () => C.get int x,
          set = fn x => C.set int x,
          init = fn x => C.set int x
        }
      val pixbufProp =
        {
          name = "pixbuf",
          gtype = fn () => C.gtype GdkPixbufPixbufClass.tOpt (),
          get = fn x => fn () => C.get GdkPixbufPixbufClass.tOpt x,
          set = fn x => C.set GdkPixbufPixbufClass.tOpt x,
          init = fn x => C.set GdkPixbufPixbufClass.tOpt x
        }
      val pixbufAnimationProp =
        {
          name = "pixbuf-animation",
          gtype = fn () => C.gtype GdkPixbufPixbufAnimationClass.tOpt (),
          get = fn x => fn () => C.get GdkPixbufPixbufAnimationClass.tOpt x,
          set = fn x => C.set GdkPixbufPixbufAnimationClass.tOpt x,
          init = fn x => C.set GdkPixbufPixbufAnimationClass.tOpt x
        }
      val pixelSizeProp =
        {
          name = "pixel-size",
          gtype = fn () => C.gtype int (),
          get = fn x => fn () => C.get int x,
          set = fn x => C.set int x,
          init = fn x => C.set int x
        }
      val resourceProp =
        {
          name = "resource",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = fn x => C.set stringOpt x,
          init = fn x => C.set stringOpt x
        }
      val stockProp =
        {
          name = "stock",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = fn x => C.set stringOpt x,
          init = fn x => C.set stringOpt x
        }
      val storageTypeProp =
        {
          name = "storage-type",
          gtype = fn () => C.gtype GtkImageType.t (),
          get = fn x => fn () => C.get GtkImageType.t x,
          set = ignore,
          init = ignore
        }
      val surfaceProp =
        {
          name = "surface",
          gtype = fn () => C.gtype CairoSurfaceRecord.tOpt (),
          get = fn x => fn () => C.get CairoSurfaceRecord.tOpt x,
          set = fn x => C.set CairoSurfaceRecord.tOpt x,
          init = fn x => C.set CairoSurfaceRecord.tOpt x
        }
      val useFallbackProp =
        {
          name = "use-fallback",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
    end
  end
