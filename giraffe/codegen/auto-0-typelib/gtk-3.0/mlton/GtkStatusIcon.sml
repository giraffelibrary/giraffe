structure GtkStatusIcon :>
  GTK_STATUS_ICON
    where type 'a class = 'a GtkStatusIconClass.class
    where type 'a menu_class = 'a GtkMenuClass.class
    where type 'a tooltip_class = 'a GtkTooltipClass.class
    where type orientation_t = GtkOrientation.t
    where type image_type_t = GtkImageType.t =
  struct
    val getType_ = _import "gtk_status_icon_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "gtk_status_icon_new" : unit -> GtkStatusIconClass.C.notnull GtkStatusIconClass.C.p;
    val newFromFile_ = _import "mlton_gtk_status_icon_new_from_file" : Utf8.MLton.p1 * Utf8.C.notnull Utf8.MLton.p2 -> GtkStatusIconClass.C.notnull GtkStatusIconClass.C.p;
    val newFromGicon_ = _import "gtk_status_icon_new_from_gicon" : GioIconClass.C.notnull GioIconClass.C.p -> GtkStatusIconClass.C.notnull GtkStatusIconClass.C.p;
    val newFromIconName_ = _import "mlton_gtk_status_icon_new_from_icon_name" : Utf8.MLton.p1 * Utf8.C.notnull Utf8.MLton.p2 -> GtkStatusIconClass.C.notnull GtkStatusIconClass.C.p;
    val newFromPixbuf_ = _import "gtk_status_icon_new_from_pixbuf" : GdkPixbufPixbufClass.C.notnull GdkPixbufPixbufClass.C.p -> GtkStatusIconClass.C.notnull GtkStatusIconClass.C.p;
    val newFromStock_ = _import "mlton_gtk_status_icon_new_from_stock" : Utf8.MLton.p1 * Utf8.C.notnull Utf8.MLton.p2 -> GtkStatusIconClass.C.notnull GtkStatusIconClass.C.p;
    val positionMenu_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5 =>
          (
            _import "gtk_status_icon_position_menu" :
              GtkMenuClass.C.notnull GtkMenuClass.C.p
               * FFI.Int32.C.ref_
               * FFI.Int32.C.ref_
               * FFI.Bool.C.ref_
               * GtkStatusIconClass.C.notnull GtkStatusIconClass.C.p
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val getGeometry_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "gtk_status_icon_get_geometry" :
              GtkStatusIconClass.C.notnull GtkStatusIconClass.C.p
               * (unit, GdkScreenClass.C.notnull) GdkScreenClass.C.r
               * CairoRectangleIntRecord.C.notnull CairoRectangleIntRecord.C.p
               * GtkOrientation.C.ref_
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val getGicon_ = _import "gtk_status_icon_get_gicon" : GtkStatusIconClass.C.notnull GtkStatusIconClass.C.p -> GioIconClass.C.notnull GioIconClass.C.p;
    val getHasTooltip_ = _import "gtk_status_icon_get_has_tooltip" : GtkStatusIconClass.C.notnull GtkStatusIconClass.C.p -> FFI.Bool.C.val_;
    val getIconName_ = _import "gtk_status_icon_get_icon_name" : GtkStatusIconClass.C.notnull GtkStatusIconClass.C.p -> Utf8.C.notnull Utf8.C.out_p;
    val getPixbuf_ = _import "gtk_status_icon_get_pixbuf" : GtkStatusIconClass.C.notnull GtkStatusIconClass.C.p -> GdkPixbufPixbufClass.C.notnull GdkPixbufPixbufClass.C.p;
    val getScreen_ = _import "gtk_status_icon_get_screen" : GtkStatusIconClass.C.notnull GtkStatusIconClass.C.p -> GdkScreenClass.C.notnull GdkScreenClass.C.p;
    val getSize_ = _import "gtk_status_icon_get_size" : GtkStatusIconClass.C.notnull GtkStatusIconClass.C.p -> FFI.Int32.C.val_;
    val getStock_ = _import "gtk_status_icon_get_stock" : GtkStatusIconClass.C.notnull GtkStatusIconClass.C.p -> Utf8.C.notnull Utf8.C.out_p;
    val getStorageType_ = _import "gtk_status_icon_get_storage_type" : GtkStatusIconClass.C.notnull GtkStatusIconClass.C.p -> GtkImageType.C.val_;
    val getTitle_ = _import "gtk_status_icon_get_title" : GtkStatusIconClass.C.notnull GtkStatusIconClass.C.p -> Utf8.C.notnull Utf8.C.out_p;
    val getTooltipMarkup_ = _import "gtk_status_icon_get_tooltip_markup" : GtkStatusIconClass.C.notnull GtkStatusIconClass.C.p -> Utf8.C.notnull Utf8.C.out_p;
    val getTooltipText_ = _import "gtk_status_icon_get_tooltip_text" : GtkStatusIconClass.C.notnull GtkStatusIconClass.C.p -> Utf8.C.notnull Utf8.C.out_p;
    val getVisible_ = _import "gtk_status_icon_get_visible" : GtkStatusIconClass.C.notnull GtkStatusIconClass.C.p -> FFI.Bool.C.val_;
    val getX11WindowId_ = _import "gtk_status_icon_get_x11_window_id" : GtkStatusIconClass.C.notnull GtkStatusIconClass.C.p -> FFI.UInt32.C.val_;
    val isEmbedded_ = _import "gtk_status_icon_is_embedded" : GtkStatusIconClass.C.notnull GtkStatusIconClass.C.p -> FFI.Bool.C.val_;
    val setFromFile_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_status_icon_set_from_file" :
              GtkStatusIconClass.C.notnull GtkStatusIconClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setFromGicon_ = fn x1 & x2 => (_import "gtk_status_icon_set_from_gicon" : GtkStatusIconClass.C.notnull GtkStatusIconClass.C.p * GioIconClass.C.notnull GioIconClass.C.p -> unit;) (x1, x2)
    val setFromIconName_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_status_icon_set_from_icon_name" :
              GtkStatusIconClass.C.notnull GtkStatusIconClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setFromPixbuf_ = fn x1 & x2 => (_import "gtk_status_icon_set_from_pixbuf" : GtkStatusIconClass.C.notnull GtkStatusIconClass.C.p * unit GdkPixbufPixbufClass.C.p -> unit;) (x1, x2)
    val setFromStock_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_status_icon_set_from_stock" :
              GtkStatusIconClass.C.notnull GtkStatusIconClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setHasTooltip_ = fn x1 & x2 => (_import "gtk_status_icon_set_has_tooltip" : GtkStatusIconClass.C.notnull GtkStatusIconClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setName_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_status_icon_set_name" :
              GtkStatusIconClass.C.notnull GtkStatusIconClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setScreen_ = fn x1 & x2 => (_import "gtk_status_icon_set_screen" : GtkStatusIconClass.C.notnull GtkStatusIconClass.C.p * GdkScreenClass.C.notnull GdkScreenClass.C.p -> unit;) (x1, x2)
    val setTitle_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_status_icon_set_title" :
              GtkStatusIconClass.C.notnull GtkStatusIconClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setTooltipMarkup_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_status_icon_set_tooltip_markup" :
              GtkStatusIconClass.C.notnull GtkStatusIconClass.C.p
               * Utf8.MLton.p1
               * unit Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setTooltipText_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_status_icon_set_tooltip_text" :
              GtkStatusIconClass.C.notnull GtkStatusIconClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setVisible_ = fn x1 & x2 => (_import "gtk_status_icon_set_visible" : GtkStatusIconClass.C.notnull GtkStatusIconClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    type 'a class = 'a GtkStatusIconClass.class
    type 'a menu_class = 'a GtkMenuClass.class
    type 'a tooltip_class = 'a GtkTooltipClass.class
    type orientation_t = GtkOrientation.t
    type image_type_t = GtkImageType.t
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkStatusIconClass.C.fromPtr true) new_ ()
    fun newFromFile filename = (Utf8.C.withPtr ---> GtkStatusIconClass.C.fromPtr true) newFromFile_ filename
    fun newFromGicon icon = (GioIconClass.C.withPtr ---> GtkStatusIconClass.C.fromPtr true) newFromGicon_ icon
    fun newFromIconName iconName = (Utf8.C.withPtr ---> GtkStatusIconClass.C.fromPtr true) newFromIconName_ iconName
    fun newFromPixbuf pixbuf = (GdkPixbufPixbufClass.C.withPtr ---> GtkStatusIconClass.C.fromPtr true) newFromPixbuf_ pixbuf
    fun newFromStock stockId = (Utf8.C.withPtr ---> GtkStatusIconClass.C.fromPtr true) newFromStock_ stockId
    fun positionMenu menu userData =
      let
        val x
         & y
         & pushIn
         & () =
          (
            GtkMenuClass.C.withPtr
             &&&> FFI.Int32.C.withRefVal
             &&&> FFI.Int32.C.withRefVal
             &&&> FFI.Bool.C.withRefVal
             &&&> GtkStatusIconClass.C.withPtr
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
            GtkStatusIconClass.C.withPtr
             &&&> GdkScreenClass.C.withRefOptPtr
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
    fun getGicon self = (GtkStatusIconClass.C.withPtr ---> GioIconClass.C.fromPtr false) getGicon_ self
    fun getHasTooltip self = (GtkStatusIconClass.C.withPtr ---> FFI.Bool.C.fromVal) getHasTooltip_ self
    fun getIconName self = (GtkStatusIconClass.C.withPtr ---> Utf8.C.fromPtr false) getIconName_ self
    fun getPixbuf self = (GtkStatusIconClass.C.withPtr ---> GdkPixbufPixbufClass.C.fromPtr false) getPixbuf_ self
    fun getScreen self = (GtkStatusIconClass.C.withPtr ---> GdkScreenClass.C.fromPtr false) getScreen_ self
    fun getSize self = (GtkStatusIconClass.C.withPtr ---> FFI.Int32.C.fromVal) getSize_ self
    fun getStock self = (GtkStatusIconClass.C.withPtr ---> Utf8.C.fromPtr false) getStock_ self
    fun getStorageType self = (GtkStatusIconClass.C.withPtr ---> GtkImageType.C.fromVal) getStorageType_ self
    fun getTitle self = (GtkStatusIconClass.C.withPtr ---> Utf8.C.fromPtr false) getTitle_ self
    fun getTooltipMarkup self = (GtkStatusIconClass.C.withPtr ---> Utf8.C.fromPtr true) getTooltipMarkup_ self
    fun getTooltipText self = (GtkStatusIconClass.C.withPtr ---> Utf8.C.fromPtr true) getTooltipText_ self
    fun getVisible self = (GtkStatusIconClass.C.withPtr ---> FFI.Bool.C.fromVal) getVisible_ self
    fun getX11WindowId self = (GtkStatusIconClass.C.withPtr ---> FFI.UInt32.C.fromVal) getX11WindowId_ self
    fun isEmbedded self = (GtkStatusIconClass.C.withPtr ---> FFI.Bool.C.fromVal) isEmbedded_ self
    fun setFromFile self filename = (GtkStatusIconClass.C.withPtr &&&> Utf8.C.withPtr ---> I) setFromFile_ (self & filename)
    fun setFromGicon self icon = (GtkStatusIconClass.C.withPtr &&&> GioIconClass.C.withPtr ---> I) setFromGicon_ (self & icon)
    fun setFromIconName self iconName = (GtkStatusIconClass.C.withPtr &&&> Utf8.C.withPtr ---> I) setFromIconName_ (self & iconName)
    fun setFromPixbuf self pixbuf = (GtkStatusIconClass.C.withPtr &&&> GdkPixbufPixbufClass.C.withOptPtr ---> I) setFromPixbuf_ (self & pixbuf)
    fun setFromStock self stockId = (GtkStatusIconClass.C.withPtr &&&> Utf8.C.withPtr ---> I) setFromStock_ (self & stockId)
    fun setHasTooltip self hasTooltip = (GtkStatusIconClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setHasTooltip_ (self & hasTooltip)
    fun setName self name = (GtkStatusIconClass.C.withPtr &&&> Utf8.C.withPtr ---> I) setName_ (self & name)
    fun setScreen self screen = (GtkStatusIconClass.C.withPtr &&&> GdkScreenClass.C.withPtr ---> I) setScreen_ (self & screen)
    fun setTitle self title = (GtkStatusIconClass.C.withPtr &&&> Utf8.C.withPtr ---> I) setTitle_ (self & title)
    fun setTooltipMarkup self markup = (GtkStatusIconClass.C.withPtr &&&> Utf8.C.withOptPtr ---> I) setTooltipMarkup_ (self & markup)
    fun setTooltipText self text = (GtkStatusIconClass.C.withPtr &&&> Utf8.C.withPtr ---> I) setTooltipText_ (self & text)
    fun setVisible self visible = (GtkStatusIconClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setVisible_ (self & visible)
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
