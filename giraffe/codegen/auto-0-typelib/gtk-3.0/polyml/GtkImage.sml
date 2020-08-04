structure GtkImage :>
  GTK_IMAGE
    where type 'a class = 'a GtkImageClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type icon_set_t = GtkIconSetRecord.t
    where type image_type_t = GtkImageType.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_image_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "gtk_image_new") (cVoid --> GtkWidgetClass.PolyML.cPtr)
      val newFromAnimation_ = call (getSymbol "gtk_image_new_from_animation") (GdkPixbufPixbufAnimationClass.PolyML.cPtr --> GtkWidgetClass.PolyML.cPtr)
      val newFromFile_ = call (getSymbol "gtk_image_new_from_file") (Utf8.PolyML.cInPtr --> GtkWidgetClass.PolyML.cPtr)
      val newFromGicon_ = call (getSymbol "gtk_image_new_from_gicon") (GioIconClass.PolyML.cPtr &&> GInt32.PolyML.cVal --> GtkWidgetClass.PolyML.cPtr)
      val newFromIconName_ = call (getSymbol "gtk_image_new_from_icon_name") (Utf8.PolyML.cInOptPtr &&> GInt32.PolyML.cVal --> GtkWidgetClass.PolyML.cPtr)
      val newFromIconSet_ = call (getSymbol "gtk_image_new_from_icon_set") (GtkIconSetRecord.PolyML.cPtr &&> GInt32.PolyML.cVal --> GtkWidgetClass.PolyML.cPtr)
      val newFromPixbuf_ = call (getSymbol "gtk_image_new_from_pixbuf") (GdkPixbufPixbufClass.PolyML.cOptPtr --> GtkWidgetClass.PolyML.cPtr)
      val newFromResource_ = call (getSymbol "gtk_image_new_from_resource") (Utf8.PolyML.cInPtr --> GtkWidgetClass.PolyML.cPtr)
      val newFromStock_ = call (getSymbol "gtk_image_new_from_stock") (Utf8.PolyML.cInPtr &&> GInt32.PolyML.cVal --> GtkWidgetClass.PolyML.cPtr)
      val newFromSurface_ = call (getSymbol "gtk_image_new_from_surface") (CairoSurfaceRecord.PolyML.cOptPtr --> GtkWidgetClass.PolyML.cPtr)
      val clear_ = call (getSymbol "gtk_image_clear") (GtkImageClass.PolyML.cPtr --> cVoid)
      val getAnimation_ = call (getSymbol "gtk_image_get_animation") (GtkImageClass.PolyML.cPtr --> GdkPixbufPixbufAnimationClass.PolyML.cOptPtr)
      val getGicon_ =
        call (getSymbol "gtk_image_get_gicon")
          (
            GtkImageClass.PolyML.cPtr
             &&> GioIconClass.PolyML.cOutRef
             &&> GInt32.PolyML.cRef
             --> cVoid
          )
      val getIconName_ =
        call (getSymbol "gtk_image_get_icon_name")
          (
            GtkImageClass.PolyML.cPtr
             &&> Utf8.PolyML.cOutRef
             &&> GInt32.PolyML.cRef
             --> cVoid
          )
      val getIconSet_ =
        call (getSymbol "gtk_image_get_icon_set")
          (
            GtkImageClass.PolyML.cPtr
             &&> GtkIconSetRecord.PolyML.cOutRef
             &&> GInt32.PolyML.cRef
             --> cVoid
          )
      val getPixbuf_ = call (getSymbol "gtk_image_get_pixbuf") (GtkImageClass.PolyML.cPtr --> GdkPixbufPixbufClass.PolyML.cOptPtr)
      val getPixelSize_ = call (getSymbol "gtk_image_get_pixel_size") (GtkImageClass.PolyML.cPtr --> GInt32.PolyML.cVal)
      val getStock_ =
        call (getSymbol "gtk_image_get_stock")
          (
            GtkImageClass.PolyML.cPtr
             &&> Utf8.PolyML.cOutRef
             &&> GInt32.PolyML.cRef
             --> cVoid
          )
      val getStorageType_ = call (getSymbol "gtk_image_get_storage_type") (GtkImageClass.PolyML.cPtr --> GtkImageType.PolyML.cVal)
      val setFromAnimation_ = call (getSymbol "gtk_image_set_from_animation") (GtkImageClass.PolyML.cPtr &&> GdkPixbufPixbufAnimationClass.PolyML.cPtr --> cVoid)
      val setFromFile_ = call (getSymbol "gtk_image_set_from_file") (GtkImageClass.PolyML.cPtr &&> Utf8.PolyML.cInOptPtr --> cVoid)
      val setFromGicon_ =
        call (getSymbol "gtk_image_set_from_gicon")
          (
            GtkImageClass.PolyML.cPtr
             &&> GioIconClass.PolyML.cPtr
             &&> GInt32.PolyML.cVal
             --> cVoid
          )
      val setFromIconName_ =
        call (getSymbol "gtk_image_set_from_icon_name")
          (
            GtkImageClass.PolyML.cPtr
             &&> Utf8.PolyML.cInOptPtr
             &&> GInt32.PolyML.cVal
             --> cVoid
          )
      val setFromIconSet_ =
        call (getSymbol "gtk_image_set_from_icon_set")
          (
            GtkImageClass.PolyML.cPtr
             &&> GtkIconSetRecord.PolyML.cPtr
             &&> GInt32.PolyML.cVal
             --> cVoid
          )
      val setFromPixbuf_ = call (getSymbol "gtk_image_set_from_pixbuf") (GtkImageClass.PolyML.cPtr &&> GdkPixbufPixbufClass.PolyML.cOptPtr --> cVoid)
      val setFromResource_ = call (getSymbol "gtk_image_set_from_resource") (GtkImageClass.PolyML.cPtr &&> Utf8.PolyML.cInOptPtr --> cVoid)
      val setFromStock_ =
        call (getSymbol "gtk_image_set_from_stock")
          (
            GtkImageClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GInt32.PolyML.cVal
             --> cVoid
          )
      val setFromSurface_ = call (getSymbol "gtk_image_set_from_surface") (GtkImageClass.PolyML.cPtr &&> CairoSurfaceRecord.PolyML.cOptPtr --> cVoid)
      val setPixelSize_ = call (getSymbol "gtk_image_set_pixel_size") (GtkImageClass.PolyML.cPtr &&> GInt32.PolyML.cVal --> cVoid)
    end
    type 'a class = 'a GtkImageClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type icon_set_t = GtkIconSetRecord.t
    type image_type_t = GtkImageType.t
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr false ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr false ---> GtkBuildableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkImageClass.FFI.fromPtr false) new_ ()
    fun newFromAnimation animation = (GdkPixbufPixbufAnimationClass.FFI.withPtr false ---> GtkImageClass.FFI.fromPtr false) newFromAnimation_ animation
    fun newFromFile filename = (Utf8.FFI.withPtr 0 ---> GtkImageClass.FFI.fromPtr false) newFromFile_ filename
    fun newFromGicon (icon, size) = (GioIconClass.FFI.withPtr false &&&> GInt32.FFI.withVal ---> GtkImageClass.FFI.fromPtr false) newFromGicon_ (icon & size)
    fun newFromIconName (iconName, size) = (Utf8.FFI.withOptPtr 0 &&&> GInt32.FFI.withVal ---> GtkImageClass.FFI.fromPtr false) newFromIconName_ (iconName & size)
    fun newFromIconSet (iconSet, size) = (GtkIconSetRecord.FFI.withPtr false &&&> GInt32.FFI.withVal ---> GtkImageClass.FFI.fromPtr false) newFromIconSet_ (iconSet & size)
    fun newFromPixbuf pixbuf = (GdkPixbufPixbufClass.FFI.withOptPtr false ---> GtkImageClass.FFI.fromPtr false) newFromPixbuf_ pixbuf
    fun newFromResource resourcePath = (Utf8.FFI.withPtr 0 ---> GtkImageClass.FFI.fromPtr false) newFromResource_ resourcePath
    fun newFromStock (stockId, size) = (Utf8.FFI.withPtr 0 &&&> GInt32.FFI.withVal ---> GtkImageClass.FFI.fromPtr false) newFromStock_ (stockId & size)
    fun newFromSurface surface = (CairoSurfaceRecord.FFI.withOptPtr false ---> GtkImageClass.FFI.fromPtr false) newFromSurface_ surface
    fun clear self = (GtkImageClass.FFI.withPtr false ---> I) clear_ self
    fun getAnimation self = (GtkImageClass.FFI.withPtr false ---> GdkPixbufPixbufAnimationClass.FFI.fromOptPtr false) getAnimation_ self
    fun getGicon self =
      let
        val gicon
         & size
         & () =
          (
            GtkImageClass.FFI.withPtr false
             &&&> GioIconClass.FFI.withRefOptPtr false
             &&&> GInt32.FFI.withRefVal
             ---> GioIconClass.FFI.fromPtr false
                   && GInt32.FFI.fromVal
                   && I
          )
            getGicon_
            (
              self
               & NONE
               & GInt32.null
            )
      in
        (gicon, size)
      end
    fun getIconName self =
      let
        val iconName
         & size
         & () =
          (
            GtkImageClass.FFI.withPtr false
             &&&> Utf8.FFI.withRefOptPtr 0
             &&&> GInt32.FFI.withRefVal
             ---> Utf8.FFI.fromPtr 0
                   && GInt32.FFI.fromVal
                   && I
          )
            getIconName_
            (
              self
               & NONE
               & GInt32.null
            )
      in
        (iconName, size)
      end
    fun getIconSet self =
      let
        val iconSet
         & size
         & () =
          (
            GtkImageClass.FFI.withPtr false
             &&&> GtkIconSetRecord.FFI.withRefOptPtr false
             &&&> GInt32.FFI.withRefVal
             ---> GtkIconSetRecord.FFI.fromPtr false
                   && GInt32.FFI.fromVal
                   && I
          )
            getIconSet_
            (
              self
               & NONE
               & GInt32.null
            )
      in
        (iconSet, size)
      end
    fun getPixbuf self = (GtkImageClass.FFI.withPtr false ---> GdkPixbufPixbufClass.FFI.fromOptPtr false) getPixbuf_ self
    fun getPixelSize self = (GtkImageClass.FFI.withPtr false ---> GInt32.FFI.fromVal) getPixelSize_ self
    fun getStock self =
      let
        val stockId
         & size
         & () =
          (
            GtkImageClass.FFI.withPtr false
             &&&> Utf8.FFI.withRefOptPtr 0
             &&&> GInt32.FFI.withRefVal
             ---> Utf8.FFI.fromPtr 0
                   && GInt32.FFI.fromVal
                   && I
          )
            getStock_
            (
              self
               & NONE
               & GInt32.null
            )
      in
        (stockId, size)
      end
    fun getStorageType self = (GtkImageClass.FFI.withPtr false ---> GtkImageType.FFI.fromVal) getStorageType_ self
    fun setFromAnimation self animation = (GtkImageClass.FFI.withPtr false &&&> GdkPixbufPixbufAnimationClass.FFI.withPtr false ---> I) setFromAnimation_ (self & animation)
    fun setFromFile self filename = (GtkImageClass.FFI.withPtr false &&&> Utf8.FFI.withOptPtr 0 ---> I) setFromFile_ (self & filename)
    fun setFromGicon self (icon, size) =
      (
        GtkImageClass.FFI.withPtr false
         &&&> GioIconClass.FFI.withPtr false
         &&&> GInt32.FFI.withVal
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
         &&&> GInt32.FFI.withVal
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
         &&&> GInt32.FFI.withVal
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
         &&&> GInt32.FFI.withVal
         ---> I
      )
        setFromStock_
        (
          self
           & stockId
           & size
        )
    fun setFromSurface self surface = (GtkImageClass.FFI.withPtr false &&&> CairoSurfaceRecord.FFI.withOptPtr false ---> I) setFromSurface_ (self & surface)
    fun setPixelSize self pixelSize = (GtkImageClass.FFI.withPtr false &&&> GInt32.FFI.withVal ---> I) setPixelSize_ (self & pixelSize)
    local
      open Property
    in
      val fileProp =
        {
          get = fn x => get "file" stringOpt x,
          set = fn x => set "file" stringOpt x,
          new = fn x => new "file" stringOpt x
        }
      val giconProp =
        {
          get = fn x => get "gicon" GioIconClass.tOpt x,
          set = fn x => set "gicon" GioIconClass.tOpt x,
          new = fn x => new "gicon" GioIconClass.tOpt x
        }
      val iconNameProp =
        {
          get = fn x => get "icon-name" stringOpt x,
          set = fn x => set "icon-name" stringOpt x,
          new = fn x => new "icon-name" stringOpt x
        }
      val iconSetProp =
        {
          get = fn x => get "icon-set" GtkIconSetRecord.tOpt x,
          set = fn x => set "icon-set" GtkIconSetRecord.tOpt x,
          new = fn x => new "icon-set" GtkIconSetRecord.tOpt x
        }
      val iconSizeProp =
        {
          get = fn x => get "icon-size" int x,
          set = fn x => set "icon-size" int x,
          new = fn x => new "icon-size" int x
        }
      val pixbufProp =
        {
          get = fn x => get "pixbuf" GdkPixbufPixbufClass.tOpt x,
          set = fn x => set "pixbuf" GdkPixbufPixbufClass.tOpt x,
          new = fn x => new "pixbuf" GdkPixbufPixbufClass.tOpt x
        }
      val pixbufAnimationProp =
        {
          get = fn x => get "pixbuf-animation" GdkPixbufPixbufAnimationClass.tOpt x,
          set = fn x => set "pixbuf-animation" GdkPixbufPixbufAnimationClass.tOpt x,
          new = fn x => new "pixbuf-animation" GdkPixbufPixbufAnimationClass.tOpt x
        }
      val pixelSizeProp =
        {
          get = fn x => get "pixel-size" int x,
          set = fn x => set "pixel-size" int x,
          new = fn x => new "pixel-size" int x
        }
      val resourceProp =
        {
          get = fn x => get "resource" stringOpt x,
          set = fn x => set "resource" stringOpt x,
          new = fn x => new "resource" stringOpt x
        }
      val stockProp =
        {
          get = fn x => get "stock" stringOpt x,
          set = fn x => set "stock" stringOpt x,
          new = fn x => new "stock" stringOpt x
        }
      val storageTypeProp = {get = fn x => get "storage-type" GtkImageType.t x}
      val surfaceProp =
        {
          get = fn x => get "surface" CairoSurfaceRecord.tOpt x,
          set = fn x => set "surface" CairoSurfaceRecord.tOpt x,
          new = fn x => new "surface" CairoSurfaceRecord.tOpt x
        }
      val useFallbackProp =
        {
          get = fn x => get "use-fallback" boolean x,
          set = fn x => set "use-fallback" boolean x,
          new = fn x => new "use-fallback" boolean x
        }
    end
  end
