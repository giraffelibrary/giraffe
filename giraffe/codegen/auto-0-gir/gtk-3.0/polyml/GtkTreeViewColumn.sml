structure GtkTreeViewColumn :>
  GTK_TREE_VIEW_COLUMN
    where type 'a class = 'a GtkTreeViewColumnClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type 'a cell_layout_class = 'a GtkCellLayoutClass.class
    where type tree_iter_t = GtkTreeIterRecord.t
    where type 'a tree_model_class = 'a GtkTreeModelClass.class
    where type 'a cell_renderer_class = 'a GtkCellRendererClass.class
    where type 'a cell_area_class = 'a GtkCellAreaClass.class
    where type tree_view_column_sizing_t = GtkTreeViewColumnSizing.t
    where type sort_type_t = GtkSortType.t
    where type 'a widget_class = 'a GtkWidgetClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_tree_view_column_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "gtk_tree_view_column_new") (PolyMLFFI.cVoid --> GtkTreeViewColumnClass.PolyML.cPtr)
      val newWithArea_ = call (getSymbol "gtk_tree_view_column_new_with_area") (GtkCellAreaClass.PolyML.cPtr --> GtkTreeViewColumnClass.PolyML.cPtr)
      val addAttribute_ =
        call (getSymbol "gtk_tree_view_column_add_attribute")
          (
            GtkTreeViewColumnClass.PolyML.cPtr
             &&> GtkCellRendererClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GInt.PolyML.cVal
             --> PolyMLFFI.cVoid
          )
      val cellGetPosition_ =
        call (getSymbol "gtk_tree_view_column_cell_get_position")
          (
            GtkTreeViewColumnClass.PolyML.cPtr
             &&> GtkCellRendererClass.PolyML.cPtr
             &&> GInt.PolyML.cRef
             &&> GInt.PolyML.cRef
             --> GBool.PolyML.cVal
          )
      val cellGetSize_ =
        call (getSymbol "gtk_tree_view_column_cell_get_size")
          (
            GtkTreeViewColumnClass.PolyML.cPtr
             &&> GdkRectangleRecord.PolyML.cOptPtr
             &&> GInt.PolyML.cRef
             &&> GInt.PolyML.cRef
             &&> GInt.PolyML.cRef
             &&> GInt.PolyML.cRef
             --> PolyMLFFI.cVoid
          )
      val cellIsVisible_ = call (getSymbol "gtk_tree_view_column_cell_is_visible") (GtkTreeViewColumnClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val cellSetCellData_ =
        call (getSymbol "gtk_tree_view_column_cell_set_cell_data")
          (
            GtkTreeViewColumnClass.PolyML.cPtr
             &&> GtkTreeModelClass.PolyML.cPtr
             &&> GtkTreeIterRecord.PolyML.cPtr
             &&> GBool.PolyML.cVal
             &&> GBool.PolyML.cVal
             --> PolyMLFFI.cVoid
          )
      val clear_ = call (getSymbol "gtk_tree_view_column_clear") (GtkTreeViewColumnClass.PolyML.cPtr --> PolyMLFFI.cVoid)
      val clearAttributes_ = call (getSymbol "gtk_tree_view_column_clear_attributes") (GtkTreeViewColumnClass.PolyML.cPtr &&> GtkCellRendererClass.PolyML.cPtr --> PolyMLFFI.cVoid)
      val clicked_ = call (getSymbol "gtk_tree_view_column_clicked") (GtkTreeViewColumnClass.PolyML.cPtr --> PolyMLFFI.cVoid)
      val focusCell_ = call (getSymbol "gtk_tree_view_column_focus_cell") (GtkTreeViewColumnClass.PolyML.cPtr &&> GtkCellRendererClass.PolyML.cPtr --> PolyMLFFI.cVoid)
      val getAlignment_ = call (getSymbol "gtk_tree_view_column_get_alignment") (GtkTreeViewColumnClass.PolyML.cPtr --> GFloat.PolyML.cVal)
      val getButton_ = call (getSymbol "gtk_tree_view_column_get_button") (GtkTreeViewColumnClass.PolyML.cPtr --> GtkWidgetClass.PolyML.cPtr)
      val getClickable_ = call (getSymbol "gtk_tree_view_column_get_clickable") (GtkTreeViewColumnClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getExpand_ = call (getSymbol "gtk_tree_view_column_get_expand") (GtkTreeViewColumnClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getFixedWidth_ = call (getSymbol "gtk_tree_view_column_get_fixed_width") (GtkTreeViewColumnClass.PolyML.cPtr --> GInt.PolyML.cVal)
      val getMaxWidth_ = call (getSymbol "gtk_tree_view_column_get_max_width") (GtkTreeViewColumnClass.PolyML.cPtr --> GInt.PolyML.cVal)
      val getMinWidth_ = call (getSymbol "gtk_tree_view_column_get_min_width") (GtkTreeViewColumnClass.PolyML.cPtr --> GInt.PolyML.cVal)
      val getReorderable_ = call (getSymbol "gtk_tree_view_column_get_reorderable") (GtkTreeViewColumnClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getResizable_ = call (getSymbol "gtk_tree_view_column_get_resizable") (GtkTreeViewColumnClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getSizing_ = call (getSymbol "gtk_tree_view_column_get_sizing") (GtkTreeViewColumnClass.PolyML.cPtr --> GtkTreeViewColumnSizing.PolyML.cVal)
      val getSortColumnId_ = call (getSymbol "gtk_tree_view_column_get_sort_column_id") (GtkTreeViewColumnClass.PolyML.cPtr --> GInt.PolyML.cVal)
      val getSortIndicator_ = call (getSymbol "gtk_tree_view_column_get_sort_indicator") (GtkTreeViewColumnClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getSortOrder_ = call (getSymbol "gtk_tree_view_column_get_sort_order") (GtkTreeViewColumnClass.PolyML.cPtr --> GtkSortType.PolyML.cVal)
      val getSpacing_ = call (getSymbol "gtk_tree_view_column_get_spacing") (GtkTreeViewColumnClass.PolyML.cPtr --> GInt.PolyML.cVal)
      val getTitle_ = call (getSymbol "gtk_tree_view_column_get_title") (GtkTreeViewColumnClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getTreeView_ = call (getSymbol "gtk_tree_view_column_get_tree_view") (GtkTreeViewColumnClass.PolyML.cPtr --> GtkWidgetClass.PolyML.cPtr)
      val getVisible_ = call (getSymbol "gtk_tree_view_column_get_visible") (GtkTreeViewColumnClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getWidget_ = call (getSymbol "gtk_tree_view_column_get_widget") (GtkTreeViewColumnClass.PolyML.cPtr --> GtkWidgetClass.PolyML.cPtr)
      val getWidth_ = call (getSymbol "gtk_tree_view_column_get_width") (GtkTreeViewColumnClass.PolyML.cPtr --> GInt.PolyML.cVal)
      val getXOffset_ = call (getSymbol "gtk_tree_view_column_get_x_offset") (GtkTreeViewColumnClass.PolyML.cPtr --> GInt.PolyML.cVal)
      val packEnd_ =
        call (getSymbol "gtk_tree_view_column_pack_end")
          (
            GtkTreeViewColumnClass.PolyML.cPtr
             &&> GtkCellRendererClass.PolyML.cPtr
             &&> GBool.PolyML.cVal
             --> PolyMLFFI.cVoid
          )
      val packStart_ =
        call (getSymbol "gtk_tree_view_column_pack_start")
          (
            GtkTreeViewColumnClass.PolyML.cPtr
             &&> GtkCellRendererClass.PolyML.cPtr
             &&> GBool.PolyML.cVal
             --> PolyMLFFI.cVoid
          )
      val queueResize_ = call (getSymbol "gtk_tree_view_column_queue_resize") (GtkTreeViewColumnClass.PolyML.cPtr --> PolyMLFFI.cVoid)
      val setAlignment_ = call (getSymbol "gtk_tree_view_column_set_alignment") (GtkTreeViewColumnClass.PolyML.cPtr &&> GFloat.PolyML.cVal --> PolyMLFFI.cVoid)
      val setClickable_ = call (getSymbol "gtk_tree_view_column_set_clickable") (GtkTreeViewColumnClass.PolyML.cPtr &&> GBool.PolyML.cVal --> PolyMLFFI.cVoid)
      val setExpand_ = call (getSymbol "gtk_tree_view_column_set_expand") (GtkTreeViewColumnClass.PolyML.cPtr &&> GBool.PolyML.cVal --> PolyMLFFI.cVoid)
      val setFixedWidth_ = call (getSymbol "gtk_tree_view_column_set_fixed_width") (GtkTreeViewColumnClass.PolyML.cPtr &&> GInt.PolyML.cVal --> PolyMLFFI.cVoid)
      val setMaxWidth_ = call (getSymbol "gtk_tree_view_column_set_max_width") (GtkTreeViewColumnClass.PolyML.cPtr &&> GInt.PolyML.cVal --> PolyMLFFI.cVoid)
      val setMinWidth_ = call (getSymbol "gtk_tree_view_column_set_min_width") (GtkTreeViewColumnClass.PolyML.cPtr &&> GInt.PolyML.cVal --> PolyMLFFI.cVoid)
      val setReorderable_ = call (getSymbol "gtk_tree_view_column_set_reorderable") (GtkTreeViewColumnClass.PolyML.cPtr &&> GBool.PolyML.cVal --> PolyMLFFI.cVoid)
      val setResizable_ = call (getSymbol "gtk_tree_view_column_set_resizable") (GtkTreeViewColumnClass.PolyML.cPtr &&> GBool.PolyML.cVal --> PolyMLFFI.cVoid)
      val setSizing_ = call (getSymbol "gtk_tree_view_column_set_sizing") (GtkTreeViewColumnClass.PolyML.cPtr &&> GtkTreeViewColumnSizing.PolyML.cVal --> PolyMLFFI.cVoid)
      val setSortColumnId_ = call (getSymbol "gtk_tree_view_column_set_sort_column_id") (GtkTreeViewColumnClass.PolyML.cPtr &&> GInt.PolyML.cVal --> PolyMLFFI.cVoid)
      val setSortIndicator_ = call (getSymbol "gtk_tree_view_column_set_sort_indicator") (GtkTreeViewColumnClass.PolyML.cPtr &&> GBool.PolyML.cVal --> PolyMLFFI.cVoid)
      val setSortOrder_ = call (getSymbol "gtk_tree_view_column_set_sort_order") (GtkTreeViewColumnClass.PolyML.cPtr &&> GtkSortType.PolyML.cVal --> PolyMLFFI.cVoid)
      val setSpacing_ = call (getSymbol "gtk_tree_view_column_set_spacing") (GtkTreeViewColumnClass.PolyML.cPtr &&> GInt.PolyML.cVal --> PolyMLFFI.cVoid)
      val setTitle_ = call (getSymbol "gtk_tree_view_column_set_title") (GtkTreeViewColumnClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> PolyMLFFI.cVoid)
      val setVisible_ = call (getSymbol "gtk_tree_view_column_set_visible") (GtkTreeViewColumnClass.PolyML.cPtr &&> GBool.PolyML.cVal --> PolyMLFFI.cVoid)
      val setWidget_ = call (getSymbol "gtk_tree_view_column_set_widget") (GtkTreeViewColumnClass.PolyML.cPtr &&> GtkWidgetClass.PolyML.cOptPtr --> PolyMLFFI.cVoid)
    end
    type 'a class = 'a GtkTreeViewColumnClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type 'a cell_layout_class = 'a GtkCellLayoutClass.class
    type tree_iter_t = GtkTreeIterRecord.t
    type 'a tree_model_class = 'a GtkTreeModelClass.class
    type 'a cell_renderer_class = 'a GtkCellRendererClass.class
    type 'a cell_area_class = 'a GtkCellAreaClass.class
    type tree_view_column_sizing_t = GtkTreeViewColumnSizing.t
    type sort_type_t = GtkSortType.t
    type 'a widget_class = 'a GtkWidgetClass.class
    type t = base class
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr ---> GtkBuildableClass.FFI.fromPtr false) I self
    fun asCellLayout self = (GObjectObjectClass.FFI.withPtr ---> GtkCellLayoutClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkTreeViewColumnClass.FFI.fromPtr false) new_ ()
    fun newWithArea area = (GtkCellAreaClass.FFI.withPtr ---> GtkTreeViewColumnClass.FFI.fromPtr false) newWithArea_ area
    fun addAttribute self cellRenderer attribute column =
      (
        GtkTreeViewColumnClass.FFI.withPtr
         &&&> GtkCellRendererClass.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GInt.FFI.withVal
         ---> I
      )
        addAttribute_
        (
          self
           & cellRenderer
           & attribute
           & column
        )
    fun cellGetPosition self cellRenderer =
      let
        val xOffset
         & width
         & retVal =
          (
            GtkTreeViewColumnClass.FFI.withPtr
             &&&> GtkCellRendererClass.FFI.withPtr
             &&&> GInt.FFI.withRefVal
             &&&> GInt.FFI.withRefVal
             ---> GInt.FFI.fromVal
                   && GInt.FFI.fromVal
                   && GBool.FFI.fromVal
          )
            cellGetPosition_
            (
              self
               & cellRenderer
               & GInt.null
               & GInt.null
            )
      in
        if retVal then SOME (xOffset, width) else NONE
      end
    fun cellGetSize self cellArea =
      let
        val xOffset
         & yOffset
         & width
         & height
         & () =
          (
            GtkTreeViewColumnClass.FFI.withPtr
             &&&> GdkRectangleRecord.FFI.withOptPtr
             &&&> GInt.FFI.withRefVal
             &&&> GInt.FFI.withRefVal
             &&&> GInt.FFI.withRefVal
             &&&> GInt.FFI.withRefVal
             ---> GInt.FFI.fromVal
                   && GInt.FFI.fromVal
                   && GInt.FFI.fromVal
                   && GInt.FFI.fromVal
                   && I
          )
            cellGetSize_
            (
              self
               & cellArea
               & GInt.null
               & GInt.null
               & GInt.null
               & GInt.null
            )
      in
        (
          xOffset,
          yOffset,
          width,
          height
        )
      end
    fun cellIsVisible self = (GtkTreeViewColumnClass.FFI.withPtr ---> GBool.FFI.fromVal) cellIsVisible_ self
    fun cellSetCellData self treeModel iter isExpander isExpanded =
      (
        GtkTreeViewColumnClass.FFI.withPtr
         &&&> GtkTreeModelClass.FFI.withPtr
         &&&> GtkTreeIterRecord.FFI.withPtr
         &&&> GBool.FFI.withVal
         &&&> GBool.FFI.withVal
         ---> I
      )
        cellSetCellData_
        (
          self
           & treeModel
           & iter
           & isExpander
           & isExpanded
        )
    fun clear self = (GtkTreeViewColumnClass.FFI.withPtr ---> I) clear_ self
    fun clearAttributes self cellRenderer = (GtkTreeViewColumnClass.FFI.withPtr &&&> GtkCellRendererClass.FFI.withPtr ---> I) clearAttributes_ (self & cellRenderer)
    fun clicked self = (GtkTreeViewColumnClass.FFI.withPtr ---> I) clicked_ self
    fun focusCell self cell = (GtkTreeViewColumnClass.FFI.withPtr &&&> GtkCellRendererClass.FFI.withPtr ---> I) focusCell_ (self & cell)
    fun getAlignment self = (GtkTreeViewColumnClass.FFI.withPtr ---> GFloat.FFI.fromVal) getAlignment_ self
    fun getButton self = (GtkTreeViewColumnClass.FFI.withPtr ---> GtkWidgetClass.FFI.fromPtr false) getButton_ self
    fun getClickable self = (GtkTreeViewColumnClass.FFI.withPtr ---> GBool.FFI.fromVal) getClickable_ self
    fun getExpand self = (GtkTreeViewColumnClass.FFI.withPtr ---> GBool.FFI.fromVal) getExpand_ self
    fun getFixedWidth self = (GtkTreeViewColumnClass.FFI.withPtr ---> GInt.FFI.fromVal) getFixedWidth_ self
    fun getMaxWidth self = (GtkTreeViewColumnClass.FFI.withPtr ---> GInt.FFI.fromVal) getMaxWidth_ self
    fun getMinWidth self = (GtkTreeViewColumnClass.FFI.withPtr ---> GInt.FFI.fromVal) getMinWidth_ self
    fun getReorderable self = (GtkTreeViewColumnClass.FFI.withPtr ---> GBool.FFI.fromVal) getReorderable_ self
    fun getResizable self = (GtkTreeViewColumnClass.FFI.withPtr ---> GBool.FFI.fromVal) getResizable_ self
    fun getSizing self = (GtkTreeViewColumnClass.FFI.withPtr ---> GtkTreeViewColumnSizing.FFI.fromVal) getSizing_ self
    fun getSortColumnId self = (GtkTreeViewColumnClass.FFI.withPtr ---> GInt.FFI.fromVal) getSortColumnId_ self
    fun getSortIndicator self = (GtkTreeViewColumnClass.FFI.withPtr ---> GBool.FFI.fromVal) getSortIndicator_ self
    fun getSortOrder self = (GtkTreeViewColumnClass.FFI.withPtr ---> GtkSortType.FFI.fromVal) getSortOrder_ self
    fun getSpacing self = (GtkTreeViewColumnClass.FFI.withPtr ---> GInt.FFI.fromVal) getSpacing_ self
    fun getTitle self = (GtkTreeViewColumnClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getTitle_ self
    fun getTreeView self = (GtkTreeViewColumnClass.FFI.withPtr ---> GtkWidgetClass.FFI.fromPtr false) getTreeView_ self
    fun getVisible self = (GtkTreeViewColumnClass.FFI.withPtr ---> GBool.FFI.fromVal) getVisible_ self
    fun getWidget self = (GtkTreeViewColumnClass.FFI.withPtr ---> GtkWidgetClass.FFI.fromPtr false) getWidget_ self
    fun getWidth self = (GtkTreeViewColumnClass.FFI.withPtr ---> GInt.FFI.fromVal) getWidth_ self
    fun getXOffset self = (GtkTreeViewColumnClass.FFI.withPtr ---> GInt.FFI.fromVal) getXOffset_ self
    fun packEnd self cell expand =
      (
        GtkTreeViewColumnClass.FFI.withPtr
         &&&> GtkCellRendererClass.FFI.withPtr
         &&&> GBool.FFI.withVal
         ---> I
      )
        packEnd_
        (
          self
           & cell
           & expand
        )
    fun packStart self cell expand =
      (
        GtkTreeViewColumnClass.FFI.withPtr
         &&&> GtkCellRendererClass.FFI.withPtr
         &&&> GBool.FFI.withVal
         ---> I
      )
        packStart_
        (
          self
           & cell
           & expand
        )
    fun queueResize self = (GtkTreeViewColumnClass.FFI.withPtr ---> I) queueResize_ self
    fun setAlignment self xalign = (GtkTreeViewColumnClass.FFI.withPtr &&&> GFloat.FFI.withVal ---> I) setAlignment_ (self & xalign)
    fun setClickable self clickable = (GtkTreeViewColumnClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setClickable_ (self & clickable)
    fun setExpand self expand = (GtkTreeViewColumnClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setExpand_ (self & expand)
    fun setFixedWidth self fixedWidth = (GtkTreeViewColumnClass.FFI.withPtr &&&> GInt.FFI.withVal ---> I) setFixedWidth_ (self & fixedWidth)
    fun setMaxWidth self maxWidth = (GtkTreeViewColumnClass.FFI.withPtr &&&> GInt.FFI.withVal ---> I) setMaxWidth_ (self & maxWidth)
    fun setMinWidth self minWidth = (GtkTreeViewColumnClass.FFI.withPtr &&&> GInt.FFI.withVal ---> I) setMinWidth_ (self & minWidth)
    fun setReorderable self reorderable = (GtkTreeViewColumnClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setReorderable_ (self & reorderable)
    fun setResizable self resizable = (GtkTreeViewColumnClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setResizable_ (self & resizable)
    fun setSizing self type' = (GtkTreeViewColumnClass.FFI.withPtr &&&> GtkTreeViewColumnSizing.FFI.withVal ---> I) setSizing_ (self & type')
    fun setSortColumnId self sortColumnId = (GtkTreeViewColumnClass.FFI.withPtr &&&> GInt.FFI.withVal ---> I) setSortColumnId_ (self & sortColumnId)
    fun setSortIndicator self setting = (GtkTreeViewColumnClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setSortIndicator_ (self & setting)
    fun setSortOrder self order = (GtkTreeViewColumnClass.FFI.withPtr &&&> GtkSortType.FFI.withVal ---> I) setSortOrder_ (self & order)
    fun setSpacing self spacing = (GtkTreeViewColumnClass.FFI.withPtr &&&> GInt.FFI.withVal ---> I) setSpacing_ (self & spacing)
    fun setTitle self title = (GtkTreeViewColumnClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> I) setTitle_ (self & title)
    fun setVisible self visible = (GtkTreeViewColumnClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setVisible_ (self & visible)
    fun setWidget self widget = (GtkTreeViewColumnClass.FFI.withPtr &&&> GtkWidgetClass.FFI.withOptPtr ---> I) setWidget_ (self & widget)
    local
      open ClosureMarshal Signal
    in
      fun clickedSig f = signal "clicked" (void ---> ret_void) f
    end
    local
      open Property
    in
      val alignmentProp =
        {
          get = fn x => get "alignment" float x,
          set = fn x => set "alignment" float x
        }
      val cellAreaProp =
        {
          get = fn x => get "cell-area" GtkCellAreaClass.tOpt x,
          set = fn x => set "cell-area" GtkCellAreaClass.tOpt x
        }
      val clickableProp =
        {
          get = fn x => get "clickable" boolean x,
          set = fn x => set "clickable" boolean x
        }
      val expandProp =
        {
          get = fn x => get "expand" boolean x,
          set = fn x => set "expand" boolean x
        }
      val fixedWidthProp =
        {
          get = fn x => get "fixed-width" int x,
          set = fn x => set "fixed-width" int x
        }
      val maxWidthProp =
        {
          get = fn x => get "max-width" int x,
          set = fn x => set "max-width" int x
        }
      val minWidthProp =
        {
          get = fn x => get "min-width" int x,
          set = fn x => set "min-width" int x
        }
      val reorderableProp =
        {
          get = fn x => get "reorderable" boolean x,
          set = fn x => set "reorderable" boolean x
        }
      val resizableProp =
        {
          get = fn x => get "resizable" boolean x,
          set = fn x => set "resizable" boolean x
        }
      val sizingProp =
        {
          get = fn x => get "sizing" GtkTreeViewColumnSizing.t x,
          set = fn x => set "sizing" GtkTreeViewColumnSizing.t x
        }
      val sortColumnIdProp =
        {
          get = fn x => get "sort-column-id" int x,
          set = fn x => set "sort-column-id" int x
        }
      val sortIndicatorProp =
        {
          get = fn x => get "sort-indicator" boolean x,
          set = fn x => set "sort-indicator" boolean x
        }
      val sortOrderProp =
        {
          get = fn x => get "sort-order" GtkSortType.t x,
          set = fn x => set "sort-order" GtkSortType.t x
        }
      val spacingProp =
        {
          get = fn x => get "spacing" int x,
          set = fn x => set "spacing" int x
        }
      val titleProp =
        {
          get = fn x => get "title" stringOpt x,
          set = fn x => set "title" stringOpt x
        }
      val visibleProp =
        {
          get = fn x => get "visible" boolean x,
          set = fn x => set "visible" boolean x
        }
      val widgetProp =
        {
          get = fn x => get "widget" GtkWidgetClass.tOpt x,
          set = fn x => set "widget" GtkWidgetClass.tOpt x
        }
      val widthProp = {get = fn x => get "width" int x}
      val xOffsetProp = {get = fn x => get "x-offset" int x}
    end
  end
