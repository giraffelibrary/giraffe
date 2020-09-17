structure GtkAction :>
  GTK_ACTION
    where type 'a class = 'a GtkActionClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type 'a widget_class = 'a GtkWidgetClass.class
    where type 'a accel_group_class = 'a GtkAccelGroupClass.class
    where type 'a action_group_class = 'a GtkActionGroupClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_action_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ =
        call (getSymbol "gtk_action_new")
          (
            Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInOptPtr
             &&> Utf8.PolyML.cInOptPtr
             &&> Utf8.PolyML.cInOptPtr
             --> GtkActionClass.PolyML.cPtr
          )
      val activate_ = call (getSymbol "gtk_action_activate") (GtkActionClass.PolyML.cPtr --> cVoid)
      val blockActivate_ = call (getSymbol "gtk_action_block_activate") (GtkActionClass.PolyML.cPtr --> cVoid)
      val connectAccelerator_ = call (getSymbol "gtk_action_connect_accelerator") (GtkActionClass.PolyML.cPtr --> cVoid)
      val createIcon_ = call (getSymbol "gtk_action_create_icon") (GtkActionClass.PolyML.cPtr &&> GInt.PolyML.cVal --> GtkWidgetClass.PolyML.cPtr)
      val createMenu_ = call (getSymbol "gtk_action_create_menu") (GtkActionClass.PolyML.cPtr --> GtkWidgetClass.PolyML.cPtr)
      val createMenuItem_ = call (getSymbol "gtk_action_create_menu_item") (GtkActionClass.PolyML.cPtr --> GtkWidgetClass.PolyML.cPtr)
      val createToolItem_ = call (getSymbol "gtk_action_create_tool_item") (GtkActionClass.PolyML.cPtr --> GtkWidgetClass.PolyML.cPtr)
      val disconnectAccelerator_ = call (getSymbol "gtk_action_disconnect_accelerator") (GtkActionClass.PolyML.cPtr --> cVoid)
      val getAccelClosure_ = call (getSymbol "gtk_action_get_accel_closure") (GtkActionClass.PolyML.cPtr --> GObjectClosureRecord.PolyML.cPtr)
      val getAccelPath_ = call (getSymbol "gtk_action_get_accel_path") (GtkActionClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getAlwaysShowImage_ = call (getSymbol "gtk_action_get_always_show_image") (GtkActionClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getGicon_ = call (getSymbol "gtk_action_get_gicon") (GtkActionClass.PolyML.cPtr --> GioIconClass.PolyML.cPtr)
      val getIconName_ = call (getSymbol "gtk_action_get_icon_name") (GtkActionClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getIsImportant_ = call (getSymbol "gtk_action_get_is_important") (GtkActionClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getLabel_ = call (getSymbol "gtk_action_get_label") (GtkActionClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getName_ = call (getSymbol "gtk_action_get_name") (GtkActionClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getSensitive_ = call (getSymbol "gtk_action_get_sensitive") (GtkActionClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getShortLabel_ = call (getSymbol "gtk_action_get_short_label") (GtkActionClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getStockId_ = call (getSymbol "gtk_action_get_stock_id") (GtkActionClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getTooltip_ = call (getSymbol "gtk_action_get_tooltip") (GtkActionClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getVisible_ = call (getSymbol "gtk_action_get_visible") (GtkActionClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getVisibleHorizontal_ = call (getSymbol "gtk_action_get_visible_horizontal") (GtkActionClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getVisibleVertical_ = call (getSymbol "gtk_action_get_visible_vertical") (GtkActionClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val isSensitive_ = call (getSymbol "gtk_action_is_sensitive") (GtkActionClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val isVisible_ = call (getSymbol "gtk_action_is_visible") (GtkActionClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val setAccelGroup_ = call (getSymbol "gtk_action_set_accel_group") (GtkActionClass.PolyML.cPtr &&> GtkAccelGroupClass.PolyML.cOptPtr --> cVoid)
      val setAccelPath_ = call (getSymbol "gtk_action_set_accel_path") (GtkActionClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> cVoid)
      val setAlwaysShowImage_ = call (getSymbol "gtk_action_set_always_show_image") (GtkActionClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setGicon_ = call (getSymbol "gtk_action_set_gicon") (GtkActionClass.PolyML.cPtr &&> GioIconClass.PolyML.cPtr --> cVoid)
      val setIconName_ = call (getSymbol "gtk_action_set_icon_name") (GtkActionClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> cVoid)
      val setIsImportant_ = call (getSymbol "gtk_action_set_is_important") (GtkActionClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setLabel_ = call (getSymbol "gtk_action_set_label") (GtkActionClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> cVoid)
      val setSensitive_ = call (getSymbol "gtk_action_set_sensitive") (GtkActionClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setShortLabel_ = call (getSymbol "gtk_action_set_short_label") (GtkActionClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> cVoid)
      val setStockId_ = call (getSymbol "gtk_action_set_stock_id") (GtkActionClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> cVoid)
      val setTooltip_ = call (getSymbol "gtk_action_set_tooltip") (GtkActionClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> cVoid)
      val setVisible_ = call (getSymbol "gtk_action_set_visible") (GtkActionClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setVisibleHorizontal_ = call (getSymbol "gtk_action_set_visible_horizontal") (GtkActionClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setVisibleVertical_ = call (getSymbol "gtk_action_set_visible_vertical") (GtkActionClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val unblockActivate_ = call (getSymbol "gtk_action_unblock_activate") (GtkActionClass.PolyML.cPtr --> cVoid)
    end
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
    fun createIcon self iconSize = (GtkActionClass.FFI.withPtr false &&&> GInt.FFI.withVal ---> GtkWidgetClass.FFI.fromPtr false) createIcon_ (self & iconSize) before GtkActionClass.FFI.touchPtr self
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
