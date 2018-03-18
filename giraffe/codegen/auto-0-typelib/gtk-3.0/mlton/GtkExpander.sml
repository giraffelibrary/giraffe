structure GtkExpander :>
  GTK_EXPANDER
    where type 'a class = 'a GtkExpanderClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type 'a widget_class = 'a GtkWidgetClass.class =
  struct
    val getType_ = _import "gtk_expander_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "mlton_gtk_expander_new" : Utf8.MLton.p1 * Utf8.FFI.notnull Utf8.MLton.p2 -> GtkWidgetClass.FFI.notnull GtkWidgetClass.FFI.p;
    val newWithMnemonic_ = _import "mlton_gtk_expander_new_with_mnemonic" : Utf8.MLton.p1 * unit Utf8.MLton.p2 -> GtkWidgetClass.FFI.notnull GtkWidgetClass.FFI.p;
    val getExpanded_ = _import "gtk_expander_get_expanded" : GtkExpanderClass.FFI.notnull GtkExpanderClass.FFI.p -> GBool.FFI.val_;
    val getLabel_ = _import "gtk_expander_get_label" : GtkExpanderClass.FFI.notnull GtkExpanderClass.FFI.p -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val getLabelFill_ = _import "gtk_expander_get_label_fill" : GtkExpanderClass.FFI.notnull GtkExpanderClass.FFI.p -> GBool.FFI.val_;
    val getLabelWidget_ = _import "gtk_expander_get_label_widget" : GtkExpanderClass.FFI.notnull GtkExpanderClass.FFI.p -> unit GtkWidgetClass.FFI.p;
    val getResizeToplevel_ = _import "gtk_expander_get_resize_toplevel" : GtkExpanderClass.FFI.notnull GtkExpanderClass.FFI.p -> GBool.FFI.val_;
    val getSpacing_ = _import "gtk_expander_get_spacing" : GtkExpanderClass.FFI.notnull GtkExpanderClass.FFI.p -> GInt32.FFI.val_;
    val getUseMarkup_ = _import "gtk_expander_get_use_markup" : GtkExpanderClass.FFI.notnull GtkExpanderClass.FFI.p -> GBool.FFI.val_;
    val getUseUnderline_ = _import "gtk_expander_get_use_underline" : GtkExpanderClass.FFI.notnull GtkExpanderClass.FFI.p -> GBool.FFI.val_;
    val setExpanded_ = fn x1 & x2 => (_import "gtk_expander_set_expanded" : GtkExpanderClass.FFI.notnull GtkExpanderClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setLabel_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_expander_set_label" :
              GtkExpanderClass.FFI.notnull GtkExpanderClass.FFI.p
               * Utf8.MLton.p1
               * unit Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setLabelFill_ = fn x1 & x2 => (_import "gtk_expander_set_label_fill" : GtkExpanderClass.FFI.notnull GtkExpanderClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setLabelWidget_ = fn x1 & x2 => (_import "gtk_expander_set_label_widget" : GtkExpanderClass.FFI.notnull GtkExpanderClass.FFI.p * unit GtkWidgetClass.FFI.p -> unit;) (x1, x2)
    val setResizeToplevel_ = fn x1 & x2 => (_import "gtk_expander_set_resize_toplevel" : GtkExpanderClass.FFI.notnull GtkExpanderClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setSpacing_ = fn x1 & x2 => (_import "gtk_expander_set_spacing" : GtkExpanderClass.FFI.notnull GtkExpanderClass.FFI.p * GInt32.FFI.val_ -> unit;) (x1, x2)
    val setUseMarkup_ = fn x1 & x2 => (_import "gtk_expander_set_use_markup" : GtkExpanderClass.FFI.notnull GtkExpanderClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setUseUnderline_ = fn x1 & x2 => (_import "gtk_expander_set_use_underline" : GtkExpanderClass.FFI.notnull GtkExpanderClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    type 'a class = 'a GtkExpanderClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type 'a widget_class = 'a GtkWidgetClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr ---> GtkBuildableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new label = (Utf8.FFI.withPtr ---> GtkExpanderClass.FFI.fromPtr false) new_ label
    fun newWithMnemonic label = (Utf8.FFI.withOptPtr ---> GtkExpanderClass.FFI.fromPtr false) newWithMnemonic_ label
    fun getExpanded self = (GtkExpanderClass.FFI.withPtr ---> GBool.FFI.fromVal) getExpanded_ self
    fun getLabel self = (GtkExpanderClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getLabel_ self
    fun getLabelFill self = (GtkExpanderClass.FFI.withPtr ---> GBool.FFI.fromVal) getLabelFill_ self
    fun getLabelWidget self = (GtkExpanderClass.FFI.withPtr ---> GtkWidgetClass.FFI.fromOptPtr false) getLabelWidget_ self
    fun getResizeToplevel self = (GtkExpanderClass.FFI.withPtr ---> GBool.FFI.fromVal) getResizeToplevel_ self
    fun getSpacing self = (GtkExpanderClass.FFI.withPtr ---> GInt32.FFI.fromVal) getSpacing_ self
    fun getUseMarkup self = (GtkExpanderClass.FFI.withPtr ---> GBool.FFI.fromVal) getUseMarkup_ self
    fun getUseUnderline self = (GtkExpanderClass.FFI.withPtr ---> GBool.FFI.fromVal) getUseUnderline_ self
    fun setExpanded self expanded = (GtkExpanderClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setExpanded_ (self & expanded)
    fun setLabel self label = (GtkExpanderClass.FFI.withPtr &&&> Utf8.FFI.withOptPtr ---> I) setLabel_ (self & label)
    fun setLabelFill self labelFill = (GtkExpanderClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setLabelFill_ (self & labelFill)
    fun setLabelWidget self labelWidget = (GtkExpanderClass.FFI.withPtr &&&> GtkWidgetClass.FFI.withOptPtr ---> I) setLabelWidget_ (self & labelWidget)
    fun setResizeToplevel self resizeToplevel = (GtkExpanderClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setResizeToplevel_ (self & resizeToplevel)
    fun setSpacing self spacing = (GtkExpanderClass.FFI.withPtr &&&> GInt32.FFI.withVal ---> I) setSpacing_ (self & spacing)
    fun setUseMarkup self useMarkup = (GtkExpanderClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setUseMarkup_ (self & useMarkup)
    fun setUseUnderline self useUnderline = (GtkExpanderClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setUseUnderline_ (self & useUnderline)
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
