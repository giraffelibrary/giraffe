structure GtkStyle :>
  GTK_STYLE
    where type 'a class = 'a GtkStyleClass.class
    where type icon_set_t = GtkIconSetRecord.t
    where type 'a widget_class = 'a GtkWidgetClass.class
    where type text_direction_t = GtkTextDirection.t
    where type icon_source_t = GtkIconSourceRecord.t
    where type state_type_t = GtkStateType.t
    where type 'a style_context_class = 'a GtkStyleContextClass.class =
  struct
    val getType_ = _import "gtk_style_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "gtk_style_new" : unit -> GtkStyleClass.FFI.non_opt GtkStyleClass.FFI.p;
    val applyDefaultBackground_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5
         & x6
         & x7
         & x8 =>
          (
            _import "gtk_style_apply_default_background" :
              GtkStyleClass.FFI.non_opt GtkStyleClass.FFI.p
               * CairoContextRecord.FFI.non_opt CairoContextRecord.FFI.p
               * GdkWindowClass.FFI.non_opt GdkWindowClass.FFI.p
               * GtkStateType.FFI.val_
               * GInt32.FFI.val_
               * GInt32.FFI.val_
               * GInt32.FFI.val_
               * GInt32.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6,
              x7,
              x8
            )
    val copy_ = _import "gtk_style_copy" : GtkStyleClass.FFI.non_opt GtkStyleClass.FFI.p -> GtkStyleClass.FFI.non_opt GtkStyleClass.FFI.p;
    val detach_ = _import "gtk_style_detach" : GtkStyleClass.FFI.non_opt GtkStyleClass.FFI.p -> unit;
    val getStyleProperty_ =
      fn
        x1
         & x2
         & (x3, x4)
         & x5 =>
          (
            _import "mlton_gtk_style_get_style_property" :
              GtkStyleClass.FFI.non_opt GtkStyleClass.FFI.p
               * GObjectType.FFI.val_
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GObjectValueRecord.FFI.non_opt GObjectValueRecord.FFI.p
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val hasContext_ = _import "gtk_style_has_context" : GtkStyleClass.FFI.non_opt GtkStyleClass.FFI.p -> GBool.FFI.val_;
    val lookupColor_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_gtk_style_lookup_color" :
              GtkStyleClass.FFI.non_opt GtkStyleClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GdkColorRecord.FFI.non_opt GdkColorRecord.FFI.p
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val lookupIconSet_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_style_lookup_icon_set" :
              GtkStyleClass.FFI.non_opt GtkStyleClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> GtkIconSetRecord.FFI.non_opt GtkIconSetRecord.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    val renderIcon_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5
         & x6
         & (x7, x8) =>
          (
            _import "mlton_gtk_style_render_icon" :
              GtkStyleClass.FFI.non_opt GtkStyleClass.FFI.p
               * GtkIconSourceRecord.FFI.non_opt GtkIconSourceRecord.FFI.p
               * GtkTextDirection.FFI.val_
               * GtkStateType.FFI.val_
               * GInt32.FFI.val_
               * GtkWidgetClass.FFI.opt GtkWidgetClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.opt Utf8.MLton.p2
               -> GdkPixbufPixbufClass.FFI.non_opt GdkPixbufPixbufClass.FFI.p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6,
              x7,
              x8
            )
    val setBackground_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_style_set_background" :
              GtkStyleClass.FFI.non_opt GtkStyleClass.FFI.p
               * GdkWindowClass.FFI.non_opt GdkWindowClass.FFI.p
               * GtkStateType.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    type 'a class = 'a GtkStyleClass.class
    type icon_set_t = GtkIconSetRecord.t
    type 'a widget_class = 'a GtkWidgetClass.class
    type text_direction_t = GtkTextDirection.t
    type icon_source_t = GtkIconSourceRecord.t
    type state_type_t = GtkStateType.t
    type 'a style_context_class = 'a GtkStyleContextClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkStyleClass.FFI.fromPtr true) new_ ()
    fun applyDefaultBackground
      self
      (
        cr,
        window,
        stateType,
        x,
        y,
        width,
        height
      ) =
      (
        GtkStyleClass.FFI.withPtr false
         &&&> CairoContextRecord.FFI.withPtr false
         &&&> GdkWindowClass.FFI.withPtr false
         &&&> GtkStateType.FFI.withVal
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         ---> I
      )
        applyDefaultBackground_
        (
          self
           & cr
           & window
           & stateType
           & x
           & y
           & width
           & height
        )
    fun copy self = (GtkStyleClass.FFI.withPtr false ---> GtkStyleClass.FFI.fromPtr true) copy_ self
    fun detach self = (GtkStyleClass.FFI.withPtr false ---> I) detach_ self
    fun getStyleProperty self (widgetType, propertyName) =
      let
        val value & () =
          (
            GtkStyleClass.FFI.withPtr false
             &&&> GObjectType.FFI.withVal
             &&&> Utf8.FFI.withPtr 0
             &&&> GObjectValueRecord.FFI.withNewPtr
             ---> GObjectValueRecord.FFI.fromPtr true && I
          )
            getStyleProperty_
            (
              self
               & widgetType
               & propertyName
               & ()
            )
      in
        value
      end
    fun hasContext self = (GtkStyleClass.FFI.withPtr false ---> GBool.FFI.fromVal) hasContext_ self
    fun lookupColor self colorName =
      let
        val color & retVal =
          (
            GtkStyleClass.FFI.withPtr false
             &&&> Utf8.FFI.withPtr 0
             &&&> GdkColorRecord.FFI.withNewPtr
             ---> GdkColorRecord.FFI.fromPtr true && GBool.FFI.fromVal
          )
            lookupColor_
            (
              self
               & colorName
               & ()
            )
      in
        if retVal then SOME color else NONE
      end
    fun lookupIconSet self stockId = (GtkStyleClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> GtkIconSetRecord.FFI.fromPtr false) lookupIconSet_ (self & stockId) before GtkStyleClass.FFI.touchPtr self before Utf8.FFI.touchPtr stockId
    fun renderIcon
      self
      (
        source,
        direction,
        state,
        size,
        widget,
        detail
      ) =
      (
        GtkStyleClass.FFI.withPtr false
         &&&> GtkIconSourceRecord.FFI.withPtr false
         &&&> GtkTextDirection.FFI.withVal
         &&&> GtkStateType.FFI.withVal
         &&&> GInt32.FFI.withVal
         &&&> GtkWidgetClass.FFI.withOptPtr false
         &&&> Utf8.FFI.withOptPtr 0
         ---> GdkPixbufPixbufClass.FFI.fromPtr true
      )
        renderIcon_
        (
          self
           & source
           & direction
           & state
           & size
           & widget
           & detail
        )
    fun setBackground self (window, stateType) =
      (
        GtkStyleClass.FFI.withPtr false
         &&&> GdkWindowClass.FFI.withPtr false
         &&&> GtkStateType.FFI.withVal
         ---> I
      )
        setBackground_
        (
          self
           & window
           & stateType
        )
    local
      open ClosureMarshal Signal
    in
      fun realizeSig f = signal "realize" (void ---> ret_void) f
      fun unrealizeSig f = signal "unrealize" (void ---> ret_void) f
    end
    local
      open ValueAccessor
    in
      val contextProp =
        {
          name = "context",
          gtype = fn () => C.gtype GtkStyleContextClass.tOpt (),
          get = fn x => fn () => C.get GtkStyleContextClass.tOpt x,
          set = ignore,
          init = fn x => C.set GtkStyleContextClass.tOpt x
        }
    end
  end
