structure GtkAction :>
  GTK_ACTION
    where type 'a class = 'a GtkActionClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type 'a widget_class = 'a GtkWidgetClass.class
    where type 'a accel_group_class = 'a GtkAccelGroupClass.class
    where type 'a action_group_class = 'a GtkActionGroupClass.class =
  struct
    val getType_ = _import "gtk_action_get_type" : unit -> GObjectType.FFI.val_;
    val new_ =
      fn
        (x1, x2)
         & (x3, x4)
         & (x5, x6)
         & (x7, x8) =>
          (
            _import "mlton_gtk_action_new" :
              Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * Utf8.MLton.p1
               * unit Utf8.MLton.p2
               * Utf8.MLton.p1
               * unit Utf8.MLton.p2
               * Utf8.MLton.p1
               * unit Utf8.MLton.p2
               -> GtkActionClass.FFI.notnull GtkActionClass.FFI.p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6,
              x7,
              x8
            )
    val activate_ = _import "gtk_action_activate" : GtkActionClass.FFI.notnull GtkActionClass.FFI.p -> unit;
    val blockActivate_ = _import "gtk_action_block_activate" : GtkActionClass.FFI.notnull GtkActionClass.FFI.p -> unit;
    val connectAccelerator_ = _import "gtk_action_connect_accelerator" : GtkActionClass.FFI.notnull GtkActionClass.FFI.p -> unit;
    val createIcon_ = fn x1 & x2 => (_import "gtk_action_create_icon" : GtkActionClass.FFI.notnull GtkActionClass.FFI.p * GInt32.FFI.val_ -> GtkWidgetClass.FFI.notnull GtkWidgetClass.FFI.p;) (x1, x2)
    val createMenu_ = _import "gtk_action_create_menu" : GtkActionClass.FFI.notnull GtkActionClass.FFI.p -> GtkWidgetClass.FFI.notnull GtkWidgetClass.FFI.p;
    val createMenuItem_ = _import "gtk_action_create_menu_item" : GtkActionClass.FFI.notnull GtkActionClass.FFI.p -> GtkWidgetClass.FFI.notnull GtkWidgetClass.FFI.p;
    val createToolItem_ = _import "gtk_action_create_tool_item" : GtkActionClass.FFI.notnull GtkActionClass.FFI.p -> GtkWidgetClass.FFI.notnull GtkWidgetClass.FFI.p;
    val disconnectAccelerator_ = _import "gtk_action_disconnect_accelerator" : GtkActionClass.FFI.notnull GtkActionClass.FFI.p -> unit;
    val getAccelClosure_ = _import "gtk_action_get_accel_closure" : GtkActionClass.FFI.notnull GtkActionClass.FFI.p -> GObjectClosureRecord.FFI.notnull GObjectClosureRecord.FFI.p;
    val getAccelPath_ = _import "gtk_action_get_accel_path" : GtkActionClass.FFI.notnull GtkActionClass.FFI.p -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val getAlwaysShowImage_ = _import "gtk_action_get_always_show_image" : GtkActionClass.FFI.notnull GtkActionClass.FFI.p -> GBool.FFI.val_;
    val getGicon_ = _import "gtk_action_get_gicon" : GtkActionClass.FFI.notnull GtkActionClass.FFI.p -> GioIconClass.FFI.notnull GioIconClass.FFI.p;
    val getIconName_ = _import "gtk_action_get_icon_name" : GtkActionClass.FFI.notnull GtkActionClass.FFI.p -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val getIsImportant_ = _import "gtk_action_get_is_important" : GtkActionClass.FFI.notnull GtkActionClass.FFI.p -> GBool.FFI.val_;
    val getLabel_ = _import "gtk_action_get_label" : GtkActionClass.FFI.notnull GtkActionClass.FFI.p -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val getName_ = _import "gtk_action_get_name" : GtkActionClass.FFI.notnull GtkActionClass.FFI.p -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val getSensitive_ = _import "gtk_action_get_sensitive" : GtkActionClass.FFI.notnull GtkActionClass.FFI.p -> GBool.FFI.val_;
    val getShortLabel_ = _import "gtk_action_get_short_label" : GtkActionClass.FFI.notnull GtkActionClass.FFI.p -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val getStockId_ = _import "gtk_action_get_stock_id" : GtkActionClass.FFI.notnull GtkActionClass.FFI.p -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val getTooltip_ = _import "gtk_action_get_tooltip" : GtkActionClass.FFI.notnull GtkActionClass.FFI.p -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val getVisible_ = _import "gtk_action_get_visible" : GtkActionClass.FFI.notnull GtkActionClass.FFI.p -> GBool.FFI.val_;
    val getVisibleHorizontal_ = _import "gtk_action_get_visible_horizontal" : GtkActionClass.FFI.notnull GtkActionClass.FFI.p -> GBool.FFI.val_;
    val getVisibleVertical_ = _import "gtk_action_get_visible_vertical" : GtkActionClass.FFI.notnull GtkActionClass.FFI.p -> GBool.FFI.val_;
    val isSensitive_ = _import "gtk_action_is_sensitive" : GtkActionClass.FFI.notnull GtkActionClass.FFI.p -> GBool.FFI.val_;
    val isVisible_ = _import "gtk_action_is_visible" : GtkActionClass.FFI.notnull GtkActionClass.FFI.p -> GBool.FFI.val_;
    val setAccelGroup_ = fn x1 & x2 => (_import "gtk_action_set_accel_group" : GtkActionClass.FFI.notnull GtkActionClass.FFI.p * unit GtkAccelGroupClass.FFI.p -> unit;) (x1, x2)
    val setAccelPath_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_action_set_accel_path" :
              GtkActionClass.FFI.notnull GtkActionClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setAlwaysShowImage_ = fn x1 & x2 => (_import "gtk_action_set_always_show_image" : GtkActionClass.FFI.notnull GtkActionClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setGicon_ = fn x1 & x2 => (_import "gtk_action_set_gicon" : GtkActionClass.FFI.notnull GtkActionClass.FFI.p * GioIconClass.FFI.notnull GioIconClass.FFI.p -> unit;) (x1, x2)
    val setIconName_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_action_set_icon_name" :
              GtkActionClass.FFI.notnull GtkActionClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setIsImportant_ = fn x1 & x2 => (_import "gtk_action_set_is_important" : GtkActionClass.FFI.notnull GtkActionClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setLabel_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_action_set_label" :
              GtkActionClass.FFI.notnull GtkActionClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setSensitive_ = fn x1 & x2 => (_import "gtk_action_set_sensitive" : GtkActionClass.FFI.notnull GtkActionClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setShortLabel_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_action_set_short_label" :
              GtkActionClass.FFI.notnull GtkActionClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setStockId_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_action_set_stock_id" :
              GtkActionClass.FFI.notnull GtkActionClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setTooltip_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_action_set_tooltip" :
              GtkActionClass.FFI.notnull GtkActionClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setVisible_ = fn x1 & x2 => (_import "gtk_action_set_visible" : GtkActionClass.FFI.notnull GtkActionClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setVisibleHorizontal_ = fn x1 & x2 => (_import "gtk_action_set_visible_horizontal" : GtkActionClass.FFI.notnull GtkActionClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setVisibleVertical_ = fn x1 & x2 => (_import "gtk_action_set_visible_vertical" : GtkActionClass.FFI.notnull GtkActionClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val unblockActivate_ = _import "gtk_action_unblock_activate" : GtkActionClass.FFI.notnull GtkActionClass.FFI.p -> unit;
    type 'a class = 'a GtkActionClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type 'a widget_class = 'a GtkWidgetClass.class
    type 'a accel_group_class = 'a GtkAccelGroupClass.class
    type 'a action_group_class = 'a GtkActionGroupClass.class
    type t = base class
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr ---> GtkBuildableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new
      (
        name,
        label,
        tooltip,
        stockId
      ) =
      (
        Utf8.FFI.withPtr
         &&&> Utf8.FFI.withOptPtr
         &&&> Utf8.FFI.withOptPtr
         &&&> Utf8.FFI.withOptPtr
         ---> GtkActionClass.FFI.fromPtr true
      )
        new_
        (
          name
           & label
           & tooltip
           & stockId
        )
    fun activate self = (GtkActionClass.FFI.withPtr ---> I) activate_ self
    fun blockActivate self = (GtkActionClass.FFI.withPtr ---> I) blockActivate_ self
    fun connectAccelerator self = (GtkActionClass.FFI.withPtr ---> I) connectAccelerator_ self
    fun createIcon self iconSize = (GtkActionClass.FFI.withPtr &&&> GInt32.FFI.withVal ---> GtkWidgetClass.FFI.fromPtr false) createIcon_ (self & iconSize)
    fun createMenu self = (GtkActionClass.FFI.withPtr ---> GtkWidgetClass.FFI.fromPtr false) createMenu_ self
    fun createMenuItem self = (GtkActionClass.FFI.withPtr ---> GtkWidgetClass.FFI.fromPtr false) createMenuItem_ self
    fun createToolItem self = (GtkActionClass.FFI.withPtr ---> GtkWidgetClass.FFI.fromPtr false) createToolItem_ self
    fun disconnectAccelerator self = (GtkActionClass.FFI.withPtr ---> I) disconnectAccelerator_ self
    fun getAccelClosure self = (GtkActionClass.FFI.withPtr ---> GObjectClosureRecord.FFI.fromPtr false) getAccelClosure_ self
    fun getAccelPath self = (GtkActionClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getAccelPath_ self
    fun getAlwaysShowImage self = (GtkActionClass.FFI.withPtr ---> GBool.FFI.fromVal) getAlwaysShowImage_ self
    fun getGicon self = (GtkActionClass.FFI.withPtr ---> GioIconClass.FFI.fromPtr false) getGicon_ self
    fun getIconName self = (GtkActionClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getIconName_ self
    fun getIsImportant self = (GtkActionClass.FFI.withPtr ---> GBool.FFI.fromVal) getIsImportant_ self
    fun getLabel self = (GtkActionClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getLabel_ self
    fun getName self = (GtkActionClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getName_ self
    fun getSensitive self = (GtkActionClass.FFI.withPtr ---> GBool.FFI.fromVal) getSensitive_ self
    fun getShortLabel self = (GtkActionClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getShortLabel_ self
    fun getStockId self = (GtkActionClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getStockId_ self
    fun getTooltip self = (GtkActionClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getTooltip_ self
    fun getVisible self = (GtkActionClass.FFI.withPtr ---> GBool.FFI.fromVal) getVisible_ self
    fun getVisibleHorizontal self = (GtkActionClass.FFI.withPtr ---> GBool.FFI.fromVal) getVisibleHorizontal_ self
    fun getVisibleVertical self = (GtkActionClass.FFI.withPtr ---> GBool.FFI.fromVal) getVisibleVertical_ self
    fun isSensitive self = (GtkActionClass.FFI.withPtr ---> GBool.FFI.fromVal) isSensitive_ self
    fun isVisible self = (GtkActionClass.FFI.withPtr ---> GBool.FFI.fromVal) isVisible_ self
    fun setAccelGroup self accelGroup = (GtkActionClass.FFI.withPtr &&&> GtkAccelGroupClass.FFI.withOptPtr ---> I) setAccelGroup_ (self & accelGroup)
    fun setAccelPath self accelPath = (GtkActionClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> I) setAccelPath_ (self & accelPath)
    fun setAlwaysShowImage self alwaysShow = (GtkActionClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setAlwaysShowImage_ (self & alwaysShow)
    fun setGicon self icon = (GtkActionClass.FFI.withPtr &&&> GioIconClass.FFI.withPtr ---> I) setGicon_ (self & icon)
    fun setIconName self iconName = (GtkActionClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> I) setIconName_ (self & iconName)
    fun setIsImportant self isImportant = (GtkActionClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setIsImportant_ (self & isImportant)
    fun setLabel self label = (GtkActionClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> I) setLabel_ (self & label)
    fun setSensitive self sensitive = (GtkActionClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setSensitive_ (self & sensitive)
    fun setShortLabel self shortLabel = (GtkActionClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> I) setShortLabel_ (self & shortLabel)
    fun setStockId self stockId = (GtkActionClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> I) setStockId_ (self & stockId)
    fun setTooltip self tooltip = (GtkActionClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> I) setTooltip_ (self & tooltip)
    fun setVisible self visible = (GtkActionClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setVisible_ (self & visible)
    fun setVisibleHorizontal self visibleHorizontal = (GtkActionClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setVisibleHorizontal_ (self & visibleHorizontal)
    fun setVisibleVertical self visibleVertical = (GtkActionClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setVisibleVertical_ (self & visibleVertical)
    fun unblockActivate self = (GtkActionClass.FFI.withPtr ---> I) unblockActivate_ self
    local
      open ClosureMarshal Signal
    in
      fun activateSig f = signal "activate" (void ---> ret_void) f
    end
    local
      open Property
    in
      val actionGroupProp =
        {
          get = fn x => get "action-group" GtkActionGroupClass.tOpt x,
          set = fn x => set "action-group" GtkActionGroupClass.tOpt x
        }
      val alwaysShowImageProp =
        {
          get = fn x => get "always-show-image" boolean x,
          set = fn x => set "always-show-image" boolean x
        }
      val giconProp =
        {
          get = fn x => get "gicon" GioIconClass.tOpt x,
          set = fn x => set "gicon" GioIconClass.tOpt x
        }
      val hideIfEmptyProp =
        {
          get = fn x => get "hide-if-empty" boolean x,
          set = fn x => set "hide-if-empty" boolean x
        }
      val iconNameProp =
        {
          get = fn x => get "icon-name" stringOpt x,
          set = fn x => set "icon-name" stringOpt x
        }
      val isImportantProp =
        {
          get = fn x => get "is-important" boolean x,
          set = fn x => set "is-important" boolean x
        }
      val labelProp =
        {
          get = fn x => get "label" stringOpt x,
          set = fn x => set "label" stringOpt x
        }
      val nameProp =
        {
          get = fn x => get "name" stringOpt x,
          set = fn x => set "name" stringOpt x
        }
      val sensitiveProp =
        {
          get = fn x => get "sensitive" boolean x,
          set = fn x => set "sensitive" boolean x
        }
      val shortLabelProp =
        {
          get = fn x => get "short-label" stringOpt x,
          set = fn x => set "short-label" stringOpt x
        }
      val stockIdProp =
        {
          get = fn x => get "stock-id" stringOpt x,
          set = fn x => set "stock-id" stringOpt x
        }
      val tooltipProp =
        {
          get = fn x => get "tooltip" stringOpt x,
          set = fn x => set "tooltip" stringOpt x
        }
      val visibleProp =
        {
          get = fn x => get "visible" boolean x,
          set = fn x => set "visible" boolean x
        }
      val visibleHorizontalProp =
        {
          get = fn x => get "visible-horizontal" boolean x,
          set = fn x => set "visible-horizontal" boolean x
        }
      val visibleOverflownProp =
        {
          get = fn x => get "visible-overflown" boolean x,
          set = fn x => set "visible-overflown" boolean x
        }
      val visibleVerticalProp =
        {
          get = fn x => get "visible-vertical" boolean x,
          set = fn x => set "visible-vertical" boolean x
        }
    end
  end
