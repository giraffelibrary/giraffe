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
    val getType_ = _import "gtk_tool_item_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "gtk_tool_item_new" : unit -> GtkToolItemClass.C.notnull GtkToolItemClass.C.p;
    val getEllipsizeMode_ = _import "gtk_tool_item_get_ellipsize_mode" : GtkToolItemClass.C.notnull GtkToolItemClass.C.p -> PangoEllipsizeMode.C.val_;
    val getExpand_ = _import "gtk_tool_item_get_expand" : GtkToolItemClass.C.notnull GtkToolItemClass.C.p -> FFI.Bool.C.val_;
    val getHomogeneous_ = _import "gtk_tool_item_get_homogeneous" : GtkToolItemClass.C.notnull GtkToolItemClass.C.p -> FFI.Bool.C.val_;
    val getIconSize_ = _import "gtk_tool_item_get_icon_size" : GtkToolItemClass.C.notnull GtkToolItemClass.C.p -> FFI.Int32.C.val_;
    val getIsImportant_ = _import "gtk_tool_item_get_is_important" : GtkToolItemClass.C.notnull GtkToolItemClass.C.p -> FFI.Bool.C.val_;
    val getOrientation_ = _import "gtk_tool_item_get_orientation" : GtkToolItemClass.C.notnull GtkToolItemClass.C.p -> GtkOrientation.C.val_;
    val getProxyMenuItem_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_tool_item_get_proxy_menu_item" :
              GtkToolItemClass.C.notnull GtkToolItemClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               -> GtkWidgetClass.C.notnull GtkWidgetClass.C.p;
          )
            (
              x1,
              x2,
              x3
            )
    val getReliefStyle_ = _import "gtk_tool_item_get_relief_style" : GtkToolItemClass.C.notnull GtkToolItemClass.C.p -> GtkReliefStyle.C.val_;
    val getTextAlignment_ = _import "gtk_tool_item_get_text_alignment" : GtkToolItemClass.C.notnull GtkToolItemClass.C.p -> FFI.Float.C.val_;
    val getTextOrientation_ = _import "gtk_tool_item_get_text_orientation" : GtkToolItemClass.C.notnull GtkToolItemClass.C.p -> GtkOrientation.C.val_;
    val getTextSizeGroup_ = _import "gtk_tool_item_get_text_size_group" : GtkToolItemClass.C.notnull GtkToolItemClass.C.p -> GtkSizeGroupClass.C.notnull GtkSizeGroupClass.C.p;
    val getToolbarStyle_ = _import "gtk_tool_item_get_toolbar_style" : GtkToolItemClass.C.notnull GtkToolItemClass.C.p -> GtkToolbarStyle.C.val_;
    val getUseDragWindow_ = _import "gtk_tool_item_get_use_drag_window" : GtkToolItemClass.C.notnull GtkToolItemClass.C.p -> FFI.Bool.C.val_;
    val getVisibleHorizontal_ = _import "gtk_tool_item_get_visible_horizontal" : GtkToolItemClass.C.notnull GtkToolItemClass.C.p -> FFI.Bool.C.val_;
    val getVisibleVertical_ = _import "gtk_tool_item_get_visible_vertical" : GtkToolItemClass.C.notnull GtkToolItemClass.C.p -> FFI.Bool.C.val_;
    val rebuildMenu_ = _import "gtk_tool_item_rebuild_menu" : GtkToolItemClass.C.notnull GtkToolItemClass.C.p -> unit;
    val retrieveProxyMenuItem_ = _import "gtk_tool_item_retrieve_proxy_menu_item" : GtkToolItemClass.C.notnull GtkToolItemClass.C.p -> GtkWidgetClass.C.notnull GtkWidgetClass.C.p;
    val setExpand_ = fn x1 & x2 => (_import "gtk_tool_item_set_expand" : GtkToolItemClass.C.notnull GtkToolItemClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setHomogeneous_ = fn x1 & x2 => (_import "gtk_tool_item_set_homogeneous" : GtkToolItemClass.C.notnull GtkToolItemClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setIsImportant_ = fn x1 & x2 => (_import "gtk_tool_item_set_is_important" : GtkToolItemClass.C.notnull GtkToolItemClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setProxyMenuItem_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_gtk_tool_item_set_proxy_menu_item" :
              GtkToolItemClass.C.notnull GtkToolItemClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * GtkWidgetClass.C.notnull GtkWidgetClass.C.p
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val setTooltipMarkup_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_tool_item_set_tooltip_markup" :
              GtkToolItemClass.C.notnull GtkToolItemClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setTooltipText_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_tool_item_set_tooltip_text" :
              GtkToolItemClass.C.notnull GtkToolItemClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setUseDragWindow_ = fn x1 & x2 => (_import "gtk_tool_item_set_use_drag_window" : GtkToolItemClass.C.notnull GtkToolItemClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setVisibleHorizontal_ = fn x1 & x2 => (_import "gtk_tool_item_set_visible_horizontal" : GtkToolItemClass.C.notnull GtkToolItemClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setVisibleVertical_ = fn x1 & x2 => (_import "gtk_tool_item_set_visible_vertical" : GtkToolItemClass.C.notnull GtkToolItemClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val toolbarReconfigured_ = _import "gtk_tool_item_toolbar_reconfigured" : GtkToolItemClass.C.notnull GtkToolItemClass.C.p -> unit;
    type 'a class = 'a GtkToolItemClass.class
    type 'a activatable_class = 'a GtkActivatableClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type relief_style_t = GtkReliefStyle.t
    type orientation_t = GtkOrientation.t
    type 'a size_group_class = 'a GtkSizeGroupClass.class
    type toolbar_style_t = GtkToolbarStyle.t
    type 'a widget_class = 'a GtkWidgetClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.C.withPtr ---> AtkImplementorIfaceClass.C.fromPtr false) I self
    fun asActivatable self = (GObjectObjectClass.C.withPtr ---> GtkActivatableClass.C.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkToolItemClass.C.fromPtr false) new_ ()
    fun getEllipsizeMode self = (GtkToolItemClass.C.withPtr ---> PangoEllipsizeMode.C.fromVal) getEllipsizeMode_ self
    fun getExpand self = (GtkToolItemClass.C.withPtr ---> FFI.Bool.C.fromVal) getExpand_ self
    fun getHomogeneous self = (GtkToolItemClass.C.withPtr ---> FFI.Bool.C.fromVal) getHomogeneous_ self
    fun getIconSize self = (GtkToolItemClass.C.withPtr ---> FFI.Int32.C.fromVal) getIconSize_ self
    fun getIsImportant self = (GtkToolItemClass.C.withPtr ---> FFI.Bool.C.fromVal) getIsImportant_ self
    fun getOrientation self = (GtkToolItemClass.C.withPtr ---> GtkOrientation.C.fromVal) getOrientation_ self
    fun getProxyMenuItem self menuItemId = (GtkToolItemClass.C.withPtr &&&> Utf8.C.withPtr ---> GtkWidgetClass.C.fromPtr false) getProxyMenuItem_ (self & menuItemId)
    fun getReliefStyle self = (GtkToolItemClass.C.withPtr ---> GtkReliefStyle.C.fromVal) getReliefStyle_ self
    fun getTextAlignment self = (GtkToolItemClass.C.withPtr ---> FFI.Float.C.fromVal) getTextAlignment_ self
    fun getTextOrientation self = (GtkToolItemClass.C.withPtr ---> GtkOrientation.C.fromVal) getTextOrientation_ self
    fun getTextSizeGroup self = (GtkToolItemClass.C.withPtr ---> GtkSizeGroupClass.C.fromPtr false) getTextSizeGroup_ self
    fun getToolbarStyle self = (GtkToolItemClass.C.withPtr ---> GtkToolbarStyle.C.fromVal) getToolbarStyle_ self
    fun getUseDragWindow self = (GtkToolItemClass.C.withPtr ---> FFI.Bool.C.fromVal) getUseDragWindow_ self
    fun getVisibleHorizontal self = (GtkToolItemClass.C.withPtr ---> FFI.Bool.C.fromVal) getVisibleHorizontal_ self
    fun getVisibleVertical self = (GtkToolItemClass.C.withPtr ---> FFI.Bool.C.fromVal) getVisibleVertical_ self
    fun rebuildMenu self = (GtkToolItemClass.C.withPtr ---> I) rebuildMenu_ self
    fun retrieveProxyMenuItem self = (GtkToolItemClass.C.withPtr ---> GtkWidgetClass.C.fromPtr false) retrieveProxyMenuItem_ self
    fun setExpand self expand = (GtkToolItemClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setExpand_ (self & expand)
    fun setHomogeneous self homogeneous = (GtkToolItemClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setHomogeneous_ (self & homogeneous)
    fun setIsImportant self isImportant = (GtkToolItemClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setIsImportant_ (self & isImportant)
    fun setProxyMenuItem self menuItemId menuItem =
      (
        GtkToolItemClass.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> GtkWidgetClass.C.withPtr
         ---> I
      )
        setProxyMenuItem_
        (
          self
           & menuItemId
           & menuItem
        )
    fun setTooltipMarkup self markup = (GtkToolItemClass.C.withPtr &&&> Utf8.C.withPtr ---> I) setTooltipMarkup_ (self & markup)
    fun setTooltipText self text = (GtkToolItemClass.C.withPtr &&&> Utf8.C.withPtr ---> I) setTooltipText_ (self & text)
    fun setUseDragWindow self useDragWindow = (GtkToolItemClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setUseDragWindow_ (self & useDragWindow)
    fun setVisibleHorizontal self visibleHorizontal = (GtkToolItemClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setVisibleHorizontal_ (self & visibleHorizontal)
    fun setVisibleVertical self visibleVertical = (GtkToolItemClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setVisibleVertical_ (self & visibleVertical)
    fun toolbarReconfigured self = (GtkToolItemClass.C.withPtr ---> I) toolbarReconfigured_ self
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
