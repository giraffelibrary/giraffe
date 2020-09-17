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
      val getType_ = call (getSymbol "gtk_tree_view_column_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "gtk_tree_view_column_new") (cVoid --> GtkTreeViewColumnClass.PolyML.cPtr)
      val newWithArea_ = call (getSymbol "gtk_tree_view_column_new_with_area") (GtkCellAreaClass.PolyML.cPtr --> GtkTreeViewColumnClass.PolyML.cPtr)
      val addAttribute_ =
        call (getSymbol "gtk_tree_view_column_add_attribute")
          (
            GtkTreeViewColumnClass.PolyML.cPtr
             &&> GtkCellRendererClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GInt32.PolyML.cVal
             --> cVoid
          )
      val cellGetPosition_ =
        call (getSymbol "gtk_tree_view_column_cell_get_position")
          (
            GtkTreeViewColumnClass.PolyML.cPtr
             &&> GtkCellRendererClass.PolyML.cPtr
             &&> GInt32.PolyML.cRef
             &&> GInt32.PolyML.cRef
             --> GBool.PolyML.cVal
          )
      val cellGetSize_ =
        call (getSymbol "gtk_tree_view_column_cell_get_size")
          (
            GtkTreeViewColumnClass.PolyML.cPtr
             &&> GdkRectangleRecord.PolyML.cOptPtr
             &&> GInt32.PolyML.cRef
             &&> GInt32.PolyML.cRef
             &&> GInt32.PolyML.cRef
             &&> GInt32.PolyML.cRef
             --> cVoid
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
             --> cVoid
          )
      val clear_ = call (getSymbol "gtk_tree_view_column_clear") (GtkTreeViewColumnClass.PolyML.cPtr --> cVoid)
      val clearAttributes_ = call (getSymbol "gtk_tree_view_column_clear_attributes") (GtkTreeViewColumnClass.PolyML.cPtr &&> GtkCellRendererClass.PolyML.cPtr --> cVoid)
      val clicked_ = call (getSymbol "gtk_tree_view_column_clicked") (GtkTreeViewColumnClass.PolyML.cPtr --> cVoid)
      val focusCell_ = call (getSymbol "gtk_tree_view_column_focus_cell") (GtkTreeViewColumnClass.PolyML.cPtr &&> GtkCellRendererClass.PolyML.cPtr --> cVoid)
      val getAlignment_ = call (getSymbol "gtk_tree_view_column_get_alignment") (GtkTreeViewColumnClass.PolyML.cPtr --> GFloat.PolyML.cVal)
      val getButton_ = call (getSymbol "gtk_tree_view_column_get_button") (GtkTreeViewColumnClass.PolyML.cPtr --> GtkWidgetClass.PolyML.cPtr)
      val getClickable_ = call (getSymbol "gtk_tree_view_column_get_clickable") (GtkTreeViewColumnClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getExpand_ = call (getSymbol "gtk_tree_view_column_get_expand") (GtkTreeViewColumnClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getFixedWidth_ = call (getSymbol "gtk_tree_view_column_get_fixed_width") (GtkTreeViewColumnClass.PolyML.cPtr --> GInt32.PolyML.cVal)
      val getMaxWidth_ = call (getSymbol "gtk_tree_view_column_get_max_width") (GtkTreeViewColumnClass.PolyML.cPtr --> GInt32.PolyML.cVal)
      val getMinWidth_ = call (getSymbol "gtk_tree_view_column_get_min_width") (GtkTreeViewColumnClass.PolyML.cPtr --> GInt32.PolyML.cVal)
      val getReorderable_ = call (getSymbol "gtk_tree_view_column_get_reorderable") (GtkTreeViewColumnClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getResizable_ = call (getSymbol "gtk_tree_view_column_get_resizable") (GtkTreeViewColumnClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getSizing_ = call (getSymbol "gtk_tree_view_column_get_sizing") (GtkTreeViewColumnClass.PolyML.cPtr --> GtkTreeViewColumnSizing.PolyML.cVal)
      val getSortColumnId_ = call (getSymbol "gtk_tree_view_column_get_sort_column_id") (GtkTreeViewColumnClass.PolyML.cPtr --> GInt32.PolyML.cVal)
      val getSortIndicator_ = call (getSymbol "gtk_tree_view_column_get_sort_indicator") (GtkTreeViewColumnClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getSortOrder_ = call (getSymbol "gtk_tree_view_column_get_sort_order") (GtkTreeViewColumnClass.PolyML.cPtr --> GtkSortType.PolyML.cVal)
      val getSpacing_ = call (getSymbol "gtk_tree_view_column_get_spacing") (GtkTreeViewColumnClass.PolyML.cPtr --> GInt32.PolyML.cVal)
      val getTitle_ = call (getSymbol "gtk_tree_view_column_get_title") (GtkTreeViewColumnClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getTreeView_ = call (getSymbol "gtk_tree_view_column_get_tree_view") (GtkTreeViewColumnClass.PolyML.cPtr --> GtkWidgetClass.PolyML.cOptPtr)
      val getVisible_ = call (getSymbol "gtk_tree_view_column_get_visible") (GtkTreeViewColumnClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getWidget_ = call (getSymbol "gtk_tree_view_column_get_widget") (GtkTreeViewColumnClass.PolyML.cPtr --> GtkWidgetClass.PolyML.cOptPtr)
      val getWidth_ = call (getSymbol "gtk_tree_view_column_get_width") (GtkTreeViewColumnClass.PolyML.cPtr --> GInt32.PolyML.cVal)
      val getXOffset_ = call (getSymbol "gtk_tree_view_column_get_x_offset") (GtkTreeViewColumnClass.PolyML.cPtr --> GInt32.PolyML.cVal)
      val packEnd_ =
        call (getSymbol "gtk_tree_view_column_pack_end")
          (
            GtkTreeViewColumnClass.PolyML.cPtr
             &&> GtkCellRendererClass.PolyML.cPtr
             &&> GBool.PolyML.cVal
             --> cVoid
          )
      val packStart_ =
        call (getSymbol "gtk_tree_view_column_pack_start")
          (
            GtkTreeViewColumnClass.PolyML.cPtr
             &&> GtkCellRendererClass.PolyML.cPtr
             &&> GBool.PolyML.cVal
             --> cVoid
          )
      val queueResize_ = call (getSymbol "gtk_tree_view_column_queue_resize") (GtkTreeViewColumnClass.PolyML.cPtr --> cVoid)
      val setAlignment_ = call (getSymbol "gtk_tree_view_column_set_alignment") (GtkTreeViewColumnClass.PolyML.cPtr &&> GFloat.PolyML.cVal --> cVoid)
      val setClickable_ = call (getSymbol "gtk_tree_view_column_set_clickable") (GtkTreeViewColumnClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setExpand_ = call (getSymbol "gtk_tree_view_column_set_expand") (GtkTreeViewColumnClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setFixedWidth_ = call (getSymbol "gtk_tree_view_column_set_fixed_width") (GtkTreeViewColumnClass.PolyML.cPtr &&> GInt32.PolyML.cVal --> cVoid)
      val setMaxWidth_ = call (getSymbol "gtk_tree_view_column_set_max_width") (GtkTreeViewColumnClass.PolyML.cPtr &&> GInt32.PolyML.cVal --> cVoid)
      val setMinWidth_ = call (getSymbol "gtk_tree_view_column_set_min_width") (GtkTreeViewColumnClass.PolyML.cPtr &&> GInt32.PolyML.cVal --> cVoid)
      val setReorderable_ = call (getSymbol "gtk_tree_view_column_set_reorderable") (GtkTreeViewColumnClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setResizable_ = call (getSymbol "gtk_tree_view_column_set_resizable") (GtkTreeViewColumnClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setSizing_ = call (getSymbol "gtk_tree_view_column_set_sizing") (GtkTreeViewColumnClass.PolyML.cPtr &&> GtkTreeViewColumnSizing.PolyML.cVal --> cVoid)
      val setSortColumnId_ = call (getSymbol "gtk_tree_view_column_set_sort_column_id") (GtkTreeViewColumnClass.PolyML.cPtr &&> GInt32.PolyML.cVal --> cVoid)
      val setSortIndicator_ = call (getSymbol "gtk_tree_view_column_set_sort_indicator") (GtkTreeViewColumnClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setSortOrder_ = call (getSymbol "gtk_tree_view_column_set_sort_order") (GtkTreeViewColumnClass.PolyML.cPtr &&> GtkSortType.PolyML.cVal --> cVoid)
      val setSpacing_ = call (getSymbol "gtk_tree_view_column_set_spacing") (GtkTreeViewColumnClass.PolyML.cPtr &&> GInt32.PolyML.cVal --> cVoid)
      val setTitle_ = call (getSymbol "gtk_tree_view_column_set_title") (GtkTreeViewColumnClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> cVoid)
      val setVisible_ = call (getSymbol "gtk_tree_view_column_set_visible") (GtkTreeViewColumnClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setWidget_ = call (getSymbol "gtk_tree_view_column_set_widget") (GtkTreeViewColumnClass.PolyML.cPtr &&> GtkWidgetClass.PolyML.cOptPtr --> cVoid)
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
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr false ---> GtkBuildableClass.FFI.fromPtr false) I self
    fun asCellLayout self = (GObjectObjectClass.FFI.withPtr false ---> GtkCellLayoutClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkTreeViewColumnClass.FFI.fromPtr false) new_ ()
    fun newWithArea area = (GtkCellAreaClass.FFI.withPtr false ---> GtkTreeViewColumnClass.FFI.fromPtr false) newWithArea_ area before GtkCellAreaClass.FFI.touchPtr area
    fun addAttribute
      self
      (
        cellRenderer,
        attribute,
        column
      ) =
      (
        GtkTreeViewColumnClass.FFI.withPtr false
         &&&> GtkCellRendererClass.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         &&&> GInt32.FFI.withVal
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
            GtkTreeViewColumnClass.FFI.withPtr false
             &&&> GtkCellRendererClass.FFI.withPtr false
             &&&> GInt32.FFI.withRefVal
             &&&> GInt32.FFI.withRefVal
             ---> GInt32.FFI.fromVal
                   && GInt32.FFI.fromVal
                   && GBool.FFI.fromVal
          )
            cellGetPosition_
            (
              self
               & cellRenderer
               & GInt32.null
               & GInt32.null
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
            GtkTreeViewColumnClass.FFI.withPtr false
             &&&> GdkRectangleRecord.FFI.withOptPtr false
             &&&> GInt32.FFI.withRefVal
             &&&> GInt32.FFI.withRefVal
             &&&> GInt32.FFI.withRefVal
             &&&> GInt32.FFI.withRefVal
             ---> GInt32.FFI.fromVal
                   && GInt32.FFI.fromVal
                   && GInt32.FFI.fromVal
                   && GInt32.FFI.fromVal
                   && I
          )
            cellGetSize_
            (
              self
               & cellArea
               & GInt32.null
               & GInt32.null
               & GInt32.null
               & GInt32.null
            )
      in
        (
          xOffset,
          yOffset,
          width,
          height
        )
      end
    fun cellIsVisible self = (GtkTreeViewColumnClass.FFI.withPtr false ---> GBool.FFI.fromVal) cellIsVisible_ self
    fun cellSetCellData
      self
      (
        treeModel,
        iter,
        isExpander,
        isExpanded
      ) =
      (
        GtkTreeViewColumnClass.FFI.withPtr false
         &&&> GtkTreeModelClass.FFI.withPtr false
         &&&> GtkTreeIterRecord.FFI.withPtr false
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
    fun clear self = (GtkTreeViewColumnClass.FFI.withPtr false ---> I) clear_ self
    fun clearAttributes self cellRenderer = (GtkTreeViewColumnClass.FFI.withPtr false &&&> GtkCellRendererClass.FFI.withPtr false ---> I) clearAttributes_ (self & cellRenderer)
    fun clicked self = (GtkTreeViewColumnClass.FFI.withPtr false ---> I) clicked_ self
    fun focusCell self cell = (GtkTreeViewColumnClass.FFI.withPtr false &&&> GtkCellRendererClass.FFI.withPtr false ---> I) focusCell_ (self & cell)
    fun getAlignment self = (GtkTreeViewColumnClass.FFI.withPtr false ---> GFloat.FFI.fromVal) getAlignment_ self
    fun getButton self = (GtkTreeViewColumnClass.FFI.withPtr false ---> GtkWidgetClass.FFI.fromPtr false) getButton_ self before GtkTreeViewColumnClass.FFI.touchPtr self
    fun getClickable self = (GtkTreeViewColumnClass.FFI.withPtr false ---> GBool.FFI.fromVal) getClickable_ self
    fun getExpand self = (GtkTreeViewColumnClass.FFI.withPtr false ---> GBool.FFI.fromVal) getExpand_ self
    fun getFixedWidth self = (GtkTreeViewColumnClass.FFI.withPtr false ---> GInt32.FFI.fromVal) getFixedWidth_ self
    fun getMaxWidth self = (GtkTreeViewColumnClass.FFI.withPtr false ---> GInt32.FFI.fromVal) getMaxWidth_ self
    fun getMinWidth self = (GtkTreeViewColumnClass.FFI.withPtr false ---> GInt32.FFI.fromVal) getMinWidth_ self
    fun getReorderable self = (GtkTreeViewColumnClass.FFI.withPtr false ---> GBool.FFI.fromVal) getReorderable_ self
    fun getResizable self = (GtkTreeViewColumnClass.FFI.withPtr false ---> GBool.FFI.fromVal) getResizable_ self
    fun getSizing self = (GtkTreeViewColumnClass.FFI.withPtr false ---> GtkTreeViewColumnSizing.FFI.fromVal) getSizing_ self
    fun getSortColumnId self = (GtkTreeViewColumnClass.FFI.withPtr false ---> GInt32.FFI.fromVal) getSortColumnId_ self
    fun getSortIndicator self = (GtkTreeViewColumnClass.FFI.withPtr false ---> GBool.FFI.fromVal) getSortIndicator_ self
    fun getSortOrder self = (GtkTreeViewColumnClass.FFI.withPtr false ---> GtkSortType.FFI.fromVal) getSortOrder_ self
    fun getSpacing self = (GtkTreeViewColumnClass.FFI.withPtr false ---> GInt32.FFI.fromVal) getSpacing_ self
    fun getTitle self = (GtkTreeViewColumnClass.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getTitle_ self before GtkTreeViewColumnClass.FFI.touchPtr self
    fun getTreeView self = (GtkTreeViewColumnClass.FFI.withPtr false ---> GtkWidgetClass.FFI.fromOptPtr false) getTreeView_ self before GtkTreeViewColumnClass.FFI.touchPtr self
    fun getVisible self = (GtkTreeViewColumnClass.FFI.withPtr false ---> GBool.FFI.fromVal) getVisible_ self
    fun getWidget self = (GtkTreeViewColumnClass.FFI.withPtr false ---> GtkWidgetClass.FFI.fromOptPtr false) getWidget_ self before GtkTreeViewColumnClass.FFI.touchPtr self
    fun getWidth self = (GtkTreeViewColumnClass.FFI.withPtr false ---> GInt32.FFI.fromVal) getWidth_ self
    fun getXOffset self = (GtkTreeViewColumnClass.FFI.withPtr false ---> GInt32.FFI.fromVal) getXOffset_ self
    fun packEnd self (cell, expand) =
      (
        GtkTreeViewColumnClass.FFI.withPtr false
         &&&> GtkCellRendererClass.FFI.withPtr false
         &&&> GBool.FFI.withVal
         ---> I
      )
        packEnd_
        (
          self
           & cell
           & expand
        )
    fun packStart self (cell, expand) =
      (
        GtkTreeViewColumnClass.FFI.withPtr false
         &&&> GtkCellRendererClass.FFI.withPtr false
         &&&> GBool.FFI.withVal
         ---> I
      )
        packStart_
        (
          self
           & cell
           & expand
        )
    fun queueResize self = (GtkTreeViewColumnClass.FFI.withPtr false ---> I) queueResize_ self
    fun setAlignment self xalign = (GtkTreeViewColumnClass.FFI.withPtr false &&&> GFloat.FFI.withVal ---> I) setAlignment_ (self & xalign)
    fun setClickable self clickable = (GtkTreeViewColumnClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setClickable_ (self & clickable)
    fun setExpand self expand = (GtkTreeViewColumnClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setExpand_ (self & expand)
    fun setFixedWidth self fixedWidth = (GtkTreeViewColumnClass.FFI.withPtr false &&&> GInt32.FFI.withVal ---> I) setFixedWidth_ (self & fixedWidth)
    fun setMaxWidth self maxWidth = (GtkTreeViewColumnClass.FFI.withPtr false &&&> GInt32.FFI.withVal ---> I) setMaxWidth_ (self & maxWidth)
    fun setMinWidth self minWidth = (GtkTreeViewColumnClass.FFI.withPtr false &&&> GInt32.FFI.withVal ---> I) setMinWidth_ (self & minWidth)
    fun setReorderable self reorderable = (GtkTreeViewColumnClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setReorderable_ (self & reorderable)
    fun setResizable self resizable = (GtkTreeViewColumnClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setResizable_ (self & resizable)
    fun setSizing self type' = (GtkTreeViewColumnClass.FFI.withPtr false &&&> GtkTreeViewColumnSizing.FFI.withVal ---> I) setSizing_ (self & type')
    fun setSortColumnId self sortColumnId = (GtkTreeViewColumnClass.FFI.withPtr false &&&> GInt32.FFI.withVal ---> I) setSortColumnId_ (self & sortColumnId)
    fun setSortIndicator self setting = (GtkTreeViewColumnClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setSortIndicator_ (self & setting)
    fun setSortOrder self order = (GtkTreeViewColumnClass.FFI.withPtr false &&&> GtkSortType.FFI.withVal ---> I) setSortOrder_ (self & order)
    fun setSpacing self spacing = (GtkTreeViewColumnClass.FFI.withPtr false &&&> GInt32.FFI.withVal ---> I) setSpacing_ (self & spacing)
    fun setTitle self title = (GtkTreeViewColumnClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> I) setTitle_ (self & title)
    fun setVisible self visible = (GtkTreeViewColumnClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setVisible_ (self & visible)
    fun setWidget self widget = (GtkTreeViewColumnClass.FFI.withPtr false &&&> GtkWidgetClass.FFI.withOptPtr false ---> I) setWidget_ (self & widget)
    local
      open ClosureMarshal Signal
    in
      fun clickedSig f = signal "clicked" (void ---> ret_void) f
    end
    local
      open ValueAccessor
    in
      val alignmentProp =
        {
          name = "alignment",
          gtype = fn () => C.gtype float (),
          get = fn x => fn () => C.get float x,
          set = fn x => C.set float x,
          init = fn x => C.set float x
        }
      val cellAreaProp =
        {
          name = "cell-area",
          gtype = fn () => C.gtype GtkCellAreaClass.tOpt (),
          get = fn x => fn () => C.get GtkCellAreaClass.tOpt x,
          set = ignore,
          init = fn x => C.set GtkCellAreaClass.tOpt x
        }
      val clickableProp =
        {
          name = "clickable",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val expandProp =
        {
          name = "expand",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val fixedWidthProp =
        {
          name = "fixed-width",
          gtype = fn () => C.gtype int (),
          get = fn x => fn () => C.get int x,
          set = fn x => C.set int x,
          init = fn x => C.set int x
        }
      val maxWidthProp =
        {
          name = "max-width",
          gtype = fn () => C.gtype int (),
          get = fn x => fn () => C.get int x,
          set = fn x => C.set int x,
          init = fn x => C.set int x
        }
      val minWidthProp =
        {
          name = "min-width",
          gtype = fn () => C.gtype int (),
          get = fn x => fn () => C.get int x,
          set = fn x => C.set int x,
          init = fn x => C.set int x
        }
      val reorderableProp =
        {
          name = "reorderable",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val resizableProp =
        {
          name = "resizable",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val sizingProp =
        {
          name = "sizing",
          gtype = fn () => C.gtype GtkTreeViewColumnSizing.t (),
          get = fn x => fn () => C.get GtkTreeViewColumnSizing.t x,
          set = fn x => C.set GtkTreeViewColumnSizing.t x,
          init = fn x => C.set GtkTreeViewColumnSizing.t x
        }
      val sortColumnIdProp =
        {
          name = "sort-column-id",
          gtype = fn () => C.gtype int (),
          get = fn x => fn () => C.get int x,
          set = fn x => C.set int x,
          init = fn x => C.set int x
        }
      val sortIndicatorProp =
        {
          name = "sort-indicator",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val sortOrderProp =
        {
          name = "sort-order",
          gtype = fn () => C.gtype GtkSortType.t (),
          get = fn x => fn () => C.get GtkSortType.t x,
          set = fn x => C.set GtkSortType.t x,
          init = fn x => C.set GtkSortType.t x
        }
      val spacingProp =
        {
          name = "spacing",
          gtype = fn () => C.gtype int (),
          get = fn x => fn () => C.get int x,
          set = fn x => C.set int x,
          init = fn x => C.set int x
        }
      val titleProp =
        {
          name = "title",
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
      val widgetProp =
        {
          name = "widget",
          gtype = fn () => C.gtype GtkWidgetClass.tOpt (),
          get = fn x => fn () => C.get GtkWidgetClass.tOpt x,
          set = fn x => C.set GtkWidgetClass.tOpt x,
          init = fn x => C.set GtkWidgetClass.tOpt x
        }
      val widthProp =
        {
          name = "width",
          gtype = fn () => C.gtype int (),
          get = fn x => fn () => C.get int x,
          set = ignore,
          init = ignore
        }
      val xOffsetProp =
        {
          name = "x-offset",
          gtype = fn () => C.gtype int (),
          get = fn x => fn () => C.get int x,
          set = ignore,
          init = ignore
        }
    end
  end
