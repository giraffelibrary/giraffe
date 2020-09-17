structure GtkToolButton :>
  GTK_TOOL_BUTTON
    where type 'a class = 'a GtkToolButtonClass.class
    where type 'a actionable_class = 'a GtkActionableClass.class
    where type 'a activatable_class = 'a GtkActivatableClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type 'a widget_class = 'a GtkWidgetClass.class =
  struct
    val getType_ = _import "gtk_tool_button_get_type" : unit -> GObjectType.FFI.val_;
    val new_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_tool_button_new" :
              GtkWidgetClass.FFI.opt GtkWidgetClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.opt Utf8.MLton.p2
               -> GtkToolItemClass.FFI.non_opt GtkToolItemClass.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    val newFromStock_ = _import "mlton_gtk_tool_button_new_from_stock" : Utf8.MLton.p1 * Utf8.FFI.non_opt Utf8.MLton.p2 -> GtkToolItemClass.FFI.non_opt GtkToolItemClass.FFI.p;
    val getIconName_ = _import "gtk_tool_button_get_icon_name" : GtkToolButtonClass.FFI.non_opt GtkToolButtonClass.FFI.p -> Utf8.FFI.opt Utf8.FFI.out_p;
    val getIconWidget_ = _import "gtk_tool_button_get_icon_widget" : GtkToolButtonClass.FFI.non_opt GtkToolButtonClass.FFI.p -> GtkWidgetClass.FFI.opt GtkWidgetClass.FFI.p;
    val getLabel_ = _import "gtk_tool_button_get_label" : GtkToolButtonClass.FFI.non_opt GtkToolButtonClass.FFI.p -> Utf8.FFI.opt Utf8.FFI.out_p;
    val getLabelWidget_ = _import "gtk_tool_button_get_label_widget" : GtkToolButtonClass.FFI.non_opt GtkToolButtonClass.FFI.p -> GtkWidgetClass.FFI.opt GtkWidgetClass.FFI.p;
    val getStockId_ = _import "gtk_tool_button_get_stock_id" : GtkToolButtonClass.FFI.non_opt GtkToolButtonClass.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val getUseUnderline_ = _import "gtk_tool_button_get_use_underline" : GtkToolButtonClass.FFI.non_opt GtkToolButtonClass.FFI.p -> GBool.FFI.val_;
    val setIconName_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_tool_button_set_icon_name" :
              GtkToolButtonClass.FFI.non_opt GtkToolButtonClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.opt Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setIconWidget_ = fn x1 & x2 => (_import "gtk_tool_button_set_icon_widget" : GtkToolButtonClass.FFI.non_opt GtkToolButtonClass.FFI.p * GtkWidgetClass.FFI.opt GtkWidgetClass.FFI.p -> unit;) (x1, x2)
    val setLabel_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_tool_button_set_label" :
              GtkToolButtonClass.FFI.non_opt GtkToolButtonClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.opt Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setLabelWidget_ = fn x1 & x2 => (_import "gtk_tool_button_set_label_widget" : GtkToolButtonClass.FFI.non_opt GtkToolButtonClass.FFI.p * GtkWidgetClass.FFI.opt GtkWidgetClass.FFI.p -> unit;) (x1, x2)
    val setStockId_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_tool_button_set_stock_id" :
              GtkToolButtonClass.FFI.non_opt GtkToolButtonClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.opt Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setUseUnderline_ = fn x1 & x2 => (_import "gtk_tool_button_set_use_underline" : GtkToolButtonClass.FFI.non_opt GtkToolButtonClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    type 'a class = 'a GtkToolButtonClass.class
    type 'a actionable_class = 'a GtkActionableClass.class
    type 'a activatable_class = 'a GtkActivatableClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type 'a widget_class = 'a GtkWidgetClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr false ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asActionable self = (GObjectObjectClass.FFI.withPtr false ---> GtkActionableClass.FFI.fromPtr false) I self
    fun asActivatable self = (GObjectObjectClass.FFI.withPtr false ---> GtkActivatableClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr false ---> GtkBuildableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new (iconWidget, label) = (GtkWidgetClass.FFI.withOptPtr false &&&> Utf8.FFI.withOptPtr 0 ---> GtkToolButtonClass.FFI.fromPtr false) new_ (iconWidget & label) before GtkWidgetClass.FFI.touchOptPtr iconWidget before Utf8.FFI.touchOptPtr label
    fun newFromStock stockId = (Utf8.FFI.withPtr 0 ---> GtkToolButtonClass.FFI.fromPtr false) newFromStock_ stockId before Utf8.FFI.touchPtr stockId
    fun getIconName self = (GtkToolButtonClass.FFI.withPtr false ---> Utf8.FFI.fromOptPtr 0) getIconName_ self before GtkToolButtonClass.FFI.touchPtr self
    fun getIconWidget self = (GtkToolButtonClass.FFI.withPtr false ---> GtkWidgetClass.FFI.fromOptPtr false) getIconWidget_ self before GtkToolButtonClass.FFI.touchPtr self
    fun getLabel self = (GtkToolButtonClass.FFI.withPtr false ---> Utf8.FFI.fromOptPtr 0) getLabel_ self before GtkToolButtonClass.FFI.touchPtr self
    fun getLabelWidget self = (GtkToolButtonClass.FFI.withPtr false ---> GtkWidgetClass.FFI.fromOptPtr false) getLabelWidget_ self before GtkToolButtonClass.FFI.touchPtr self
    fun getStockId self = (GtkToolButtonClass.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getStockId_ self before GtkToolButtonClass.FFI.touchPtr self
    fun getUseUnderline self = (GtkToolButtonClass.FFI.withPtr false ---> GBool.FFI.fromVal) getUseUnderline_ self
    fun setIconName self iconName = (GtkToolButtonClass.FFI.withPtr false &&&> Utf8.FFI.withOptPtr 0 ---> I) setIconName_ (self & iconName)
    fun setIconWidget self iconWidget = (GtkToolButtonClass.FFI.withPtr false &&&> GtkWidgetClass.FFI.withOptPtr false ---> I) setIconWidget_ (self & iconWidget)
    fun setLabel self label = (GtkToolButtonClass.FFI.withPtr false &&&> Utf8.FFI.withOptPtr 0 ---> I) setLabel_ (self & label)
    fun setLabelWidget self labelWidget = (GtkToolButtonClass.FFI.withPtr false &&&> GtkWidgetClass.FFI.withOptPtr false ---> I) setLabelWidget_ (self & labelWidget)
    fun setStockId self stockId = (GtkToolButtonClass.FFI.withPtr false &&&> Utf8.FFI.withOptPtr 0 ---> I) setStockId_ (self & stockId)
    fun setUseUnderline self useUnderline = (GtkToolButtonClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setUseUnderline_ (self & useUnderline)
    local
      open ClosureMarshal Signal
    in
      fun clickedSig f = signal "clicked" (void ---> ret_void) f
    end
    local
      open ValueAccessor
    in
      val iconNameProp =
        {
          name = "icon-name",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = fn x => C.set stringOpt x,
          init = fn x => C.set stringOpt x
        }
      val iconWidgetProp =
        {
          name = "icon-widget",
          gtype = fn () => C.gtype GtkWidgetClass.tOpt (),
          get = fn x => fn () => C.get GtkWidgetClass.tOpt x,
          set = fn x => C.set GtkWidgetClass.tOpt x,
          init = fn x => C.set GtkWidgetClass.tOpt x
        }
      val labelProp =
        {
          name = "label",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = fn x => C.set stringOpt x,
          init = fn x => C.set stringOpt x
        }
      val labelWidgetProp =
        {
          name = "label-widget",
          gtype = fn () => C.gtype GtkWidgetClass.tOpt (),
          get = fn x => fn () => C.get GtkWidgetClass.tOpt x,
          set = fn x => C.set GtkWidgetClass.tOpt x,
          init = fn x => C.set GtkWidgetClass.tOpt x
        }
      val stockIdProp =
        {
          name = "stock-id",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = fn x => C.set stringOpt x,
          init = fn x => C.set stringOpt x
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
