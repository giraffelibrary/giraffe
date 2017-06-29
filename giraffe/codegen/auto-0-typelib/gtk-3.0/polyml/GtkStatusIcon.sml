structure GtkStatusIcon :>
  GTK_STATUS_ICON
    where type 'a class = 'a GtkStatusIconClass.class
    where type 'a menu_class = 'a GtkMenuClass.class
    where type 'a tooltip_class = 'a GtkTooltipClass.class
    where type orientation_t = GtkOrientation.t
    where type image_type_t = GtkImageType.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_status_icon_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "gtk_status_icon_new") (PolyMLFFI.cVoid --> GtkStatusIconClass.PolyML.cPtr)
      val newFromFile_ = call (getSymbol "gtk_status_icon_new_from_file") (Utf8.PolyML.cInPtr --> GtkStatusIconClass.PolyML.cPtr)
      val newFromGicon_ = call (getSymbol "gtk_status_icon_new_from_gicon") (GioIconClass.PolyML.cPtr --> GtkStatusIconClass.PolyML.cPtr)
      val newFromIconName_ = call (getSymbol "gtk_status_icon_new_from_icon_name") (Utf8.PolyML.cInPtr --> GtkStatusIconClass.PolyML.cPtr)
      val newFromPixbuf_ = call (getSymbol "gtk_status_icon_new_from_pixbuf") (GdkPixbufPixbufClass.PolyML.cPtr --> GtkStatusIconClass.PolyML.cPtr)
      val newFromStock_ = call (getSymbol "gtk_status_icon_new_from_stock") (Utf8.PolyML.cInPtr --> GtkStatusIconClass.PolyML.cPtr)
      val positionMenu_ =
        call (getSymbol "gtk_status_icon_position_menu")
          (
            GtkMenuClass.PolyML.cPtr
             &&> GInt32.PolyML.cRef
             &&> GInt32.PolyML.cRef
             &&> GBool.PolyML.cRef
             &&> GtkStatusIconClass.PolyML.cPtr
             --> PolyMLFFI.cVoid
          )
      val getGeometry_ =
        call (getSymbol "gtk_status_icon_get_geometry")
          (
            GtkStatusIconClass.PolyML.cPtr
             &&> GdkScreenClass.PolyML.cOutRef
             &&> CairoRectangleIntRecord.PolyML.cPtr
             &&> GtkOrientation.PolyML.cRef
             --> GBool.PolyML.cVal
          )
      val getGicon_ = call (getSymbol "gtk_status_icon_get_gicon") (GtkStatusIconClass.PolyML.cPtr --> GioIconClass.PolyML.cPtr)
      val getHasTooltip_ = call (getSymbol "gtk_status_icon_get_has_tooltip") (GtkStatusIconClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getIconName_ = call (getSymbol "gtk_status_icon_get_icon_name") (GtkStatusIconClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getPixbuf_ = call (getSymbol "gtk_status_icon_get_pixbuf") (GtkStatusIconClass.PolyML.cPtr --> GdkPixbufPixbufClass.PolyML.cPtr)
      val getScreen_ = call (getSymbol "gtk_status_icon_get_screen") (GtkStatusIconClass.PolyML.cPtr --> GdkScreenClass.PolyML.cPtr)
      val getSize_ = call (getSymbol "gtk_status_icon_get_size") (GtkStatusIconClass.PolyML.cPtr --> GInt32.PolyML.cVal)
      val getStock_ = call (getSymbol "gtk_status_icon_get_stock") (GtkStatusIconClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getStorageType_ = call (getSymbol "gtk_status_icon_get_storage_type") (GtkStatusIconClass.PolyML.cPtr --> GtkImageType.PolyML.cVal)
      val getTitle_ = call (getSymbol "gtk_status_icon_get_title") (GtkStatusIconClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getTooltipMarkup_ = call (getSymbol "gtk_status_icon_get_tooltip_markup") (GtkStatusIconClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getTooltipText_ = call (getSymbol "gtk_status_icon_get_tooltip_text") (GtkStatusIconClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getVisible_ = call (getSymbol "gtk_status_icon_get_visible") (GtkStatusIconClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getX11WindowId_ = call (getSymbol "gtk_status_icon_get_x11_window_id") (GtkStatusIconClass.PolyML.cPtr --> GUInt32.PolyML.cVal)
      val isEmbedded_ = call (getSymbol "gtk_status_icon_is_embedded") (GtkStatusIconClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val setFromFile_ = call (getSymbol "gtk_status_icon_set_from_file") (GtkStatusIconClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> PolyMLFFI.cVoid)
      val setFromGicon_ = call (getSymbol "gtk_status_icon_set_from_gicon") (GtkStatusIconClass.PolyML.cPtr &&> GioIconClass.PolyML.cPtr --> PolyMLFFI.cVoid)
      val setFromIconName_ = call (getSymbol "gtk_status_icon_set_from_icon_name") (GtkStatusIconClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> PolyMLFFI.cVoid)
      val setFromPixbuf_ = call (getSymbol "gtk_status_icon_set_from_pixbuf") (GtkStatusIconClass.PolyML.cPtr &&> GdkPixbufPixbufClass.PolyML.cOptPtr --> PolyMLFFI.cVoid)
      val setFromStock_ = call (getSymbol "gtk_status_icon_set_from_stock") (GtkStatusIconClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> PolyMLFFI.cVoid)
      val setHasTooltip_ = call (getSymbol "gtk_status_icon_set_has_tooltip") (GtkStatusIconClass.PolyML.cPtr &&> GBool.PolyML.cVal --> PolyMLFFI.cVoid)
      val setName_ = call (getSymbol "gtk_status_icon_set_name") (GtkStatusIconClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> PolyMLFFI.cVoid)
      val setScreen_ = call (getSymbol "gtk_status_icon_set_screen") (GtkStatusIconClass.PolyML.cPtr &&> GdkScreenClass.PolyML.cPtr --> PolyMLFFI.cVoid)
      val setTitle_ = call (getSymbol "gtk_status_icon_set_title") (GtkStatusIconClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> PolyMLFFI.cVoid)
      val setTooltipMarkup_ = call (getSymbol "gtk_status_icon_set_tooltip_markup") (GtkStatusIconClass.PolyML.cPtr &&> Utf8.PolyML.cInOptPtr --> PolyMLFFI.cVoid)
      val setTooltipText_ = call (getSymbol "gtk_status_icon_set_tooltip_text") (GtkStatusIconClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> PolyMLFFI.cVoid)
      val setVisible_ = call (getSymbol "gtk_status_icon_set_visible") (GtkStatusIconClass.PolyML.cPtr &&> GBool.PolyML.cVal --> PolyMLFFI.cVoid)
    end
    type 'a class = 'a GtkStatusIconClass.class
    type 'a menu_class = 'a GtkMenuClass.class
    type 'a tooltip_class = 'a GtkTooltipClass.class
    type orientation_t = GtkOrientation.t
    type image_type_t = GtkImageType.t
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkStatusIconClass.FFI.fromPtr true) new_ ()
    fun newFromFile filename = (Utf8.FFI.withPtr ---> GtkStatusIconClass.FFI.fromPtr true) newFromFile_ filename
    fun newFromGicon icon = (GioIconClass.FFI.withPtr ---> GtkStatusIconClass.FFI.fromPtr true) newFromGicon_ icon
    fun newFromIconName iconName = (Utf8.FFI.withPtr ---> GtkStatusIconClass.FFI.fromPtr true) newFromIconName_ iconName
    fun newFromPixbuf pixbuf = (GdkPixbufPixbufClass.FFI.withPtr ---> GtkStatusIconClass.FFI.fromPtr true) newFromPixbuf_ pixbuf
    fun newFromStock stockId = (Utf8.FFI.withPtr ---> GtkStatusIconClass.FFI.fromPtr true) newFromStock_ stockId
    fun positionMenu menu userData =
      let
        val x
         & y
         & pushIn
         & () =
          (
            GtkMenuClass.FFI.withPtr
             &&&> GInt32.FFI.withRefVal
             &&&> GInt32.FFI.withRefVal
             &&&> GBool.FFI.withRefVal
             &&&> GtkStatusIconClass.FFI.withPtr
             ---> GInt32.FFI.fromVal
                   && GInt32.FFI.fromVal
                   && GBool.FFI.fromVal
                   && I
          )
            positionMenu_
            (
              menu
               & GInt32.null
               & GInt32.null
               & GBool.null
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
            GtkStatusIconClass.FFI.withPtr
             &&&> GdkScreenClass.FFI.withRefOptPtr
             &&&> CairoRectangleIntRecord.FFI.withNewPtr
             &&&> GtkOrientation.FFI.withRefVal
             ---> GdkScreenClass.FFI.fromPtr false
                   && CairoRectangleIntRecord.FFI.fromPtr true
                   && GtkOrientation.FFI.fromVal
                   && GBool.FFI.fromVal
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
    fun getGicon self = (GtkStatusIconClass.FFI.withPtr ---> GioIconClass.FFI.fromPtr false) getGicon_ self
    fun getHasTooltip self = (GtkStatusIconClass.FFI.withPtr ---> GBool.FFI.fromVal) getHasTooltip_ self
    fun getIconName self = (GtkStatusIconClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getIconName_ self
    fun getPixbuf self = (GtkStatusIconClass.FFI.withPtr ---> GdkPixbufPixbufClass.FFI.fromPtr false) getPixbuf_ self
    fun getScreen self = (GtkStatusIconClass.FFI.withPtr ---> GdkScreenClass.FFI.fromPtr false) getScreen_ self
    fun getSize self = (GtkStatusIconClass.FFI.withPtr ---> GInt32.FFI.fromVal) getSize_ self
    fun getStock self = (GtkStatusIconClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getStock_ self
    fun getStorageType self = (GtkStatusIconClass.FFI.withPtr ---> GtkImageType.FFI.fromVal) getStorageType_ self
    fun getTitle self = (GtkStatusIconClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getTitle_ self
    fun getTooltipMarkup self = (GtkStatusIconClass.FFI.withPtr ---> Utf8.FFI.fromPtr 1) getTooltipMarkup_ self
    fun getTooltipText self = (GtkStatusIconClass.FFI.withPtr ---> Utf8.FFI.fromPtr 1) getTooltipText_ self
    fun getVisible self = (GtkStatusIconClass.FFI.withPtr ---> GBool.FFI.fromVal) getVisible_ self
    fun getX11WindowId self = (GtkStatusIconClass.FFI.withPtr ---> GUInt32.FFI.fromVal) getX11WindowId_ self
    fun isEmbedded self = (GtkStatusIconClass.FFI.withPtr ---> GBool.FFI.fromVal) isEmbedded_ self
    fun setFromFile self filename = (GtkStatusIconClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> I) setFromFile_ (self & filename)
    fun setFromGicon self icon = (GtkStatusIconClass.FFI.withPtr &&&> GioIconClass.FFI.withPtr ---> I) setFromGicon_ (self & icon)
    fun setFromIconName self iconName = (GtkStatusIconClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> I) setFromIconName_ (self & iconName)
    fun setFromPixbuf self pixbuf = (GtkStatusIconClass.FFI.withPtr &&&> GdkPixbufPixbufClass.FFI.withOptPtr ---> I) setFromPixbuf_ (self & pixbuf)
    fun setFromStock self stockId = (GtkStatusIconClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> I) setFromStock_ (self & stockId)
    fun setHasTooltip self hasTooltip = (GtkStatusIconClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setHasTooltip_ (self & hasTooltip)
    fun setName self name = (GtkStatusIconClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> I) setName_ (self & name)
    fun setScreen self screen = (GtkStatusIconClass.FFI.withPtr &&&> GdkScreenClass.FFI.withPtr ---> I) setScreen_ (self & screen)
    fun setTitle self title = (GtkStatusIconClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> I) setTitle_ (self & title)
    fun setTooltipMarkup self markup = (GtkStatusIconClass.FFI.withPtr &&&> Utf8.FFI.withOptPtr ---> I) setTooltipMarkup_ (self & markup)
    fun setTooltipText self text = (GtkStatusIconClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> I) setTooltipText_ (self & text)
    fun setVisible self visible = (GtkStatusIconClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setVisible_ (self & visible)
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
