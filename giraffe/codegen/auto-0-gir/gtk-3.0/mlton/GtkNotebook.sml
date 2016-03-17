structure GtkNotebook :>
  GTK_NOTEBOOK
    where type 'a class = 'a GtkNotebookClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type pack_type_t = GtkPackType.t
    where type notebook_tab_t = GtkNotebookTab.t
    where type direction_type_t = GtkDirectionType.t
    where type 'a widget_class = 'a GtkWidgetClass.class
    where type position_type_t = GtkPositionType.t =
  struct
    val getType_ = _import "gtk_notebook_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "gtk_notebook_new" : unit -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val appendPage_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_notebook_append_page" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * unit GObjectObjectClass.C.p
               -> FFI.Int.C.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val appendPageMenu_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "gtk_notebook_append_page_menu" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * unit GObjectObjectClass.C.p
               * unit GObjectObjectClass.C.p
               -> FFI.Int.C.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val getActionWidget_ = fn x1 & x2 => (_import "gtk_notebook_get_action_widget" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GtkPackType.C.val_ -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;) (x1, x2)
    val getCurrentPage_ = _import "gtk_notebook_get_current_page" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Int.C.val_;
    val getGroupName_ = _import "gtk_notebook_get_group_name" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> Utf8.C.notnull Utf8.C.out_p;
    val getMenuLabel_ = fn x1 & x2 => (_import "gtk_notebook_get_menu_label" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;) (x1, x2)
    val getMenuLabelText_ = fn x1 & x2 => (_import "gtk_notebook_get_menu_label_text" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> Utf8.C.notnull Utf8.C.out_p;) (x1, x2)
    val getNPages_ = _import "gtk_notebook_get_n_pages" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Int.C.val_;
    val getNthPage_ = fn x1 & x2 => (_import "gtk_notebook_get_nth_page" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Int.C.val_ -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;) (x1, x2)
    val getScrollable_ = _import "gtk_notebook_get_scrollable" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    val getShowBorder_ = _import "gtk_notebook_get_show_border" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    val getShowTabs_ = _import "gtk_notebook_get_show_tabs" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    val getTabDetachable_ = fn x1 & x2 => (_import "gtk_notebook_get_tab_detachable" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;) (x1, x2)
    val getTabHborder_ = _import "gtk_notebook_get_tab_hborder" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.UInt16.C.val_;
    val getTabLabel_ = fn x1 & x2 => (_import "gtk_notebook_get_tab_label" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;) (x1, x2)
    val getTabLabelText_ = fn x1 & x2 => (_import "gtk_notebook_get_tab_label_text" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> Utf8.C.notnull Utf8.C.out_p;) (x1, x2)
    val getTabPos_ = _import "gtk_notebook_get_tab_pos" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GtkPositionType.C.val_;
    val getTabReorderable_ = fn x1 & x2 => (_import "gtk_notebook_get_tab_reorderable" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;) (x1, x2)
    val getTabVborder_ = _import "gtk_notebook_get_tab_vborder" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.UInt16.C.val_;
    val insertPage_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "gtk_notebook_insert_page" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * unit GObjectObjectClass.C.p
               * FFI.Int.C.val_
               -> FFI.Int.C.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val insertPageMenu_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5 =>
          (
            _import "gtk_notebook_insert_page_menu" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * unit GObjectObjectClass.C.p
               * unit GObjectObjectClass.C.p
               * FFI.Int.C.val_
               -> FFI.Int.C.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val nextPage_ = _import "gtk_notebook_next_page" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;
    val pageNum_ = fn x1 & x2 => (_import "gtk_notebook_page_num" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Int.C.val_;) (x1, x2)
    val popupDisable_ = _import "gtk_notebook_popup_disable" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;
    val popupEnable_ = _import "gtk_notebook_popup_enable" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;
    val prependPage_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_notebook_prepend_page" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * unit GObjectObjectClass.C.p
               -> FFI.Int.C.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val prependPageMenu_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "gtk_notebook_prepend_page_menu" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * unit GObjectObjectClass.C.p
               * unit GObjectObjectClass.C.p
               -> FFI.Int.C.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val prevPage_ = _import "gtk_notebook_prev_page" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;
    val removePage_ = fn x1 & x2 => (_import "gtk_notebook_remove_page" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Int.C.val_ -> unit;) (x1, x2)
    val reorderChild_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_notebook_reorder_child" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.Int.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setActionWidget_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_notebook_set_action_widget" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GtkPackType.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setCurrentPage_ = fn x1 & x2 => (_import "gtk_notebook_set_current_page" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Int.C.val_ -> unit;) (x1, x2)
    val setGroupName_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_notebook_set_group_name" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * Utf8.MLton.p1
               * unit Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setMenuLabel_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_notebook_set_menu_label" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * unit GObjectObjectClass.C.p
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setMenuLabelText_ =
      fn
        x1
         & x2
         & (x3, x4) =>
          (
            _import "mlton_gtk_notebook_set_menu_label_text" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val setScrollable_ = fn x1 & x2 => (_import "gtk_notebook_set_scrollable" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setShowBorder_ = fn x1 & x2 => (_import "gtk_notebook_set_show_border" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setShowTabs_ = fn x1 & x2 => (_import "gtk_notebook_set_show_tabs" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setTabDetachable_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_notebook_set_tab_detachable" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.Bool.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setTabLabel_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_notebook_set_tab_label" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * unit GObjectObjectClass.C.p
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setTabLabelText_ =
      fn
        x1
         & x2
         & (x3, x4) =>
          (
            _import "mlton_gtk_notebook_set_tab_label_text" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val setTabPos_ = fn x1 & x2 => (_import "gtk_notebook_set_tab_pos" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GtkPositionType.C.val_ -> unit;) (x1, x2)
    val setTabReorderable_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_notebook_set_tab_reorderable" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.Bool.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    type 'a class = 'a GtkNotebookClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type pack_type_t = GtkPackType.t
    type notebook_tab_t = GtkNotebookTab.t
    type direction_type_t = GtkDirectionType.t
    type 'a widget_class = 'a GtkWidgetClass.class
    type position_type_t = GtkPositionType.t
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.C.withPtr ---> AtkImplementorIfaceClass.C.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkNotebookClass.C.fromPtr false) new_ ()
    fun appendPage self child tabLabel =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withOptPtr
         ---> FFI.Int.C.fromVal
      )
        appendPage_
        (
          self
           & child
           & tabLabel
        )
    fun appendPageMenu self child tabLabel menuLabel =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> GObjectObjectClass.C.withOptPtr
         ---> FFI.Int.C.fromVal
      )
        appendPageMenu_
        (
          self
           & child
           & tabLabel
           & menuLabel
        )
    fun getActionWidget self packType = (GObjectObjectClass.C.withPtr &&&> GtkPackType.C.withVal ---> GtkWidgetClass.C.fromPtr false) getActionWidget_ (self & packType)
    fun getCurrentPage self = (GObjectObjectClass.C.withPtr ---> FFI.Int.C.fromVal) getCurrentPage_ self
    fun getGroupName self = (GObjectObjectClass.C.withPtr ---> Utf8.C.fromPtr false) getGroupName_ self
    fun getMenuLabel self child = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> GtkWidgetClass.C.fromPtr false) getMenuLabel_ (self & child)
    fun getMenuLabelText self child = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> Utf8.C.fromPtr false) getMenuLabelText_ (self & child)
    fun getNPages self = (GObjectObjectClass.C.withPtr ---> FFI.Int.C.fromVal) getNPages_ self
    fun getNthPage self pageNum = (GObjectObjectClass.C.withPtr &&&> FFI.Int.C.withVal ---> GtkWidgetClass.C.fromPtr false) getNthPage_ (self & pageNum)
    fun getScrollable self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getScrollable_ self
    fun getShowBorder self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getShowBorder_ self
    fun getShowTabs self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getShowTabs_ self
    fun getTabDetachable self child = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getTabDetachable_ (self & child)
    fun getTabHborder self = (GObjectObjectClass.C.withPtr ---> FFI.UInt16.C.fromVal) getTabHborder_ self
    fun getTabLabel self child = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> GtkWidgetClass.C.fromPtr false) getTabLabel_ (self & child)
    fun getTabLabelText self child = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> Utf8.C.fromPtr false) getTabLabelText_ (self & child)
    fun getTabPos self = (GObjectObjectClass.C.withPtr ---> GtkPositionType.C.fromVal) getTabPos_ self
    fun getTabReorderable self child = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getTabReorderable_ (self & child)
    fun getTabVborder self = (GObjectObjectClass.C.withPtr ---> FFI.UInt16.C.fromVal) getTabVborder_ self
    fun insertPage self child tabLabel position =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> FFI.Int.C.withVal
         ---> FFI.Int.C.fromVal
      )
        insertPage_
        (
          self
           & child
           & tabLabel
           & position
        )
    fun insertPageMenu self child tabLabel menuLabel position =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> FFI.Int.C.withVal
         ---> FFI.Int.C.fromVal
      )
        insertPageMenu_
        (
          self
           & child
           & tabLabel
           & menuLabel
           & position
        )
    fun nextPage self = (GObjectObjectClass.C.withPtr ---> I) nextPage_ self
    fun pageNum self child = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> FFI.Int.C.fromVal) pageNum_ (self & child)
    fun popupDisable self = (GObjectObjectClass.C.withPtr ---> I) popupDisable_ self
    fun popupEnable self = (GObjectObjectClass.C.withPtr ---> I) popupEnable_ self
    fun prependPage self child tabLabel =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withOptPtr
         ---> FFI.Int.C.fromVal
      )
        prependPage_
        (
          self
           & child
           & tabLabel
        )
    fun prependPageMenu self child tabLabel menuLabel =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> GObjectObjectClass.C.withOptPtr
         ---> FFI.Int.C.fromVal
      )
        prependPageMenu_
        (
          self
           & child
           & tabLabel
           & menuLabel
        )
    fun prevPage self = (GObjectObjectClass.C.withPtr ---> I) prevPage_ self
    fun removePage self pageNum = (GObjectObjectClass.C.withPtr &&&> FFI.Int.C.withVal ---> I) removePage_ (self & pageNum)
    fun reorderChild self child position =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> FFI.Int.C.withVal
         ---> I
      )
        reorderChild_
        (
          self
           & child
           & position
        )
    fun setActionWidget self widget packType =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> GtkPackType.C.withVal
         ---> I
      )
        setActionWidget_
        (
          self
           & widget
           & packType
        )
    fun setCurrentPage self pageNum = (GObjectObjectClass.C.withPtr &&&> FFI.Int.C.withVal ---> I) setCurrentPage_ (self & pageNum)
    fun setGroupName self groupName = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withOptPtr ---> I) setGroupName_ (self & groupName)
    fun setMenuLabel self child menuLabel =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withOptPtr
         ---> I
      )
        setMenuLabel_
        (
          self
           & child
           & menuLabel
        )
    fun setMenuLabelText self child menuText =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> Utf8.C.withPtr
         ---> I
      )
        setMenuLabelText_
        (
          self
           & child
           & menuText
        )
    fun setScrollable self scrollable = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setScrollable_ (self & scrollable)
    fun setShowBorder self showBorder = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setShowBorder_ (self & showBorder)
    fun setShowTabs self showTabs = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setShowTabs_ (self & showTabs)
    fun setTabDetachable self child detachable =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> FFI.Bool.C.withVal
         ---> I
      )
        setTabDetachable_
        (
          self
           & child
           & detachable
        )
    fun setTabLabel self child tabLabel =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withOptPtr
         ---> I
      )
        setTabLabel_
        (
          self
           & child
           & tabLabel
        )
    fun setTabLabelText self child tabText =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> Utf8.C.withPtr
         ---> I
      )
        setTabLabelText_
        (
          self
           & child
           & tabText
        )
    fun setTabPos self pos = (GObjectObjectClass.C.withPtr &&&> GtkPositionType.C.withVal ---> I) setTabPos_ (self & pos)
    fun setTabReorderable self child reorderable =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> FFI.Bool.C.withVal
         ---> I
      )
        setTabReorderable_
        (
          self
           & child
           & reorderable
        )
    local
      open ClosureMarshal Signal
    in
      fun changeCurrentPageSig f = signal "change-current-page" (get 0w1 int ---> ret boolean) f
      fun createWindowSig f =
        signal "create-window"
          (
            get 0w1 GtkWidgetClass.t
             &&&> get 0w2 int
             &&&> get 0w3 int
             ---> ret GtkNotebookClass.t
          )
          (
            fn
              page
               & x
               & y =>
                f page x y
          )
      fun focusTabSig f = signal "focus-tab" (get 0w1 GtkNotebookTab.t ---> ret boolean) f
      fun moveFocusOutSig f = signal "move-focus-out" (get 0w1 GtkDirectionType.t ---> ret_void) f
      fun pageAddedSig f = signal "page-added" (get 0w1 GtkWidgetClass.t &&&> get 0w2 uint ---> ret_void) (fn child & pageNum => f child pageNum)
      fun pageRemovedSig f = signal "page-removed" (get 0w1 GtkWidgetClass.t &&&> get 0w2 uint ---> ret_void) (fn child & pageNum => f child pageNum)
      fun pageReorderedSig f = signal "page-reordered" (get 0w1 GtkWidgetClass.t &&&> get 0w2 uint ---> ret_void) (fn child & pageNum => f child pageNum)
      fun reorderTabSig f = signal "reorder-tab" (get 0w1 GtkDirectionType.t &&&> get 0w2 boolean ---> ret boolean) (fn object & p0 => f object p0)
      fun selectPageSig f = signal "select-page" (get 0w1 boolean ---> ret boolean) f
      fun switchPageSig f = signal "switch-page" (get 0w1 GtkWidgetClass.t &&&> get 0w2 uint ---> ret_void) (fn page & pageNum => f page pageNum)
    end
    local
      open Property
    in
      val enablePopupProp =
        {
          get = fn x => get "enable-popup" boolean x,
          set = fn x => set "enable-popup" boolean x
        }
      val groupNameProp =
        {
          get = fn x => get "group-name" stringOpt x,
          set = fn x => set "group-name" stringOpt x
        }
      val pageProp =
        {
          get = fn x => get "page" int x,
          set = fn x => set "page" int x
        }
      val scrollableProp =
        {
          get = fn x => get "scrollable" boolean x,
          set = fn x => set "scrollable" boolean x
        }
      val showBorderProp =
        {
          get = fn x => get "show-border" boolean x,
          set = fn x => set "show-border" boolean x
        }
      val showTabsProp =
        {
          get = fn x => get "show-tabs" boolean x,
          set = fn x => set "show-tabs" boolean x
        }
      val tabPosProp =
        {
          get = fn x => get "tab-pos" GtkPositionType.t x,
          set = fn x => set "tab-pos" GtkPositionType.t x
        }
    end
  end
