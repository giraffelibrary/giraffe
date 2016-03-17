structure GtkImage :>
  GTK_IMAGE
    where type 'a class = 'a GtkImageClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type icon_set_t = GtkIconSetRecord.t
    where type image_type_t = GtkImageType.t =
  struct
    val getType_ = _import "gtk_image_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "gtk_image_new" : unit -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val newFromAnimation_ = _import "gtk_image_new_from_animation" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val newFromFile_ = _import "mlton_gtk_image_new_from_file" : Utf8.MLton.p1 * Utf8.C.notnull Utf8.MLton.p2 -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val newFromGicon_ = fn x1 & x2 => (_import "gtk_image_new_from_gicon" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Int32.C.val_ -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;) (x1, x2)
    val newFromIconName_ =
      fn
        (x1, x2) & x3 =>
          (
            _import "mlton_gtk_image_new_from_icon_name" :
              Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * FFI.Int32.C.val_
               -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
          )
            (
              x1,
              x2,
              x3
            )
    val newFromIconSet_ = fn x1 & x2 => (_import "gtk_image_new_from_icon_set" : GtkIconSetRecord.C.notnull GtkIconSetRecord.C.p * FFI.Int32.C.val_ -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;) (x1, x2)
    val newFromPixbuf_ = _import "gtk_image_new_from_pixbuf" : unit GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val newFromStock_ =
      fn
        (x1, x2) & x3 =>
          (
            _import "mlton_gtk_image_new_from_stock" :
              Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * FFI.Int32.C.val_
               -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
          )
            (
              x1,
              x2,
              x3
            )
    val clear_ = _import "gtk_image_clear" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;
    val getAnimation_ = _import "gtk_image_get_animation" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val getGicon_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_image_get_gicon" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * (unit, GObjectObjectClass.C.notnull) GObjectObjectClass.C.r
               * FFI.Int32.C.ref_
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * Utf8.MLton.r1
               * (unit, Utf8.C.notnull) Utf8.MLton.r2
               * FFI.Int32.C.ref_
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * (unit, GtkIconSetRecord.C.notnull) GtkIconSetRecord.C.r
               * FFI.Int32.C.ref_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val getPixbuf_ = _import "gtk_image_get_pixbuf" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val getPixelSize_ = _import "gtk_image_get_pixel_size" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Int32.C.val_;
    val getStock_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_gtk_image_get_stock" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * Utf8.MLton.r1
               * (unit, Utf8.C.notnull) Utf8.MLton.r2
               * FFI.Int32.C.ref_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val getStorageType_ = _import "gtk_image_get_storage_type" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GtkImageType.C.val_;
    val setFromAnimation_ = fn x1 & x2 => (_import "gtk_image_set_from_animation" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;) (x1, x2)
    val setFromFile_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_image_set_from_file" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * Utf8.MLton.p1
               * unit Utf8.MLton.p2
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.Int32.C.val_
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * FFI.Int32.C.val_
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GtkIconSetRecord.C.notnull GtkIconSetRecord.C.p
               * FFI.Int32.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setFromPixbuf_ = fn x1 & x2 => (_import "gtk_image_set_from_pixbuf" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * unit GObjectObjectClass.C.p -> unit;) (x1, x2)
    val setFromStock_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_gtk_image_set_from_stock" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * FFI.Int32.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val setPixelSize_ = fn x1 & x2 => (_import "gtk_image_set_pixel_size" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Int32.C.val_ -> unit;) (x1, x2)
    type 'a class = 'a GtkImageClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type icon_set_t = GtkIconSetRecord.t
    type image_type_t = GtkImageType.t
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.C.withPtr ---> AtkImplementorIfaceClass.C.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkImageClass.C.fromPtr false) new_ ()
    fun newFromAnimation animation = (GObjectObjectClass.C.withPtr ---> GtkImageClass.C.fromPtr false) newFromAnimation_ animation
    fun newFromFile filename = (Utf8.C.withPtr ---> GtkImageClass.C.fromPtr false) newFromFile_ filename
    fun newFromGicon icon size = (GObjectObjectClass.C.withPtr &&&> FFI.Int32.C.withVal ---> GtkImageClass.C.fromPtr false) newFromGicon_ (icon & size)
    fun newFromIconName iconName size = (Utf8.C.withPtr &&&> FFI.Int32.C.withVal ---> GtkImageClass.C.fromPtr false) newFromIconName_ (iconName & size)
    fun newFromIconSet iconSet size = (GtkIconSetRecord.C.withPtr &&&> FFI.Int32.C.withVal ---> GtkImageClass.C.fromPtr false) newFromIconSet_ (iconSet & size)
    fun newFromPixbuf pixbuf = (GObjectObjectClass.C.withOptPtr ---> GtkImageClass.C.fromPtr false) newFromPixbuf_ pixbuf
    fun newFromStock stockId size = (Utf8.C.withPtr &&&> FFI.Int32.C.withVal ---> GtkImageClass.C.fromPtr false) newFromStock_ (stockId & size)
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
             &&&> FFI.Int32.C.withRefVal
             ---> GioIconClass.C.fromPtr false
                   && FFI.Int32.C.fromVal
                   && I
          )
            getGicon_
            (
              self
               & NONE
               & FFI.Int32.null
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
             &&&> Utf8.C.withRefOptPtr
             &&&> FFI.Int32.C.withRefVal
             ---> Utf8.C.fromPtr false
                   && FFI.Int32.C.fromVal
                   && I
          )
            getIconName_
            (
              self
               & NONE
               & FFI.Int32.null
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
             &&&> FFI.Int32.C.withRefVal
             ---> GtkIconSetRecord.C.fromPtr false
                   && FFI.Int32.C.fromVal
                   && I
          )
            getIconSet_
            (
              self
               & NONE
               & FFI.Int32.null
            )
      in
        (iconSet, size)
      end
    fun getPixbuf self = (GObjectObjectClass.C.withPtr ---> GdkPixbufPixbufClass.C.fromPtr false) getPixbuf_ self
    fun getPixelSize self = (GObjectObjectClass.C.withPtr ---> FFI.Int32.C.fromVal) getPixelSize_ self
    fun getStock self =
      let
        val stockId
         & size
         & () =
          (
            GObjectObjectClass.C.withPtr
             &&&> Utf8.C.withRefOptPtr
             &&&> FFI.Int32.C.withRefVal
             ---> Utf8.C.fromPtr false
                   && FFI.Int32.C.fromVal
                   && I
          )
            getStock_
            (
              self
               & NONE
               & FFI.Int32.null
            )
      in
        (stockId, size)
      end
    fun getStorageType self = (GObjectObjectClass.C.withPtr ---> GtkImageType.C.fromVal) getStorageType_ self
    fun setFromAnimation self animation = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> I) setFromAnimation_ (self & animation)
    fun setFromFile self filename = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withOptPtr ---> I) setFromFile_ (self & filename)
    fun setFromGicon self icon size =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> FFI.Int32.C.withVal
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
         &&&> Utf8.C.withPtr
         &&&> FFI.Int32.C.withVal
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
         &&&> FFI.Int32.C.withVal
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
         &&&> Utf8.C.withPtr
         &&&> FFI.Int32.C.withVal
         ---> I
      )
        setFromStock_
        (
          self
           & stockId
           & size
        )
    fun setPixelSize self pixelSize = (GObjectObjectClass.C.withPtr &&&> FFI.Int32.C.withVal ---> I) setPixelSize_ (self & pixelSize)
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
