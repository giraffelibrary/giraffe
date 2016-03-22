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
      val getType_ = call (load_sym libgtk "gtk_tree_view_column_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libgtk "gtk_tree_view_column_new") (FFI.PolyML.cVoid --> GtkTreeViewColumnClass.PolyML.cPtr)
      val newWithArea_ = call (load_sym libgtk "gtk_tree_view_column_new_with_area") (GtkCellAreaClass.PolyML.cPtr --> GtkTreeViewColumnClass.PolyML.cPtr)
      val addAttribute_ =
        call (load_sym libgtk "gtk_tree_view_column_add_attribute")
          (
            GtkTreeViewColumnClass.PolyML.cPtr
             &&> GtkCellRendererClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> FFI.Int.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
      val cellGetPosition_ =
        call (load_sym libgtk "gtk_tree_view_column_cell_get_position")
          (
            GtkTreeViewColumnClass.PolyML.cPtr
             &&> GtkCellRendererClass.PolyML.cPtr
             &&> FFI.Int.PolyML.cRef
             &&> FFI.Int.PolyML.cRef
             --> FFI.Bool.PolyML.cVal
          )
      val cellGetSize_ =
        call (load_sym libgtk "gtk_tree_view_column_cell_get_size")
          (
            GtkTreeViewColumnClass.PolyML.cPtr
             &&> GdkRectangleRecord.PolyML.cOptPtr
             &&> FFI.Int.PolyML.cRef
             &&> FFI.Int.PolyML.cRef
             &&> FFI.Int.PolyML.cRef
             &&> FFI.Int.PolyML.cRef
             --> FFI.PolyML.cVoid
          )
      val cellIsVisible_ = call (load_sym libgtk "gtk_tree_view_column_cell_is_visible") (GtkTreeViewColumnClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val cellSetCellData_ =
        call (load_sym libgtk "gtk_tree_view_column_cell_set_cell_data")
          (
            GtkTreeViewColumnClass.PolyML.cPtr
             &&> GtkTreeModelClass.PolyML.cPtr
             &&> GtkTreeIterRecord.PolyML.cPtr
             &&> FFI.Bool.PolyML.cVal
             &&> FFI.Bool.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
      val clear_ = call (load_sym libgtk "gtk_tree_view_column_clear") (GtkTreeViewColumnClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val clearAttributes_ = call (load_sym libgtk "gtk_tree_view_column_clear_attributes") (GtkTreeViewColumnClass.PolyML.cPtr &&> GtkCellRendererClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val clicked_ = call (load_sym libgtk "gtk_tree_view_column_clicked") (GtkTreeViewColumnClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val focusCell_ = call (load_sym libgtk "gtk_tree_view_column_focus_cell") (GtkTreeViewColumnClass.PolyML.cPtr &&> GtkCellRendererClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val getAlignment_ = call (load_sym libgtk "gtk_tree_view_column_get_alignment") (GtkTreeViewColumnClass.PolyML.cPtr --> FFI.Float.PolyML.cVal)
      val getButton_ = call (load_sym libgtk "gtk_tree_view_column_get_button") (GtkTreeViewColumnClass.PolyML.cPtr --> GtkWidgetClass.PolyML.cPtr)
      val getClickable_ = call (load_sym libgtk "gtk_tree_view_column_get_clickable") (GtkTreeViewColumnClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getExpand_ = call (load_sym libgtk "gtk_tree_view_column_get_expand") (GtkTreeViewColumnClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getFixedWidth_ = call (load_sym libgtk "gtk_tree_view_column_get_fixed_width") (GtkTreeViewColumnClass.PolyML.cPtr --> FFI.Int.PolyML.cVal)
      val getMaxWidth_ = call (load_sym libgtk "gtk_tree_view_column_get_max_width") (GtkTreeViewColumnClass.PolyML.cPtr --> FFI.Int.PolyML.cVal)
      val getMinWidth_ = call (load_sym libgtk "gtk_tree_view_column_get_min_width") (GtkTreeViewColumnClass.PolyML.cPtr --> FFI.Int.PolyML.cVal)
      val getReorderable_ = call (load_sym libgtk "gtk_tree_view_column_get_reorderable") (GtkTreeViewColumnClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getResizable_ = call (load_sym libgtk "gtk_tree_view_column_get_resizable") (GtkTreeViewColumnClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getSizing_ = call (load_sym libgtk "gtk_tree_view_column_get_sizing") (GtkTreeViewColumnClass.PolyML.cPtr --> GtkTreeViewColumnSizing.PolyML.cVal)
      val getSortColumnId_ = call (load_sym libgtk "gtk_tree_view_column_get_sort_column_id") (GtkTreeViewColumnClass.PolyML.cPtr --> FFI.Int.PolyML.cVal)
      val getSortIndicator_ = call (load_sym libgtk "gtk_tree_view_column_get_sort_indicator") (GtkTreeViewColumnClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getSortOrder_ = call (load_sym libgtk "gtk_tree_view_column_get_sort_order") (GtkTreeViewColumnClass.PolyML.cPtr --> GtkSortType.PolyML.cVal)
      val getSpacing_ = call (load_sym libgtk "gtk_tree_view_column_get_spacing") (GtkTreeViewColumnClass.PolyML.cPtr --> FFI.Int.PolyML.cVal)
      val getTitle_ = call (load_sym libgtk "gtk_tree_view_column_get_title") (GtkTreeViewColumnClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getTreeView_ = call (load_sym libgtk "gtk_tree_view_column_get_tree_view") (GtkTreeViewColumnClass.PolyML.cPtr --> GtkWidgetClass.PolyML.cPtr)
      val getVisible_ = call (load_sym libgtk "gtk_tree_view_column_get_visible") (GtkTreeViewColumnClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getWidget_ = call (load_sym libgtk "gtk_tree_view_column_get_widget") (GtkTreeViewColumnClass.PolyML.cPtr --> GtkWidgetClass.PolyML.cPtr)
      val getWidth_ = call (load_sym libgtk "gtk_tree_view_column_get_width") (GtkTreeViewColumnClass.PolyML.cPtr --> FFI.Int.PolyML.cVal)
      val getXOffset_ = call (load_sym libgtk "gtk_tree_view_column_get_x_offset") (GtkTreeViewColumnClass.PolyML.cPtr --> FFI.Int.PolyML.cVal)
      val packEnd_ =
        call (load_sym libgtk "gtk_tree_view_column_pack_end")
          (
            GtkTreeViewColumnClass.PolyML.cPtr
             &&> GtkCellRendererClass.PolyML.cPtr
             &&> FFI.Bool.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
      val packStart_ =
        call (load_sym libgtk "gtk_tree_view_column_pack_start")
          (
            GtkTreeViewColumnClass.PolyML.cPtr
             &&> GtkCellRendererClass.PolyML.cPtr
             &&> FFI.Bool.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
      val queueResize_ = call (load_sym libgtk "gtk_tree_view_column_queue_resize") (GtkTreeViewColumnClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val setAlignment_ = call (load_sym libgtk "gtk_tree_view_column_set_alignment") (GtkTreeViewColumnClass.PolyML.cPtr &&> FFI.Float.PolyML.cVal --> FFI.PolyML.cVoid)
      val setClickable_ = call (load_sym libgtk "gtk_tree_view_column_set_clickable") (GtkTreeViewColumnClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> FFI.PolyML.cVoid)
      val setExpand_ = call (load_sym libgtk "gtk_tree_view_column_set_expand") (GtkTreeViewColumnClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> FFI.PolyML.cVoid)
      val setFixedWidth_ = call (load_sym libgtk "gtk_tree_view_column_set_fixed_width") (GtkTreeViewColumnClass.PolyML.cPtr &&> FFI.Int.PolyML.cVal --> FFI.PolyML.cVoid)
      val setMaxWidth_ = call (load_sym libgtk "gtk_tree_view_column_set_max_width") (GtkTreeViewColumnClass.PolyML.cPtr &&> FFI.Int.PolyML.cVal --> FFI.PolyML.cVoid)
      val setMinWidth_ = call (load_sym libgtk "gtk_tree_view_column_set_min_width") (GtkTreeViewColumnClass.PolyML.cPtr &&> FFI.Int.PolyML.cVal --> FFI.PolyML.cVoid)
      val setReorderable_ = call (load_sym libgtk "gtk_tree_view_column_set_reorderable") (GtkTreeViewColumnClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> FFI.PolyML.cVoid)
      val setResizable_ = call (load_sym libgtk "gtk_tree_view_column_set_resizable") (GtkTreeViewColumnClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> FFI.PolyML.cVoid)
      val setSizing_ = call (load_sym libgtk "gtk_tree_view_column_set_sizing") (GtkTreeViewColumnClass.PolyML.cPtr &&> GtkTreeViewColumnSizing.PolyML.cVal --> FFI.PolyML.cVoid)
      val setSortColumnId_ = call (load_sym libgtk "gtk_tree_view_column_set_sort_column_id") (GtkTreeViewColumnClass.PolyML.cPtr &&> FFI.Int.PolyML.cVal --> FFI.PolyML.cVoid)
      val setSortIndicator_ = call (load_sym libgtk "gtk_tree_view_column_set_sort_indicator") (GtkTreeViewColumnClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> FFI.PolyML.cVoid)
      val setSortOrder_ = call (load_sym libgtk "gtk_tree_view_column_set_sort_order") (GtkTreeViewColumnClass.PolyML.cPtr &&> GtkSortType.PolyML.cVal --> FFI.PolyML.cVoid)
      val setSpacing_ = call (load_sym libgtk "gtk_tree_view_column_set_spacing") (GtkTreeViewColumnClass.PolyML.cPtr &&> FFI.Int.PolyML.cVal --> FFI.PolyML.cVoid)
      val setTitle_ = call (load_sym libgtk "gtk_tree_view_column_set_title") (GtkTreeViewColumnClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> FFI.PolyML.cVoid)
      val setVisible_ = call (load_sym libgtk "gtk_tree_view_column_set_visible") (GtkTreeViewColumnClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> FFI.PolyML.cVoid)
      val setWidget_ = call (load_sym libgtk "gtk_tree_view_column_set_widget") (GtkTreeViewColumnClass.PolyML.cPtr &&> GtkWidgetClass.PolyML.cOptPtr --> FFI.PolyML.cVoid)
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
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    fun asCellLayout self = (GObjectObjectClass.C.withPtr ---> GtkCellLayoutClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkTreeViewColumnClass.C.fromPtr false) new_ ()
    fun newWithArea area = (GtkCellAreaClass.C.withPtr ---> GtkTreeViewColumnClass.C.fromPtr false) newWithArea_ area
    fun addAttribute self cellRenderer attribute column =
      (
        GtkTreeViewColumnClass.C.withPtr
         &&&> GtkCellRendererClass.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> FFI.Int.C.withVal
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
            GtkTreeViewColumnClass.C.withPtr
             &&&> GtkCellRendererClass.C.withPtr
             &&&> FFI.Int.C.withRefVal
             &&&> FFI.Int.C.withRefVal
             ---> FFI.Int.C.fromVal
                   && FFI.Int.C.fromVal
                   && FFI.Bool.C.fromVal
          )
            cellGetPosition_
            (
              self
               & cellRenderer
               & FFI.Int.null
               & FFI.Int.null
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
            GtkTreeViewColumnClass.C.withPtr
             &&&> GdkRectangleRecord.C.withOptPtr
             &&&> FFI.Int.C.withRefVal
             &&&> FFI.Int.C.withRefVal
             &&&> FFI.Int.C.withRefVal
             &&&> FFI.Int.C.withRefVal
             ---> FFI.Int.C.fromVal
                   && FFI.Int.C.fromVal
                   && FFI.Int.C.fromVal
                   && FFI.Int.C.fromVal
                   && I
          )
            cellGetSize_
            (
              self
               & cellArea
               & FFI.Int.null
               & FFI.Int.null
               & FFI.Int.null
               & FFI.Int.null
            )
      in
        (
          xOffset,
          yOffset,
          width,
          height
        )
      end
    fun cellIsVisible self = (GtkTreeViewColumnClass.C.withPtr ---> FFI.Bool.C.fromVal) cellIsVisible_ self
    fun cellSetCellData self treeModel iter isExpander isExpanded =
      (
        GtkTreeViewColumnClass.C.withPtr
         &&&> GtkTreeModelClass.C.withPtr
         &&&> GtkTreeIterRecord.C.withPtr
         &&&> FFI.Bool.C.withVal
         &&&> FFI.Bool.C.withVal
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
    fun clear self = (GtkTreeViewColumnClass.C.withPtr ---> I) clear_ self
    fun clearAttributes self cellRenderer = (GtkTreeViewColumnClass.C.withPtr &&&> GtkCellRendererClass.C.withPtr ---> I) clearAttributes_ (self & cellRenderer)
    fun clicked self = (GtkTreeViewColumnClass.C.withPtr ---> I) clicked_ self
    fun focusCell self cell = (GtkTreeViewColumnClass.C.withPtr &&&> GtkCellRendererClass.C.withPtr ---> I) focusCell_ (self & cell)
    fun getAlignment self = (GtkTreeViewColumnClass.C.withPtr ---> FFI.Float.C.fromVal) getAlignment_ self
    fun getButton self = (GtkTreeViewColumnClass.C.withPtr ---> GtkWidgetClass.C.fromPtr false) getButton_ self
    fun getClickable self = (GtkTreeViewColumnClass.C.withPtr ---> FFI.Bool.C.fromVal) getClickable_ self
    fun getExpand self = (GtkTreeViewColumnClass.C.withPtr ---> FFI.Bool.C.fromVal) getExpand_ self
    fun getFixedWidth self = (GtkTreeViewColumnClass.C.withPtr ---> FFI.Int.C.fromVal) getFixedWidth_ self
    fun getMaxWidth self = (GtkTreeViewColumnClass.C.withPtr ---> FFI.Int.C.fromVal) getMaxWidth_ self
    fun getMinWidth self = (GtkTreeViewColumnClass.C.withPtr ---> FFI.Int.C.fromVal) getMinWidth_ self
    fun getReorderable self = (GtkTreeViewColumnClass.C.withPtr ---> FFI.Bool.C.fromVal) getReorderable_ self
    fun getResizable self = (GtkTreeViewColumnClass.C.withPtr ---> FFI.Bool.C.fromVal) getResizable_ self
    fun getSizing self = (GtkTreeViewColumnClass.C.withPtr ---> GtkTreeViewColumnSizing.C.fromVal) getSizing_ self
    fun getSortColumnId self = (GtkTreeViewColumnClass.C.withPtr ---> FFI.Int.C.fromVal) getSortColumnId_ self
    fun getSortIndicator self = (GtkTreeViewColumnClass.C.withPtr ---> FFI.Bool.C.fromVal) getSortIndicator_ self
    fun getSortOrder self = (GtkTreeViewColumnClass.C.withPtr ---> GtkSortType.C.fromVal) getSortOrder_ self
    fun getSpacing self = (GtkTreeViewColumnClass.C.withPtr ---> FFI.Int.C.fromVal) getSpacing_ self
    fun getTitle self = (GtkTreeViewColumnClass.C.withPtr ---> Utf8.C.fromPtr false) getTitle_ self
    fun getTreeView self = (GtkTreeViewColumnClass.C.withPtr ---> GtkWidgetClass.C.fromPtr false) getTreeView_ self
    fun getVisible self = (GtkTreeViewColumnClass.C.withPtr ---> FFI.Bool.C.fromVal) getVisible_ self
    fun getWidget self = (GtkTreeViewColumnClass.C.withPtr ---> GtkWidgetClass.C.fromPtr false) getWidget_ self
    fun getWidth self = (GtkTreeViewColumnClass.C.withPtr ---> FFI.Int.C.fromVal) getWidth_ self
    fun getXOffset self = (GtkTreeViewColumnClass.C.withPtr ---> FFI.Int.C.fromVal) getXOffset_ self
    fun packEnd self cell expand =
      (
        GtkTreeViewColumnClass.C.withPtr
         &&&> GtkCellRendererClass.C.withPtr
         &&&> FFI.Bool.C.withVal
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
        GtkTreeViewColumnClass.C.withPtr
         &&&> GtkCellRendererClass.C.withPtr
         &&&> FFI.Bool.C.withVal
         ---> I
      )
        packStart_
        (
          self
           & cell
           & expand
        )
    fun queueResize self = (GtkTreeViewColumnClass.C.withPtr ---> I) queueResize_ self
    fun setAlignment self xalign = (GtkTreeViewColumnClass.C.withPtr &&&> FFI.Float.C.withVal ---> I) setAlignment_ (self & xalign)
    fun setClickable self clickable = (GtkTreeViewColumnClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setClickable_ (self & clickable)
    fun setExpand self expand = (GtkTreeViewColumnClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setExpand_ (self & expand)
    fun setFixedWidth self fixedWidth = (GtkTreeViewColumnClass.C.withPtr &&&> FFI.Int.C.withVal ---> I) setFixedWidth_ (self & fixedWidth)
    fun setMaxWidth self maxWidth = (GtkTreeViewColumnClass.C.withPtr &&&> FFI.Int.C.withVal ---> I) setMaxWidth_ (self & maxWidth)
    fun setMinWidth self minWidth = (GtkTreeViewColumnClass.C.withPtr &&&> FFI.Int.C.withVal ---> I) setMinWidth_ (self & minWidth)
    fun setReorderable self reorderable = (GtkTreeViewColumnClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setReorderable_ (self & reorderable)
    fun setResizable self resizable = (GtkTreeViewColumnClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setResizable_ (self & resizable)
    fun setSizing self type' = (GtkTreeViewColumnClass.C.withPtr &&&> GtkTreeViewColumnSizing.C.withVal ---> I) setSizing_ (self & type')
    fun setSortColumnId self sortColumnId = (GtkTreeViewColumnClass.C.withPtr &&&> FFI.Int.C.withVal ---> I) setSortColumnId_ (self & sortColumnId)
    fun setSortIndicator self setting = (GtkTreeViewColumnClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setSortIndicator_ (self & setting)
    fun setSortOrder self order = (GtkTreeViewColumnClass.C.withPtr &&&> GtkSortType.C.withVal ---> I) setSortOrder_ (self & order)
    fun setSpacing self spacing = (GtkTreeViewColumnClass.C.withPtr &&&> FFI.Int.C.withVal ---> I) setSpacing_ (self & spacing)
    fun setTitle self title = (GtkTreeViewColumnClass.C.withPtr &&&> Utf8.C.withPtr ---> I) setTitle_ (self & title)
    fun setVisible self visible = (GtkTreeViewColumnClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setVisible_ (self & visible)
    fun setWidget self widget = (GtkTreeViewColumnClass.C.withPtr &&&> GtkWidgetClass.C.withOptPtr ---> I) setWidget_ (self & widget)
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
