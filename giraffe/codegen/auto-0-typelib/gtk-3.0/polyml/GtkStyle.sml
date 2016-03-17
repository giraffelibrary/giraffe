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
            GObjectObjectClass.PolyML.cPtr
             &&> CairoContextRecord.PolyML.cPtr
             &&> GObjectObjectClass.PolyML.cPtr
             &&> GtkStateType.PolyML.cVal
             &&> FFI.Int32.PolyML.cVal
             &&> FFI.Int32.PolyML.cVal
             &&> FFI.Int32.PolyML.cVal
             &&> FFI.Int32.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
      val copy_ = call (load_sym libgtk "gtk_style_copy") (GObjectObjectClass.PolyML.cPtr --> GObjectObjectClass.PolyML.cPtr)
      val detach_ = call (load_sym libgtk "gtk_style_detach") (GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val hasContext_ = call (load_sym libgtk "gtk_style_has_context") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val lookupColor_ =
        call (load_sym libgtk "gtk_style_lookup_color")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GdkColorRecord.PolyML.cPtr
             --> FFI.Bool.PolyML.cVal
          )
      val lookupIconSet_ = call (load_sym libgtk "gtk_style_lookup_icon_set") (GObjectObjectClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GtkIconSetRecord.PolyML.cPtr)
      val renderIcon_ =
        call (load_sym libgtk "gtk_style_render_icon")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GtkIconSourceRecord.PolyML.cPtr
             &&> GtkTextDirection.PolyML.cVal
             &&> GtkStateType.PolyML.cVal
             &&> FFI.Int32.PolyML.cVal
             &&> GObjectObjectClass.PolyML.cOptPtr
             &&> Utf8.PolyML.cInOptPtr
             --> GObjectObjectClass.PolyML.cPtr
          )
      val setBackground_ =
        call (load_sym libgtk "gtk_style_set_background")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GObjectObjectClass.PolyML.cPtr
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
        GObjectObjectClass.C.withPtr
         &&&> CairoContextRecord.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> GtkStateType.C.withVal
         &&&> FFI.Int32.C.withVal
         &&&> FFI.Int32.C.withVal
         &&&> FFI.Int32.C.withVal
         &&&> FFI.Int32.C.withVal
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
    fun copy self = (GObjectObjectClass.C.withPtr ---> GtkStyleClass.C.fromPtr true) copy_ self
    fun detach self = (GObjectObjectClass.C.withPtr ---> I) detach_ self
    fun hasContext self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) hasContext_ self
    fun lookupColor self colorName =
      let
        val color & retVal =
          (
            GObjectObjectClass.C.withPtr
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
    fun lookupIconSet self stockId = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withPtr ---> GtkIconSetRecord.C.fromPtr false) lookupIconSet_ (self & stockId)
    fun renderIcon self source direction state size widget detail =
      (
        GObjectObjectClass.C.withPtr
         &&&> GtkIconSourceRecord.C.withPtr
         &&&> GtkTextDirection.C.withVal
         &&&> GtkStateType.C.withVal
         &&&> FFI.Int32.C.withVal
         &&&> GObjectObjectClass.C.withOptPtr
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
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
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
