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
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.opt Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.opt Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.opt Utf8.MLton.p2
               -> GtkActionClass.FFI.non_opt GtkActionClass.FFI.p;
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
    val activate_ = _import "gtk_action_activate" : GtkActionClass.FFI.non_opt GtkActionClass.FFI.p -> unit;
    val blockActivate_ = _import "gtk_action_block_activate" : GtkActionClass.FFI.non_opt GtkActionClass.FFI.p -> unit;
    val connectAccelerator_ = _import "gtk_action_connect_accelerator" : GtkActionClass.FFI.non_opt GtkActionClass.FFI.p -> unit;
    val createIcon_ = fn x1 & x2 => (_import "gtk_action_create_icon" : GtkActionClass.FFI.non_opt GtkActionClass.FFI.p * GInt32.FFI.val_ -> GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p;) (x1, x2)
    val createMenu_ = _import "gtk_action_create_menu" : GtkActionClass.FFI.non_opt GtkActionClass.FFI.p -> GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p;
    val createMenuItem_ = _import "gtk_action_create_menu_item" : GtkActionClass.FFI.non_opt GtkActionClass.FFI.p -> GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p;
    val createToolItem_ = _import "gtk_action_create_tool_item" : GtkActionClass.FFI.non_opt GtkActionClass.FFI.p -> GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p;
    val disconnectAccelerator_ = _import "gtk_action_disconnect_accelerator" : GtkActionClass.FFI.non_opt GtkActionClass.FFI.p -> unit;
    val getAccelClosure_ = _import "gtk_action_get_accel_closure" : GtkActionClass.FFI.non_opt GtkActionClass.FFI.p -> GObjectClosureRecord.FFI.non_opt GObjectClosureRecord.FFI.p;
    val getAccelPath_ = _import "gtk_action_get_accel_path" : GtkActionClass.FFI.non_opt GtkActionClass.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val getAlwaysShowImage_ = _import "gtk_action_get_always_show_image" : GtkActionClass.FFI.non_opt GtkActionClass.FFI.p -> GBool.FFI.val_;
    val getGicon_ = _import "gtk_action_get_gicon" : GtkActionClass.FFI.non_opt GtkActionClass.FFI.p -> GioIconClass.FFI.non_opt GioIconClass.FFI.p;
    val getIconName_ = _import "gtk_action_get_icon_name" : GtkActionClass.FFI.non_opt GtkActionClass.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val getIsImportant_ = _import "gtk_action_get_is_important" : GtkActionClass.FFI.non_opt GtkActionClass.FFI.p -> GBool.FFI.val_;
    val getLabel_ = _import "gtk_action_get_label" : GtkActionClass.FFI.non_opt GtkActionClass.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val getName_ = _import "gtk_action_get_name" : GtkActionClass.FFI.non_opt GtkActionClass.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val getSensitive_ = _import "gtk_action_get_sensitive" : GtkActionClass.FFI.non_opt GtkActionClass.FFI.p -> GBool.FFI.val_;
    val getShortLabel_ = _import "gtk_action_get_short_label" : GtkActionClass.FFI.non_opt GtkActionClass.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val getStockId_ = _import "gtk_action_get_stock_id" : GtkActionClass.FFI.non_opt GtkActionClass.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val getTooltip_ = _import "gtk_action_get_tooltip" : GtkActionClass.FFI.non_opt GtkActionClass.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val getVisible_ = _import "gtk_action_get_visible" : GtkActionClass.FFI.non_opt GtkActionClass.FFI.p -> GBool.FFI.val_;
    val getVisibleHorizontal_ = _import "gtk_action_get_visible_horizontal" : GtkActionClass.FFI.non_opt GtkActionClass.FFI.p -> GBool.FFI.val_;
    val getVisibleVertical_ = _import "gtk_action_get_visible_vertical" : GtkActionClass.FFI.non_opt GtkActionClass.FFI.p -> GBool.FFI.val_;
    val isSensitive_ = _import "gtk_action_is_sensitive" : GtkActionClass.FFI.non_opt GtkActionClass.FFI.p -> GBool.FFI.val_;
    val isVisible_ = _import "gtk_action_is_visible" : GtkActionClass.FFI.non_opt GtkActionClass.FFI.p -> GBool.FFI.val_;
    val setAccelGroup_ = fn x1 & x2 => (_import "gtk_action_set_accel_group" : GtkActionClass.FFI.non_opt GtkActionClass.FFI.p * GtkAccelGroupClass.FFI.opt GtkAccelGroupClass.FFI.p -> unit;) (x1, x2)
    val setAccelPath_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_action_set_accel_path" :
              GtkActionClass.FFI.non_opt GtkActionClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setAlwaysShowImage_ = fn x1 & x2 => (_import "gtk_action_set_always_show_image" : GtkActionClass.FFI.non_opt GtkActionClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setGicon_ = fn x1 & x2 => (_import "gtk_action_set_gicon" : GtkActionClass.FFI.non_opt GtkActionClass.FFI.p * GioIconClass.FFI.non_opt GioIconClass.FFI.p -> unit;) (x1, x2)
    val setIconName_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_action_set_icon_name" :
              GtkActionClass.FFI.non_opt GtkActionClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setIsImportant_ = fn x1 & x2 => (_import "gtk_action_set_is_important" : GtkActionClass.FFI.non_opt GtkActionClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setLabel_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_action_set_label" :
              GtkActionClass.FFI.non_opt GtkActionClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setSensitive_ = fn x1 & x2 => (_import "gtk_action_set_sensitive" : GtkActionClass.FFI.non_opt GtkActionClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setShortLabel_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_action_set_short_label" :
              GtkActionClass.FFI.non_opt GtkActionClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
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
              GtkActionClass.FFI.non_opt GtkActionClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
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
              GtkActionClass.FFI.non_opt GtkActionClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setVisible_ = fn x1 & x2 => (_import "gtk_action_set_visible" : GtkActionClass.FFI.non_opt GtkActionClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setVisibleHorizontal_ = fn x1 & x2 => (_import "gtk_action_set_visible_horizontal" : GtkActionClass.FFI.non_opt GtkActionClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setVisibleVertical_ = fn x1 & x2 => (_import "gtk_action_set_visible_vertical" : GtkActionClass.FFI.non_opt GtkActionClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val unblockActivate_ = _import "gtk_action_unblock_activate" : GtkActionClass.FFI.non_opt GtkActionClass.FFI.p -> unit;
    type 'a class = 'a GtkActionClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type 'a widget_class = 'a GtkWidgetClass.class
    type 'a accel_group_class = 'a GtkAccelGroupClass.class
    type 'a action_group_class = 'a GtkActionGroupClass.class
    type t = base class
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr false ---> GtkBuildableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new
      (
        name,
        label,
        tooltip,
        stockId
      ) =
      (
        Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withOptPtr 0
         &&&> Utf8.FFI.withOptPtr 0
         &&&> Utf8.FFI.withOptPtr 0
         ---> GtkActionClass.FFI.fromPtr true
      )
        new_
        (
          name
           & label
           & tooltip
           & stockId
        )
    fun activate self = (GtkActionClass.FFI.withPtr false ---> I) activate_ self
    fun blockActivate self = (GtkActionClass.FFI.withPtr false ---> I) blockActivate_ self
    fun connectAccelerator self = (GtkActionClass.FFI.withPtr false ---> I) connectAccelerator_ self
    fun createIcon self iconSize = (GtkActionClass.FFI.withPtr false &&&> GInt32.FFI.withVal ---> GtkWidgetClass.FFI.fromPtr false) createIcon_ (self & iconSize) before GtkActionClass.FFI.touchPtr self
    fun createMenu self = (GtkActionClass.FFI.withPtr false ---> GtkWidgetClass.FFI.fromPtr false) createMenu_ self before GtkActionClass.FFI.touchPtr self
    fun createMenuItem self = (GtkActionClass.FFI.withPtr false ---> GtkWidgetClass.FFI.fromPtr false) createMenuItem_ self before GtkActionClass.FFI.touchPtr self
    fun createToolItem self = (GtkActionClass.FFI.withPtr false ---> GtkWidgetClass.FFI.fromPtr false) createToolItem_ self before GtkActionClass.FFI.touchPtr self
    fun disconnectAccelerator self = (GtkActionClass.FFI.withPtr false ---> I) disconnectAccelerator_ self
    fun getAccelClosure self = (GtkActionClass.FFI.withPtr false ---> GObjectClosureRecord.FFI.fromPtr false) getAccelClosure_ self before GtkActionClass.FFI.touchPtr self
    fun getAccelPath self = (GtkActionClass.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getAccelPath_ self before GtkActionClass.FFI.touchPtr self
    fun getAlwaysShowImage self = (GtkActionClass.FFI.withPtr false ---> GBool.FFI.fromVal) getAlwaysShowImage_ self
    fun getGicon self = (GtkActionClass.FFI.withPtr false ---> GioIconClass.FFI.fromPtr false) getGicon_ self before GtkActionClass.FFI.touchPtr self
    fun getIconName self = (GtkActionClass.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getIconName_ self before GtkActionClass.FFI.touchPtr self
    fun getIsImportant self = (GtkActionClass.FFI.withPtr false ---> GBool.FFI.fromVal) getIsImportant_ self
    fun getLabel self = (GtkActionClass.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getLabel_ self before GtkActionClass.FFI.touchPtr self
    fun getName self = (GtkActionClass.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getName_ self before GtkActionClass.FFI.touchPtr self
    fun getSensitive self = (GtkActionClass.FFI.withPtr false ---> GBool.FFI.fromVal) getSensitive_ self
    fun getShortLabel self = (GtkActionClass.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getShortLabel_ self before GtkActionClass.FFI.touchPtr self
    fun getStockId self = (GtkActionClass.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getStockId_ self before GtkActionClass.FFI.touchPtr self
    fun getTooltip self = (GtkActionClass.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getTooltip_ self before GtkActionClass.FFI.touchPtr self
    fun getVisible self = (GtkActionClass.FFI.withPtr false ---> GBool.FFI.fromVal) getVisible_ self
    fun getVisibleHorizontal self = (GtkActionClass.FFI.withPtr false ---> GBool.FFI.fromVal) getVisibleHorizontal_ self
    fun getVisibleVertical self = (GtkActionClass.FFI.withPtr false ---> GBool.FFI.fromVal) getVisibleVertical_ self
    fun isSensitive self = (GtkActionClass.FFI.withPtr false ---> GBool.FFI.fromVal) isSensitive_ self
    fun isVisible self = (GtkActionClass.FFI.withPtr false ---> GBool.FFI.fromVal) isVisible_ self
    fun setAccelGroup self accelGroup = (GtkActionClass.FFI.withPtr false &&&> GtkAccelGroupClass.FFI.withOptPtr false ---> I) setAccelGroup_ (self & accelGroup)
    fun setAccelPath self accelPath = (GtkActionClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> I) setAccelPath_ (self & accelPath)
    fun setAlwaysShowImage self alwaysShow = (GtkActionClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setAlwaysShowImage_ (self & alwaysShow)
    fun setGicon self icon = (GtkActionClass.FFI.withPtr false &&&> GioIconClass.FFI.withPtr false ---> I) setGicon_ (self & icon)
    fun setIconName self iconName = (GtkActionClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> I) setIconName_ (self & iconName)
    fun setIsImportant self isImportant = (GtkActionClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setIsImportant_ (self & isImportant)
    fun setLabel self label = (GtkActionClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> I) setLabel_ (self & label)
    fun setSensitive self sensitive = (GtkActionClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setSensitive_ (self & sensitive)
    fun setShortLabel self shortLabel = (GtkActionClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> I) setShortLabel_ (self & shortLabel)
    fun setStockId self stockId = (GtkActionClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> I) setStockId_ (self & stockId)
    fun setTooltip self tooltip = (GtkActionClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> I) setTooltip_ (self & tooltip)
    fun setVisible self visible = (GtkActionClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setVisible_ (self & visible)
    fun setVisibleHorizontal self visibleHorizontal = (GtkActionClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setVisibleHorizontal_ (self & visibleHorizontal)
    fun setVisibleVertical self visibleVertical = (GtkActionClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setVisibleVertical_ (self & visibleVertical)
    fun unblockActivate self = (GtkActionClass.FFI.withPtr false ---> I) unblockActivate_ self
    local
      open ClosureMarshal Signal
    in
      fun activateSig f = signal "activate" (void ---> ret_void) f
    end
    local
      open ValueAccessor
    in
      val actionGroupProp =
        {
          name = "action-group",
          gtype = fn () => C.gtype GtkActionGroupClass.tOpt (),
          get = fn x => fn () => C.get GtkActionGroupClass.tOpt x,
          set = fn x => C.set GtkActionGroupClass.tOpt x,
          init = fn x => C.set GtkActionGroupClass.tOpt x
        }
      val alwaysShowImageProp =
        {
          name = "always-show-image",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val giconProp =
        {
          name = "gicon",
          gtype = fn () => C.gtype GioIconClass.tOpt (),
          get = fn x => fn () => C.get GioIconClass.tOpt x,
          set = fn x => C.set GioIconClass.tOpt x,
          init = fn x => C.set GioIconClass.tOpt x
        }
      val hideIfEmptyProp =
        {
          name = "hide-if-empty",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val iconNameProp =
        {
          name = "icon-name",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = fn x => C.set stringOpt x,
          init = fn x => C.set stringOpt x
        }
      val isImportantProp =
        {
          name = "is-important",
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
      val nameProp =
        {
          name = "name",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = ignore,
          init = fn x => C.set stringOpt x
        }
      val sensitiveProp =
        {
          name = "sensitive",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val shortLabelProp =
        {
          name = "short-label",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = fn x => C.set stringOpt x,
          init = fn x => C.set stringOpt x
        }
      val stockIdProp =
        {
          name = "stock-id",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = fn x => C.set stringOpt x,
          init = fn x => C.set stringOpt x
        }
      val tooltipProp =
        {
          name = "tooltip",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = fn x => C.set stringOpt x,
          init = fn x => C.set stringOpt x
        }
      val visibleProp =
        {
          name = "visible",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val visibleHorizontalProp =
        {
          name = "visible-horizontal",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val visibleOverflownProp =
        {
          name = "visible-overflown",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val visibleVerticalProp =
        {
          name = "visible-vertical",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
    end
  end
