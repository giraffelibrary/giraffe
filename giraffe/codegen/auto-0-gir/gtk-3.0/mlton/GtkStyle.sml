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
    val getType_ = _import "gtk_style_get_type" : unit -> GObjectType.C.val_;
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
              GtkStyleClass.C.notnull GtkStyleClass.C.p
               * CairoContextRecord.C.notnull CairoContextRecord.C.p
               * GdkWindowClass.C.notnull GdkWindowClass.C.p
               * GtkStateType.C.val_
               * FFI.Int.C.val_
               * FFI.Int.C.val_
               * FFI.Int.C.val_
               * FFI.Int.C.val_
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
    val copy_ = _import "gtk_style_copy" : GtkStyleClass.C.notnull GtkStyleClass.C.p -> GtkStyleClass.C.notnull GtkStyleClass.C.p;
    val detach_ = _import "gtk_style_detach" : GtkStyleClass.C.notnull GtkStyleClass.C.p -> unit;
    val hasContext_ = _import "gtk_style_has_context" : GtkStyleClass.C.notnull GtkStyleClass.C.p -> FFI.Bool.C.val_;
    val lookupColor_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_gtk_style_lookup_color" :
              GtkStyleClass.C.notnull GtkStyleClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * GdkColorRecord.C.notnull GdkColorRecord.C.p
               -> FFI.Bool.C.val_;
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
              GtkStyleClass.C.notnull GtkStyleClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               -> GtkIconSetRecord.C.notnull GtkIconSetRecord.C.p;
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
              GtkStyleClass.C.notnull GtkStyleClass.C.p
               * GtkIconSourceRecord.C.notnull GtkIconSourceRecord.C.p
               * GtkTextDirection.C.val_
               * GtkStateType.C.val_
               * FFI.Int.C.val_
               * unit GtkWidgetClass.C.p
               * Utf8.MLton.p1
               * unit Utf8.MLton.p2
               -> GdkPixbufPixbufClass.C.notnull GdkPixbufPixbufClass.C.p;
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
              GtkStyleClass.C.notnull GtkStyleClass.C.p
               * GdkWindowClass.C.notnull GdkWindowClass.C.p
               * GtkStateType.C.val_
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
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun applyDefaultBackground self cr window stateType x y width height =
      (
        GtkStyleClass.C.withPtr
         &&&> CairoContextRecord.C.withPtr
         &&&> GdkWindowClass.C.withPtr
         &&&> GtkStateType.C.withVal
         &&&> FFI.Int.C.withVal
         &&&> FFI.Int.C.withVal
         &&&> FFI.Int.C.withVal
         &&&> FFI.Int.C.withVal
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
    fun copy self = (GtkStyleClass.C.withPtr ---> GtkStyleClass.C.fromPtr true) copy_ self
    fun detach self = (GtkStyleClass.C.withPtr ---> I) detach_ self
    fun hasContext self = (GtkStyleClass.C.withPtr ---> FFI.Bool.C.fromVal) hasContext_ self
    fun lookupColor self colorName =
      let
        val color & retVal =
          (
            GtkStyleClass.C.withPtr
             &&&> Utf8.C.withPtr
             &&&> GdkColorRecord.C.withNewPtr
             ---> GdkColorRecord.C.fromPtr true && FFI.Bool.C.fromVal
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
    fun lookupIconSet self stockId = (GtkStyleClass.C.withPtr &&&> Utf8.C.withPtr ---> GtkIconSetRecord.C.fromPtr false) lookupIconSet_ (self & stockId)
    fun renderIcon self source direction state size widget detail =
      (
        GtkStyleClass.C.withPtr
         &&&> GtkIconSourceRecord.C.withPtr
         &&&> GtkTextDirection.C.withVal
         &&&> GtkStateType.C.withVal
         &&&> FFI.Int.C.withVal
         &&&> GtkWidgetClass.C.withOptPtr
         &&&> Utf8.C.withOptPtr
         ---> GdkPixbufPixbufClass.C.fromPtr true
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
    fun setBackground self window stateType =
      (
        GtkStyleClass.C.withPtr
         &&&> GdkWindowClass.C.withPtr
         &&&> GtkStateType.C.withVal
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
