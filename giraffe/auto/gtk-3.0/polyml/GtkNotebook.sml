structure GtkNotebook :>
  GTK_NOTEBOOK
    where type 'a class_t = 'a GtkNotebookClass.t
    where type 'a buildableclass_t = 'a GtkBuildableClass.t
    where type packtype_t = GtkPackType.t
    where type notebooktab_t = GtkNotebookTab.t
    where type directiontype_t = GtkDirectionType.t
    where type 'a widgetclass_t = 'a GtkWidgetClass.t
    where type positiontype_t = GtkPositionType.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_notebook_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val new_ = call (load_sym libgtk "gtk_notebook_new") (FFI.PolyML.VOID --> GObjectObjectClass.PolyML.PTR)
      val appendPage_ =
        call (load_sym libgtk "gtk_notebook_append_page")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.OPTPTR
             --> FFI.Int32.PolyML.VAL
          )
      val appendPageMenu_ =
        call (load_sym libgtk "gtk_notebook_append_page_menu")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.OPTPTR
             &&> GObjectObjectClass.PolyML.OPTPTR
             --> FFI.Int32.PolyML.VAL
          )
      val getActionWidget_ = call (load_sym libgtk "gtk_notebook_get_action_widget") (GObjectObjectClass.PolyML.PTR &&> GtkPackType.PolyML.VAL --> GObjectObjectClass.PolyML.PTR)
      val getCurrentPage_ = call (load_sym libgtk "gtk_notebook_get_current_page") (GObjectObjectClass.PolyML.PTR --> FFI.Int32.PolyML.VAL)
      val getGroupName_ = call (load_sym libgtk "gtk_notebook_get_group_name") (GObjectObjectClass.PolyML.PTR --> FFI.String.PolyML.RETPTR)
      val getMenuLabel_ = call (load_sym libgtk "gtk_notebook_get_menu_label") (GObjectObjectClass.PolyML.PTR &&> GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val getMenuLabelText_ = call (load_sym libgtk "gtk_notebook_get_menu_label_text") (GObjectObjectClass.PolyML.PTR &&> GObjectObjectClass.PolyML.PTR --> FFI.String.PolyML.RETPTR)
      val getNPages_ = call (load_sym libgtk "gtk_notebook_get_n_pages") (GObjectObjectClass.PolyML.PTR --> FFI.Int32.PolyML.VAL)
      val getNthPage_ = call (load_sym libgtk "gtk_notebook_get_nth_page") (GObjectObjectClass.PolyML.PTR &&> FFI.Int32.PolyML.VAL --> GObjectObjectClass.PolyML.PTR)
      val getScrollable_ = call (load_sym libgtk "gtk_notebook_get_scrollable") (GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val getShowBorder_ = call (load_sym libgtk "gtk_notebook_get_show_border") (GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val getShowTabs_ = call (load_sym libgtk "gtk_notebook_get_show_tabs") (GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val getTabDetachable_ = call (load_sym libgtk "gtk_notebook_get_tab_detachable") (GObjectObjectClass.PolyML.PTR &&> GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val getTabHborder_ = call (load_sym libgtk "gtk_notebook_get_tab_hborder") (GObjectObjectClass.PolyML.PTR --> FFI.UInt16.PolyML.VAL)
      val getTabLabel_ = call (load_sym libgtk "gtk_notebook_get_tab_label") (GObjectObjectClass.PolyML.PTR &&> GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val getTabLabelText_ = call (load_sym libgtk "gtk_notebook_get_tab_label_text") (GObjectObjectClass.PolyML.PTR &&> GObjectObjectClass.PolyML.PTR --> FFI.String.PolyML.RETPTR)
      val getTabPos_ = call (load_sym libgtk "gtk_notebook_get_tab_pos") (GObjectObjectClass.PolyML.PTR --> GtkPositionType.PolyML.VAL)
      val getTabReorderable_ = call (load_sym libgtk "gtk_notebook_get_tab_reorderable") (GObjectObjectClass.PolyML.PTR &&> GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val getTabVborder_ = call (load_sym libgtk "gtk_notebook_get_tab_vborder") (GObjectObjectClass.PolyML.PTR --> FFI.UInt16.PolyML.VAL)
      val insertPage_ =
        call (load_sym libgtk "gtk_notebook_insert_page")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.OPTPTR
             &&> FFI.Int32.PolyML.VAL
             --> FFI.Int32.PolyML.VAL
          )
      val insertPageMenu_ =
        call (load_sym libgtk "gtk_notebook_insert_page_menu")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.OPTPTR
             &&> GObjectObjectClass.PolyML.OPTPTR
             &&> FFI.Int32.PolyML.VAL
             --> FFI.Int32.PolyML.VAL
          )
      val nextPage_ = call (load_sym libgtk "gtk_notebook_next_page") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val pageNum_ = call (load_sym libgtk "gtk_notebook_page_num") (GObjectObjectClass.PolyML.PTR &&> GObjectObjectClass.PolyML.PTR --> FFI.Int32.PolyML.VAL)
      val popupDisable_ = call (load_sym libgtk "gtk_notebook_popup_disable") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val popupEnable_ = call (load_sym libgtk "gtk_notebook_popup_enable") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val prependPage_ =
        call (load_sym libgtk "gtk_notebook_prepend_page")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.OPTPTR
             --> FFI.Int32.PolyML.VAL
          )
      val prependPageMenu_ =
        call (load_sym libgtk "gtk_notebook_prepend_page_menu")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.OPTPTR
             &&> GObjectObjectClass.PolyML.OPTPTR
             --> FFI.Int32.PolyML.VAL
          )
      val prevPage_ = call (load_sym libgtk "gtk_notebook_prev_page") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val removePage_ = call (load_sym libgtk "gtk_notebook_remove_page") (GObjectObjectClass.PolyML.PTR &&> FFI.Int32.PolyML.VAL --> FFI.PolyML.VOID)
      val reorderChild_ =
        call (load_sym libgtk "gtk_notebook_reorder_child")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> FFI.Int32.PolyML.VAL
             --> FFI.PolyML.VOID
          )
      val setActionWidget_ =
        call (load_sym libgtk "gtk_notebook_set_action_widget")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> GtkPackType.PolyML.VAL
             --> FFI.PolyML.VOID
          )
      val setCurrentPage_ = call (load_sym libgtk "gtk_notebook_set_current_page") (GObjectObjectClass.PolyML.PTR &&> FFI.Int32.PolyML.VAL --> FFI.PolyML.VOID)
      val setGroupName_ = call (load_sym libgtk "gtk_notebook_set_group_name") (GObjectObjectClass.PolyML.PTR &&> FFI.String.PolyML.INOPTPTR --> FFI.PolyML.VOID)
      val setMenuLabel_ =
        call (load_sym libgtk "gtk_notebook_set_menu_label")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.OPTPTR
             --> FFI.PolyML.VOID
          )
      val setMenuLabelText_ =
        call (load_sym libgtk "gtk_notebook_set_menu_label_text")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> FFI.String.PolyML.INPTR
             --> FFI.PolyML.VOID
          )
      val setScrollable_ = call (load_sym libgtk "gtk_notebook_set_scrollable") (GObjectObjectClass.PolyML.PTR &&> FFI.Bool.PolyML.VAL --> FFI.PolyML.VOID)
      val setShowBorder_ = call (load_sym libgtk "gtk_notebook_set_show_border") (GObjectObjectClass.PolyML.PTR &&> FFI.Bool.PolyML.VAL --> FFI.PolyML.VOID)
      val setShowTabs_ = call (load_sym libgtk "gtk_notebook_set_show_tabs") (GObjectObjectClass.PolyML.PTR &&> FFI.Bool.PolyML.VAL --> FFI.PolyML.VOID)
      val setTabDetachable_ =
        call (load_sym libgtk "gtk_notebook_set_tab_detachable")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> FFI.Bool.PolyML.VAL
             --> FFI.PolyML.VOID
          )
      val setTabLabel_ =
        call (load_sym libgtk "gtk_notebook_set_tab_label")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.OPTPTR
             --> FFI.PolyML.VOID
          )
      val setTabLabelText_ =
        call (load_sym libgtk "gtk_notebook_set_tab_label_text")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> FFI.String.PolyML.INPTR
             --> FFI.PolyML.VOID
          )
      val setTabPos_ = call (load_sym libgtk "gtk_notebook_set_tab_pos") (GObjectObjectClass.PolyML.PTR &&> GtkPositionType.PolyML.VAL --> FFI.PolyML.VOID)
      val setTabReorderable_ =
        call (load_sym libgtk "gtk_notebook_set_tab_reorderable")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> FFI.Bool.PolyML.VAL
             --> FFI.PolyML.VOID
          )
    end
    type 'a class_t = 'a GtkNotebookClass.t
    type 'a buildableclass_t = 'a GtkBuildableClass.t
    type packtype_t = GtkPackType.t
    type notebooktab_t = GtkNotebookTab.t
    type directiontype_t = GtkDirectionType.t
    type 'a widgetclass_t = 'a GtkWidgetClass.t
    type positiontype_t = GtkPositionType.t
    fun asImplementorIface self = (GObjectObjectClass.C.withPtr ---> AtkImplementorIfaceClass.C.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkNotebookClass.C.fromPtr false) new_ ()
    fun appendPage self child tabLabel =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withOptPtr
         ---> FFI.Int32.C.fromVal
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
         ---> FFI.Int32.C.fromVal
      )
        appendPageMenu_
        (
          self
           & child
           & tabLabel
           & menuLabel
        )
    fun getActionWidget self packType = (GObjectObjectClass.C.withPtr &&&> GtkPackType.C.withVal ---> GtkWidgetClass.C.fromPtr false) getActionWidget_ (self & packType)
    fun getCurrentPage self = (GObjectObjectClass.C.withPtr ---> FFI.Int32.C.fromVal) getCurrentPage_ self
    fun getGroupName self = (GObjectObjectClass.C.withPtr ---> FFI.String.C.fromPtr false) getGroupName_ self
    fun getMenuLabel self child = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> GtkWidgetClass.C.fromPtr false) getMenuLabel_ (self & child)
    fun getMenuLabelText self child = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> FFI.String.C.fromPtr false) getMenuLabelText_ (self & child)
    fun getNPages self = (GObjectObjectClass.C.withPtr ---> FFI.Int32.C.fromVal) getNPages_ self
    fun getNthPage self pageNum = (GObjectObjectClass.C.withPtr &&&> FFI.Int32.C.withVal ---> GtkWidgetClass.C.fromPtr false) getNthPage_ (self & pageNum)
    fun getScrollable self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getScrollable_ self
    fun getShowBorder self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getShowBorder_ self
    fun getShowTabs self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getShowTabs_ self
    fun getTabDetachable self child = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getTabDetachable_ (self & child)
    fun getTabHborder self = (GObjectObjectClass.C.withPtr ---> FFI.UInt16.C.fromVal) getTabHborder_ self
    fun getTabLabel self child = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> GtkWidgetClass.C.fromPtr false) getTabLabel_ (self & child)
    fun getTabLabelText self child = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> FFI.String.C.fromPtr false) getTabLabelText_ (self & child)
    fun getTabPos self = (GObjectObjectClass.C.withPtr ---> GtkPositionType.C.fromVal) getTabPos_ self
    fun getTabReorderable self child = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getTabReorderable_ (self & child)
    fun getTabVborder self = (GObjectObjectClass.C.withPtr ---> FFI.UInt16.C.fromVal) getTabVborder_ self
    fun insertPage self child tabLabel position =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> FFI.Int32.C.withVal
         ---> FFI.Int32.C.fromVal
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
         &&&> FFI.Int32.C.withVal
         ---> FFI.Int32.C.fromVal
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
    fun pageNum self child = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> FFI.Int32.C.fromVal) pageNum_ (self & child)
    fun popupDisable self = (GObjectObjectClass.C.withPtr ---> I) popupDisable_ self
    fun popupEnable self = (GObjectObjectClass.C.withPtr ---> I) popupEnable_ self
    fun prependPage self child tabLabel =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withOptPtr
         ---> FFI.Int32.C.fromVal
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
         ---> FFI.Int32.C.fromVal
      )
        prependPageMenu_
        (
          self
           & child
           & tabLabel
           & menuLabel
        )
    fun prevPage self = (GObjectObjectClass.C.withPtr ---> I) prevPage_ self
    fun removePage self pageNum = (GObjectObjectClass.C.withPtr &&&> FFI.Int32.C.withVal ---> I) removePage_ (self & pageNum)
    fun reorderChild self child position =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> FFI.Int32.C.withVal
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
    fun setCurrentPage self pageNum = (GObjectObjectClass.C.withPtr &&&> FFI.Int32.C.withVal ---> I) setCurrentPage_ (self & pageNum)
    fun setGroupName self groupName = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstOptPtr ---> I) setGroupName_ (self & groupName)
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
         &&&> FFI.String.C.withConstPtr
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
         &&&> FFI.String.C.withConstPtr
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
