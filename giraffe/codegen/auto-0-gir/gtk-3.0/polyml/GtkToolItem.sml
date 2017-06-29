structure GtkToolItem :>
  GTK_TOOL_ITEM
    where type 'a class = 'a GtkToolItemClass.class
    where type 'a activatable_class = 'a GtkActivatableClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type relief_style_t = GtkReliefStyle.t
    where type orientation_t = GtkOrientation.t
    where type 'a size_group_class = 'a GtkSizeGroupClass.class
    where type toolbar_style_t = GtkToolbarStyle.t
    where type 'a widget_class = 'a GtkWidgetClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_tool_item_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "gtk_tool_item_new") (PolyMLFFI.cVoid --> GtkToolItemClass.PolyML.cPtr)
      val getEllipsizeMode_ = call (getSymbol "gtk_tool_item_get_ellipsize_mode") (GtkToolItemClass.PolyML.cPtr --> PangoEllipsizeMode.PolyML.cVal)
      val getExpand_ = call (getSymbol "gtk_tool_item_get_expand") (GtkToolItemClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getHomogeneous_ = call (getSymbol "gtk_tool_item_get_homogeneous") (GtkToolItemClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getIconSize_ = call (getSymbol "gtk_tool_item_get_icon_size") (GtkToolItemClass.PolyML.cPtr --> GInt.PolyML.cVal)
      val getIsImportant_ = call (getSymbol "gtk_tool_item_get_is_important") (GtkToolItemClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getOrientation_ = call (getSymbol "gtk_tool_item_get_orientation") (GtkToolItemClass.PolyML.cPtr --> GtkOrientation.PolyML.cVal)
      val getProxyMenuItem_ = call (getSymbol "gtk_tool_item_get_proxy_menu_item") (GtkToolItemClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GtkWidgetClass.PolyML.cPtr)
      val getReliefStyle_ = call (getSymbol "gtk_tool_item_get_relief_style") (GtkToolItemClass.PolyML.cPtr --> GtkReliefStyle.PolyML.cVal)
      val getTextAlignment_ = call (getSymbol "gtk_tool_item_get_text_alignment") (GtkToolItemClass.PolyML.cPtr --> GFloat.PolyML.cVal)
      val getTextOrientation_ = call (getSymbol "gtk_tool_item_get_text_orientation") (GtkToolItemClass.PolyML.cPtr --> GtkOrientation.PolyML.cVal)
      val getTextSizeGroup_ = call (getSymbol "gtk_tool_item_get_text_size_group") (GtkToolItemClass.PolyML.cPtr --> GtkSizeGroupClass.PolyML.cPtr)
      val getToolbarStyle_ = call (getSymbol "gtk_tool_item_get_toolbar_style") (GtkToolItemClass.PolyML.cPtr --> GtkToolbarStyle.PolyML.cVal)
      val getUseDragWindow_ = call (getSymbol "gtk_tool_item_get_use_drag_window") (GtkToolItemClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getVisibleHorizontal_ = call (getSymbol "gtk_tool_item_get_visible_horizontal") (GtkToolItemClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getVisibleVertical_ = call (getSymbol "gtk_tool_item_get_visible_vertical") (GtkToolItemClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val rebuildMenu_ = call (getSymbol "gtk_tool_item_rebuild_menu") (GtkToolItemClass.PolyML.cPtr --> PolyMLFFI.cVoid)
      val retrieveProxyMenuItem_ = call (getSymbol "gtk_tool_item_retrieve_proxy_menu_item") (GtkToolItemClass.PolyML.cPtr --> GtkWidgetClass.PolyML.cPtr)
      val setExpand_ = call (getSymbol "gtk_tool_item_set_expand") (GtkToolItemClass.PolyML.cPtr &&> GBool.PolyML.cVal --> PolyMLFFI.cVoid)
      val setHomogeneous_ = call (getSymbol "gtk_tool_item_set_homogeneous") (GtkToolItemClass.PolyML.cPtr &&> GBool.PolyML.cVal --> PolyMLFFI.cVoid)
      val setIsImportant_ = call (getSymbol "gtk_tool_item_set_is_important") (GtkToolItemClass.PolyML.cPtr &&> GBool.PolyML.cVal --> PolyMLFFI.cVoid)
      val setProxyMenuItem_ =
        call (getSymbol "gtk_tool_item_set_proxy_menu_item")
          (
            GtkToolItemClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GtkWidgetClass.PolyML.cPtr
             --> PolyMLFFI.cVoid
          )
      val setTooltipMarkup_ = call (getSymbol "gtk_tool_item_set_tooltip_markup") (GtkToolItemClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> PolyMLFFI.cVoid)
      val setTooltipText_ = call (getSymbol "gtk_tool_item_set_tooltip_text") (GtkToolItemClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> PolyMLFFI.cVoid)
      val setUseDragWindow_ = call (getSymbol "gtk_tool_item_set_use_drag_window") (GtkToolItemClass.PolyML.cPtr &&> GBool.PolyML.cVal --> PolyMLFFI.cVoid)
      val setVisibleHorizontal_ = call (getSymbol "gtk_tool_item_set_visible_horizontal") (GtkToolItemClass.PolyML.cPtr &&> GBool.PolyML.cVal --> PolyMLFFI.cVoid)
      val setVisibleVertical_ = call (getSymbol "gtk_tool_item_set_visible_vertical") (GtkToolItemClass.PolyML.cPtr &&> GBool.PolyML.cVal --> PolyMLFFI.cVoid)
      val toolbarReconfigured_ = call (getSymbol "gtk_tool_item_toolbar_reconfigured") (GtkToolItemClass.PolyML.cPtr --> PolyMLFFI.cVoid)
    end
    type 'a class = 'a GtkToolItemClass.class
    type 'a activatable_class = 'a GtkActivatableClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type relief_style_t = GtkReliefStyle.t
    type orientation_t = GtkOrientation.t
    type 'a size_group_class = 'a GtkSizeGroupClass.class
    type toolbar_style_t = GtkToolbarStyle.t
    type 'a widget_class = 'a GtkWidgetClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asActivatable self = (GObjectObjectClass.FFI.withPtr ---> GtkActivatableClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr ---> GtkBuildableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkToolItemClass.FFI.fromPtr false) new_ ()
    fun getEllipsizeMode self = (GtkToolItemClass.FFI.withPtr ---> PangoEllipsizeMode.FFI.fromVal) getEllipsizeMode_ self
    fun getExpand self = (GtkToolItemClass.FFI.withPtr ---> GBool.FFI.fromVal) getExpand_ self
    fun getHomogeneous self = (GtkToolItemClass.FFI.withPtr ---> GBool.FFI.fromVal) getHomogeneous_ self
    fun getIconSize self = (GtkToolItemClass.FFI.withPtr ---> GInt.FFI.fromVal) getIconSize_ self
    fun getIsImportant self = (GtkToolItemClass.FFI.withPtr ---> GBool.FFI.fromVal) getIsImportant_ self
    fun getOrientation self = (GtkToolItemClass.FFI.withPtr ---> GtkOrientation.FFI.fromVal) getOrientation_ self
    fun getProxyMenuItem self menuItemId = (GtkToolItemClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> GtkWidgetClass.FFI.fromPtr false) getProxyMenuItem_ (self & menuItemId)
    fun getReliefStyle self = (GtkToolItemClass.FFI.withPtr ---> GtkReliefStyle.FFI.fromVal) getReliefStyle_ self
    fun getTextAlignment self = (GtkToolItemClass.FFI.withPtr ---> GFloat.FFI.fromVal) getTextAlignment_ self
    fun getTextOrientation self = (GtkToolItemClass.FFI.withPtr ---> GtkOrientation.FFI.fromVal) getTextOrientation_ self
    fun getTextSizeGroup self = (GtkToolItemClass.FFI.withPtr ---> GtkSizeGroupClass.FFI.fromPtr false) getTextSizeGroup_ self
    fun getToolbarStyle self = (GtkToolItemClass.FFI.withPtr ---> GtkToolbarStyle.FFI.fromVal) getToolbarStyle_ self
    fun getUseDragWindow self = (GtkToolItemClass.FFI.withPtr ---> GBool.FFI.fromVal) getUseDragWindow_ self
    fun getVisibleHorizontal self = (GtkToolItemClass.FFI.withPtr ---> GBool.FFI.fromVal) getVisibleHorizontal_ self
    fun getVisibleVertical self = (GtkToolItemClass.FFI.withPtr ---> GBool.FFI.fromVal) getVisibleVertical_ self
    fun rebuildMenu self = (GtkToolItemClass.FFI.withPtr ---> I) rebuildMenu_ self
    fun retrieveProxyMenuItem self = (GtkToolItemClass.FFI.withPtr ---> GtkWidgetClass.FFI.fromPtr false) retrieveProxyMenuItem_ self
    fun setExpand self expand = (GtkToolItemClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setExpand_ (self & expand)
    fun setHomogeneous self homogeneous = (GtkToolItemClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setHomogeneous_ (self & homogeneous)
    fun setIsImportant self isImportant = (GtkToolItemClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setIsImportant_ (self & isImportant)
    fun setProxyMenuItem self menuItemId menuItem =
      (
        GtkToolItemClass.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GtkWidgetClass.FFI.withPtr
         ---> I
      )
        setProxyMenuItem_
        (
          self
           & menuItemId
           & menuItem
        )
    fun setTooltipMarkup self markup = (GtkToolItemClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> I) setTooltipMarkup_ (self & markup)
    fun setTooltipText self text = (GtkToolItemClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> I) setTooltipText_ (self & text)
    fun setUseDragWindow self useDragWindow = (GtkToolItemClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setUseDragWindow_ (self & useDragWindow)
    fun setVisibleHorizontal self visibleHorizontal = (GtkToolItemClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setVisibleHorizontal_ (self & visibleHorizontal)
    fun setVisibleVertical self visibleVertical = (GtkToolItemClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setVisibleVertical_ (self & visibleVertical)
    fun toolbarReconfigured self = (GtkToolItemClass.FFI.withPtr ---> I) toolbarReconfigured_ self
    local
      open ClosureMarshal Signal
    in
      fun createMenuProxySig f = signal "create-menu-proxy" (void ---> ret boolean) f
      fun toolbarReconfiguredSig f = signal "toolbar-reconfigured" (void ---> ret_void) f
    end
    local
      open Property
    in
      val isImportantProp =
        {
          get = fn x => get "is-important" boolean x,
          set = fn x => set "is-important" boolean x
        }
      val visibleHorizontalProp =
        {
          get = fn x => get "visible-horizontal" boolean x,
          set = fn x => set "visible-horizontal" boolean x
        }
      val visibleVerticalProp =
        {
          get = fn x => get "visible-vertical" boolean x,
          set = fn x => set "visible-vertical" boolean x
        }
    end
  end
