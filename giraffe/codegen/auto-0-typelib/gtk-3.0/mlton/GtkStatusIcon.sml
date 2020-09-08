structure GtkStatusIcon :>
  GTK_STATUS_ICON
    where type 'a class = 'a GtkStatusIconClass.class
    where type 'a menu_class = 'a GtkMenuClass.class
    where type 'a tooltip_class = 'a GtkTooltipClass.class
    where type orientation_t = GtkOrientation.t
    where type image_type_t = GtkImageType.t =
  struct
    val getType_ = _import "gtk_status_icon_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "gtk_status_icon_new" : unit -> GtkStatusIconClass.FFI.non_opt GtkStatusIconClass.FFI.p;
    val newFromFile_ = _import "mlton_gtk_status_icon_new_from_file" : Utf8.MLton.p1 * Utf8.FFI.non_opt Utf8.MLton.p2 -> GtkStatusIconClass.FFI.non_opt GtkStatusIconClass.FFI.p;
    val newFromGicon_ = _import "gtk_status_icon_new_from_gicon" : GioIconClass.FFI.non_opt GioIconClass.FFI.p -> GtkStatusIconClass.FFI.non_opt GtkStatusIconClass.FFI.p;
    val newFromIconName_ = _import "mlton_gtk_status_icon_new_from_icon_name" : Utf8.MLton.p1 * Utf8.FFI.non_opt Utf8.MLton.p2 -> GtkStatusIconClass.FFI.non_opt GtkStatusIconClass.FFI.p;
    val newFromPixbuf_ = _import "gtk_status_icon_new_from_pixbuf" : GdkPixbufPixbufClass.FFI.non_opt GdkPixbufPixbufClass.FFI.p -> GtkStatusIconClass.FFI.non_opt GtkStatusIconClass.FFI.p;
    val newFromStock_ = _import "mlton_gtk_status_icon_new_from_stock" : Utf8.MLton.p1 * Utf8.FFI.non_opt Utf8.MLton.p2 -> GtkStatusIconClass.FFI.non_opt GtkStatusIconClass.FFI.p;
    val positionMenu_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5 =>
          (
            _import "gtk_status_icon_position_menu" :
              GtkMenuClass.FFI.non_opt GtkMenuClass.FFI.p
               * GInt32.FFI.ref_
               * GInt32.FFI.ref_
               * GBool.FFI.ref_
               * GtkStatusIconClass.FFI.non_opt GtkStatusIconClass.FFI.p
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
              GtkStatusIconClass.FFI.non_opt GtkStatusIconClass.FFI.p
               * (GdkScreenClass.FFI.opt, GdkScreenClass.FFI.non_opt) GdkScreenClass.FFI.r
               * GdkRectangleRecord.FFI.non_opt GdkRectangleRecord.FFI.p
               * GtkOrientation.FFI.ref_
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val getGicon_ = _import "gtk_status_icon_get_gicon" : GtkStatusIconClass.FFI.non_opt GtkStatusIconClass.FFI.p -> GioIconClass.FFI.opt GioIconClass.FFI.p;
    val getHasTooltip_ = _import "gtk_status_icon_get_has_tooltip" : GtkStatusIconClass.FFI.non_opt GtkStatusIconClass.FFI.p -> GBool.FFI.val_;
    val getIconName_ = _import "gtk_status_icon_get_icon_name" : GtkStatusIconClass.FFI.non_opt GtkStatusIconClass.FFI.p -> Utf8.FFI.opt Utf8.FFI.out_p;
    val getPixbuf_ = _import "gtk_status_icon_get_pixbuf" : GtkStatusIconClass.FFI.non_opt GtkStatusIconClass.FFI.p -> GdkPixbufPixbufClass.FFI.opt GdkPixbufPixbufClass.FFI.p;
    val getScreen_ = _import "gtk_status_icon_get_screen" : GtkStatusIconClass.FFI.non_opt GtkStatusIconClass.FFI.p -> GdkScreenClass.FFI.non_opt GdkScreenClass.FFI.p;
    val getSize_ = _import "gtk_status_icon_get_size" : GtkStatusIconClass.FFI.non_opt GtkStatusIconClass.FFI.p -> GInt32.FFI.val_;
    val getStock_ = _import "gtk_status_icon_get_stock" : GtkStatusIconClass.FFI.non_opt GtkStatusIconClass.FFI.p -> Utf8.FFI.opt Utf8.FFI.out_p;
    val getStorageType_ = _import "gtk_status_icon_get_storage_type" : GtkStatusIconClass.FFI.non_opt GtkStatusIconClass.FFI.p -> GtkImageType.FFI.val_;
    val getTitle_ = _import "gtk_status_icon_get_title" : GtkStatusIconClass.FFI.non_opt GtkStatusIconClass.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val getTooltipMarkup_ = _import "gtk_status_icon_get_tooltip_markup" : GtkStatusIconClass.FFI.non_opt GtkStatusIconClass.FFI.p -> Utf8.FFI.opt Utf8.FFI.out_p;
    val getTooltipText_ = _import "gtk_status_icon_get_tooltip_text" : GtkStatusIconClass.FFI.non_opt GtkStatusIconClass.FFI.p -> Utf8.FFI.opt Utf8.FFI.out_p;
    val getVisible_ = _import "gtk_status_icon_get_visible" : GtkStatusIconClass.FFI.non_opt GtkStatusIconClass.FFI.p -> GBool.FFI.val_;
    val getX11WindowId_ = _import "gtk_status_icon_get_x11_window_id" : GtkStatusIconClass.FFI.non_opt GtkStatusIconClass.FFI.p -> GUInt32.FFI.val_;
    val isEmbedded_ = _import "gtk_status_icon_is_embedded" : GtkStatusIconClass.FFI.non_opt GtkStatusIconClass.FFI.p -> GBool.FFI.val_;
    val setFromFile_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_status_icon_set_from_file" :
              GtkStatusIconClass.FFI.non_opt GtkStatusIconClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setFromGicon_ = fn x1 & x2 => (_import "gtk_status_icon_set_from_gicon" : GtkStatusIconClass.FFI.non_opt GtkStatusIconClass.FFI.p * GioIconClass.FFI.non_opt GioIconClass.FFI.p -> unit;) (x1, x2)
    val setFromIconName_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_status_icon_set_from_icon_name" :
              GtkStatusIconClass.FFI.non_opt GtkStatusIconClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setFromPixbuf_ = fn x1 & x2 => (_import "gtk_status_icon_set_from_pixbuf" : GtkStatusIconClass.FFI.non_opt GtkStatusIconClass.FFI.p * GdkPixbufPixbufClass.FFI.opt GdkPixbufPixbufClass.FFI.p -> unit;) (x1, x2)
    val setFromStock_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_status_icon_set_from_stock" :
              GtkStatusIconClass.FFI.non_opt GtkStatusIconClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setHasTooltip_ = fn x1 & x2 => (_import "gtk_status_icon_set_has_tooltip" : GtkStatusIconClass.FFI.non_opt GtkStatusIconClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setName_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_status_icon_set_name" :
              GtkStatusIconClass.FFI.non_opt GtkStatusIconClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setScreen_ = fn x1 & x2 => (_import "gtk_status_icon_set_screen" : GtkStatusIconClass.FFI.non_opt GtkStatusIconClass.FFI.p * GdkScreenClass.FFI.non_opt GdkScreenClass.FFI.p -> unit;) (x1, x2)
    val setTitle_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_status_icon_set_title" :
              GtkStatusIconClass.FFI.non_opt GtkStatusIconClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
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
              GtkStatusIconClass.FFI.non_opt GtkStatusIconClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.opt Utf8.MLton.p2
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
              GtkStatusIconClass.FFI.non_opt GtkStatusIconClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setVisible_ = fn x1 & x2 => (_import "gtk_status_icon_set_visible" : GtkStatusIconClass.FFI.non_opt GtkStatusIconClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
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
             &&&> GInt32.FFI.withRefVal
             &&&> GInt32.FFI.withRefVal
             &&&> GBool.FFI.withRefVal
             &&&> GtkStatusIconClass.FFI.withPtr false
             ---> GInt32.FFI.fromVal
                   && GInt32.FFI.fromVal
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
    fun getSize self = (GtkStatusIconClass.FFI.withPtr false ---> GInt32.FFI.fromVal) getSize_ self
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
      open ValueAccessor
    in
      val embeddedProp =
        {
          name = "embedded",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = ignore,
          init = ignore
        }
      val fileProp =
        {
          name = "file",
          gtype = fn () => C.gtype stringOpt (),
          get = ignore,
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
      val hasTooltipProp =
        {
          name = "has-tooltip",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val iconNameProp =
        {
          name = "icon-name",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = fn x => C.set stringOpt x,
          init = fn x => C.set stringOpt x
        }
      val orientationProp =
        {
          name = "orientation",
          gtype = fn () => C.gtype GtkOrientation.t (),
          get = fn x => fn () => C.get GtkOrientation.t x,
          set = ignore,
          init = ignore
        }
      val pixbufProp =
        {
          name = "pixbuf",
          gtype = fn () => C.gtype GdkPixbufPixbufClass.tOpt (),
          get = fn x => fn () => C.get GdkPixbufPixbufClass.tOpt x,
          set = fn x => C.set GdkPixbufPixbufClass.tOpt x,
          init = fn x => C.set GdkPixbufPixbufClass.tOpt x
        }
      val screenProp =
        {
          name = "screen",
          gtype = fn () => C.gtype GdkScreenClass.tOpt (),
          get = fn x => fn () => C.get GdkScreenClass.tOpt x,
          set = fn x => C.set GdkScreenClass.tOpt x,
          init = fn x => C.set GdkScreenClass.tOpt x
        }
      val sizeProp =
        {
          name = "size",
          gtype = fn () => C.gtype int (),
          get = fn x => fn () => C.get int x,
          set = ignore,
          init = ignore
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
      val titleProp =
        {
          name = "title",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = fn x => C.set stringOpt x,
          init = fn x => C.set stringOpt x
        }
      val tooltipMarkupProp =
        {
          name = "tooltip-markup",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = fn x => C.set stringOpt x,
          init = fn x => C.set stringOpt x
        }
      val tooltipTextProp =
        {
          name = "tooltip-text",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = fn x => C.set stringOpt x,
          init = fn x => C.set stringOpt x
        }
      val visibleProp =
        {
          name = "visible",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
    end
  end
