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
    val getType_ = _import "gtk_notebook_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "gtk_notebook_new" : unit -> GtkWidgetClass.FFI.notnull GtkWidgetClass.FFI.p;
    val appendPage_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_notebook_append_page" :
              GtkNotebookClass.FFI.notnull GtkNotebookClass.FFI.p
               * GtkWidgetClass.FFI.notnull GtkWidgetClass.FFI.p
               * unit GtkWidgetClass.FFI.p
               -> GInt.FFI.val_;
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
              GtkNotebookClass.FFI.notnull GtkNotebookClass.FFI.p
               * GtkWidgetClass.FFI.notnull GtkWidgetClass.FFI.p
               * unit GtkWidgetClass.FFI.p
               * unit GtkWidgetClass.FFI.p
               -> GInt.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val detachTab_ = fn x1 & x2 => (_import "gtk_notebook_detach_tab" : GtkNotebookClass.FFI.notnull GtkNotebookClass.FFI.p * GtkWidgetClass.FFI.notnull GtkWidgetClass.FFI.p -> unit;) (x1, x2)
    val getActionWidget_ = fn x1 & x2 => (_import "gtk_notebook_get_action_widget" : GtkNotebookClass.FFI.notnull GtkNotebookClass.FFI.p * GtkPackType.FFI.val_ -> unit GtkWidgetClass.FFI.p;) (x1, x2)
    val getCurrentPage_ = _import "gtk_notebook_get_current_page" : GtkNotebookClass.FFI.notnull GtkNotebookClass.FFI.p -> GInt.FFI.val_;
    val getGroupName_ = _import "gtk_notebook_get_group_name" : GtkNotebookClass.FFI.notnull GtkNotebookClass.FFI.p -> unit Utf8.FFI.out_p;
    val getMenuLabel_ = fn x1 & x2 => (_import "gtk_notebook_get_menu_label" : GtkNotebookClass.FFI.notnull GtkNotebookClass.FFI.p * GtkWidgetClass.FFI.notnull GtkWidgetClass.FFI.p -> unit GtkWidgetClass.FFI.p;) (x1, x2)
    val getMenuLabelText_ = fn x1 & x2 => (_import "gtk_notebook_get_menu_label_text" : GtkNotebookClass.FFI.notnull GtkNotebookClass.FFI.p * GtkWidgetClass.FFI.notnull GtkWidgetClass.FFI.p -> unit Utf8.FFI.out_p;) (x1, x2)
    val getNPages_ = _import "gtk_notebook_get_n_pages" : GtkNotebookClass.FFI.notnull GtkNotebookClass.FFI.p -> GInt.FFI.val_;
    val getNthPage_ = fn x1 & x2 => (_import "gtk_notebook_get_nth_page" : GtkNotebookClass.FFI.notnull GtkNotebookClass.FFI.p * GInt.FFI.val_ -> unit GtkWidgetClass.FFI.p;) (x1, x2)
    val getScrollable_ = _import "gtk_notebook_get_scrollable" : GtkNotebookClass.FFI.notnull GtkNotebookClass.FFI.p -> GBool.FFI.val_;
    val getShowBorder_ = _import "gtk_notebook_get_show_border" : GtkNotebookClass.FFI.notnull GtkNotebookClass.FFI.p -> GBool.FFI.val_;
    val getShowTabs_ = _import "gtk_notebook_get_show_tabs" : GtkNotebookClass.FFI.notnull GtkNotebookClass.FFI.p -> GBool.FFI.val_;
    val getTabDetachable_ = fn x1 & x2 => (_import "gtk_notebook_get_tab_detachable" : GtkNotebookClass.FFI.notnull GtkNotebookClass.FFI.p * GtkWidgetClass.FFI.notnull GtkWidgetClass.FFI.p -> GBool.FFI.val_;) (x1, x2)
    val getTabHborder_ = _import "gtk_notebook_get_tab_hborder" : GtkNotebookClass.FFI.notnull GtkNotebookClass.FFI.p -> GUInt16.FFI.val_;
    val getTabLabel_ = fn x1 & x2 => (_import "gtk_notebook_get_tab_label" : GtkNotebookClass.FFI.notnull GtkNotebookClass.FFI.p * GtkWidgetClass.FFI.notnull GtkWidgetClass.FFI.p -> unit GtkWidgetClass.FFI.p;) (x1, x2)
    val getTabLabelText_ = fn x1 & x2 => (_import "gtk_notebook_get_tab_label_text" : GtkNotebookClass.FFI.notnull GtkNotebookClass.FFI.p * GtkWidgetClass.FFI.notnull GtkWidgetClass.FFI.p -> unit Utf8.FFI.out_p;) (x1, x2)
    val getTabPos_ = _import "gtk_notebook_get_tab_pos" : GtkNotebookClass.FFI.notnull GtkNotebookClass.FFI.p -> GtkPositionType.FFI.val_;
    val getTabReorderable_ = fn x1 & x2 => (_import "gtk_notebook_get_tab_reorderable" : GtkNotebookClass.FFI.notnull GtkNotebookClass.FFI.p * GtkWidgetClass.FFI.notnull GtkWidgetClass.FFI.p -> GBool.FFI.val_;) (x1, x2)
    val getTabVborder_ = _import "gtk_notebook_get_tab_vborder" : GtkNotebookClass.FFI.notnull GtkNotebookClass.FFI.p -> GUInt16.FFI.val_;
    val insertPage_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "gtk_notebook_insert_page" :
              GtkNotebookClass.FFI.notnull GtkNotebookClass.FFI.p
               * GtkWidgetClass.FFI.notnull GtkWidgetClass.FFI.p
               * unit GtkWidgetClass.FFI.p
               * GInt.FFI.val_
               -> GInt.FFI.val_;
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
              GtkNotebookClass.FFI.notnull GtkNotebookClass.FFI.p
               * GtkWidgetClass.FFI.notnull GtkWidgetClass.FFI.p
               * unit GtkWidgetClass.FFI.p
               * unit GtkWidgetClass.FFI.p
               * GInt.FFI.val_
               -> GInt.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val nextPage_ = _import "gtk_notebook_next_page" : GtkNotebookClass.FFI.notnull GtkNotebookClass.FFI.p -> unit;
    val pageNum_ = fn x1 & x2 => (_import "gtk_notebook_page_num" : GtkNotebookClass.FFI.notnull GtkNotebookClass.FFI.p * GtkWidgetClass.FFI.notnull GtkWidgetClass.FFI.p -> GInt.FFI.val_;) (x1, x2)
    val popupDisable_ = _import "gtk_notebook_popup_disable" : GtkNotebookClass.FFI.notnull GtkNotebookClass.FFI.p -> unit;
    val popupEnable_ = _import "gtk_notebook_popup_enable" : GtkNotebookClass.FFI.notnull GtkNotebookClass.FFI.p -> unit;
    val prependPage_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_notebook_prepend_page" :
              GtkNotebookClass.FFI.notnull GtkNotebookClass.FFI.p
               * GtkWidgetClass.FFI.notnull GtkWidgetClass.FFI.p
               * unit GtkWidgetClass.FFI.p
               -> GInt.FFI.val_;
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
              GtkNotebookClass.FFI.notnull GtkNotebookClass.FFI.p
               * GtkWidgetClass.FFI.notnull GtkWidgetClass.FFI.p
               * unit GtkWidgetClass.FFI.p
               * unit GtkWidgetClass.FFI.p
               -> GInt.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val prevPage_ = _import "gtk_notebook_prev_page" : GtkNotebookClass.FFI.notnull GtkNotebookClass.FFI.p -> unit;
    val removePage_ = fn x1 & x2 => (_import "gtk_notebook_remove_page" : GtkNotebookClass.FFI.notnull GtkNotebookClass.FFI.p * GInt.FFI.val_ -> unit;) (x1, x2)
    val reorderChild_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_notebook_reorder_child" :
              GtkNotebookClass.FFI.notnull GtkNotebookClass.FFI.p
               * GtkWidgetClass.FFI.notnull GtkWidgetClass.FFI.p
               * GInt.FFI.val_
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
              GtkNotebookClass.FFI.notnull GtkNotebookClass.FFI.p
               * GtkWidgetClass.FFI.notnull GtkWidgetClass.FFI.p
               * GtkPackType.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setCurrentPage_ = fn x1 & x2 => (_import "gtk_notebook_set_current_page" : GtkNotebookClass.FFI.notnull GtkNotebookClass.FFI.p * GInt.FFI.val_ -> unit;) (x1, x2)
    val setGroupName_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_notebook_set_group_name" :
              GtkNotebookClass.FFI.notnull GtkNotebookClass.FFI.p
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
              GtkNotebookClass.FFI.notnull GtkNotebookClass.FFI.p
               * GtkWidgetClass.FFI.notnull GtkWidgetClass.FFI.p
               * unit GtkWidgetClass.FFI.p
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
              GtkNotebookClass.FFI.notnull GtkNotebookClass.FFI.p
               * GtkWidgetClass.FFI.notnull GtkWidgetClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val setScrollable_ = fn x1 & x2 => (_import "gtk_notebook_set_scrollable" : GtkNotebookClass.FFI.notnull GtkNotebookClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setShowBorder_ = fn x1 & x2 => (_import "gtk_notebook_set_show_border" : GtkNotebookClass.FFI.notnull GtkNotebookClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setShowTabs_ = fn x1 & x2 => (_import "gtk_notebook_set_show_tabs" : GtkNotebookClass.FFI.notnull GtkNotebookClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setTabDetachable_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_notebook_set_tab_detachable" :
              GtkNotebookClass.FFI.notnull GtkNotebookClass.FFI.p
               * GtkWidgetClass.FFI.notnull GtkWidgetClass.FFI.p
               * GBool.FFI.val_
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
              GtkNotebookClass.FFI.notnull GtkNotebookClass.FFI.p
               * GtkWidgetClass.FFI.notnull GtkWidgetClass.FFI.p
               * unit GtkWidgetClass.FFI.p
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
              GtkNotebookClass.FFI.notnull GtkNotebookClass.FFI.p
               * GtkWidgetClass.FFI.notnull GtkWidgetClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val setTabPos_ = fn x1 & x2 => (_import "gtk_notebook_set_tab_pos" : GtkNotebookClass.FFI.notnull GtkNotebookClass.FFI.p * GtkPositionType.FFI.val_ -> unit;) (x1, x2)
    val setTabReorderable_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_notebook_set_tab_reorderable" :
              GtkNotebookClass.FFI.notnull GtkNotebookClass.FFI.p
               * GtkWidgetClass.FFI.notnull GtkWidgetClass.FFI.p
               * GBool.FFI.val_
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
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr ---> GtkBuildableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkNotebookClass.FFI.fromPtr false) new_ ()
    fun appendPage self (child, tabLabel) =
      (
        GtkNotebookClass.FFI.withPtr
         &&&> GtkWidgetClass.FFI.withPtr
         &&&> GtkWidgetClass.FFI.withOptPtr
         ---> GInt.FFI.fromVal
      )
        appendPage_
        (
          self
           & child
           & tabLabel
        )
    fun appendPageMenu
      self
      (
        child,
        tabLabel,
        menuLabel
      ) =
      (
        GtkNotebookClass.FFI.withPtr
         &&&> GtkWidgetClass.FFI.withPtr
         &&&> GtkWidgetClass.FFI.withOptPtr
         &&&> GtkWidgetClass.FFI.withOptPtr
         ---> GInt.FFI.fromVal
      )
        appendPageMenu_
        (
          self
           & child
           & tabLabel
           & menuLabel
        )
    fun detachTab self child = (GtkNotebookClass.FFI.withPtr &&&> GtkWidgetClass.FFI.withPtr ---> I) detachTab_ (self & child)
    fun getActionWidget self packType = (GtkNotebookClass.FFI.withPtr &&&> GtkPackType.FFI.withVal ---> GtkWidgetClass.FFI.fromOptPtr false) getActionWidget_ (self & packType)
    fun getCurrentPage self = (GtkNotebookClass.FFI.withPtr ---> GInt.FFI.fromVal) getCurrentPage_ self
    fun getGroupName self = (GtkNotebookClass.FFI.withPtr ---> Utf8.FFI.fromOptPtr 0) getGroupName_ self
    fun getMenuLabel self child = (GtkNotebookClass.FFI.withPtr &&&> GtkWidgetClass.FFI.withPtr ---> GtkWidgetClass.FFI.fromOptPtr false) getMenuLabel_ (self & child)
    fun getMenuLabelText self child = (GtkNotebookClass.FFI.withPtr &&&> GtkWidgetClass.FFI.withPtr ---> Utf8.FFI.fromOptPtr 0) getMenuLabelText_ (self & child)
    fun getNPages self = (GtkNotebookClass.FFI.withPtr ---> GInt.FFI.fromVal) getNPages_ self
    fun getNthPage self pageNum = (GtkNotebookClass.FFI.withPtr &&&> GInt.FFI.withVal ---> GtkWidgetClass.FFI.fromOptPtr false) getNthPage_ (self & pageNum)
    fun getScrollable self = (GtkNotebookClass.FFI.withPtr ---> GBool.FFI.fromVal) getScrollable_ self
    fun getShowBorder self = (GtkNotebookClass.FFI.withPtr ---> GBool.FFI.fromVal) getShowBorder_ self
    fun getShowTabs self = (GtkNotebookClass.FFI.withPtr ---> GBool.FFI.fromVal) getShowTabs_ self
    fun getTabDetachable self child = (GtkNotebookClass.FFI.withPtr &&&> GtkWidgetClass.FFI.withPtr ---> GBool.FFI.fromVal) getTabDetachable_ (self & child)
    fun getTabHborder self = (GtkNotebookClass.FFI.withPtr ---> GUInt16.FFI.fromVal) getTabHborder_ self
    fun getTabLabel self child = (GtkNotebookClass.FFI.withPtr &&&> GtkWidgetClass.FFI.withPtr ---> GtkWidgetClass.FFI.fromOptPtr false) getTabLabel_ (self & child)
    fun getTabLabelText self child = (GtkNotebookClass.FFI.withPtr &&&> GtkWidgetClass.FFI.withPtr ---> Utf8.FFI.fromOptPtr 0) getTabLabelText_ (self & child)
    fun getTabPos self = (GtkNotebookClass.FFI.withPtr ---> GtkPositionType.FFI.fromVal) getTabPos_ self
    fun getTabReorderable self child = (GtkNotebookClass.FFI.withPtr &&&> GtkWidgetClass.FFI.withPtr ---> GBool.FFI.fromVal) getTabReorderable_ (self & child)
    fun getTabVborder self = (GtkNotebookClass.FFI.withPtr ---> GUInt16.FFI.fromVal) getTabVborder_ self
    fun insertPage
      self
      (
        child,
        tabLabel,
        position
      ) =
      (
        GtkNotebookClass.FFI.withPtr
         &&&> GtkWidgetClass.FFI.withPtr
         &&&> GtkWidgetClass.FFI.withOptPtr
         &&&> GInt.FFI.withVal
         ---> GInt.FFI.fromVal
      )
        insertPage_
        (
          self
           & child
           & tabLabel
           & position
        )
    fun insertPageMenu
      self
      (
        child,
        tabLabel,
        menuLabel,
        position
      ) =
      (
        GtkNotebookClass.FFI.withPtr
         &&&> GtkWidgetClass.FFI.withPtr
         &&&> GtkWidgetClass.FFI.withOptPtr
         &&&> GtkWidgetClass.FFI.withOptPtr
         &&&> GInt.FFI.withVal
         ---> GInt.FFI.fromVal
      )
        insertPageMenu_
        (
          self
           & child
           & tabLabel
           & menuLabel
           & position
        )
    fun nextPage self = (GtkNotebookClass.FFI.withPtr ---> I) nextPage_ self
    fun pageNum self child = (GtkNotebookClass.FFI.withPtr &&&> GtkWidgetClass.FFI.withPtr ---> GInt.FFI.fromVal) pageNum_ (self & child)
    fun popupDisable self = (GtkNotebookClass.FFI.withPtr ---> I) popupDisable_ self
    fun popupEnable self = (GtkNotebookClass.FFI.withPtr ---> I) popupEnable_ self
    fun prependPage self (child, tabLabel) =
      (
        GtkNotebookClass.FFI.withPtr
         &&&> GtkWidgetClass.FFI.withPtr
         &&&> GtkWidgetClass.FFI.withOptPtr
         ---> GInt.FFI.fromVal
      )
        prependPage_
        (
          self
           & child
           & tabLabel
        )
    fun prependPageMenu
      self
      (
        child,
        tabLabel,
        menuLabel
      ) =
      (
        GtkNotebookClass.FFI.withPtr
         &&&> GtkWidgetClass.FFI.withPtr
         &&&> GtkWidgetClass.FFI.withOptPtr
         &&&> GtkWidgetClass.FFI.withOptPtr
         ---> GInt.FFI.fromVal
      )
        prependPageMenu_
        (
          self
           & child
           & tabLabel
           & menuLabel
        )
    fun prevPage self = (GtkNotebookClass.FFI.withPtr ---> I) prevPage_ self
    fun removePage self pageNum = (GtkNotebookClass.FFI.withPtr &&&> GInt.FFI.withVal ---> I) removePage_ (self & pageNum)
    fun reorderChild self (child, position) =
      (
        GtkNotebookClass.FFI.withPtr
         &&&> GtkWidgetClass.FFI.withPtr
         &&&> GInt.FFI.withVal
         ---> I
      )
        reorderChild_
        (
          self
           & child
           & position
        )
    fun setActionWidget self (widget, packType) =
      (
        GtkNotebookClass.FFI.withPtr
         &&&> GtkWidgetClass.FFI.withPtr
         &&&> GtkPackType.FFI.withVal
         ---> I
      )
        setActionWidget_
        (
          self
           & widget
           & packType
        )
    fun setCurrentPage self pageNum = (GtkNotebookClass.FFI.withPtr &&&> GInt.FFI.withVal ---> I) setCurrentPage_ (self & pageNum)
    fun setGroupName self groupName = (GtkNotebookClass.FFI.withPtr &&&> Utf8.FFI.withOptPtr ---> I) setGroupName_ (self & groupName)
    fun setMenuLabel self (child, menuLabel) =
      (
        GtkNotebookClass.FFI.withPtr
         &&&> GtkWidgetClass.FFI.withPtr
         &&&> GtkWidgetClass.FFI.withOptPtr
         ---> I
      )
        setMenuLabel_
        (
          self
           & child
           & menuLabel
        )
    fun setMenuLabelText self (child, menuText) =
      (
        GtkNotebookClass.FFI.withPtr
         &&&> GtkWidgetClass.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         ---> I
      )
        setMenuLabelText_
        (
          self
           & child
           & menuText
        )
    fun setScrollable self scrollable = (GtkNotebookClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setScrollable_ (self & scrollable)
    fun setShowBorder self showBorder = (GtkNotebookClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setShowBorder_ (self & showBorder)
    fun setShowTabs self showTabs = (GtkNotebookClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setShowTabs_ (self & showTabs)
    fun setTabDetachable self (child, detachable) =
      (
        GtkNotebookClass.FFI.withPtr
         &&&> GtkWidgetClass.FFI.withPtr
         &&&> GBool.FFI.withVal
         ---> I
      )
        setTabDetachable_
        (
          self
           & child
           & detachable
        )
    fun setTabLabel self (child, tabLabel) =
      (
        GtkNotebookClass.FFI.withPtr
         &&&> GtkWidgetClass.FFI.withPtr
         &&&> GtkWidgetClass.FFI.withOptPtr
         ---> I
      )
        setTabLabel_
        (
          self
           & child
           & tabLabel
        )
    fun setTabLabelText self (child, tabText) =
      (
        GtkNotebookClass.FFI.withPtr
         &&&> GtkWidgetClass.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         ---> I
      )
        setTabLabelText_
        (
          self
           & child
           & tabText
        )
    fun setTabPos self pos = (GtkNotebookClass.FFI.withPtr &&&> GtkPositionType.FFI.withVal ---> I) setTabPos_ (self & pos)
    fun setTabReorderable self (child, reorderable) =
      (
        GtkNotebookClass.FFI.withPtr
         &&&> GtkWidgetClass.FFI.withPtr
         &&&> GBool.FFI.withVal
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
                f
                  (
                    page,
                    x,
                    y
                  )
          )
      fun focusTabSig f = signal "focus-tab" (get 0w1 GtkNotebookTab.t ---> ret boolean) f
      fun moveFocusOutSig f = signal "move-focus-out" (get 0w1 GtkDirectionType.t ---> ret_void) f
      fun pageAddedSig f = signal "page-added" (get 0w1 GtkWidgetClass.t &&&> get 0w2 uint ---> ret_void) (fn child & pageNum => f (child, pageNum))
      fun pageRemovedSig f = signal "page-removed" (get 0w1 GtkWidgetClass.t &&&> get 0w2 uint ---> ret_void) (fn child & pageNum => f (child, pageNum))
      fun pageReorderedSig f = signal "page-reordered" (get 0w1 GtkWidgetClass.t &&&> get 0w2 uint ---> ret_void) (fn child & pageNum => f (child, pageNum))
      fun reorderTabSig f = signal "reorder-tab" (get 0w1 GtkDirectionType.t &&&> get 0w2 boolean ---> ret boolean) (fn object & p0 => f (object, p0))
      fun selectPageSig f = signal "select-page" (get 0w1 boolean ---> ret boolean) f
      fun switchPageSig f = signal "switch-page" (get 0w1 GtkWidgetClass.t &&&> get 0w2 uint ---> ret_void) (fn page & pageNum => f (page, pageNum))
    end
    local
      open Property
    in
      val enablePopupProp =
        {
          get = fn x => get "enable-popup" boolean x,
          set = fn x => set "enable-popup" boolean x,
          new = fn x => new "enable-popup" boolean x
        }
      val groupNameProp =
        {
          get = fn x => get "group-name" stringOpt x,
          set = fn x => set "group-name" stringOpt x,
          new = fn x => new "group-name" stringOpt x
        }
      val pageProp =
        {
          get = fn x => get "page" int x,
          set = fn x => set "page" int x,
          new = fn x => new "page" int x
        }
      val scrollableProp =
        {
          get = fn x => get "scrollable" boolean x,
          set = fn x => set "scrollable" boolean x,
          new = fn x => new "scrollable" boolean x
        }
      val showBorderProp =
        {
          get = fn x => get "show-border" boolean x,
          set = fn x => set "show-border" boolean x,
          new = fn x => new "show-border" boolean x
        }
      val showTabsProp =
        {
          get = fn x => get "show-tabs" boolean x,
          set = fn x => set "show-tabs" boolean x,
          new = fn x => new "show-tabs" boolean x
        }
      val tabPosProp =
        {
          get = fn x => get "tab-pos" GtkPositionType.t x,
          set = fn x => set "tab-pos" GtkPositionType.t x,
          new = fn x => new "tab-pos" GtkPositionType.t x
        }
    end
  end
