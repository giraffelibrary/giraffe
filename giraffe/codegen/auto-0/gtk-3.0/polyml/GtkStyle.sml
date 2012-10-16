structure GtkStyle :>
  GTK_STYLE
    where type 'a class_t = 'a GtkStyleClass.t
    where type iconsetrecord_t = GtkIconSetRecord.t
    where type 'a widgetclass_t = 'a GtkWidgetClass.t
    where type textdirection_t = GtkTextDirection.t
    where type iconsourcerecord_t = GtkIconSourceRecord.t
    where type statetype_t = GtkStateType.t
    where type 'a stylecontextclass_t = 'a GtkStyleContextClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_style_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val applyDefaultBackground_ =
        call (load_sym libgtk "gtk_style_apply_default_background")
          (
            GObjectObjectClass.PolyML.PTR
             &&> CairoContextRecord.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> GtkStateType.PolyML.VAL
             &&> FFI.PolyML.Int32.VAL
             &&> FFI.PolyML.Int32.VAL
             &&> FFI.PolyML.Int32.VAL
             &&> FFI.PolyML.Int32.VAL
             --> FFI.PolyML.VOID
          )
      val copy_ = call (load_sym libgtk "gtk_style_copy") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val detach_ = call (load_sym libgtk "gtk_style_detach") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val hasContext_ = call (load_sym libgtk "gtk_style_has_context") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.Bool.VAL)
      val lookupColor_ =
        call (load_sym libgtk "gtk_style_lookup_color")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.PolyML.String.INPTR
             &&> GdkColorRecord.PolyML.PTR
             --> FFI.PolyML.Bool.VAL
          )
      val lookupIconSet_ = call (load_sym libgtk "gtk_style_lookup_icon_set") (GObjectObjectClass.PolyML.PTR &&> FFI.PolyML.String.INPTR --> GtkIconSetRecord.PolyML.PTR)
      val renderIcon_ =
        call (load_sym libgtk "gtk_style_render_icon")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GtkIconSourceRecord.PolyML.PTR
             &&> GtkTextDirection.PolyML.VAL
             &&> GtkStateType.PolyML.VAL
             &&> FFI.PolyML.Int32.VAL
             &&> GObjectObjectClass.PolyML.OPTPTR
             &&> FFI.PolyML.String.INOPTPTR
             --> GObjectObjectClass.PolyML.PTR
          )
      val setBackground_ =
        call (load_sym libgtk "gtk_style_set_background")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> GtkStateType.PolyML.VAL
             --> FFI.PolyML.VOID
          )
    end
    type 'a class_t = 'a GtkStyleClass.t
    type iconsetrecord_t = GtkIconSetRecord.t
    type 'a widgetclass_t = 'a GtkWidgetClass.t
    type textdirection_t = GtkTextDirection.t
    type iconsourcerecord_t = GtkIconSourceRecord.t
    type statetype_t = GtkStateType.t
    type 'a stylecontextclass_t = 'a GtkStyleContextClass.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun applyDefaultBackground self cr window stateType x y width height =
      (
        GObjectObjectClass.C.withPtr
         &&&> CairoContextRecord.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> GtkStateType.C.withVal
         &&&> FFI.Int32.withVal
         &&&> FFI.Int32.withVal
         &&&> FFI.Int32.withVal
         &&&> FFI.Int32.withVal
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
    fun hasContext self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.fromVal) hasContext_ self
    fun lookupColor self colorName =
      let
        val color & retVal =
          (
            GObjectObjectClass.C.withPtr
             &&&> FFI.String.withConstPtr
             &&&> GdkColorRecord.C.withNewPtr
             ---> GdkColorRecord.C.fromPtr true && FFI.Bool.fromVal
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
    fun lookupIconSet self stockId = (GObjectObjectClass.C.withPtr &&&> FFI.String.withConstPtr ---> GtkIconSetRecord.C.fromPtr false) lookupIconSet_ (self & stockId)
    fun renderIcon self source direction state size widget detail =
      (
        GObjectObjectClass.C.withPtr
         &&&> GtkIconSourceRecord.C.withPtr
         &&&> GtkTextDirection.C.withVal
         &&&> GtkStateType.C.withVal
         &&&> FFI.Int32.withVal
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> FFI.String.withConstOptPtr
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
