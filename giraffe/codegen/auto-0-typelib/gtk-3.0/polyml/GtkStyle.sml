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
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_style_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "gtk_style_new") (cVoid --> GtkStyleClass.PolyML.cPtr)
      val applyDefaultBackground_ =
        call (getSymbol "gtk_style_apply_default_background")
          (
            GtkStyleClass.PolyML.cPtr
             &&> CairoContextRecord.PolyML.cPtr
             &&> GdkWindowClass.PolyML.cPtr
             &&> GtkStateType.PolyML.cVal
             &&> GInt32.PolyML.cVal
             &&> GInt32.PolyML.cVal
             &&> GInt32.PolyML.cVal
             &&> GInt32.PolyML.cVal
             --> cVoid
          )
      val copy_ = call (getSymbol "gtk_style_copy") (GtkStyleClass.PolyML.cPtr --> GtkStyleClass.PolyML.cPtr)
      val detach_ = call (getSymbol "gtk_style_detach") (GtkStyleClass.PolyML.cPtr --> cVoid)
      val hasContext_ = call (getSymbol "gtk_style_has_context") (GtkStyleClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val lookupColor_ =
        call (getSymbol "gtk_style_lookup_color")
          (
            GtkStyleClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GdkColorRecord.PolyML.cPtr
             --> GBool.PolyML.cVal
          )
      val lookupIconSet_ = call (getSymbol "gtk_style_lookup_icon_set") (GtkStyleClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GtkIconSetRecord.PolyML.cPtr)
      val renderIcon_ =
        call (getSymbol "gtk_style_render_icon")
          (
            GtkStyleClass.PolyML.cPtr
             &&> GtkIconSourceRecord.PolyML.cPtr
             &&> GtkTextDirection.PolyML.cVal
             &&> GtkStateType.PolyML.cVal
             &&> GInt32.PolyML.cVal
             &&> GtkWidgetClass.PolyML.cOptPtr
             &&> Utf8.PolyML.cInOptPtr
             --> GdkPixbufPixbufClass.PolyML.cPtr
          )
      val setBackground_ =
        call (getSymbol "gtk_style_set_background")
          (
            GtkStyleClass.PolyML.cPtr
             &&> GdkWindowClass.PolyML.cPtr
             &&> GtkStateType.PolyML.cVal
             --> cVoid
          )
    end
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
