structure GtkStatusIcon :>
  GTK_STATUS_ICON
    where type 'a class_t = 'a GtkStatusIconClass.t
    where type 'a menu_class_t = 'a GtkMenuClass.t
    where type 'a tooltip_class_t = 'a GtkTooltipClass.t
    where type orientation_t = GtkOrientation.t
    where type image_type_t = GtkImageType.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_status_icon_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libgtk "gtk_status_icon_new") (FFI.PolyML.cVoid --> GObjectObjectClass.PolyML.cPtr)
      val newFromFile_ = call (load_sym libgtk "gtk_status_icon_new_from_file") (Utf8.PolyML.cInPtr --> GObjectObjectClass.PolyML.cPtr)
      val newFromGicon_ = call (load_sym libgtk "gtk_status_icon_new_from_gicon") (GObjectObjectClass.PolyML.cPtr --> GObjectObjectClass.PolyML.cPtr)
      val newFromIconName_ = call (load_sym libgtk "gtk_status_icon_new_from_icon_name") (Utf8.PolyML.cInPtr --> GObjectObjectClass.PolyML.cPtr)
      val newFromPixbuf_ = call (load_sym libgtk "gtk_status_icon_new_from_pixbuf") (GObjectObjectClass.PolyML.cPtr --> GObjectObjectClass.PolyML.cPtr)
      val newFromStock_ = call (load_sym libgtk "gtk_status_icon_new_from_stock") (Utf8.PolyML.cInPtr --> GObjectObjectClass.PolyML.cPtr)
      val positionMenu_ =
        call (load_sym libgtk "gtk_status_icon_position_menu")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> FFI.Int32.PolyML.cRef
             &&> FFI.Int32.PolyML.cRef
             &&> FFI.Bool.PolyML.cRef
             &&> GObjectObjectClass.PolyML.cPtr
             --> FFI.PolyML.cVoid
          )
      val getGeometry_ =
        call (load_sym libgtk "gtk_status_icon_get_geometry")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GObjectObjectClass.PolyML.cOutRef
             &&> CairoRectangleIntRecord.PolyML.cPtr
             &&> GtkOrientation.PolyML.cRef
             --> FFI.Bool.PolyML.cVal
          )
      val getGicon_ = call (load_sym libgtk "gtk_status_icon_get_gicon") (GObjectObjectClass.PolyML.cPtr --> GObjectObjectClass.PolyML.cPtr)
      val getHasTooltip_ = call (load_sym libgtk "gtk_status_icon_get_has_tooltip") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getIconName_ = call (load_sym libgtk "gtk_status_icon_get_icon_name") (GObjectObjectClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getPixbuf_ = call (load_sym libgtk "gtk_status_icon_get_pixbuf") (GObjectObjectClass.PolyML.cPtr --> GObjectObjectClass.PolyML.cPtr)
      val getScreen_ = call (load_sym libgtk "gtk_status_icon_get_screen") (GObjectObjectClass.PolyML.cPtr --> GObjectObjectClass.PolyML.cPtr)
      val getSize_ = call (load_sym libgtk "gtk_status_icon_get_size") (GObjectObjectClass.PolyML.cPtr --> FFI.Int32.PolyML.cVal)
      val getStock_ = call (load_sym libgtk "gtk_status_icon_get_stock") (GObjectObjectClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getStorageType_ = call (load_sym libgtk "gtk_status_icon_get_storage_type") (GObjectObjectClass.PolyML.cPtr --> GtkImageType.PolyML.cVal)
      val getTitle_ = call (load_sym libgtk "gtk_status_icon_get_title") (GObjectObjectClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getTooltipMarkup_ = call (load_sym libgtk "gtk_status_icon_get_tooltip_markup") (GObjectObjectClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getTooltipText_ = call (load_sym libgtk "gtk_status_icon_get_tooltip_text") (GObjectObjectClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getVisible_ = call (load_sym libgtk "gtk_status_icon_get_visible") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getX11WindowId_ = call (load_sym libgtk "gtk_status_icon_get_x11_window_id") (GObjectObjectClass.PolyML.cPtr --> FFI.UInt32.PolyML.cVal)
      val isEmbedded_ = call (load_sym libgtk "gtk_status_icon_is_embedded") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val setFromFile_ = call (load_sym libgtk "gtk_status_icon_set_from_file") (GObjectObjectClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> FFI.PolyML.cVoid)
      val setFromGicon_ = call (load_sym libgtk "gtk_status_icon_set_from_gicon") (GObjectObjectClass.PolyML.cPtr &&> GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val setFromIconName_ = call (load_sym libgtk "gtk_status_icon_set_from_icon_name") (GObjectObjectClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> FFI.PolyML.cVoid)
      val setFromPixbuf_ = call (load_sym libgtk "gtk_status_icon_set_from_pixbuf") (GObjectObjectClass.PolyML.cPtr &&> GObjectObjectClass.PolyML.cOptPtr --> FFI.PolyML.cVoid)
      val setFromStock_ = call (load_sym libgtk "gtk_status_icon_set_from_stock") (GObjectObjectClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> FFI.PolyML.cVoid)
      val setHasTooltip_ = call (load_sym libgtk "gtk_status_icon_set_has_tooltip") (GObjectObjectClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> FFI.PolyML.cVoid)
      val setName_ = call (load_sym libgtk "gtk_status_icon_set_name") (GObjectObjectClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> FFI.PolyML.cVoid)
      val setScreen_ = call (load_sym libgtk "gtk_status_icon_set_screen") (GObjectObjectClass.PolyML.cPtr &&> GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val setTitle_ = call (load_sym libgtk "gtk_status_icon_set_title") (GObjectObjectClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> FFI.PolyML.cVoid)
      val setTooltipMarkup_ = call (load_sym libgtk "gtk_status_icon_set_tooltip_markup") (GObjectObjectClass.PolyML.cPtr &&> Utf8.PolyML.cInOptPtr --> FFI.PolyML.cVoid)
      val setTooltipText_ = call (load_sym libgtk "gtk_status_icon_set_tooltip_text") (GObjectObjectClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> FFI.PolyML.cVoid)
      val setVisible_ = call (load_sym libgtk "gtk_status_icon_set_visible") (GObjectObjectClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> FFI.PolyML.cVoid)
    end
    type 'a class_t = 'a GtkStatusIconClass.t
    type 'a menu_class_t = 'a GtkMenuClass.t
    type 'a tooltip_class_t = 'a GtkTooltipClass.t
    type orientation_t = GtkOrientation.t
    type image_type_t = GtkImageType.t
    type t = base class_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkStatusIconClass.C.fromPtr true) new_ ()
    fun newFromFile filename = (Utf8.C.withPtr ---> GtkStatusIconClass.C.fromPtr true) newFromFile_ filename
    fun newFromGicon icon = (GObjectObjectClass.C.withPtr ---> GtkStatusIconClass.C.fromPtr true) newFromGicon_ icon
    fun newFromIconName iconName = (Utf8.C.withPtr ---> GtkStatusIconClass.C.fromPtr true) newFromIconName_ iconName
    fun newFromPixbuf pixbuf = (GObjectObjectClass.C.withPtr ---> GtkStatusIconClass.C.fromPtr true) newFromPixbuf_ pixbuf
    fun newFromStock stockId = (Utf8.C.withPtr ---> GtkStatusIconClass.C.fromPtr true) newFromStock_ stockId
    fun positionMenu menu userData =
      let
        val x
         & y
         & pushIn
         & () =
          (
            GObjectObjectClass.C.withPtr
             &&&> FFI.Int32.C.withRefVal
             &&&> FFI.Int32.C.withRefVal
             &&&> FFI.Bool.C.withRefVal
             &&&> GObjectObjectClass.C.withPtr
             ---> FFI.Int32.C.fromVal
                   && FFI.Int32.C.fromVal
                   && FFI.Bool.C.fromVal
                   && I
          )
            positionMenu_
            (
              menu
               & FFI.Int32.null
               & FFI.Int32.null
               & FFI.Bool.null
               & userData
            )
      in
        (
          x,
          y,
          pushIn
        )
      end
    fun getGeometry self =
      let
        val screen
         & area
         & orientation
         & retVal =
          (
            GObjectObjectClass.C.withPtr
             &&&> GObjectObjectClass.C.withRefOptPtr
             &&&> CairoRectangleIntRecord.C.withNewPtr
             &&&> GtkOrientation.C.withRefVal
             ---> GdkScreenClass.C.fromPtr false
                   && CairoRectangleIntRecord.C.fromPtr true
                   && GtkOrientation.C.fromVal
                   && FFI.Bool.C.fromVal
          )
            getGeometry_
            (
              self
               & NONE
               & ()
               & GtkOrientation.null
            )
      in
        if retVal
        then
          SOME
            (
              screen,
              area,
              orientation
            )
        else NONE
      end
    fun getGicon self = (GObjectObjectClass.C.withPtr ---> GioIconClass.C.fromPtr false) getGicon_ self
    fun getHasTooltip self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getHasTooltip_ self
    fun getIconName self = (GObjectObjectClass.C.withPtr ---> Utf8.C.fromPtr false) getIconName_ self
    fun getPixbuf self = (GObjectObjectClass.C.withPtr ---> GdkPixbufPixbufClass.C.fromPtr false) getPixbuf_ self
    fun getScreen self = (GObjectObjectClass.C.withPtr ---> GdkScreenClass.C.fromPtr false) getScreen_ self
    fun getSize self = (GObjectObjectClass.C.withPtr ---> FFI.Int32.C.fromVal) getSize_ self
    fun getStock self = (GObjectObjectClass.C.withPtr ---> Utf8.C.fromPtr false) getStock_ self
    fun getStorageType self = (GObjectObjectClass.C.withPtr ---> GtkImageType.C.fromVal) getStorageType_ self
    fun getTitle self = (GObjectObjectClass.C.withPtr ---> Utf8.C.fromPtr false) getTitle_ self
    fun getTooltipMarkup self = (GObjectObjectClass.C.withPtr ---> Utf8.C.fromPtr true) getTooltipMarkup_ self
    fun getTooltipText self = (GObjectObjectClass.C.withPtr ---> Utf8.C.fromPtr true) getTooltipText_ self
    fun getVisible self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getVisible_ self
    fun getX11WindowId self = (GObjectObjectClass.C.withPtr ---> FFI.UInt32.C.fromVal) getX11WindowId_ self
    fun isEmbedded self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) isEmbedded_ self
    fun setFromFile self filename = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withPtr ---> I) setFromFile_ (self & filename)
    fun setFromGicon self icon = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> I) setFromGicon_ (self & icon)
    fun setFromIconName self iconName = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withPtr ---> I) setFromIconName_ (self & iconName)
    fun setFromPixbuf self pixbuf = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withOptPtr ---> I) setFromPixbuf_ (self & pixbuf)
    fun setFromStock self stockId = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withPtr ---> I) setFromStock_ (self & stockId)
    fun setHasTooltip self hasTooltip = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setHasTooltip_ (self & hasTooltip)
    fun setName self name = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withPtr ---> I) setName_ (self & name)
    fun setScreen self screen = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> I) setScreen_ (self & screen)
    fun setTitle self title = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withPtr ---> I) setTitle_ (self & title)
    fun setTooltipMarkup self markup = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withOptPtr ---> I) setTooltipMarkup_ (self & markup)
    fun setTooltipText self text = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withPtr ---> I) setTooltipText_ (self & text)
    fun setVisible self visible = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setVisible_ (self & visible)
    local
      open ClosureMarshal Signal
    in
      fun activateSig f = signal "activate" (void ---> ret_void) f
      fun buttonPressEventSig f = signal "button-press-event" (get 0w1 GdkEventButtonRecord.t ---> ret boolean) f
      fun buttonReleaseEventSig f = signal "button-release-event" (get 0w1 GdkEventButtonRecord.t ---> ret boolean) f
      fun popupMenuSig f = signal "popup-menu" (get 0w1 uint &&&> get 0w2 uint ---> ret_void) (fn button & activateTime => f button activateTime)
      fun queryTooltipSig f =
        signal "query-tooltip"
          (
            get 0w1 int
             &&&> get 0w2 int
             &&&> get 0w3 boolean
             &&&> get 0w4 GtkTooltipClass.t
             ---> ret boolean
          )
          (
            fn
              x
               & y
               & keyboardMode
               & tooltip =>
                f x y keyboardMode tooltip
          )
      fun scrollEventSig f = signal "scroll-event" (get 0w1 GdkEventScrollRecord.t ---> ret boolean) f
      fun sizeChangedSig f = signal "size-changed" (get 0w1 int ---> ret boolean) f
    end
    local
      open Property
    in
      val embeddedProp = {get = fn x => get "embedded" boolean x}
      val fileProp = {set = fn x => set "file" stringOpt x}
      val giconProp =
        {
          get = fn x => get "gicon" GioIconClass.tOpt x,
          set = fn x => set "gicon" GioIconClass.tOpt x
        }
      val hasTooltipProp =
        {
          get = fn x => get "has-tooltip" boolean x,
          set = fn x => set "has-tooltip" boolean x
        }
      val iconNameProp =
        {
          get = fn x => get "icon-name" stringOpt x,
          set = fn x => set "icon-name" stringOpt x
        }
      val orientationProp = {get = fn x => get "orientation" GtkOrientation.t x}
      val pixbufProp =
        {
          get = fn x => get "pixbuf" GdkPixbufPixbufClass.tOpt x,
          set = fn x => set "pixbuf" GdkPixbufPixbufClass.tOpt x
        }
      val screenProp =
        {
          get = fn x => get "screen" GdkScreenClass.tOpt x,
          set = fn x => set "screen" GdkScreenClass.tOpt x
        }
      val sizeProp = {get = fn x => get "size" int x}
      val stockProp =
        {
          get = fn x => get "stock" stringOpt x,
          set = fn x => set "stock" stringOpt x
        }
      val storageTypeProp = {get = fn x => get "storage-type" GtkImageType.t x}
      val titleProp =
        {
          get = fn x => get "title" stringOpt x,
          set = fn x => set "title" stringOpt x
        }
      val tooltipMarkupProp =
        {
          get = fn x => get "tooltip-markup" stringOpt x,
          set = fn x => set "tooltip-markup" stringOpt x
        }
      val tooltipTextProp =
        {
          get = fn x => get "tooltip-text" stringOpt x,
          set = fn x => set "tooltip-text" stringOpt x
        }
      val visibleProp =
        {
          get = fn x => get "visible" boolean x,
          set = fn x => set "visible" boolean x
        }
    end
  end
