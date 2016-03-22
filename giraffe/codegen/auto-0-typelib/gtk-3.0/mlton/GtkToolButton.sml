structure GtkToolButton :>
  GTK_TOOL_BUTTON
    where type 'a class = 'a GtkToolButtonClass.class
    where type 'a activatable_class = 'a GtkActivatableClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type 'a widget_class = 'a GtkWidgetClass.class =
  struct
    val getType_ = _import "gtk_tool_button_get_type" : unit -> GObjectType.C.val_;
    val new_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_tool_button_new" :
              unit GtkWidgetClass.C.p
               * Utf8.MLton.p1
               * unit Utf8.MLton.p2
               -> GtkToolItemClass.C.notnull GtkToolItemClass.C.p;
          )
            (
              x1,
              x2,
              x3
            )
    val newFromStock_ = _import "mlton_gtk_tool_button_new_from_stock" : Utf8.MLton.p1 * Utf8.C.notnull Utf8.MLton.p2 -> GtkToolItemClass.C.notnull GtkToolItemClass.C.p;
    val getIconName_ = _import "gtk_tool_button_get_icon_name" : GtkToolButtonClass.C.notnull GtkToolButtonClass.C.p -> Utf8.C.notnull Utf8.C.out_p;
    val getIconWidget_ = _import "gtk_tool_button_get_icon_widget" : GtkToolButtonClass.C.notnull GtkToolButtonClass.C.p -> GtkWidgetClass.C.notnull GtkWidgetClass.C.p;
    val getLabel_ = _import "gtk_tool_button_get_label" : GtkToolButtonClass.C.notnull GtkToolButtonClass.C.p -> Utf8.C.notnull Utf8.C.out_p;
    val getLabelWidget_ = _import "gtk_tool_button_get_label_widget" : GtkToolButtonClass.C.notnull GtkToolButtonClass.C.p -> GtkWidgetClass.C.notnull GtkWidgetClass.C.p;
    val getStockId_ = _import "gtk_tool_button_get_stock_id" : GtkToolButtonClass.C.notnull GtkToolButtonClass.C.p -> Utf8.C.notnull Utf8.C.out_p;
    val getUseUnderline_ = _import "gtk_tool_button_get_use_underline" : GtkToolButtonClass.C.notnull GtkToolButtonClass.C.p -> FFI.Bool.C.val_;
    val setIconName_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_tool_button_set_icon_name" :
              GtkToolButtonClass.C.notnull GtkToolButtonClass.C.p
               * Utf8.MLton.p1
               * unit Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setIconWidget_ = fn x1 & x2 => (_import "gtk_tool_button_set_icon_widget" : GtkToolButtonClass.C.notnull GtkToolButtonClass.C.p * unit GtkWidgetClass.C.p -> unit;) (x1, x2)
    val setLabel_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_tool_button_set_label" :
              GtkToolButtonClass.C.notnull GtkToolButtonClass.C.p
               * Utf8.MLton.p1
               * unit Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setLabelWidget_ = fn x1 & x2 => (_import "gtk_tool_button_set_label_widget" : GtkToolButtonClass.C.notnull GtkToolButtonClass.C.p * unit GtkWidgetClass.C.p -> unit;) (x1, x2)
    val setStockId_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_tool_button_set_stock_id" :
              GtkToolButtonClass.C.notnull GtkToolButtonClass.C.p
               * Utf8.MLton.p1
               * unit Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setUseUnderline_ = fn x1 & x2 => (_import "gtk_tool_button_set_use_underline" : GtkToolButtonClass.C.notnull GtkToolButtonClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    type 'a class = 'a GtkToolButtonClass.class
    type 'a activatable_class = 'a GtkActivatableClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type 'a widget_class = 'a GtkWidgetClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.C.withPtr ---> AtkImplementorIfaceClass.C.fromPtr false) I self
    fun asActivatable self = (GObjectObjectClass.C.withPtr ---> GtkActivatableClass.C.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new iconWidget label = (GtkWidgetClass.C.withOptPtr &&&> Utf8.C.withOptPtr ---> GtkToolButtonClass.C.fromPtr false) new_ (iconWidget & label)
    fun newFromStock stockId = (Utf8.C.withPtr ---> GtkToolButtonClass.C.fromPtr false) newFromStock_ stockId
    fun getIconName self = (GtkToolButtonClass.C.withPtr ---> Utf8.C.fromPtr false) getIconName_ self
    fun getIconWidget self = (GtkToolButtonClass.C.withPtr ---> GtkWidgetClass.C.fromPtr false) getIconWidget_ self
    fun getLabel self = (GtkToolButtonClass.C.withPtr ---> Utf8.C.fromPtr false) getLabel_ self
    fun getLabelWidget self = (GtkToolButtonClass.C.withPtr ---> GtkWidgetClass.C.fromPtr false) getLabelWidget_ self
    fun getStockId self = (GtkToolButtonClass.C.withPtr ---> Utf8.C.fromPtr false) getStockId_ self
    fun getUseUnderline self = (GtkToolButtonClass.C.withPtr ---> FFI.Bool.C.fromVal) getUseUnderline_ self
    fun setIconName self iconName = (GtkToolButtonClass.C.withPtr &&&> Utf8.C.withOptPtr ---> I) setIconName_ (self & iconName)
    fun setIconWidget self iconWidget = (GtkToolButtonClass.C.withPtr &&&> GtkWidgetClass.C.withOptPtr ---> I) setIconWidget_ (self & iconWidget)
    fun setLabel self label = (GtkToolButtonClass.C.withPtr &&&> Utf8.C.withOptPtr ---> I) setLabel_ (self & label)
    fun setLabelWidget self labelWidget = (GtkToolButtonClass.C.withPtr &&&> GtkWidgetClass.C.withOptPtr ---> I) setLabelWidget_ (self & labelWidget)
    fun setStockId self stockId = (GtkToolButtonClass.C.withPtr &&&> Utf8.C.withOptPtr ---> I) setStockId_ (self & stockId)
    fun setUseUnderline self useUnderline = (GtkToolButtonClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setUseUnderline_ (self & useUnderline)
    local
      open ClosureMarshal Signal
    in
      fun clickedSig f = signal "clicked" (void ---> ret_void) f
    end
    local
      open Property
    in
      val iconNameProp =
        {
          get = fn x => get "icon-name" stringOpt x,
          set = fn x => set "icon-name" stringOpt x
        }
      val iconWidgetProp =
        {
          get = fn x => get "icon-widget" GtkWidgetClass.tOpt x,
          set = fn x => set "icon-widget" GtkWidgetClass.tOpt x
        }
      val labelProp =
        {
          get = fn x => get "label" stringOpt x,
          set = fn x => set "label" stringOpt x
        }
      val labelWidgetProp =
        {
          get = fn x => get "label-widget" GtkWidgetClass.tOpt x,
          set = fn x => set "label-widget" GtkWidgetClass.tOpt x
        }
      val stockIdProp =
        {
          get = fn x => get "stock-id" stringOpt x,
          set = fn x => set "stock-id" stringOpt x
        }
      val useUnderlineProp =
        {
          get = fn x => get "use-underline" boolean x,
          set = fn x => set "use-underline" boolean x
        }
    end
  end
