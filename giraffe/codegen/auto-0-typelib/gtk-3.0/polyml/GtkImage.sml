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
      val getType_ = call (getSymbol "gtk_image_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "gtk_image_new") (PolyMLFFI.cVoid --> GtkWidgetClass.PolyML.cPtr)
      val newFromAnimation_ = call (getSymbol "gtk_image_new_from_animation") (GdkPixbufPixbufAnimationClass.PolyML.cPtr --> GtkWidgetClass.PolyML.cPtr)
      val newFromFile_ = call (getSymbol "gtk_image_new_from_file") (Utf8.PolyML.cInPtr --> GtkWidgetClass.PolyML.cPtr)
      val newFromGicon_ = call (getSymbol "gtk_image_new_from_gicon") (GioIconClass.PolyML.cPtr &&> GInt32.PolyML.cVal --> GtkWidgetClass.PolyML.cPtr)
      val newFromIconName_ = call (getSymbol "gtk_image_new_from_icon_name") (Utf8.PolyML.cInPtr &&> GInt32.PolyML.cVal --> GtkWidgetClass.PolyML.cPtr)
      val newFromIconSet_ = call (getSymbol "gtk_image_new_from_icon_set") (GtkIconSetRecord.PolyML.cPtr &&> GInt32.PolyML.cVal --> GtkWidgetClass.PolyML.cPtr)
      val newFromPixbuf_ = call (getSymbol "gtk_image_new_from_pixbuf") (GdkPixbufPixbufClass.PolyML.cOptPtr --> GtkWidgetClass.PolyML.cPtr)
      val newFromStock_ = call (getSymbol "gtk_image_new_from_stock") (Utf8.PolyML.cInPtr &&> GInt32.PolyML.cVal --> GtkWidgetClass.PolyML.cPtr)
      val clear_ = call (getSymbol "gtk_image_clear") (GtkImageClass.PolyML.cPtr --> PolyMLFFI.cVoid)
      val getAnimation_ = call (getSymbol "gtk_image_get_animation") (GtkImageClass.PolyML.cPtr --> GdkPixbufPixbufAnimationClass.PolyML.cPtr)
      val getGicon_ =
        call (getSymbol "gtk_image_get_gicon")
          (
            GtkImageClass.PolyML.cPtr
             &&> GioIconClass.PolyML.cOutRef
             &&> GInt32.PolyML.cRef
             --> PolyMLFFI.cVoid
          )
      val getIconName_ =
        call (getSymbol "gtk_image_get_icon_name")
          (
            GtkImageClass.PolyML.cPtr
             &&> Utf8.PolyML.cOutRef
             &&> GInt32.PolyML.cRef
             --> PolyMLFFI.cVoid
          )
      val getIconSet_ =
        call (getSymbol "gtk_image_get_icon_set")
          (
            GtkImageClass.PolyML.cPtr
             &&> GtkIconSetRecord.PolyML.cOutRef
             &&> GInt32.PolyML.cRef
             --> PolyMLFFI.cVoid
          )
      val getPixbuf_ = call (getSymbol "gtk_image_get_pixbuf") (GtkImageClass.PolyML.cPtr --> GdkPixbufPixbufClass.PolyML.cPtr)
      val getPixelSize_ = call (getSymbol "gtk_image_get_pixel_size") (GtkImageClass.PolyML.cPtr --> GInt32.PolyML.cVal)
      val getStock_ =
        call (getSymbol "gtk_image_get_stock")
          (
            GtkImageClass.PolyML.cPtr
             &&> Utf8.PolyML.cOutRef
             &&> GInt32.PolyML.cRef
             --> PolyMLFFI.cVoid
          )
      val getStorageType_ = call (getSymbol "gtk_image_get_storage_type") (GtkImageClass.PolyML.cPtr --> GtkImageType.PolyML.cVal)
      val setFromAnimation_ = call (getSymbol "gtk_image_set_from_animation") (GtkImageClass.PolyML.cPtr &&> GdkPixbufPixbufAnimationClass.PolyML.cPtr --> PolyMLFFI.cVoid)
      val setFromFile_ = call (getSymbol "gtk_image_set_from_file") (GtkImageClass.PolyML.cPtr &&> Utf8.PolyML.cInOptPtr --> PolyMLFFI.cVoid)
      val setFromGicon_ =
        call (getSymbol "gtk_image_set_from_gicon")
          (
            GtkImageClass.PolyML.cPtr
             &&> GioIconClass.PolyML.cPtr
             &&> GInt32.PolyML.cVal
             --> PolyMLFFI.cVoid
          )
      val setFromIconName_ =
        call (getSymbol "gtk_image_set_from_icon_name")
          (
            GtkImageClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GInt32.PolyML.cVal
             --> PolyMLFFI.cVoid
          )
      val setFromIconSet_ =
        call (getSymbol "gtk_image_set_from_icon_set")
          (
            GtkImageClass.PolyML.cPtr
             &&> GtkIconSetRecord.PolyML.cPtr
             &&> GInt32.PolyML.cVal
             --> PolyMLFFI.cVoid
          )
      val setFromPixbuf_ = call (getSymbol "gtk_image_set_from_pixbuf") (GtkImageClass.PolyML.cPtr &&> GdkPixbufPixbufClass.PolyML.cOptPtr --> PolyMLFFI.cVoid)
      val setFromStock_ =
        call (getSymbol "gtk_image_set_from_stock")
          (
            GtkImageClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GInt32.PolyML.cVal
             --> PolyMLFFI.cVoid
          )
      val setPixelSize_ = call (getSymbol "gtk_image_set_pixel_size") (GtkImageClass.PolyML.cPtr &&> GInt32.PolyML.cVal --> PolyMLFFI.cVoid)
    end
    type 'a class = 'a GtkImageClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type icon_set_t = GtkIconSetRecord.t
    type image_type_t = GtkImageType.t
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr ---> GtkBuildableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkImageClass.FFI.fromPtr false) new_ ()
    fun newFromAnimation animation = (GdkPixbufPixbufAnimationClass.FFI.withPtr ---> GtkImageClass.FFI.fromPtr false) newFromAnimation_ animation
    fun newFromFile filename = (Utf8.FFI.withPtr ---> GtkImageClass.FFI.fromPtr false) newFromFile_ filename
    fun newFromGicon icon size = (GioIconClass.FFI.withPtr &&&> GInt32.FFI.withVal ---> GtkImageClass.FFI.fromPtr false) newFromGicon_ (icon & size)
    fun newFromIconName iconName size = (Utf8.FFI.withPtr &&&> GInt32.FFI.withVal ---> GtkImageClass.FFI.fromPtr false) newFromIconName_ (iconName & size)
    fun newFromIconSet iconSet size = (GtkIconSetRecord.FFI.withPtr &&&> GInt32.FFI.withVal ---> GtkImageClass.FFI.fromPtr false) newFromIconSet_ (iconSet & size)
    fun newFromPixbuf pixbuf = (GdkPixbufPixbufClass.FFI.withOptPtr ---> GtkImageClass.FFI.fromPtr false) newFromPixbuf_ pixbuf
    fun newFromStock stockId size = (Utf8.FFI.withPtr &&&> GInt32.FFI.withVal ---> GtkImageClass.FFI.fromPtr false) newFromStock_ (stockId & size)
    fun clear self = (GtkImageClass.FFI.withPtr ---> I) clear_ self
    fun getAnimation self = (GtkImageClass.FFI.withPtr ---> GdkPixbufPixbufAnimationClass.FFI.fromPtr false) getAnimation_ self
    fun getGicon self =
      let
        val gicon
         & size
         & () =
          (
            GtkImageClass.FFI.withPtr
             &&&> GioIconClass.FFI.withRefOptPtr
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
            GtkImageClass.FFI.withPtr
             &&&> Utf8.FFI.withRefOptPtr
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
            GtkImageClass.FFI.withPtr
             &&&> GtkIconSetRecord.FFI.withRefOptPtr
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
    fun getPixbuf self = (GtkImageClass.FFI.withPtr ---> GdkPixbufPixbufClass.FFI.fromPtr false) getPixbuf_ self
    fun getPixelSize self = (GtkImageClass.FFI.withPtr ---> GInt32.FFI.fromVal) getPixelSize_ self
    fun getStock self =
      let
        val stockId
         & size
         & () =
          (
            GtkImageClass.FFI.withPtr
             &&&> Utf8.FFI.withRefOptPtr
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
    fun getStorageType self = (GtkImageClass.FFI.withPtr ---> GtkImageType.FFI.fromVal) getStorageType_ self
    fun setFromAnimation self animation = (GtkImageClass.FFI.withPtr &&&> GdkPixbufPixbufAnimationClass.FFI.withPtr ---> I) setFromAnimation_ (self & animation)
    fun setFromFile self filename = (GtkImageClass.FFI.withPtr &&&> Utf8.FFI.withOptPtr ---> I) setFromFile_ (self & filename)
    fun setFromGicon self icon size =
      (
        GtkImageClass.FFI.withPtr
         &&&> GioIconClass.FFI.withPtr
         &&&> GInt32.FFI.withVal
         ---> I
      )
        setFromGicon_
        (
          self
           & icon
           & size
        )
    fun setFromIconName self iconName size =
      (
        GtkImageClass.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GInt32.FFI.withVal
         ---> I
      )
        setFromIconName_
        (
          self
           & iconName
           & size
        )
    fun setFromIconSet self iconSet size =
      (
        GtkImageClass.FFI.withPtr
         &&&> GtkIconSetRecord.FFI.withPtr
         &&&> GInt32.FFI.withVal
         ---> I
      )
        setFromIconSet_
        (
          self
           & iconSet
           & size
        )
    fun setFromPixbuf self pixbuf = (GtkImageClass.FFI.withPtr &&&> GdkPixbufPixbufClass.FFI.withOptPtr ---> I) setFromPixbuf_ (self & pixbuf)
    fun setFromStock self stockId size =
      (
        GtkImageClass.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GInt32.FFI.withVal
         ---> I
      )
        setFromStock_
        (
          self
           & stockId
           & size
        )
    fun setPixelSize self pixelSize = (GtkImageClass.FFI.withPtr &&&> GInt32.FFI.withVal ---> I) setPixelSize_ (self & pixelSize)
    local
      open Property
    in
      val fileProp =
        {
          get = fn x => get "file" stringOpt x,
          set = fn x => set "file" stringOpt x
        }
      val giconProp =
        {
          get = fn x => get "gicon" GioIconClass.tOpt x,
          set = fn x => set "gicon" GioIconClass.tOpt x
        }
      val iconNameProp =
        {
          get = fn x => get "icon-name" stringOpt x,
          set = fn x => set "icon-name" stringOpt x
        }
      val iconSetProp =
        {
          get = fn x => get "icon-set" GtkIconSetRecord.tOpt x,
          set = fn x => set "icon-set" GtkIconSetRecord.tOpt x
        }
      val iconSizeProp =
        {
          get = fn x => get "icon-size" int x,
          set = fn x => set "icon-size" int x
        }
      val pixbufProp =
        {
          get = fn x => get "pixbuf" GdkPixbufPixbufClass.tOpt x,
          set = fn x => set "pixbuf" GdkPixbufPixbufClass.tOpt x
        }
      val pixbufAnimationProp =
        {
          get = fn x => get "pixbuf-animation" GdkPixbufPixbufAnimationClass.tOpt x,
          set = fn x => set "pixbuf-animation" GdkPixbufPixbufAnimationClass.tOpt x
        }
      val pixelSizeProp =
        {
          get = fn x => get "pixel-size" int x,
          set = fn x => set "pixel-size" int x
        }
      val stockProp =
        {
          get = fn x => get "stock" stringOpt x,
          set = fn x => set "stock" stringOpt x
        }
      val storageTypeProp = {get = fn x => get "storage-type" GtkImageType.t x}
      val useFallbackProp =
        {
          get = fn x => get "use-fallback" boolean x,
          set = fn x => set "use-fallback" boolean x
        }
    end
  end
