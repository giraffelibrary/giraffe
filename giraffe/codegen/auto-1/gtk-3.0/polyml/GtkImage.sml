structure GtkImage :>
  GTK_IMAGE
    where type 'a class_t = 'a GtkImageClass.t
    where type 'a buildableclass_t = 'a GtkBuildableClass.t
    where type iconsetrecord_t = GtkIconSetRecord.t
    where type imagetype_t = GtkImageType.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_image_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val new_ = call (load_sym libgtk "gtk_image_new") (FFI.PolyML.VOID --> GObjectObjectClass.PolyML.PTR)
      val newFromAnimation_ = call (load_sym libgtk "gtk_image_new_from_animation") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val newFromFile_ = call (load_sym libgtk "gtk_image_new_from_file") (FFI.PolyML.String.INPTR --> GObjectObjectClass.PolyML.PTR)
      val newFromGicon_ = call (load_sym libgtk "gtk_image_new_from_gicon") (GObjectObjectClass.PolyML.PTR &&> FFI.PolyML.Int32.VAL --> GObjectObjectClass.PolyML.PTR)
      val newFromIconName_ = call (load_sym libgtk "gtk_image_new_from_icon_name") (FFI.PolyML.String.INPTR &&> FFI.PolyML.Int32.VAL --> GObjectObjectClass.PolyML.PTR)
      val newFromIconSet_ = call (load_sym libgtk "gtk_image_new_from_icon_set") (GtkIconSetRecord.PolyML.PTR &&> FFI.PolyML.Int32.VAL --> GObjectObjectClass.PolyML.PTR)
      val newFromPixbuf_ = call (load_sym libgtk "gtk_image_new_from_pixbuf") (GObjectObjectClass.PolyML.OPTPTR --> GObjectObjectClass.PolyML.PTR)
      val newFromStock_ = call (load_sym libgtk "gtk_image_new_from_stock") (FFI.PolyML.String.INPTR &&> FFI.PolyML.Int32.VAL --> GObjectObjectClass.PolyML.PTR)
      val clear_ = call (load_sym libgtk "gtk_image_clear") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val getAnimation_ = call (load_sym libgtk "gtk_image_get_animation") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val getGicon_ =
        call (load_sym libgtk "gtk_image_get_gicon")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.OUTREF
             &&> FFI.PolyML.Int32.REF
             --> FFI.PolyML.VOID
          )
      val getIconName_ =
        call (load_sym libgtk "gtk_image_get_icon_name")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.PolyML.String.OUTREF
             &&> FFI.PolyML.Int32.REF
             --> FFI.PolyML.VOID
          )
      val getIconSet_ =
        call (load_sym libgtk "gtk_image_get_icon_set")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GtkIconSetRecord.PolyML.OUTREF
             &&> FFI.PolyML.Int32.REF
             --> FFI.PolyML.VOID
          )
      val getPixbuf_ = call (load_sym libgtk "gtk_image_get_pixbuf") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val getPixelSize_ = call (load_sym libgtk "gtk_image_get_pixel_size") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.Int32.VAL)
      val getStock_ =
        call (load_sym libgtk "gtk_image_get_stock")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.PolyML.String.OUTREF
             &&> FFI.PolyML.Int32.REF
             --> FFI.PolyML.VOID
          )
      val getStorageType_ = call (load_sym libgtk "gtk_image_get_storage_type") (GObjectObjectClass.PolyML.PTR --> GtkImageType.PolyML.VAL)
      val setFromAnimation_ = call (load_sym libgtk "gtk_image_set_from_animation") (GObjectObjectClass.PolyML.PTR &&> GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val setFromFile_ = call (load_sym libgtk "gtk_image_set_from_file") (GObjectObjectClass.PolyML.PTR &&> FFI.PolyML.String.INOPTPTR --> FFI.PolyML.VOID)
      val setFromGicon_ =
        call (load_sym libgtk "gtk_image_set_from_gicon")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> FFI.PolyML.Int32.VAL
             --> FFI.PolyML.VOID
          )
      val setFromIconName_ =
        call (load_sym libgtk "gtk_image_set_from_icon_name")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.PolyML.String.INPTR
             &&> FFI.PolyML.Int32.VAL
             --> FFI.PolyML.VOID
          )
      val setFromIconSet_ =
        call (load_sym libgtk "gtk_image_set_from_icon_set")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GtkIconSetRecord.PolyML.PTR
             &&> FFI.PolyML.Int32.VAL
             --> FFI.PolyML.VOID
          )
      val setFromPixbuf_ = call (load_sym libgtk "gtk_image_set_from_pixbuf") (GObjectObjectClass.PolyML.PTR &&> GObjectObjectClass.PolyML.OPTPTR --> FFI.PolyML.VOID)
      val setFromStock_ =
        call (load_sym libgtk "gtk_image_set_from_stock")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.PolyML.String.INPTR
             &&> FFI.PolyML.Int32.VAL
             --> FFI.PolyML.VOID
          )
      val setPixelSize_ = call (load_sym libgtk "gtk_image_set_pixel_size") (GObjectObjectClass.PolyML.PTR &&> FFI.PolyML.Int32.VAL --> FFI.PolyML.VOID)
    end
    type 'a class_t = 'a GtkImageClass.t
    type 'a buildableclass_t = 'a GtkBuildableClass.t
    type iconsetrecord_t = GtkIconSetRecord.t
    type imagetype_t = GtkImageType.t
    fun asImplementorIface self = (GObjectObjectClass.C.withPtr ---> AtkImplementorIfaceClass.C.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkImageClass.C.fromPtr false) new_ ()
    fun newFromAnimation animation = (GObjectObjectClass.C.withPtr ---> GtkImageClass.C.fromPtr false) newFromAnimation_ animation
    fun newFromFile filename = (FFI.String.withConstPtr ---> GtkImageClass.C.fromPtr false) newFromFile_ filename
    fun newFromGicon icon size = (GObjectObjectClass.C.withPtr &&&> FFI.Int32.withVal ---> GtkImageClass.C.fromPtr false) newFromGicon_ (icon & size)
    fun newFromIconName iconName size = (FFI.String.withConstPtr &&&> FFI.Int32.withVal ---> GtkImageClass.C.fromPtr false) newFromIconName_ (iconName & size)
    fun newFromIconSet iconSet size = (GtkIconSetRecord.C.withPtr &&&> FFI.Int32.withVal ---> GtkImageClass.C.fromPtr false) newFromIconSet_ (iconSet & size)
    fun newFromPixbuf pixbuf = (GObjectObjectClass.C.withOptPtr ---> GtkImageClass.C.fromPtr false) newFromPixbuf_ pixbuf
    fun newFromStock stockId size = (FFI.String.withConstPtr &&&> FFI.Int32.withVal ---> GtkImageClass.C.fromPtr false) newFromStock_ (stockId & size)
    fun clear self = (GObjectObjectClass.C.withPtr ---> I) clear_ self
    fun getAnimation self = (GObjectObjectClass.C.withPtr ---> GdkPixbufPixbufAnimationClass.C.fromPtr false) getAnimation_ self
    fun getGicon self =
      let
        val gicon
         & size
         & () =
          (
            GObjectObjectClass.C.withPtr
             &&&> GObjectObjectClass.C.withRefOptPtr
             &&&> FFI.Int32.withRefVal
             ---> GioIconClass.C.fromPtr false
                   && FFI.Int32.fromVal
                   && I
          )
            getGicon_
            (
              self
               & NONE
               & 0
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
            GObjectObjectClass.C.withPtr
             &&&> FFI.String.withRefConstOptPtr
             &&&> FFI.Int32.withRefVal
             ---> FFI.String.fromPtr false
                   && FFI.Int32.fromVal
                   && I
          )
            getIconName_
            (
              self
               & NONE
               & 0
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
            GObjectObjectClass.C.withPtr
             &&&> GtkIconSetRecord.C.withRefOptPtr
             &&&> FFI.Int32.withRefVal
             ---> GtkIconSetRecord.C.fromPtr false
                   && FFI.Int32.fromVal
                   && I
          )
            getIconSet_
            (
              self
               & NONE
               & 0
            )
      in
        (iconSet, size)
      end
    fun getPixbuf self = (GObjectObjectClass.C.withPtr ---> GdkPixbufPixbufClass.C.fromPtr false) getPixbuf_ self
    fun getPixelSize self = (GObjectObjectClass.C.withPtr ---> FFI.Int32.fromVal) getPixelSize_ self
    fun getStock self =
      let
        val stockId
         & size
         & () =
          (
            GObjectObjectClass.C.withPtr
             &&&> FFI.String.withRefConstOptPtr
             &&&> FFI.Int32.withRefVal
             ---> FFI.String.fromPtr false
                   && FFI.Int32.fromVal
                   && I
          )
            getStock_
            (
              self
               & NONE
               & 0
            )
      in
        (stockId, size)
      end
    fun getStorageType self = (GObjectObjectClass.C.withPtr ---> GtkImageType.C.fromVal) getStorageType_ self
    fun setFromAnimation self animation = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> I) setFromAnimation_ (self & animation)
    fun setFromFile self filename = (GObjectObjectClass.C.withPtr &&&> FFI.String.withConstOptPtr ---> I) setFromFile_ (self & filename)
    fun setFromGicon self icon size =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> FFI.Int32.withVal
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
        GObjectObjectClass.C.withPtr
         &&&> FFI.String.withConstPtr
         &&&> FFI.Int32.withVal
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
        GObjectObjectClass.C.withPtr
         &&&> GtkIconSetRecord.C.withPtr
         &&&> FFI.Int32.withVal
         ---> I
      )
        setFromIconSet_
        (
          self
           & iconSet
           & size
        )
    fun setFromPixbuf self pixbuf = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withOptPtr ---> I) setFromPixbuf_ (self & pixbuf)
    fun setFromStock self stockId size =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.String.withConstPtr
         &&&> FFI.Int32.withVal
         ---> I
      )
        setFromStock_
        (
          self
           & stockId
           & size
        )
    fun setPixelSize self pixelSize = (GObjectObjectClass.C.withPtr &&&> FFI.Int32.withVal ---> I) setPixelSize_ (self & pixelSize)
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
