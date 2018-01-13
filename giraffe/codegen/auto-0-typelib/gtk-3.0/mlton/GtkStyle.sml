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
    val new_ = _import "gtk_style_new" : unit -> GtkStyleClass.FFI.notnull GtkStyleClass.FFI.p;
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
              GtkStyleClass.FFI.notnull GtkStyleClass.FFI.p
               * CairoContextRecord.FFI.notnull CairoContextRecord.FFI.p
               * GdkWindowClass.FFI.notnull GdkWindowClass.FFI.p
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
    val copy_ = _import "gtk_style_copy" : GtkStyleClass.FFI.notnull GtkStyleClass.FFI.p -> GtkStyleClass.FFI.notnull GtkStyleClass.FFI.p;
    val detach_ = _import "gtk_style_detach" : GtkStyleClass.FFI.notnull GtkStyleClass.FFI.p -> unit;
    val getStyleProperty_ =
      fn
        x1
         & x2
         & (x3, x4)
         & x5 =>
          (
            _import "mlton_gtk_style_get_style_property" :
              GtkStyleClass.FFI.notnull GtkStyleClass.FFI.p
               * GObjectType.FFI.val_
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val hasContext_ = _import "gtk_style_has_context" : GtkStyleClass.FFI.notnull GtkStyleClass.FFI.p -> GBool.FFI.val_;
    val lookupColor_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_gtk_style_lookup_color" :
              GtkStyleClass.FFI.notnull GtkStyleClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * GdkColorRecord.FFI.notnull GdkColorRecord.FFI.p
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
              GtkStyleClass.FFI.notnull GtkStyleClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               -> GtkIconSetRecord.FFI.notnull GtkIconSetRecord.FFI.p;
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
              GtkStyleClass.FFI.notnull GtkStyleClass.FFI.p
               * GtkIconSourceRecord.FFI.notnull GtkIconSourceRecord.FFI.p
               * GtkTextDirection.FFI.val_
               * GtkStateType.FFI.val_
               * GInt32.FFI.val_
               * unit GtkWidgetClass.FFI.p
               * Utf8.MLton.p1
               * unit Utf8.MLton.p2
               -> GdkPixbufPixbufClass.FFI.notnull GdkPixbufPixbufClass.FFI.p;
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
              GtkStyleClass.FFI.notnull GtkStyleClass.FFI.p
               * GdkWindowClass.FFI.notnull GdkWindowClass.FFI.p
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
        GtkStyleClass.FFI.withPtr
         &&&> CairoContextRecord.FFI.withPtr
         &&&> GdkWindowClass.FFI.withPtr
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
    fun copy self = (GtkStyleClass.FFI.withPtr ---> GtkStyleClass.FFI.fromPtr true) copy_ self
    fun detach self = (GtkStyleClass.FFI.withPtr ---> I) detach_ self
    fun getStyleProperty self (widgetType, propertyName) =
      let
        val value & () =
          (
            GtkStyleClass.FFI.withPtr
             &&&> GObjectType.FFI.withVal
             &&&> Utf8.FFI.withPtr
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
    fun hasContext self = (GtkStyleClass.FFI.withPtr ---> GBool.FFI.fromVal) hasContext_ self
    fun lookupColor self colorName =
      let
        val color & retVal =
          (
            GtkStyleClass.FFI.withPtr
             &&&> Utf8.FFI.withPtr
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
    fun lookupIconSet self stockId = (GtkStyleClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> GtkIconSetRecord.FFI.fromPtr false) lookupIconSet_ (self & stockId)
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
        GtkStyleClass.FFI.withPtr
         &&&> GtkIconSourceRecord.FFI.withPtr
         &&&> GtkTextDirection.FFI.withVal
         &&&> GtkStateType.FFI.withVal
         &&&> GInt32.FFI.withVal
         &&&> GtkWidgetClass.FFI.withOptPtr
         &&&> Utf8.FFI.withOptPtr
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
        GtkStyleClass.FFI.withPtr
         &&&> GdkWindowClass.FFI.withPtr
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
      open Property
    in
      val contextProp =
        {
          get = fn x => get "context" GtkStyleContextClass.tOpt x,
          set = fn x => set "context" GtkStyleContextClass.tOpt x
        }
    end
  end
