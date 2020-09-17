structure GtkExpander :>
  GTK_EXPANDER
    where type 'a class = 'a GtkExpanderClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type 'a widget_class = 'a GtkWidgetClass.class =
  struct
    val getType_ = _import "gtk_expander_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "mlton_gtk_expander_new" : Utf8.MLton.p1 * Utf8.FFI.non_opt Utf8.MLton.p2 -> GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p;
    val newWithMnemonic_ = _import "mlton_gtk_expander_new_with_mnemonic" : Utf8.MLton.p1 * Utf8.FFI.opt Utf8.MLton.p2 -> GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p;
    val getExpanded_ = _import "gtk_expander_get_expanded" : GtkExpanderClass.FFI.non_opt GtkExpanderClass.FFI.p -> GBool.FFI.val_;
    val getLabel_ = _import "gtk_expander_get_label" : GtkExpanderClass.FFI.non_opt GtkExpanderClass.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val getLabelFill_ = _import "gtk_expander_get_label_fill" : GtkExpanderClass.FFI.non_opt GtkExpanderClass.FFI.p -> GBool.FFI.val_;
    val getLabelWidget_ = _import "gtk_expander_get_label_widget" : GtkExpanderClass.FFI.non_opt GtkExpanderClass.FFI.p -> GtkWidgetClass.FFI.opt GtkWidgetClass.FFI.p;
    val getResizeToplevel_ = _import "gtk_expander_get_resize_toplevel" : GtkExpanderClass.FFI.non_opt GtkExpanderClass.FFI.p -> GBool.FFI.val_;
    val getSpacing_ = _import "gtk_expander_get_spacing" : GtkExpanderClass.FFI.non_opt GtkExpanderClass.FFI.p -> GInt.FFI.val_;
    val getUseMarkup_ = _import "gtk_expander_get_use_markup" : GtkExpanderClass.FFI.non_opt GtkExpanderClass.FFI.p -> GBool.FFI.val_;
    val getUseUnderline_ = _import "gtk_expander_get_use_underline" : GtkExpanderClass.FFI.non_opt GtkExpanderClass.FFI.p -> GBool.FFI.val_;
    val setExpanded_ = fn x1 & x2 => (_import "gtk_expander_set_expanded" : GtkExpanderClass.FFI.non_opt GtkExpanderClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setLabel_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_expander_set_label" :
              GtkExpanderClass.FFI.non_opt GtkExpanderClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.opt Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setLabelFill_ = fn x1 & x2 => (_import "gtk_expander_set_label_fill" : GtkExpanderClass.FFI.non_opt GtkExpanderClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setLabelWidget_ = fn x1 & x2 => (_import "gtk_expander_set_label_widget" : GtkExpanderClass.FFI.non_opt GtkExpanderClass.FFI.p * GtkWidgetClass.FFI.opt GtkWidgetClass.FFI.p -> unit;) (x1, x2)
    val setResizeToplevel_ = fn x1 & x2 => (_import "gtk_expander_set_resize_toplevel" : GtkExpanderClass.FFI.non_opt GtkExpanderClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setSpacing_ = fn x1 & x2 => (_import "gtk_expander_set_spacing" : GtkExpanderClass.FFI.non_opt GtkExpanderClass.FFI.p * GInt.FFI.val_ -> unit;) (x1, x2)
    val setUseMarkup_ = fn x1 & x2 => (_import "gtk_expander_set_use_markup" : GtkExpanderClass.FFI.non_opt GtkExpanderClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setUseUnderline_ = fn x1 & x2 => (_import "gtk_expander_set_use_underline" : GtkExpanderClass.FFI.non_opt GtkExpanderClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    type 'a class = 'a GtkExpanderClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type 'a widget_class = 'a GtkWidgetClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr false ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr false ---> GtkBuildableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new label = (Utf8.FFI.withPtr 0 ---> GtkExpanderClass.FFI.fromPtr false) new_ label before Utf8.FFI.touchPtr label
    fun newWithMnemonic label = (Utf8.FFI.withOptPtr 0 ---> GtkExpanderClass.FFI.fromPtr false) newWithMnemonic_ label before Utf8.FFI.touchOptPtr label
    fun getExpanded self = (GtkExpanderClass.FFI.withPtr false ---> GBool.FFI.fromVal) getExpanded_ self
    fun getLabel self = (GtkExpanderClass.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getLabel_ self before GtkExpanderClass.FFI.touchPtr self
    fun getLabelFill self = (GtkExpanderClass.FFI.withPtr false ---> GBool.FFI.fromVal) getLabelFill_ self
    fun getLabelWidget self = (GtkExpanderClass.FFI.withPtr false ---> GtkWidgetClass.FFI.fromOptPtr false) getLabelWidget_ self before GtkExpanderClass.FFI.touchPtr self
    fun getResizeToplevel self = (GtkExpanderClass.FFI.withPtr false ---> GBool.FFI.fromVal) getResizeToplevel_ self
    fun getSpacing self = (GtkExpanderClass.FFI.withPtr false ---> GInt.FFI.fromVal) getSpacing_ self
    fun getUseMarkup self = (GtkExpanderClass.FFI.withPtr false ---> GBool.FFI.fromVal) getUseMarkup_ self
    fun getUseUnderline self = (GtkExpanderClass.FFI.withPtr false ---> GBool.FFI.fromVal) getUseUnderline_ self
    fun setExpanded self expanded = (GtkExpanderClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setExpanded_ (self & expanded)
    fun setLabel self label = (GtkExpanderClass.FFI.withPtr false &&&> Utf8.FFI.withOptPtr 0 ---> I) setLabel_ (self & label)
    fun setLabelFill self labelFill = (GtkExpanderClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setLabelFill_ (self & labelFill)
    fun setLabelWidget self labelWidget = (GtkExpanderClass.FFI.withPtr false &&&> GtkWidgetClass.FFI.withOptPtr false ---> I) setLabelWidget_ (self & labelWidget)
    fun setResizeToplevel self resizeToplevel = (GtkExpanderClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setResizeToplevel_ (self & resizeToplevel)
    fun setSpacing self spacing = (GtkExpanderClass.FFI.withPtr false &&&> GInt.FFI.withVal ---> I) setSpacing_ (self & spacing)
    fun setUseMarkup self useMarkup = (GtkExpanderClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setUseMarkup_ (self & useMarkup)
    fun setUseUnderline self useUnderline = (GtkExpanderClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setUseUnderline_ (self & useUnderline)
    local
      open ClosureMarshal Signal
    in
      fun activateSig f = signal "activate" (void ---> ret_void) f
    end
    local
      open ValueAccessor
    in
      val expandedProp =
        {
          name = "expanded",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val labelProp =
        {
          name = "label",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = fn x => C.set stringOpt x,
          init = fn x => C.set stringOpt x
        }
      val labelFillProp =
        {
          name = "label-fill",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val labelWidgetProp =
        {
          name = "label-widget",
          gtype = fn () => C.gtype GtkWidgetClass.tOpt (),
          get = fn x => fn () => C.get GtkWidgetClass.tOpt x,
          set = fn x => C.set GtkWidgetClass.tOpt x,
          init = fn x => C.set GtkWidgetClass.tOpt x
        }
      val resizeToplevelProp =
        {
          name = "resize-toplevel",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val spacingProp =
        {
          name = "spacing",
          gtype = fn () => C.gtype int (),
          get = fn x => fn () => C.get int x,
          set = fn x => C.set int x,
          init = fn x => C.set int x
        }
      val useMarkupProp =
        {
          name = "use-markup",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val useUnderlineProp =
        {
          name = "use-underline",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
    end
  end
