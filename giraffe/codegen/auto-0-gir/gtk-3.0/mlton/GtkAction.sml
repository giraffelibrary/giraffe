structure GtkAction :>
  GTK_ACTION
    where type 'a class = 'a GtkActionClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type 'a widget_class = 'a GtkWidgetClass.class
    where type 'a accel_group_class = 'a GtkAccelGroupClass.class
    where type 'a action_group_class = 'a GtkActionGroupClass.class =
  struct
    val getType_ = _import "gtk_action_get_type" : unit -> GObjectType.C.val_;
    val new_ =
      fn
        (x1, x2)
         & (x3, x4)
         & (x5, x6)
         & (x7, x8) =>
          (
            _import "mlton_gtk_action_new" :
              Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * Utf8.MLton.p1
               * unit Utf8.MLton.p2
               * Utf8.MLton.p1
               * unit Utf8.MLton.p2
               * Utf8.MLton.p1
               * unit Utf8.MLton.p2
               -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
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
    val activate_ = _import "gtk_action_activate" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;
    val blockActivate_ = _import "gtk_action_block_activate" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;
    val connectAccelerator_ = _import "gtk_action_connect_accelerator" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;
    val createIcon_ = fn x1 & x2 => (_import "gtk_action_create_icon" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Int.C.val_ -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;) (x1, x2)
    val createMenu_ = _import "gtk_action_create_menu" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val createMenuItem_ = _import "gtk_action_create_menu_item" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val createToolItem_ = _import "gtk_action_create_tool_item" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val disconnectAccelerator_ = _import "gtk_action_disconnect_accelerator" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;
    val getAccelClosure_ = _import "gtk_action_get_accel_closure" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectClosureRecord.C.notnull GObjectClosureRecord.C.p;
    val getAccelPath_ = _import "gtk_action_get_accel_path" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> Utf8.C.notnull Utf8.C.out_p;
    val getAlwaysShowImage_ = _import "gtk_action_get_always_show_image" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    val getGicon_ = _import "gtk_action_get_gicon" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val getIconName_ = _import "gtk_action_get_icon_name" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> Utf8.C.notnull Utf8.C.out_p;
    val getIsImportant_ = _import "gtk_action_get_is_important" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    val getLabel_ = _import "gtk_action_get_label" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> Utf8.C.notnull Utf8.C.out_p;
    val getName_ = _import "gtk_action_get_name" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> Utf8.C.notnull Utf8.C.out_p;
    val getSensitive_ = _import "gtk_action_get_sensitive" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    val getShortLabel_ = _import "gtk_action_get_short_label" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> Utf8.C.notnull Utf8.C.out_p;
    val getStockId_ = _import "gtk_action_get_stock_id" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> Utf8.C.notnull Utf8.C.out_p;
    val getTooltip_ = _import "gtk_action_get_tooltip" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> Utf8.C.notnull Utf8.C.out_p;
    val getVisible_ = _import "gtk_action_get_visible" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    val getVisibleHorizontal_ = _import "gtk_action_get_visible_horizontal" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    val getVisibleVertical_ = _import "gtk_action_get_visible_vertical" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    val isSensitive_ = _import "gtk_action_is_sensitive" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    val isVisible_ = _import "gtk_action_is_visible" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    val setAccelGroup_ = fn x1 & x2 => (_import "gtk_action_set_accel_group" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * unit GObjectObjectClass.C.p -> unit;) (x1, x2)
    val setAccelPath_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_action_set_accel_path" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setAlwaysShowImage_ = fn x1 & x2 => (_import "gtk_action_set_always_show_image" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setGicon_ = fn x1 & x2 => (_import "gtk_action_set_gicon" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;) (x1, x2)
    val setIconName_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_action_set_icon_name" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setIsImportant_ = fn x1 & x2 => (_import "gtk_action_set_is_important" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setLabel_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_action_set_label" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setSensitive_ = fn x1 & x2 => (_import "gtk_action_set_sensitive" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setShortLabel_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_action_set_short_label" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setVisible_ = fn x1 & x2 => (_import "gtk_action_set_visible" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setVisibleHorizontal_ = fn x1 & x2 => (_import "gtk_action_set_visible_horizontal" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setVisibleVertical_ = fn x1 & x2 => (_import "gtk_action_set_visible_vertical" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val unblockActivate_ = _import "gtk_action_unblock_activate" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;
    type 'a class = 'a GtkActionClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type 'a widget_class = 'a GtkWidgetClass.class
    type 'a accel_group_class = 'a GtkAccelGroupClass.class
    type 'a action_group_class = 'a GtkActionGroupClass.class
    type t = base class
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new name label tooltip stockId =
      (
        Utf8.C.withPtr
         &&&> Utf8.C.withOptPtr
         &&&> Utf8.C.withOptPtr
         &&&> Utf8.C.withOptPtr
         ---> GtkActionClass.C.fromPtr true
      )
        new_
        (
          name
           & label
           & tooltip
           & stockId
        )
    fun activate self = (GObjectObjectClass.C.withPtr ---> I) activate_ self
    fun blockActivate self = (GObjectObjectClass.C.withPtr ---> I) blockActivate_ self
    fun connectAccelerator self = (GObjectObjectClass.C.withPtr ---> I) connectAccelerator_ self
    fun createIcon self iconSize = (GObjectObjectClass.C.withPtr &&&> FFI.Int.C.withVal ---> GtkWidgetClass.C.fromPtr false) createIcon_ (self & iconSize)
    fun createMenu self = (GObjectObjectClass.C.withPtr ---> GtkWidgetClass.C.fromPtr false) createMenu_ self
    fun createMenuItem self = (GObjectObjectClass.C.withPtr ---> GtkWidgetClass.C.fromPtr false) createMenuItem_ self
    fun createToolItem self = (GObjectObjectClass.C.withPtr ---> GtkWidgetClass.C.fromPtr false) createToolItem_ self
    fun disconnectAccelerator self = (GObjectObjectClass.C.withPtr ---> I) disconnectAccelerator_ self
    fun getAccelClosure self = (GObjectObjectClass.C.withPtr ---> GObjectClosureRecord.C.fromPtr false) getAccelClosure_ self
    fun getAccelPath self = (GObjectObjectClass.C.withPtr ---> Utf8.C.fromPtr false) getAccelPath_ self
    fun getAlwaysShowImage self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getAlwaysShowImage_ self
    fun getGicon self = (GObjectObjectClass.C.withPtr ---> GioIconClass.C.fromPtr false) getGicon_ self
    fun getIconName self = (GObjectObjectClass.C.withPtr ---> Utf8.C.fromPtr false) getIconName_ self
    fun getIsImportant self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getIsImportant_ self
    fun getLabel self = (GObjectObjectClass.C.withPtr ---> Utf8.C.fromPtr false) getLabel_ self
    fun getName self = (GObjectObjectClass.C.withPtr ---> Utf8.C.fromPtr false) getName_ self
    fun getSensitive self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getSensitive_ self
    fun getShortLabel self = (GObjectObjectClass.C.withPtr ---> Utf8.C.fromPtr false) getShortLabel_ self
    fun getStockId self = (GObjectObjectClass.C.withPtr ---> Utf8.C.fromPtr false) getStockId_ self
    fun getTooltip self = (GObjectObjectClass.C.withPtr ---> Utf8.C.fromPtr false) getTooltip_ self
    fun getVisible self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getVisible_ self
    fun getVisibleHorizontal self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getVisibleHorizontal_ self
    fun getVisibleVertical self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getVisibleVertical_ self
    fun isSensitive self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) isSensitive_ self
    fun isVisible self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) isVisible_ self
    fun setAccelGroup self accelGroup = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withOptPtr ---> I) setAccelGroup_ (self & accelGroup)
    fun setAccelPath self accelPath = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withPtr ---> I) setAccelPath_ (self & accelPath)
    fun setAlwaysShowImage self alwaysShow = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setAlwaysShowImage_ (self & alwaysShow)
    fun setGicon self icon = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> I) setGicon_ (self & icon)
    fun setIconName self iconName = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withPtr ---> I) setIconName_ (self & iconName)
    fun setIsImportant self isImportant = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setIsImportant_ (self & isImportant)
    fun setLabel self label = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withPtr ---> I) setLabel_ (self & label)
    fun setSensitive self sensitive = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setSensitive_ (self & sensitive)
    fun setShortLabel self shortLabel = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withPtr ---> I) setShortLabel_ (self & shortLabel)
    fun setStockId self stockId = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withPtr ---> I) setStockId_ (self & stockId)
    fun setTooltip self tooltip = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withPtr ---> I) setTooltip_ (self & tooltip)
    fun setVisible self visible = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setVisible_ (self & visible)
    fun setVisibleHorizontal self visibleHorizontal = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setVisibleHorizontal_ (self & visibleHorizontal)
    fun setVisibleVertical self visibleVertical = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setVisibleVertical_ (self & visibleVertical)
    fun unblockActivate self = (GObjectObjectClass.C.withPtr ---> I) unblockActivate_ self
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
