structure GtkExpander :>
  GTK_EXPANDER
    where type 'a class = 'a GtkExpanderClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type 'a widget_class = 'a GtkWidgetClass.class =
  struct
    val getType_ = _import "gtk_expander_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "mlton_gtk_expander_new" : Utf8.MLton.p1 * Utf8.C.notnull Utf8.MLton.p2 -> GtkWidgetClass.C.notnull GtkWidgetClass.C.p;
    val newWithMnemonic_ = _import "mlton_gtk_expander_new_with_mnemonic" : Utf8.MLton.p1 * unit Utf8.MLton.p2 -> GtkWidgetClass.C.notnull GtkWidgetClass.C.p;
    val getExpanded_ = _import "gtk_expander_get_expanded" : GtkExpanderClass.C.notnull GtkExpanderClass.C.p -> FFI.Bool.C.val_;
    val getLabel_ = _import "gtk_expander_get_label" : GtkExpanderClass.C.notnull GtkExpanderClass.C.p -> Utf8.C.notnull Utf8.C.out_p;
    val getLabelFill_ = _import "gtk_expander_get_label_fill" : GtkExpanderClass.C.notnull GtkExpanderClass.C.p -> FFI.Bool.C.val_;
    val getLabelWidget_ = _import "gtk_expander_get_label_widget" : GtkExpanderClass.C.notnull GtkExpanderClass.C.p -> GtkWidgetClass.C.notnull GtkWidgetClass.C.p;
    val getResizeToplevel_ = _import "gtk_expander_get_resize_toplevel" : GtkExpanderClass.C.notnull GtkExpanderClass.C.p -> FFI.Bool.C.val_;
    val getSpacing_ = _import "gtk_expander_get_spacing" : GtkExpanderClass.C.notnull GtkExpanderClass.C.p -> FFI.Int.C.val_;
    val getUseMarkup_ = _import "gtk_expander_get_use_markup" : GtkExpanderClass.C.notnull GtkExpanderClass.C.p -> FFI.Bool.C.val_;
    val getUseUnderline_ = _import "gtk_expander_get_use_underline" : GtkExpanderClass.C.notnull GtkExpanderClass.C.p -> FFI.Bool.C.val_;
    val setExpanded_ = fn x1 & x2 => (_import "gtk_expander_set_expanded" : GtkExpanderClass.C.notnull GtkExpanderClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setLabel_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_expander_set_label" :
              GtkExpanderClass.C.notnull GtkExpanderClass.C.p
               * Utf8.MLton.p1
               * unit Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setLabelFill_ = fn x1 & x2 => (_import "gtk_expander_set_label_fill" : GtkExpanderClass.C.notnull GtkExpanderClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setLabelWidget_ = fn x1 & x2 => (_import "gtk_expander_set_label_widget" : GtkExpanderClass.C.notnull GtkExpanderClass.C.p * unit GtkWidgetClass.C.p -> unit;) (x1, x2)
    val setResizeToplevel_ = fn x1 & x2 => (_import "gtk_expander_set_resize_toplevel" : GtkExpanderClass.C.notnull GtkExpanderClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setSpacing_ = fn x1 & x2 => (_import "gtk_expander_set_spacing" : GtkExpanderClass.C.notnull GtkExpanderClass.C.p * FFI.Int.C.val_ -> unit;) (x1, x2)
    val setUseMarkup_ = fn x1 & x2 => (_import "gtk_expander_set_use_markup" : GtkExpanderClass.C.notnull GtkExpanderClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setUseUnderline_ = fn x1 & x2 => (_import "gtk_expander_set_use_underline" : GtkExpanderClass.C.notnull GtkExpanderClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    type 'a class = 'a GtkExpanderClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type 'a widget_class = 'a GtkWidgetClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.C.withPtr ---> AtkImplementorIfaceClass.C.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new label = (Utf8.C.withPtr ---> GtkExpanderClass.C.fromPtr false) new_ label
    fun newWithMnemonic label = (Utf8.C.withOptPtr ---> GtkExpanderClass.C.fromPtr false) newWithMnemonic_ label
    fun getExpanded self = (GtkExpanderClass.C.withPtr ---> FFI.Bool.C.fromVal) getExpanded_ self
    fun getLabel self = (GtkExpanderClass.C.withPtr ---> Utf8.C.fromPtr false) getLabel_ self
    fun getLabelFill self = (GtkExpanderClass.C.withPtr ---> FFI.Bool.C.fromVal) getLabelFill_ self
    fun getLabelWidget self = (GtkExpanderClass.C.withPtr ---> GtkWidgetClass.C.fromPtr false) getLabelWidget_ self
    fun getResizeToplevel self = (GtkExpanderClass.C.withPtr ---> FFI.Bool.C.fromVal) getResizeToplevel_ self
    fun getSpacing self = (GtkExpanderClass.C.withPtr ---> FFI.Int.C.fromVal) getSpacing_ self
    fun getUseMarkup self = (GtkExpanderClass.C.withPtr ---> FFI.Bool.C.fromVal) getUseMarkup_ self
    fun getUseUnderline self = (GtkExpanderClass.C.withPtr ---> FFI.Bool.C.fromVal) getUseUnderline_ self
    fun setExpanded self expanded = (GtkExpanderClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setExpanded_ (self & expanded)
    fun setLabel self label = (GtkExpanderClass.C.withPtr &&&> Utf8.C.withOptPtr ---> I) setLabel_ (self & label)
    fun setLabelFill self labelFill = (GtkExpanderClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setLabelFill_ (self & labelFill)
    fun setLabelWidget self labelWidget = (GtkExpanderClass.C.withPtr &&&> GtkWidgetClass.C.withOptPtr ---> I) setLabelWidget_ (self & labelWidget)
    fun setResizeToplevel self resizeToplevel = (GtkExpanderClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setResizeToplevel_ (self & resizeToplevel)
    fun setSpacing self spacing = (GtkExpanderClass.C.withPtr &&&> FFI.Int.C.withVal ---> I) setSpacing_ (self & spacing)
    fun setUseMarkup self useMarkup = (GtkExpanderClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setUseMarkup_ (self & useMarkup)
    fun setUseUnderline self useUnderline = (GtkExpanderClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setUseUnderline_ (self & useUnderline)
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
