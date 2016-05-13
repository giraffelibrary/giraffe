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
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_notebook_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libgtk "gtk_notebook_new") (PolyMLFFI.cVoid --> GtkWidgetClass.PolyML.cPtr)
      val appendPage_ =
        call (load_sym libgtk "gtk_notebook_append_page")
          (
            GtkNotebookClass.PolyML.cPtr
             &&> GtkWidgetClass.PolyML.cPtr
             &&> GtkWidgetClass.PolyML.cOptPtr
             --> FFI.Int.PolyML.cVal
          )
      val appendPageMenu_ =
        call (load_sym libgtk "gtk_notebook_append_page_menu")
          (
            GtkNotebookClass.PolyML.cPtr
             &&> GtkWidgetClass.PolyML.cPtr
             &&> GtkWidgetClass.PolyML.cOptPtr
             &&> GtkWidgetClass.PolyML.cOptPtr
             --> FFI.Int.PolyML.cVal
          )
      val getActionWidget_ = call (load_sym libgtk "gtk_notebook_get_action_widget") (GtkNotebookClass.PolyML.cPtr &&> GtkPackType.PolyML.cVal --> GtkWidgetClass.PolyML.cPtr)
      val getCurrentPage_ = call (load_sym libgtk "gtk_notebook_get_current_page") (GtkNotebookClass.PolyML.cPtr --> FFI.Int.PolyML.cVal)
      val getGroupName_ = call (load_sym libgtk "gtk_notebook_get_group_name") (GtkNotebookClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getMenuLabel_ = call (load_sym libgtk "gtk_notebook_get_menu_label") (GtkNotebookClass.PolyML.cPtr &&> GtkWidgetClass.PolyML.cPtr --> GtkWidgetClass.PolyML.cPtr)
      val getMenuLabelText_ = call (load_sym libgtk "gtk_notebook_get_menu_label_text") (GtkNotebookClass.PolyML.cPtr &&> GtkWidgetClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getNPages_ = call (load_sym libgtk "gtk_notebook_get_n_pages") (GtkNotebookClass.PolyML.cPtr --> FFI.Int.PolyML.cVal)
      val getNthPage_ = call (load_sym libgtk "gtk_notebook_get_nth_page") (GtkNotebookClass.PolyML.cPtr &&> FFI.Int.PolyML.cVal --> GtkWidgetClass.PolyML.cPtr)
      val getScrollable_ = call (load_sym libgtk "gtk_notebook_get_scrollable") (GtkNotebookClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getShowBorder_ = call (load_sym libgtk "gtk_notebook_get_show_border") (GtkNotebookClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getShowTabs_ = call (load_sym libgtk "gtk_notebook_get_show_tabs") (GtkNotebookClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getTabDetachable_ = call (load_sym libgtk "gtk_notebook_get_tab_detachable") (GtkNotebookClass.PolyML.cPtr &&> GtkWidgetClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getTabHborder_ = call (load_sym libgtk "gtk_notebook_get_tab_hborder") (GtkNotebookClass.PolyML.cPtr --> FFI.UInt16.PolyML.cVal)
      val getTabLabel_ = call (load_sym libgtk "gtk_notebook_get_tab_label") (GtkNotebookClass.PolyML.cPtr &&> GtkWidgetClass.PolyML.cPtr --> GtkWidgetClass.PolyML.cPtr)
      val getTabLabelText_ = call (load_sym libgtk "gtk_notebook_get_tab_label_text") (GtkNotebookClass.PolyML.cPtr &&> GtkWidgetClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getTabPos_ = call (load_sym libgtk "gtk_notebook_get_tab_pos") (GtkNotebookClass.PolyML.cPtr --> GtkPositionType.PolyML.cVal)
      val getTabReorderable_ = call (load_sym libgtk "gtk_notebook_get_tab_reorderable") (GtkNotebookClass.PolyML.cPtr &&> GtkWidgetClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getTabVborder_ = call (load_sym libgtk "gtk_notebook_get_tab_vborder") (GtkNotebookClass.PolyML.cPtr --> FFI.UInt16.PolyML.cVal)
      val insertPage_ =
        call (load_sym libgtk "gtk_notebook_insert_page")
          (
            GtkNotebookClass.PolyML.cPtr
             &&> GtkWidgetClass.PolyML.cPtr
             &&> GtkWidgetClass.PolyML.cOptPtr
             &&> FFI.Int.PolyML.cVal
             --> FFI.Int.PolyML.cVal
          )
      val insertPageMenu_ =
        call (load_sym libgtk "gtk_notebook_insert_page_menu")
          (
            GtkNotebookClass.PolyML.cPtr
             &&> GtkWidgetClass.PolyML.cPtr
             &&> GtkWidgetClass.PolyML.cOptPtr
             &&> GtkWidgetClass.PolyML.cOptPtr
             &&> FFI.Int.PolyML.cVal
             --> FFI.Int.PolyML.cVal
          )
      val nextPage_ = call (load_sym libgtk "gtk_notebook_next_page") (GtkNotebookClass.PolyML.cPtr --> PolyMLFFI.cVoid)
      val pageNum_ = call (load_sym libgtk "gtk_notebook_page_num") (GtkNotebookClass.PolyML.cPtr &&> GtkWidgetClass.PolyML.cPtr --> FFI.Int.PolyML.cVal)
      val popupDisable_ = call (load_sym libgtk "gtk_notebook_popup_disable") (GtkNotebookClass.PolyML.cPtr --> PolyMLFFI.cVoid)
      val popupEnable_ = call (load_sym libgtk "gtk_notebook_popup_enable") (GtkNotebookClass.PolyML.cPtr --> PolyMLFFI.cVoid)
      val prependPage_ =
        call (load_sym libgtk "gtk_notebook_prepend_page")
          (
            GtkNotebookClass.PolyML.cPtr
             &&> GtkWidgetClass.PolyML.cPtr
             &&> GtkWidgetClass.PolyML.cOptPtr
             --> FFI.Int.PolyML.cVal
          )
      val prependPageMenu_ =
        call (load_sym libgtk "gtk_notebook_prepend_page_menu")
          (
            GtkNotebookClass.PolyML.cPtr
             &&> GtkWidgetClass.PolyML.cPtr
             &&> GtkWidgetClass.PolyML.cOptPtr
             &&> GtkWidgetClass.PolyML.cOptPtr
             --> FFI.Int.PolyML.cVal
          )
      val prevPage_ = call (load_sym libgtk "gtk_notebook_prev_page") (GtkNotebookClass.PolyML.cPtr --> PolyMLFFI.cVoid)
      val removePage_ = call (load_sym libgtk "gtk_notebook_remove_page") (GtkNotebookClass.PolyML.cPtr &&> FFI.Int.PolyML.cVal --> PolyMLFFI.cVoid)
      val reorderChild_ =
        call (load_sym libgtk "gtk_notebook_reorder_child")
          (
            GtkNotebookClass.PolyML.cPtr
             &&> GtkWidgetClass.PolyML.cPtr
             &&> FFI.Int.PolyML.cVal
             --> PolyMLFFI.cVoid
          )
      val setActionWidget_ =
        call (load_sym libgtk "gtk_notebook_set_action_widget")
          (
            GtkNotebookClass.PolyML.cPtr
             &&> GtkWidgetClass.PolyML.cPtr
             &&> GtkPackType.PolyML.cVal
             --> PolyMLFFI.cVoid
          )
      val setCurrentPage_ = call (load_sym libgtk "gtk_notebook_set_current_page") (GtkNotebookClass.PolyML.cPtr &&> FFI.Int.PolyML.cVal --> PolyMLFFI.cVoid)
      val setGroupName_ = call (load_sym libgtk "gtk_notebook_set_group_name") (GtkNotebookClass.PolyML.cPtr &&> Utf8.PolyML.cInOptPtr --> PolyMLFFI.cVoid)
      val setMenuLabel_ =
        call (load_sym libgtk "gtk_notebook_set_menu_label")
          (
            GtkNotebookClass.PolyML.cPtr
             &&> GtkWidgetClass.PolyML.cPtr
             &&> GtkWidgetClass.PolyML.cOptPtr
             --> PolyMLFFI.cVoid
          )
      val setMenuLabelText_ =
        call (load_sym libgtk "gtk_notebook_set_menu_label_text")
          (
            GtkNotebookClass.PolyML.cPtr
             &&> GtkWidgetClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             --> PolyMLFFI.cVoid
          )
      val setScrollable_ = call (load_sym libgtk "gtk_notebook_set_scrollable") (GtkNotebookClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> PolyMLFFI.cVoid)
      val setShowBorder_ = call (load_sym libgtk "gtk_notebook_set_show_border") (GtkNotebookClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> PolyMLFFI.cVoid)
      val setShowTabs_ = call (load_sym libgtk "gtk_notebook_set_show_tabs") (GtkNotebookClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> PolyMLFFI.cVoid)
      val setTabDetachable_ =
        call (load_sym libgtk "gtk_notebook_set_tab_detachable")
          (
            GtkNotebookClass.PolyML.cPtr
             &&> GtkWidgetClass.PolyML.cPtr
             &&> FFI.Bool.PolyML.cVal
             --> PolyMLFFI.cVoid
          )
      val setTabLabel_ =
        call (load_sym libgtk "gtk_notebook_set_tab_label")
          (
            GtkNotebookClass.PolyML.cPtr
             &&> GtkWidgetClass.PolyML.cPtr
             &&> GtkWidgetClass.PolyML.cOptPtr
             --> PolyMLFFI.cVoid
          )
      val setTabLabelText_ =
        call (load_sym libgtk "gtk_notebook_set_tab_label_text")
          (
            GtkNotebookClass.PolyML.cPtr
             &&> GtkWidgetClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             --> PolyMLFFI.cVoid
          )
      val setTabPos_ = call (load_sym libgtk "gtk_notebook_set_tab_pos") (GtkNotebookClass.PolyML.cPtr &&> GtkPositionType.PolyML.cVal --> PolyMLFFI.cVoid)
      val setTabReorderable_ =
        call (load_sym libgtk "gtk_notebook_set_tab_reorderable")
          (
            GtkNotebookClass.PolyML.cPtr
             &&> GtkWidgetClass.PolyML.cPtr
             &&> FFI.Bool.PolyML.cVal
             --> PolyMLFFI.cVoid
          )
    end
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
        GtkNotebookClass.C.withPtr
         &&&> GtkWidgetClass.C.withPtr
         &&&> GtkWidgetClass.C.withOptPtr
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
        GtkNotebookClass.C.withPtr
         &&&> GtkWidgetClass.C.withPtr
         &&&> GtkWidgetClass.C.withOptPtr
         &&&> GtkWidgetClass.C.withOptPtr
         ---> FFI.Int.C.fromVal
      )
        appendPageMenu_
        (
          self
           & child
           & tabLabel
           & menuLabel
        )
    fun getActionWidget self packType = (GtkNotebookClass.C.withPtr &&&> GtkPackType.C.withVal ---> GtkWidgetClass.C.fromPtr false) getActionWidget_ (self & packType)
    fun getCurrentPage self = (GtkNotebookClass.C.withPtr ---> FFI.Int.C.fromVal) getCurrentPage_ self
    fun getGroupName self = (GtkNotebookClass.C.withPtr ---> Utf8.C.fromPtr false) getGroupName_ self
    fun getMenuLabel self child = (GtkNotebookClass.C.withPtr &&&> GtkWidgetClass.C.withPtr ---> GtkWidgetClass.C.fromPtr false) getMenuLabel_ (self & child)
    fun getMenuLabelText self child = (GtkNotebookClass.C.withPtr &&&> GtkWidgetClass.C.withPtr ---> Utf8.C.fromPtr false) getMenuLabelText_ (self & child)
    fun getNPages self = (GtkNotebookClass.C.withPtr ---> FFI.Int.C.fromVal) getNPages_ self
    fun getNthPage self pageNum = (GtkNotebookClass.C.withPtr &&&> FFI.Int.C.withVal ---> GtkWidgetClass.C.fromPtr false) getNthPage_ (self & pageNum)
    fun getScrollable self = (GtkNotebookClass.C.withPtr ---> FFI.Bool.C.fromVal) getScrollable_ self
    fun getShowBorder self = (GtkNotebookClass.C.withPtr ---> FFI.Bool.C.fromVal) getShowBorder_ self
    fun getShowTabs self = (GtkNotebookClass.C.withPtr ---> FFI.Bool.C.fromVal) getShowTabs_ self
    fun getTabDetachable self child = (GtkNotebookClass.C.withPtr &&&> GtkWidgetClass.C.withPtr ---> FFI.Bool.C.fromVal) getTabDetachable_ (self & child)
    fun getTabHborder self = (GtkNotebookClass.C.withPtr ---> FFI.UInt16.C.fromVal) getTabHborder_ self
    fun getTabLabel self child = (GtkNotebookClass.C.withPtr &&&> GtkWidgetClass.C.withPtr ---> GtkWidgetClass.C.fromPtr false) getTabLabel_ (self & child)
    fun getTabLabelText self child = (GtkNotebookClass.C.withPtr &&&> GtkWidgetClass.C.withPtr ---> Utf8.C.fromPtr false) getTabLabelText_ (self & child)
    fun getTabPos self = (GtkNotebookClass.C.withPtr ---> GtkPositionType.C.fromVal) getTabPos_ self
    fun getTabReorderable self child = (GtkNotebookClass.C.withPtr &&&> GtkWidgetClass.C.withPtr ---> FFI.Bool.C.fromVal) getTabReorderable_ (self & child)
    fun getTabVborder self = (GtkNotebookClass.C.withPtr ---> FFI.UInt16.C.fromVal) getTabVborder_ self
    fun insertPage self child tabLabel position =
      (
        GtkNotebookClass.C.withPtr
         &&&> GtkWidgetClass.C.withPtr
         &&&> GtkWidgetClass.C.withOptPtr
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
        GtkNotebookClass.C.withPtr
         &&&> GtkWidgetClass.C.withPtr
         &&&> GtkWidgetClass.C.withOptPtr
         &&&> GtkWidgetClass.C.withOptPtr
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
    fun nextPage self = (GtkNotebookClass.C.withPtr ---> I) nextPage_ self
    fun pageNum self child = (GtkNotebookClass.C.withPtr &&&> GtkWidgetClass.C.withPtr ---> FFI.Int.C.fromVal) pageNum_ (self & child)
    fun popupDisable self = (GtkNotebookClass.C.withPtr ---> I) popupDisable_ self
    fun popupEnable self = (GtkNotebookClass.C.withPtr ---> I) popupEnable_ self
    fun prependPage self child tabLabel =
      (
        GtkNotebookClass.C.withPtr
         &&&> GtkWidgetClass.C.withPtr
         &&&> GtkWidgetClass.C.withOptPtr
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
        GtkNotebookClass.C.withPtr
         &&&> GtkWidgetClass.C.withPtr
         &&&> GtkWidgetClass.C.withOptPtr
         &&&> GtkWidgetClass.C.withOptPtr
         ---> FFI.Int.C.fromVal
      )
        prependPageMenu_
        (
          self
           & child
           & tabLabel
           & menuLabel
        )
    fun prevPage self = (GtkNotebookClass.C.withPtr ---> I) prevPage_ self
    fun removePage self pageNum = (GtkNotebookClass.C.withPtr &&&> FFI.Int.C.withVal ---> I) removePage_ (self & pageNum)
    fun reorderChild self child position =
      (
        GtkNotebookClass.C.withPtr
         &&&> GtkWidgetClass.C.withPtr
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
        GtkNotebookClass.C.withPtr
         &&&> GtkWidgetClass.C.withPtr
         &&&> GtkPackType.C.withVal
         ---> I
      )
        setActionWidget_
        (
          self
           & widget
           & packType
        )
    fun setCurrentPage self pageNum = (GtkNotebookClass.C.withPtr &&&> FFI.Int.C.withVal ---> I) setCurrentPage_ (self & pageNum)
    fun setGroupName self groupName = (GtkNotebookClass.C.withPtr &&&> Utf8.C.withOptPtr ---> I) setGroupName_ (self & groupName)
    fun setMenuLabel self child menuLabel =
      (
        GtkNotebookClass.C.withPtr
         &&&> GtkWidgetClass.C.withPtr
         &&&> GtkWidgetClass.C.withOptPtr
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
        GtkNotebookClass.C.withPtr
         &&&> GtkWidgetClass.C.withPtr
         &&&> Utf8.C.withPtr
         ---> I
      )
        setMenuLabelText_
        (
          self
           & child
           & menuText
        )
    fun setScrollable self scrollable = (GtkNotebookClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setScrollable_ (self & scrollable)
    fun setShowBorder self showBorder = (GtkNotebookClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setShowBorder_ (self & showBorder)
    fun setShowTabs self showTabs = (GtkNotebookClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setShowTabs_ (self & showTabs)
    fun setTabDetachable self child detachable =
      (
        GtkNotebookClass.C.withPtr
         &&&> GtkWidgetClass.C.withPtr
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
        GtkNotebookClass.C.withPtr
         &&&> GtkWidgetClass.C.withPtr
         &&&> GtkWidgetClass.C.withOptPtr
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
        GtkNotebookClass.C.withPtr
         &&&> GtkWidgetClass.C.withPtr
         &&&> Utf8.C.withPtr
         ---> I
      )
        setTabLabelText_
        (
          self
           & child
           & tabText
        )
    fun setTabPos self pos = (GtkNotebookClass.C.withPtr &&&> GtkPositionType.C.withVal ---> I) setTabPos_ (self & pos)
    fun setTabReorderable self child reorderable =
      (
        GtkNotebookClass.C.withPtr
         &&&> GtkWidgetClass.C.withPtr
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
