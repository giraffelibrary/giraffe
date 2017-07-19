structure GtkToolButton :>
  GTK_TOOL_BUTTON
    where type 'a class = 'a GtkToolButtonClass.class
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
              unit GtkWidgetClass.FFI.p
               * Utf8.MLton.p1
               * unit Utf8.MLton.p2
               -> GtkToolItemClass.FFI.notnull GtkToolItemClass.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    val newFromStock_ = _import "mlton_gtk_tool_button_new_from_stock" : Utf8.MLton.p1 * Utf8.FFI.notnull Utf8.MLton.p2 -> GtkToolItemClass.FFI.notnull GtkToolItemClass.FFI.p;
    val getIconName_ = _import "gtk_tool_button_get_icon_name" : GtkToolButtonClass.FFI.notnull GtkToolButtonClass.FFI.p -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val getIconWidget_ = _import "gtk_tool_button_get_icon_widget" : GtkToolButtonClass.FFI.notnull GtkToolButtonClass.FFI.p -> GtkWidgetClass.FFI.notnull GtkWidgetClass.FFI.p;
    val getLabel_ = _import "gtk_tool_button_get_label" : GtkToolButtonClass.FFI.notnull GtkToolButtonClass.FFI.p -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val getLabelWidget_ = _import "gtk_tool_button_get_label_widget" : GtkToolButtonClass.FFI.notnull GtkToolButtonClass.FFI.p -> GtkWidgetClass.FFI.notnull GtkWidgetClass.FFI.p;
    val getStockId_ = _import "gtk_tool_button_get_stock_id" : GtkToolButtonClass.FFI.notnull GtkToolButtonClass.FFI.p -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val getUseUnderline_ = _import "gtk_tool_button_get_use_underline" : GtkToolButtonClass.FFI.notnull GtkToolButtonClass.FFI.p -> GBool.FFI.val_;
    val setIconName_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_tool_button_set_icon_name" :
              GtkToolButtonClass.FFI.notnull GtkToolButtonClass.FFI.p
               * Utf8.MLton.p1
               * unit Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setIconWidget_ = fn x1 & x2 => (_import "gtk_tool_button_set_icon_widget" : GtkToolButtonClass.FFI.notnull GtkToolButtonClass.FFI.p * unit GtkWidgetClass.FFI.p -> unit;) (x1, x2)
    val setLabel_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_tool_button_set_label" :
              GtkToolButtonClass.FFI.notnull GtkToolButtonClass.FFI.p
               * Utf8.MLton.p1
               * unit Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setLabelWidget_ = fn x1 & x2 => (_import "gtk_tool_button_set_label_widget" : GtkToolButtonClass.FFI.notnull GtkToolButtonClass.FFI.p * unit GtkWidgetClass.FFI.p -> unit;) (x1, x2)
    val setStockId_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_tool_button_set_stock_id" :
              GtkToolButtonClass.FFI.notnull GtkToolButtonClass.FFI.p
               * Utf8.MLton.p1
               * unit Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setUseUnderline_ = fn x1 & x2 => (_import "gtk_tool_button_set_use_underline" : GtkToolButtonClass.FFI.notnull GtkToolButtonClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    type 'a class = 'a GtkToolButtonClass.class
    type 'a activatable_class = 'a GtkActivatableClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type 'a widget_class = 'a GtkWidgetClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asActivatable self = (GObjectObjectClass.FFI.withPtr ---> GtkActivatableClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr ---> GtkBuildableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new (iconWidget, label) = (GtkWidgetClass.FFI.withOptPtr &&&> Utf8.FFI.withOptPtr ---> GtkToolButtonClass.FFI.fromPtr false) new_ (iconWidget & label)
    fun newFromStock stockId = (Utf8.FFI.withPtr ---> GtkToolButtonClass.FFI.fromPtr false) newFromStock_ stockId
    fun getIconName self = (GtkToolButtonClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getIconName_ self
    fun getIconWidget self = (GtkToolButtonClass.FFI.withPtr ---> GtkWidgetClass.FFI.fromPtr false) getIconWidget_ self
    fun getLabel self = (GtkToolButtonClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getLabel_ self
    fun getLabelWidget self = (GtkToolButtonClass.FFI.withPtr ---> GtkWidgetClass.FFI.fromPtr false) getLabelWidget_ self
    fun getStockId self = (GtkToolButtonClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getStockId_ self
    fun getUseUnderline self = (GtkToolButtonClass.FFI.withPtr ---> GBool.FFI.fromVal) getUseUnderline_ self
    fun setIconName self iconName = (GtkToolButtonClass.FFI.withPtr &&&> Utf8.FFI.withOptPtr ---> I) setIconName_ (self & iconName)
    fun setIconWidget self iconWidget = (GtkToolButtonClass.FFI.withPtr &&&> GtkWidgetClass.FFI.withOptPtr ---> I) setIconWidget_ (self & iconWidget)
    fun setLabel self label = (GtkToolButtonClass.FFI.withPtr &&&> Utf8.FFI.withOptPtr ---> I) setLabel_ (self & label)
    fun setLabelWidget self labelWidget = (GtkToolButtonClass.FFI.withPtr &&&> GtkWidgetClass.FFI.withOptPtr ---> I) setLabelWidget_ (self & labelWidget)
    fun setStockId self stockId = (GtkToolButtonClass.FFI.withPtr &&&> Utf8.FFI.withOptPtr ---> I) setStockId_ (self & stockId)
    fun setUseUnderline self useUnderline = (GtkToolButtonClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setUseUnderline_ (self & useUnderline)
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
