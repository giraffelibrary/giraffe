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
      val getType_ = call (getSymbol "gtk_status_icon_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "gtk_status_icon_new") (cVoid --> GtkStatusIconClass.PolyML.cPtr)
      val newFromFile_ = call (getSymbol "gtk_status_icon_new_from_file") (Utf8.PolyML.cInPtr --> GtkStatusIconClass.PolyML.cPtr)
      val newFromGicon_ = call (getSymbol "gtk_status_icon_new_from_gicon") (GioIconClass.PolyML.cPtr --> GtkStatusIconClass.PolyML.cPtr)
      val newFromIconName_ = call (getSymbol "gtk_status_icon_new_from_icon_name") (Utf8.PolyML.cInPtr --> GtkStatusIconClass.PolyML.cPtr)
      val newFromPixbuf_ = call (getSymbol "gtk_status_icon_new_from_pixbuf") (GdkPixbufPixbufClass.PolyML.cPtr --> GtkStatusIconClass.PolyML.cPtr)
      val newFromStock_ = call (getSymbol "gtk_status_icon_new_from_stock") (Utf8.PolyML.cInPtr --> GtkStatusIconClass.PolyML.cPtr)
      val positionMenu_ =
        call (getSymbol "gtk_status_icon_position_menu")
          (
            GtkMenuClass.PolyML.cPtr
             &&> GInt.PolyML.cRef
             &&> GInt.PolyML.cRef
             &&> GBool.PolyML.cRef
             &&> GtkStatusIconClass.PolyML.cPtr
             --> cVoid
          )
      val getGeometry_ =
        call (getSymbol "gtk_status_icon_get_geometry")
          (
            GtkStatusIconClass.PolyML.cPtr
             &&> GdkScreenClass.PolyML.cOutRef
             &&> GdkRectangleRecord.PolyML.cPtr
             &&> GtkOrientation.PolyML.cRef
             --> GBool.PolyML.cVal
          )
      val getGicon_ = call (getSymbol "gtk_status_icon_get_gicon") (GtkStatusIconClass.PolyML.cPtr --> GioIconClass.PolyML.cOptPtr)
      val getHasTooltip_ = call (getSymbol "gtk_status_icon_get_has_tooltip") (GtkStatusIconClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getIconName_ = call (getSymbol "gtk_status_icon_get_icon_name") (GtkStatusIconClass.PolyML.cPtr --> Utf8.PolyML.cOutOptPtr)
      val getPixbuf_ = call (getSymbol "gtk_status_icon_get_pixbuf") (GtkStatusIconClass.PolyML.cPtr --> GdkPixbufPixbufClass.PolyML.cOptPtr)
      val getScreen_ = call (getSymbol "gtk_status_icon_get_screen") (GtkStatusIconClass.PolyML.cPtr --> GdkScreenClass.PolyML.cPtr)
      val getSize_ = call (getSymbol "gtk_status_icon_get_size") (GtkStatusIconClass.PolyML.cPtr --> GInt.PolyML.cVal)
      val getStock_ = call (getSymbol "gtk_status_icon_get_stock") (GtkStatusIconClass.PolyML.cPtr --> Utf8.PolyML.cOutOptPtr)
      val getStorageType_ = call (getSymbol "gtk_status_icon_get_storage_type") (GtkStatusIconClass.PolyML.cPtr --> GtkImageType.PolyML.cVal)
      val getTitle_ = call (getSymbol "gtk_status_icon_get_title") (GtkStatusIconClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getTooltipMarkup_ = call (getSymbol "gtk_status_icon_get_tooltip_markup") (GtkStatusIconClass.PolyML.cPtr --> Utf8.PolyML.cOutOptPtr)
      val getTooltipText_ = call (getSymbol "gtk_status_icon_get_tooltip_text") (GtkStatusIconClass.PolyML.cPtr --> Utf8.PolyML.cOutOptPtr)
      val getVisible_ = call (getSymbol "gtk_status_icon_get_visible") (GtkStatusIconClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getX11WindowId_ = call (getSymbol "gtk_status_icon_get_x11_window_id") (GtkStatusIconClass.PolyML.cPtr --> GUInt32.PolyML.cVal)
      val isEmbedded_ = call (getSymbol "gtk_status_icon_is_embedded") (GtkStatusIconClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val setFromFile_ = call (getSymbol "gtk_status_icon_set_from_file") (GtkStatusIconClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> cVoid)
      val setFromGicon_ = call (getSymbol "gtk_status_icon_set_from_gicon") (GtkStatusIconClass.PolyML.cPtr &&> GioIconClass.PolyML.cPtr --> cVoid)
      val setFromIconName_ = call (getSymbol "gtk_status_icon_set_from_icon_name") (GtkStatusIconClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> cVoid)
      val setFromPixbuf_ = call (getSymbol "gtk_status_icon_set_from_pixbuf") (GtkStatusIconClass.PolyML.cPtr &&> GdkPixbufPixbufClass.PolyML.cOptPtr --> cVoid)
      val setFromStock_ = call (getSymbol "gtk_status_icon_set_from_stock") (GtkStatusIconClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> cVoid)
      val setHasTooltip_ = call (getSymbol "gtk_status_icon_set_has_tooltip") (GtkStatusIconClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setName_ = call (getSymbol "gtk_status_icon_set_name") (GtkStatusIconClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> cVoid)
      val setScreen_ = call (getSymbol "gtk_status_icon_set_screen") (GtkStatusIconClass.PolyML.cPtr &&> GdkScreenClass.PolyML.cPtr --> cVoid)
      val setTitle_ = call (getSymbol "gtk_status_icon_set_title") (GtkStatusIconClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> cVoid)
      val setTooltipMarkup_ = call (getSymbol "gtk_status_icon_set_tooltip_markup") (GtkStatusIconClass.PolyML.cPtr &&> Utf8.PolyML.cInOptPtr --> cVoid)
      val setTooltipText_ = call (getSymbol "gtk_status_icon_set_tooltip_text") (GtkStatusIconClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> cVoid)
      val setVisible_ = call (getSymbol "gtk_status_icon_set_visible") (GtkStatusIconClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
    end
    type 'a class = 'a GtkStatusIconClass.class
    type 'a menu_class = 'a GtkMenuClass.class
    type 'a tooltip_class = 'a GtkTooltipClass.class
    type orientation_t = GtkOrientation.t
    type image_type_t = GtkImageType.t
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkStatusIconClass.FFI.fromPtr true) new_ ()
    fun newFromFile filename = (Utf8.FFI.withPtr 0 ---> GtkStatusIconClass.FFI.fromPtr true) newFromFile_ filename
    fun newFromGicon icon = (GioIconClass.FFI.withPtr false ---> GtkStatusIconClass.FFI.fromPtr true) newFromGicon_ icon
    fun newFromIconName iconName = (Utf8.FFI.withPtr 0 ---> GtkStatusIconClass.FFI.fromPtr true) newFromIconName_ iconName
    fun newFromPixbuf pixbuf = (GdkPixbufPixbufClass.FFI.withPtr false ---> GtkStatusIconClass.FFI.fromPtr true) newFromPixbuf_ pixbuf
    fun newFromStock stockId = (Utf8.FFI.withPtr 0 ---> GtkStatusIconClass.FFI.fromPtr true) newFromStock_ stockId
    fun positionMenu
      (
        menu,
        x,
        y,
        userData
      ) =
      let
        val x
         & y
         & pushIn
         & () =
          (
            GtkMenuClass.FFI.withPtr false
             &&&> GInt.FFI.withRefVal
             &&&> GInt.FFI.withRefVal
             &&&> GBool.FFI.withRefVal
             &&&> GtkStatusIconClass.FFI.withPtr false
             ---> GInt.FFI.fromVal
                   && GInt.FFI.fromVal
                   && GBool.FFI.fromVal
                   && I
          )
            positionMenu_
            (
              menu
               & x
               & y
               & GBool.null
               & userData
            )
      in
        (
          pushIn,
          x,
          y
        )
      end
    fun getGeometry self =
      let
        val screen
         & area
         & orientation
         & retVal =
          (
            GtkStatusIconClass.FFI.withPtr false
             &&&> GdkScreenClass.FFI.withRefOptPtr false
             &&&> GdkRectangleRecord.FFI.withNewPtr
             &&&> GtkOrientation.FFI.withRefVal
             ---> GdkScreenClass.FFI.fromPtr false
                   && GdkRectangleRecord.FFI.fromPtr true
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
    fun getGicon self = (GtkStatusIconClass.FFI.withPtr false ---> GioIconClass.FFI.fromOptPtr false) getGicon_ self
    fun getHasTooltip self = (GtkStatusIconClass.FFI.withPtr false ---> GBool.FFI.fromVal) getHasTooltip_ self
    fun getIconName self = (GtkStatusIconClass.FFI.withPtr false ---> Utf8.FFI.fromOptPtr 0) getIconName_ self
    fun getPixbuf self = (GtkStatusIconClass.FFI.withPtr false ---> GdkPixbufPixbufClass.FFI.fromOptPtr false) getPixbuf_ self
    fun getScreen self = (GtkStatusIconClass.FFI.withPtr false ---> GdkScreenClass.FFI.fromPtr false) getScreen_ self
    fun getSize self = (GtkStatusIconClass.FFI.withPtr false ---> GInt.FFI.fromVal) getSize_ self
    fun getStock self = (GtkStatusIconClass.FFI.withPtr false ---> Utf8.FFI.fromOptPtr 0) getStock_ self
    fun getStorageType self = (GtkStatusIconClass.FFI.withPtr false ---> GtkImageType.FFI.fromVal) getStorageType_ self
    fun getTitle self = (GtkStatusIconClass.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getTitle_ self
    fun getTooltipMarkup self = (GtkStatusIconClass.FFI.withPtr false ---> Utf8.FFI.fromOptPtr ~1) getTooltipMarkup_ self
    fun getTooltipText self = (GtkStatusIconClass.FFI.withPtr false ---> Utf8.FFI.fromOptPtr ~1) getTooltipText_ self
    fun getVisible self = (GtkStatusIconClass.FFI.withPtr false ---> GBool.FFI.fromVal) getVisible_ self
    fun getX11WindowId self = (GtkStatusIconClass.FFI.withPtr false ---> GUInt32.FFI.fromVal) getX11WindowId_ self
    fun isEmbedded self = (GtkStatusIconClass.FFI.withPtr false ---> GBool.FFI.fromVal) isEmbedded_ self
    fun setFromFile self filename = (GtkStatusIconClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> I) setFromFile_ (self & filename)
    fun setFromGicon self icon = (GtkStatusIconClass.FFI.withPtr false &&&> GioIconClass.FFI.withPtr false ---> I) setFromGicon_ (self & icon)
    fun setFromIconName self iconName = (GtkStatusIconClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> I) setFromIconName_ (self & iconName)
    fun setFromPixbuf self pixbuf = (GtkStatusIconClass.FFI.withPtr false &&&> GdkPixbufPixbufClass.FFI.withOptPtr false ---> I) setFromPixbuf_ (self & pixbuf)
    fun setFromStock self stockId = (GtkStatusIconClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> I) setFromStock_ (self & stockId)
    fun setHasTooltip self hasTooltip = (GtkStatusIconClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setHasTooltip_ (self & hasTooltip)
    fun setName self name = (GtkStatusIconClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> I) setName_ (self & name)
    fun setScreen self screen = (GtkStatusIconClass.FFI.withPtr false &&&> GdkScreenClass.FFI.withPtr false ---> I) setScreen_ (self & screen)
    fun setTitle self title = (GtkStatusIconClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> I) setTitle_ (self & title)
    fun setTooltipMarkup self markup = (GtkStatusIconClass.FFI.withPtr false &&&> Utf8.FFI.withOptPtr 0 ---> I) setTooltipMarkup_ (self & markup)
    fun setTooltipText self text = (GtkStatusIconClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> I) setTooltipText_ (self & text)
    fun setVisible self visible = (GtkStatusIconClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setVisible_ (self & visible)
    local
      open ClosureMarshal Signal
    in
      fun activateSig f = signal "activate" (void ---> ret_void) f
      fun buttonPressEventSig f = signal "button-press-event" (get 0w1 GdkEventButtonRecord.t ---> ret boolean) f
      fun buttonReleaseEventSig f = signal "button-release-event" (get 0w1 GdkEventButtonRecord.t ---> ret boolean) f
      fun popupMenuSig f = signal "popup-menu" (get 0w1 uint &&&> get 0w2 uint ---> ret_void) (fn button & activateTime => f (button, activateTime))
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
                f
                  (
                    x,
                    y,
                    keyboardMode,
                    tooltip
                  )
          )
      fun scrollEventSig f = signal "scroll-event" (get 0w1 GdkEventScrollRecord.t ---> ret boolean) f
      fun sizeChangedSig f = signal "size-changed" (get 0w1 int ---> ret boolean) f
    end
    local
      open Property
    in
      val embeddedProp = {get = fn x => get "embedded" boolean x}
      val fileProp =
        {
          set = fn x => set "file" stringOpt x,
          new = fn x => new "file" stringOpt x
        }
      val giconProp =
        {
          get = fn x => get "gicon" GioIconClass.tOpt x,
          set = fn x => set "gicon" GioIconClass.tOpt x,
          new = fn x => new "gicon" GioIconClass.tOpt x
        }
      val hasTooltipProp =
        {
          get = fn x => get "has-tooltip" boolean x,
          set = fn x => set "has-tooltip" boolean x,
          new = fn x => new "has-tooltip" boolean x
        }
      val iconNameProp =
        {
          get = fn x => get "icon-name" stringOpt x,
          set = fn x => set "icon-name" stringOpt x,
          new = fn x => new "icon-name" stringOpt x
        }
      val orientationProp = {get = fn x => get "orientation" GtkOrientation.t x}
      val pixbufProp =
        {
          get = fn x => get "pixbuf" GdkPixbufPixbufClass.tOpt x,
          set = fn x => set "pixbuf" GdkPixbufPixbufClass.tOpt x,
          new = fn x => new "pixbuf" GdkPixbufPixbufClass.tOpt x
        }
      val screenProp =
        {
          get = fn x => get "screen" GdkScreenClass.tOpt x,
          set = fn x => set "screen" GdkScreenClass.tOpt x,
          new = fn x => new "screen" GdkScreenClass.tOpt x
        }
      val sizeProp = {get = fn x => get "size" int x}
      val stockProp =
        {
          get = fn x => get "stock" stringOpt x,
          set = fn x => set "stock" stringOpt x,
          new = fn x => new "stock" stringOpt x
        }
      val storageTypeProp = {get = fn x => get "storage-type" GtkImageType.t x}
      val titleProp =
        {
          get = fn x => get "title" stringOpt x,
          set = fn x => set "title" stringOpt x,
          new = fn x => new "title" stringOpt x
        }
      val tooltipMarkupProp =
        {
          get = fn x => get "tooltip-markup" stringOpt x,
          set = fn x => set "tooltip-markup" stringOpt x,
          new = fn x => new "tooltip-markup" stringOpt x
        }
      val tooltipTextProp =
        {
          get = fn x => get "tooltip-text" stringOpt x,
          set = fn x => set "tooltip-text" stringOpt x,
          new = fn x => new "tooltip-text" stringOpt x
        }
      val visibleProp =
        {
          get = fn x => get "visible" boolean x,
          set = fn x => set "visible" boolean x,
          new = fn x => new "visible" boolean x
        }
    end
  end
