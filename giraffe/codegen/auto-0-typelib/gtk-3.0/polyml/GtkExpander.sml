structure GtkExpander :>
  GTK_EXPANDER
    where type 'a class = 'a GtkExpanderClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type 'a widget_class = 'a GtkWidgetClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_expander_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "gtk_expander_new") (Utf8.PolyML.cInPtr --> GtkWidgetClass.PolyML.cPtr)
      val newWithMnemonic_ = call (getSymbol "gtk_expander_new_with_mnemonic") (Utf8.PolyML.cInOptPtr --> GtkWidgetClass.PolyML.cPtr)
      val getExpanded_ = call (getSymbol "gtk_expander_get_expanded") (GtkExpanderClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getLabel_ = call (getSymbol "gtk_expander_get_label") (GtkExpanderClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getLabelFill_ = call (getSymbol "gtk_expander_get_label_fill") (GtkExpanderClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getLabelWidget_ = call (getSymbol "gtk_expander_get_label_widget") (GtkExpanderClass.PolyML.cPtr --> GtkWidgetClass.PolyML.cOptPtr)
      val getResizeToplevel_ = call (getSymbol "gtk_expander_get_resize_toplevel") (GtkExpanderClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getSpacing_ = call (getSymbol "gtk_expander_get_spacing") (GtkExpanderClass.PolyML.cPtr --> GInt32.PolyML.cVal)
      val getUseMarkup_ = call (getSymbol "gtk_expander_get_use_markup") (GtkExpanderClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getUseUnderline_ = call (getSymbol "gtk_expander_get_use_underline") (GtkExpanderClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val setExpanded_ = call (getSymbol "gtk_expander_set_expanded") (GtkExpanderClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setLabel_ = call (getSymbol "gtk_expander_set_label") (GtkExpanderClass.PolyML.cPtr &&> Utf8.PolyML.cInOptPtr --> cVoid)
      val setLabelFill_ = call (getSymbol "gtk_expander_set_label_fill") (GtkExpanderClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setLabelWidget_ = call (getSymbol "gtk_expander_set_label_widget") (GtkExpanderClass.PolyML.cPtr &&> GtkWidgetClass.PolyML.cOptPtr --> cVoid)
      val setResizeToplevel_ = call (getSymbol "gtk_expander_set_resize_toplevel") (GtkExpanderClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setSpacing_ = call (getSymbol "gtk_expander_set_spacing") (GtkExpanderClass.PolyML.cPtr &&> GInt32.PolyML.cVal --> cVoid)
      val setUseMarkup_ = call (getSymbol "gtk_expander_set_use_markup") (GtkExpanderClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setUseUnderline_ = call (getSymbol "gtk_expander_set_use_underline") (GtkExpanderClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
    end
    type 'a class = 'a GtkExpanderClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type 'a widget_class = 'a GtkWidgetClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr false ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr false ---> GtkBuildableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new label = (Utf8.FFI.withPtr 0 ---> GtkExpanderClass.FFI.fromPtr false) new_ label
    fun newWithMnemonic label = (Utf8.FFI.withOptPtr 0 ---> GtkExpanderClass.FFI.fromPtr false) newWithMnemonic_ label
    fun getExpanded self = (GtkExpanderClass.FFI.withPtr false ---> GBool.FFI.fromVal) getExpanded_ self
    fun getLabel self = (GtkExpanderClass.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getLabel_ self
    fun getLabelFill self = (GtkExpanderClass.FFI.withPtr false ---> GBool.FFI.fromVal) getLabelFill_ self
    fun getLabelWidget self = (GtkExpanderClass.FFI.withPtr false ---> GtkWidgetClass.FFI.fromOptPtr false) getLabelWidget_ self
    fun getResizeToplevel self = (GtkExpanderClass.FFI.withPtr false ---> GBool.FFI.fromVal) getResizeToplevel_ self
    fun getSpacing self = (GtkExpanderClass.FFI.withPtr false ---> GInt32.FFI.fromVal) getSpacing_ self
    fun getUseMarkup self = (GtkExpanderClass.FFI.withPtr false ---> GBool.FFI.fromVal) getUseMarkup_ self
    fun getUseUnderline self = (GtkExpanderClass.FFI.withPtr false ---> GBool.FFI.fromVal) getUseUnderline_ self
    fun setExpanded self expanded = (GtkExpanderClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setExpanded_ (self & expanded)
    fun setLabel self label = (GtkExpanderClass.FFI.withPtr false &&&> Utf8.FFI.withOptPtr 0 ---> I) setLabel_ (self & label)
    fun setLabelFill self labelFill = (GtkExpanderClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setLabelFill_ (self & labelFill)
    fun setLabelWidget self labelWidget = (GtkExpanderClass.FFI.withPtr false &&&> GtkWidgetClass.FFI.withOptPtr false ---> I) setLabelWidget_ (self & labelWidget)
    fun setResizeToplevel self resizeToplevel = (GtkExpanderClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setResizeToplevel_ (self & resizeToplevel)
    fun setSpacing self spacing = (GtkExpanderClass.FFI.withPtr false &&&> GInt32.FFI.withVal ---> I) setSpacing_ (self & spacing)
    fun setUseMarkup self useMarkup = (GtkExpanderClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setUseMarkup_ (self & useMarkup)
    fun setUseUnderline self useUnderline = (GtkExpanderClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setUseUnderline_ (self & useUnderline)
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
          set = fn x => set "expanded" boolean x,
          new = fn x => new "expanded" boolean x
        }
      val labelProp =
        {
          get = fn x => get "label" stringOpt x,
          set = fn x => set "label" stringOpt x,
          new = fn x => new "label" stringOpt x
        }
      val labelFillProp =
        {
          get = fn x => get "label-fill" boolean x,
          set = fn x => set "label-fill" boolean x,
          new = fn x => new "label-fill" boolean x
        }
      val labelWidgetProp =
        {
          get = fn x => get "label-widget" GtkWidgetClass.tOpt x,
          set = fn x => set "label-widget" GtkWidgetClass.tOpt x,
          new = fn x => new "label-widget" GtkWidgetClass.tOpt x
        }
      val resizeToplevelProp =
        {
          get = fn x => get "resize-toplevel" boolean x,
          set = fn x => set "resize-toplevel" boolean x,
          new = fn x => new "resize-toplevel" boolean x
        }
      val spacingProp =
        {
          get = fn x => get "spacing" int x,
          set = fn x => set "spacing" int x,
          new = fn x => new "spacing" int x
        }
      val useMarkupProp =
        {
          get = fn x => get "use-markup" boolean x,
          set = fn x => set "use-markup" boolean x,
          new = fn x => new "use-markup" boolean x
        }
      val useUnderlineProp =
        {
          get = fn x => get "use-underline" boolean x,
          set = fn x => set "use-underline" boolean x,
          new = fn x => new "use-underline" boolean x
        }
    end
  end
