structure GtkExpander :>
  GTK_EXPANDER
    where type 'a class_t = 'a GtkExpanderClass.t
    where type 'a buildable_class_t = 'a GtkBuildableClass.t
    where type 'a widget_class_t = 'a GtkWidgetClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_expander_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libgtk "gtk_expander_new") (Utf8.PolyML.cInPtr --> GObjectObjectClass.PolyML.cPtr)
      val newWithMnemonic_ = call (load_sym libgtk "gtk_expander_new_with_mnemonic") (Utf8.PolyML.cInOptPtr --> GObjectObjectClass.PolyML.cPtr)
      val getExpanded_ = call (load_sym libgtk "gtk_expander_get_expanded") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getLabel_ = call (load_sym libgtk "gtk_expander_get_label") (GObjectObjectClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getLabelFill_ = call (load_sym libgtk "gtk_expander_get_label_fill") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getLabelWidget_ = call (load_sym libgtk "gtk_expander_get_label_widget") (GObjectObjectClass.PolyML.cPtr --> GObjectObjectClass.PolyML.cPtr)
      val getResizeToplevel_ = call (load_sym libgtk "gtk_expander_get_resize_toplevel") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getSpacing_ = call (load_sym libgtk "gtk_expander_get_spacing") (GObjectObjectClass.PolyML.cPtr --> FFI.Int32.PolyML.cVal)
      val getUseMarkup_ = call (load_sym libgtk "gtk_expander_get_use_markup") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getUseUnderline_ = call (load_sym libgtk "gtk_expander_get_use_underline") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val setExpanded_ = call (load_sym libgtk "gtk_expander_set_expanded") (GObjectObjectClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> FFI.PolyML.cVoid)
      val setLabel_ = call (load_sym libgtk "gtk_expander_set_label") (GObjectObjectClass.PolyML.cPtr &&> Utf8.PolyML.cInOptPtr --> FFI.PolyML.cVoid)
      val setLabelFill_ = call (load_sym libgtk "gtk_expander_set_label_fill") (GObjectObjectClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> FFI.PolyML.cVoid)
      val setLabelWidget_ = call (load_sym libgtk "gtk_expander_set_label_widget") (GObjectObjectClass.PolyML.cPtr &&> GObjectObjectClass.PolyML.cOptPtr --> FFI.PolyML.cVoid)
      val setResizeToplevel_ = call (load_sym libgtk "gtk_expander_set_resize_toplevel") (GObjectObjectClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> FFI.PolyML.cVoid)
      val setSpacing_ = call (load_sym libgtk "gtk_expander_set_spacing") (GObjectObjectClass.PolyML.cPtr &&> FFI.Int32.PolyML.cVal --> FFI.PolyML.cVoid)
      val setUseMarkup_ = call (load_sym libgtk "gtk_expander_set_use_markup") (GObjectObjectClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> FFI.PolyML.cVoid)
      val setUseUnderline_ = call (load_sym libgtk "gtk_expander_set_use_underline") (GObjectObjectClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> FFI.PolyML.cVoid)
    end
    type 'a class_t = 'a GtkExpanderClass.t
    type 'a buildable_class_t = 'a GtkBuildableClass.t
    type 'a widget_class_t = 'a GtkWidgetClass.t
    type t = base class_t
    fun asImplementorIface self = (GObjectObjectClass.C.withPtr ---> AtkImplementorIfaceClass.C.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new label = (Utf8.C.withPtr ---> GtkExpanderClass.C.fromPtr false) new_ label
    fun newWithMnemonic label = (Utf8.C.withOptPtr ---> GtkExpanderClass.C.fromPtr false) newWithMnemonic_ label
    fun getExpanded self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getExpanded_ self
    fun getLabel self = (GObjectObjectClass.C.withPtr ---> Utf8.C.fromPtr false) getLabel_ self
    fun getLabelFill self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getLabelFill_ self
    fun getLabelWidget self = (GObjectObjectClass.C.withPtr ---> GtkWidgetClass.C.fromPtr false) getLabelWidget_ self
    fun getResizeToplevel self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getResizeToplevel_ self
    fun getSpacing self = (GObjectObjectClass.C.withPtr ---> FFI.Int32.C.fromVal) getSpacing_ self
    fun getUseMarkup self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getUseMarkup_ self
    fun getUseUnderline self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getUseUnderline_ self
    fun setExpanded self expanded = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setExpanded_ (self & expanded)
    fun setLabel self label = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withOptPtr ---> I) setLabel_ (self & label)
    fun setLabelFill self labelFill = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setLabelFill_ (self & labelFill)
    fun setLabelWidget self labelWidget = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withOptPtr ---> I) setLabelWidget_ (self & labelWidget)
    fun setResizeToplevel self resizeToplevel = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setResizeToplevel_ (self & resizeToplevel)
    fun setSpacing self spacing = (GObjectObjectClass.C.withPtr &&&> FFI.Int32.C.withVal ---> I) setSpacing_ (self & spacing)
    fun setUseMarkup self useMarkup = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setUseMarkup_ (self & useMarkup)
    fun setUseUnderline self useUnderline = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setUseUnderline_ (self & useUnderline)
    local
      open ClosureMarshal Signal
    in
      fun activateSig f = signal "activate" (void ---> ret_void) f
    end
    local
      open Property
    in
      val expandedProp =
        {
          get = fn x => get "expanded" boolean x,
          set = fn x => set "expanded" boolean x
        }
      val labelProp =
        {
          get = fn x => get "label" stringOpt x,
          set = fn x => set "label" stringOpt x
        }
      val labelFillProp =
        {
          get = fn x => get "label-fill" boolean x,
          set = fn x => set "label-fill" boolean x
        }
      val labelWidgetProp =
        {
          get = fn x => get "label-widget" GtkWidgetClass.tOpt x,
          set = fn x => set "label-widget" GtkWidgetClass.tOpt x
        }
      val resizeToplevelProp =
        {
          get = fn x => get "resize-toplevel" boolean x,
          set = fn x => set "resize-toplevel" boolean x
        }
      val spacingProp =
        {
          get = fn x => get "spacing" int x,
          set = fn x => set "spacing" int x
        }
      val useMarkupProp =
        {
          get = fn x => get "use-markup" boolean x,
          set = fn x => set "use-markup" boolean x
        }
      val useUnderlineProp =
        {
          get = fn x => get "use-underline" boolean x,
          set = fn x => set "use-underline" boolean x
        }
    end
  end
