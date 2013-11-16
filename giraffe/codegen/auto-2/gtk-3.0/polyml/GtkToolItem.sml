structure GtkToolItem :>
  GTK_TOOL_ITEM
    where type 'a class_t = 'a GtkToolItemClass.t
    where type 'a activatableclass_t = 'a GtkActivatableClass.t
    where type 'a buildableclass_t = 'a GtkBuildableClass.t
    where type reliefstyle_t = GtkReliefStyle.t
    where type orientation_t = GtkOrientation.t
    where type 'a sizegroupclass_t = 'a GtkSizeGroupClass.t
    where type toolbarstyle_t = GtkToolbarStyle.t
    where type 'a widgetclass_t = 'a GtkWidgetClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_tool_item_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val new_ = call (load_sym libgtk "gtk_tool_item_new") (FFI.PolyML.VOID --> GObjectObjectClass.PolyML.PTR)
      val getEllipsizeMode_ = call (load_sym libgtk "gtk_tool_item_get_ellipsize_mode") (GObjectObjectClass.PolyML.PTR --> PangoEllipsizeMode.PolyML.VAL)
      val getExpand_ = call (load_sym libgtk "gtk_tool_item_get_expand") (GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val getHomogeneous_ = call (load_sym libgtk "gtk_tool_item_get_homogeneous") (GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val getIconSize_ = call (load_sym libgtk "gtk_tool_item_get_icon_size") (GObjectObjectClass.PolyML.PTR --> FFI.Int32.PolyML.VAL)
      val getIsImportant_ = call (load_sym libgtk "gtk_tool_item_get_is_important") (GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val getOrientation_ = call (load_sym libgtk "gtk_tool_item_get_orientation") (GObjectObjectClass.PolyML.PTR --> GtkOrientation.PolyML.VAL)
      val getProxyMenuItem_ = call (load_sym libgtk "gtk_tool_item_get_proxy_menu_item") (GObjectObjectClass.PolyML.PTR &&> FFI.String.PolyML.INPTR --> GObjectObjectClass.PolyML.PTR)
      val getReliefStyle_ = call (load_sym libgtk "gtk_tool_item_get_relief_style") (GObjectObjectClass.PolyML.PTR --> GtkReliefStyle.PolyML.VAL)
      val getTextAlignment_ = call (load_sym libgtk "gtk_tool_item_get_text_alignment") (GObjectObjectClass.PolyML.PTR --> FFI.Float.PolyML.VAL)
      val getTextOrientation_ = call (load_sym libgtk "gtk_tool_item_get_text_orientation") (GObjectObjectClass.PolyML.PTR --> GtkOrientation.PolyML.VAL)
      val getTextSizeGroup_ = call (load_sym libgtk "gtk_tool_item_get_text_size_group") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val getToolbarStyle_ = call (load_sym libgtk "gtk_tool_item_get_toolbar_style") (GObjectObjectClass.PolyML.PTR --> GtkToolbarStyle.PolyML.VAL)
      val getUseDragWindow_ = call (load_sym libgtk "gtk_tool_item_get_use_drag_window") (GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val getVisibleHorizontal_ = call (load_sym libgtk "gtk_tool_item_get_visible_horizontal") (GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val getVisibleVertical_ = call (load_sym libgtk "gtk_tool_item_get_visible_vertical") (GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val rebuildMenu_ = call (load_sym libgtk "gtk_tool_item_rebuild_menu") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val retrieveProxyMenuItem_ = call (load_sym libgtk "gtk_tool_item_retrieve_proxy_menu_item") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val setExpand_ = call (load_sym libgtk "gtk_tool_item_set_expand") (GObjectObjectClass.PolyML.PTR &&> FFI.Bool.PolyML.VAL --> FFI.PolyML.VOID)
      val setHomogeneous_ = call (load_sym libgtk "gtk_tool_item_set_homogeneous") (GObjectObjectClass.PolyML.PTR &&> FFI.Bool.PolyML.VAL --> FFI.PolyML.VOID)
      val setIsImportant_ = call (load_sym libgtk "gtk_tool_item_set_is_important") (GObjectObjectClass.PolyML.PTR &&> FFI.Bool.PolyML.VAL --> FFI.PolyML.VOID)
      val setProxyMenuItem_ =
        call (load_sym libgtk "gtk_tool_item_set_proxy_menu_item")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.String.PolyML.INPTR
             &&> GObjectObjectClass.PolyML.PTR
             --> FFI.PolyML.VOID
          )
      val setTooltipMarkup_ = call (load_sym libgtk "gtk_tool_item_set_tooltip_markup") (GObjectObjectClass.PolyML.PTR &&> FFI.String.PolyML.INPTR --> FFI.PolyML.VOID)
      val setTooltipText_ = call (load_sym libgtk "gtk_tool_item_set_tooltip_text") (GObjectObjectClass.PolyML.PTR &&> FFI.String.PolyML.INPTR --> FFI.PolyML.VOID)
      val setUseDragWindow_ = call (load_sym libgtk "gtk_tool_item_set_use_drag_window") (GObjectObjectClass.PolyML.PTR &&> FFI.Bool.PolyML.VAL --> FFI.PolyML.VOID)
      val setVisibleHorizontal_ = call (load_sym libgtk "gtk_tool_item_set_visible_horizontal") (GObjectObjectClass.PolyML.PTR &&> FFI.Bool.PolyML.VAL --> FFI.PolyML.VOID)
      val setVisibleVertical_ = call (load_sym libgtk "gtk_tool_item_set_visible_vertical") (GObjectObjectClass.PolyML.PTR &&> FFI.Bool.PolyML.VAL --> FFI.PolyML.VOID)
      val toolbarReconfigured_ = call (load_sym libgtk "gtk_tool_item_toolbar_reconfigured") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
    end
    type 'a class_t = 'a GtkToolItemClass.t
    type 'a activatableclass_t = 'a GtkActivatableClass.t
    type 'a buildableclass_t = 'a GtkBuildableClass.t
    type reliefstyle_t = GtkReliefStyle.t
    type orientation_t = GtkOrientation.t
    type 'a sizegroupclass_t = 'a GtkSizeGroupClass.t
    type toolbarstyle_t = GtkToolbarStyle.t
    type 'a widgetclass_t = 'a GtkWidgetClass.t
    fun asImplementorIface self = (GObjectObjectClass.C.withPtr ---> AtkImplementorIfaceClass.C.fromPtr false) I self
    fun asActivatable self = (GObjectObjectClass.C.withPtr ---> GtkActivatableClass.C.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkToolItemClass.C.fromPtr false) new_ ()
    fun getEllipsizeMode self = (GObjectObjectClass.C.withPtr ---> PangoEllipsizeMode.C.fromVal) getEllipsizeMode_ self
    fun getExpand self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getExpand_ self
    fun getHomogeneous self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getHomogeneous_ self
    fun getIconSize self = (GObjectObjectClass.C.withPtr ---> FFI.Int32.C.fromVal) getIconSize_ self
    fun getIsImportant self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getIsImportant_ self
    fun getOrientation self = (GObjectObjectClass.C.withPtr ---> GtkOrientation.C.fromVal) getOrientation_ self
    fun getProxyMenuItem self menuItemId = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstPtr ---> GtkWidgetClass.C.fromPtr false) getProxyMenuItem_ (self & menuItemId)
    fun getReliefStyle self = (GObjectObjectClass.C.withPtr ---> GtkReliefStyle.C.fromVal) getReliefStyle_ self
    fun getTextAlignment self = (GObjectObjectClass.C.withPtr ---> FFI.Float.C.fromVal) getTextAlignment_ self
    fun getTextOrientation self = (GObjectObjectClass.C.withPtr ---> GtkOrientation.C.fromVal) getTextOrientation_ self
    fun getTextSizeGroup self = (GObjectObjectClass.C.withPtr ---> GtkSizeGroupClass.C.fromPtr false) getTextSizeGroup_ self
    fun getToolbarStyle self = (GObjectObjectClass.C.withPtr ---> GtkToolbarStyle.C.fromVal) getToolbarStyle_ self
    fun getUseDragWindow self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getUseDragWindow_ self
    fun getVisibleHorizontal self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getVisibleHorizontal_ self
    fun getVisibleVertical self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getVisibleVertical_ self
    fun rebuildMenu self = (GObjectObjectClass.C.withPtr ---> I) rebuildMenu_ self
    fun retrieveProxyMenuItem self = (GObjectObjectClass.C.withPtr ---> GtkWidgetClass.C.fromPtr false) retrieveProxyMenuItem_ self
    fun setExpand self expand = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setExpand_ (self & expand)
    fun setHomogeneous self homogeneous = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setHomogeneous_ (self & homogeneous)
    fun setIsImportant self isImportant = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setIsImportant_ (self & isImportant)
    fun setProxyMenuItem self menuItemId menuItem =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.String.C.withConstPtr
         &&&> GObjectObjectClass.C.withPtr
         ---> I
      )
        setProxyMenuItem_
        (
          self
           & menuItemId
           & menuItem
        )
    fun setTooltipMarkup self markup = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstPtr ---> I) setTooltipMarkup_ (self & markup)
    fun setTooltipText self text = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstPtr ---> I) setTooltipText_ (self & text)
    fun setUseDragWindow self useDragWindow = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setUseDragWindow_ (self & useDragWindow)
    fun setVisibleHorizontal self visibleHorizontal = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setVisibleHorizontal_ (self & visibleHorizontal)
    fun setVisibleVertical self visibleVertical = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setVisibleVertical_ (self & visibleVertical)
    fun toolbarReconfigured self = (GObjectObjectClass.C.withPtr ---> I) toolbarReconfigured_ self
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
