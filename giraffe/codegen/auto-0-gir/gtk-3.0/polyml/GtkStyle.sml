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
      val getType_ = call (load_sym libgtk "gtk_style_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val applyDefaultBackground_ =
        call (load_sym libgtk "gtk_style_apply_default_background")
          (
            GtkStyleClass.PolyML.cPtr
             &&> CairoContextRecord.PolyML.cPtr
             &&> GdkWindowClass.PolyML.cPtr
             &&> GtkStateType.PolyML.cVal
             &&> FFI.Int.PolyML.cVal
             &&> FFI.Int.PolyML.cVal
             &&> FFI.Int.PolyML.cVal
             &&> FFI.Int.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
      val copy_ = call (load_sym libgtk "gtk_style_copy") (GtkStyleClass.PolyML.cPtr --> GtkStyleClass.PolyML.cPtr)
      val detach_ = call (load_sym libgtk "gtk_style_detach") (GtkStyleClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val hasContext_ = call (load_sym libgtk "gtk_style_has_context") (GtkStyleClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val lookupColor_ =
        call (load_sym libgtk "gtk_style_lookup_color")
          (
            GtkStyleClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GdkColorRecord.PolyML.cPtr
             --> FFI.Bool.PolyML.cVal
          )
      val lookupIconSet_ = call (load_sym libgtk "gtk_style_lookup_icon_set") (GtkStyleClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GtkIconSetRecord.PolyML.cPtr)
      val renderIcon_ =
        call (load_sym libgtk "gtk_style_render_icon")
          (
            GtkStyleClass.PolyML.cPtr
             &&> GtkIconSourceRecord.PolyML.cPtr
             &&> GtkTextDirection.PolyML.cVal
             &&> GtkStateType.PolyML.cVal
             &&> FFI.Int.PolyML.cVal
             &&> GtkWidgetClass.PolyML.cOptPtr
             &&> Utf8.PolyML.cInOptPtr
             --> GdkPixbufPixbufClass.PolyML.cPtr
          )
      val setBackground_ =
        call (load_sym libgtk "gtk_style_set_background")
          (
            GtkStyleClass.PolyML.cPtr
             &&> GdkWindowClass.PolyML.cPtr
             &&> GtkStateType.PolyML.cVal
             --> FFI.PolyML.cVoid
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
