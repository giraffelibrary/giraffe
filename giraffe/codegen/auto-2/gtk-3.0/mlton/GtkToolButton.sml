structure GtkToolButton :>
  GTK_TOOL_BUTTON
    where type 'a class_t = 'a GtkToolButtonClass.t
    where type 'a activatableclass_t = 'a GtkActivatableClass.t
    where type 'a buildableclass_t = 'a GtkBuildableClass.t
    where type 'a widgetclass_t = 'a GtkWidgetClass.t =
  struct
    val getType_ = _import "gtk_tool_button_get_type" : unit -> GObjectType.C.val_;
    val new_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_tool_button_new" :
              unit GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
          )
            (
              x1,
              x2,
              x3
            )
    val newFromStock_ = _import "mlton_gtk_tool_button_new_from_stock" : cstring * unit CPointer.t -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val getIconName_ = _import "gtk_tool_button_get_icon_name" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.String.notnull FFI.String.out_p;
    val getIconWidget_ = _import "gtk_tool_button_get_icon_widget" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val getLabel_ = _import "gtk_tool_button_get_label" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.String.notnull FFI.String.out_p;
    val getLabelWidget_ = _import "gtk_tool_button_get_label_widget" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val getStockId_ = _import "gtk_tool_button_get_stock_id" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.String.notnull FFI.String.out_p;
    val getUseUnderline_ = _import "gtk_tool_button_get_use_underline" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.val_;
    val setIconName_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_tool_button_set_icon_name" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setIconWidget_ = fn x1 & x2 => (_import "gtk_tool_button_set_icon_widget" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * unit GObjectObjectClass.C.p -> unit;) (x1, x2)
    val setLabel_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_tool_button_set_label" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setLabelWidget_ = fn x1 & x2 => (_import "gtk_tool_button_set_label_widget" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * unit GObjectObjectClass.C.p -> unit;) (x1, x2)
    val setStockId_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_tool_button_set_stock_id" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setUseUnderline_ = fn x1 & x2 => (_import "gtk_tool_button_set_use_underline" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Bool.val_ -> unit;) (x1, x2)
    type 'a class_t = 'a GtkToolButtonClass.t
    type 'a activatableclass_t = 'a GtkActivatableClass.t
    type 'a buildableclass_t = 'a GtkBuildableClass.t
    type 'a widgetclass_t = 'a GtkWidgetClass.t
    fun asImplementorIface self = (GObjectObjectClass.C.withPtr ---> AtkImplementorIfaceClass.C.fromPtr false) I self
    fun asActivatable self = (GObjectObjectClass.C.withPtr ---> GtkActivatableClass.C.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new iconWidget label = (GObjectObjectClass.C.withOptPtr &&&> FFI.String.withConstOptPtr ---> GtkToolButtonClass.C.fromPtr false) new_ (iconWidget & label)
    fun newFromStock stockId = (FFI.String.withConstPtr ---> GtkToolButtonClass.C.fromPtr false) newFromStock_ stockId
    fun getIconName self = (GObjectObjectClass.C.withPtr ---> FFI.String.fromPtr false) getIconName_ self
    fun getIconWidget self = (GObjectObjectClass.C.withPtr ---> GtkWidgetClass.C.fromPtr false) getIconWidget_ self
    fun getLabel self = (GObjectObjectClass.C.withPtr ---> FFI.String.fromPtr false) getLabel_ self
    fun getLabelWidget self = (GObjectObjectClass.C.withPtr ---> GtkWidgetClass.C.fromPtr false) getLabelWidget_ self
    fun getStockId self = (GObjectObjectClass.C.withPtr ---> FFI.String.fromPtr false) getStockId_ self
    fun getUseUnderline self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.fromVal) getUseUnderline_ self
    fun setIconName self iconName = (GObjectObjectClass.C.withPtr &&&> FFI.String.withConstOptPtr ---> I) setIconName_ (self & iconName)
    fun setIconWidget self iconWidget = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withOptPtr ---> I) setIconWidget_ (self & iconWidget)
    fun setLabel self label = (GObjectObjectClass.C.withPtr &&&> FFI.String.withConstOptPtr ---> I) setLabel_ (self & label)
    fun setLabelWidget self labelWidget = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withOptPtr ---> I) setLabelWidget_ (self & labelWidget)
    fun setStockId self stockId = (GObjectObjectClass.C.withPtr &&&> FFI.String.withConstOptPtr ---> I) setStockId_ (self & stockId)
    fun setUseUnderline self useUnderline = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.withVal ---> I) setUseUnderline_ (self & useUnderline)
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
