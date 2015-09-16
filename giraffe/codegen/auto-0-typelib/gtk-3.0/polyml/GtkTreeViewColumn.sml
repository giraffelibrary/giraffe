structure GtkTreeViewColumn :>
  GTK_TREE_VIEW_COLUMN
    where type 'a class_t = 'a GtkTreeViewColumnClass.t
    where type 'a buildable_class_t = 'a GtkBuildableClass.t
    where type 'a cell_layout_class_t = 'a GtkCellLayoutClass.t
    where type tree_iter_record_t = GtkTreeIterRecord.t
    where type 'a tree_model_class_t = 'a GtkTreeModelClass.t
    where type 'a cell_renderer_class_t = 'a GtkCellRendererClass.t
    where type 'a cell_area_class_t = 'a GtkCellAreaClass.t
    where type tree_view_column_sizing_t = GtkTreeViewColumnSizing.t
    where type sort_type_t = GtkSortType.t
    where type 'a widget_class_t = 'a GtkWidgetClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_tree_view_column_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val new_ = call (load_sym libgtk "gtk_tree_view_column_new") (FFI.PolyML.VOID --> GObjectObjectClass.PolyML.PTR)
      val newWithArea_ = call (load_sym libgtk "gtk_tree_view_column_new_with_area") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val addAttribute_ =
        call (load_sym libgtk "gtk_tree_view_column_add_attribute")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> FFI.String.PolyML.INPTR
             &&> FFI.Int32.PolyML.VAL
             --> FFI.PolyML.VOID
          )
      val cellGetPosition_ =
        call (load_sym libgtk "gtk_tree_view_column_cell_get_position")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> FFI.Int32.PolyML.REF
             &&> FFI.Int32.PolyML.REF
             --> FFI.Bool.PolyML.VAL
          )
      val cellGetSize_ =
        call (load_sym libgtk "gtk_tree_view_column_cell_get_size")
          (
            GObjectObjectClass.PolyML.PTR
             &&> CairoRectangleIntRecord.PolyML.OPTPTR
             &&> FFI.Int32.PolyML.REF
             &&> FFI.Int32.PolyML.REF
             &&> FFI.Int32.PolyML.REF
             &&> FFI.Int32.PolyML.REF
             --> FFI.PolyML.VOID
          )
      val cellIsVisible_ = call (load_sym libgtk "gtk_tree_view_column_cell_is_visible") (GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val cellSetCellData_ =
        call (load_sym libgtk "gtk_tree_view_column_cell_set_cell_data")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> GtkTreeIterRecord.PolyML.PTR
             &&> FFI.Bool.PolyML.VAL
             &&> FFI.Bool.PolyML.VAL
             --> FFI.PolyML.VOID
          )
      val clear_ = call (load_sym libgtk "gtk_tree_view_column_clear") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val clearAttributes_ = call (load_sym libgtk "gtk_tree_view_column_clear_attributes") (GObjectObjectClass.PolyML.PTR &&> GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val clicked_ = call (load_sym libgtk "gtk_tree_view_column_clicked") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val focusCell_ = call (load_sym libgtk "gtk_tree_view_column_focus_cell") (GObjectObjectClass.PolyML.PTR &&> GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val getAlignment_ = call (load_sym libgtk "gtk_tree_view_column_get_alignment") (GObjectObjectClass.PolyML.PTR --> FFI.Float.PolyML.VAL)
      val getButton_ = call (load_sym libgtk "gtk_tree_view_column_get_button") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val getClickable_ = call (load_sym libgtk "gtk_tree_view_column_get_clickable") (GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val getExpand_ = call (load_sym libgtk "gtk_tree_view_column_get_expand") (GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val getFixedWidth_ = call (load_sym libgtk "gtk_tree_view_column_get_fixed_width") (GObjectObjectClass.PolyML.PTR --> FFI.Int32.PolyML.VAL)
      val getMaxWidth_ = call (load_sym libgtk "gtk_tree_view_column_get_max_width") (GObjectObjectClass.PolyML.PTR --> FFI.Int32.PolyML.VAL)
      val getMinWidth_ = call (load_sym libgtk "gtk_tree_view_column_get_min_width") (GObjectObjectClass.PolyML.PTR --> FFI.Int32.PolyML.VAL)
      val getReorderable_ = call (load_sym libgtk "gtk_tree_view_column_get_reorderable") (GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val getResizable_ = call (load_sym libgtk "gtk_tree_view_column_get_resizable") (GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val getSizing_ = call (load_sym libgtk "gtk_tree_view_column_get_sizing") (GObjectObjectClass.PolyML.PTR --> GtkTreeViewColumnSizing.PolyML.VAL)
      val getSortColumnId_ = call (load_sym libgtk "gtk_tree_view_column_get_sort_column_id") (GObjectObjectClass.PolyML.PTR --> FFI.Int32.PolyML.VAL)
      val getSortIndicator_ = call (load_sym libgtk "gtk_tree_view_column_get_sort_indicator") (GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val getSortOrder_ = call (load_sym libgtk "gtk_tree_view_column_get_sort_order") (GObjectObjectClass.PolyML.PTR --> GtkSortType.PolyML.VAL)
      val getSpacing_ = call (load_sym libgtk "gtk_tree_view_column_get_spacing") (GObjectObjectClass.PolyML.PTR --> FFI.Int32.PolyML.VAL)
      val getTitle_ = call (load_sym libgtk "gtk_tree_view_column_get_title") (GObjectObjectClass.PolyML.PTR --> FFI.String.PolyML.RETPTR)
      val getTreeView_ = call (load_sym libgtk "gtk_tree_view_column_get_tree_view") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val getVisible_ = call (load_sym libgtk "gtk_tree_view_column_get_visible") (GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val getWidget_ = call (load_sym libgtk "gtk_tree_view_column_get_widget") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val getWidth_ = call (load_sym libgtk "gtk_tree_view_column_get_width") (GObjectObjectClass.PolyML.PTR --> FFI.Int32.PolyML.VAL)
      val getXOffset_ = call (load_sym libgtk "gtk_tree_view_column_get_x_offset") (GObjectObjectClass.PolyML.PTR --> FFI.Int32.PolyML.VAL)
      val packEnd_ =
        call (load_sym libgtk "gtk_tree_view_column_pack_end")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> FFI.Bool.PolyML.VAL
             --> FFI.PolyML.VOID
          )
      val packStart_ =
        call (load_sym libgtk "gtk_tree_view_column_pack_start")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> FFI.Bool.PolyML.VAL
             --> FFI.PolyML.VOID
          )
      val queueResize_ = call (load_sym libgtk "gtk_tree_view_column_queue_resize") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val setAlignment_ = call (load_sym libgtk "gtk_tree_view_column_set_alignment") (GObjectObjectClass.PolyML.PTR &&> FFI.Float.PolyML.VAL --> FFI.PolyML.VOID)
      val setClickable_ = call (load_sym libgtk "gtk_tree_view_column_set_clickable") (GObjectObjectClass.PolyML.PTR &&> FFI.Bool.PolyML.VAL --> FFI.PolyML.VOID)
      val setExpand_ = call (load_sym libgtk "gtk_tree_view_column_set_expand") (GObjectObjectClass.PolyML.PTR &&> FFI.Bool.PolyML.VAL --> FFI.PolyML.VOID)
      val setFixedWidth_ = call (load_sym libgtk "gtk_tree_view_column_set_fixed_width") (GObjectObjectClass.PolyML.PTR &&> FFI.Int32.PolyML.VAL --> FFI.PolyML.VOID)
      val setMaxWidth_ = call (load_sym libgtk "gtk_tree_view_column_set_max_width") (GObjectObjectClass.PolyML.PTR &&> FFI.Int32.PolyML.VAL --> FFI.PolyML.VOID)
      val setMinWidth_ = call (load_sym libgtk "gtk_tree_view_column_set_min_width") (GObjectObjectClass.PolyML.PTR &&> FFI.Int32.PolyML.VAL --> FFI.PolyML.VOID)
      val setReorderable_ = call (load_sym libgtk "gtk_tree_view_column_set_reorderable") (GObjectObjectClass.PolyML.PTR &&> FFI.Bool.PolyML.VAL --> FFI.PolyML.VOID)
      val setResizable_ = call (load_sym libgtk "gtk_tree_view_column_set_resizable") (GObjectObjectClass.PolyML.PTR &&> FFI.Bool.PolyML.VAL --> FFI.PolyML.VOID)
      val setSizing_ = call (load_sym libgtk "gtk_tree_view_column_set_sizing") (GObjectObjectClass.PolyML.PTR &&> GtkTreeViewColumnSizing.PolyML.VAL --> FFI.PolyML.VOID)
      val setSortColumnId_ = call (load_sym libgtk "gtk_tree_view_column_set_sort_column_id") (GObjectObjectClass.PolyML.PTR &&> FFI.Int32.PolyML.VAL --> FFI.PolyML.VOID)
      val setSortIndicator_ = call (load_sym libgtk "gtk_tree_view_column_set_sort_indicator") (GObjectObjectClass.PolyML.PTR &&> FFI.Bool.PolyML.VAL --> FFI.PolyML.VOID)
      val setSortOrder_ = call (load_sym libgtk "gtk_tree_view_column_set_sort_order") (GObjectObjectClass.PolyML.PTR &&> GtkSortType.PolyML.VAL --> FFI.PolyML.VOID)
      val setSpacing_ = call (load_sym libgtk "gtk_tree_view_column_set_spacing") (GObjectObjectClass.PolyML.PTR &&> FFI.Int32.PolyML.VAL --> FFI.PolyML.VOID)
      val setTitle_ = call (load_sym libgtk "gtk_tree_view_column_set_title") (GObjectObjectClass.PolyML.PTR &&> FFI.String.PolyML.INPTR --> FFI.PolyML.VOID)
      val setVisible_ = call (load_sym libgtk "gtk_tree_view_column_set_visible") (GObjectObjectClass.PolyML.PTR &&> FFI.Bool.PolyML.VAL --> FFI.PolyML.VOID)
      val setWidget_ = call (load_sym libgtk "gtk_tree_view_column_set_widget") (GObjectObjectClass.PolyML.PTR &&> GObjectObjectClass.PolyML.OPTPTR --> FFI.PolyML.VOID)
    end
    type 'a class_t = 'a GtkTreeViewColumnClass.t
    type 'a buildable_class_t = 'a GtkBuildableClass.t
    type 'a cell_layout_class_t = 'a GtkCellLayoutClass.t
    type tree_iter_record_t = GtkTreeIterRecord.t
    type 'a tree_model_class_t = 'a GtkTreeModelClass.t
    type 'a cell_renderer_class_t = 'a GtkCellRendererClass.t
    type 'a cell_area_class_t = 'a GtkCellAreaClass.t
    type tree_view_column_sizing_t = GtkTreeViewColumnSizing.t
    type sort_type_t = GtkSortType.t
    type 'a widget_class_t = 'a GtkWidgetClass.t
    type t = base class_t
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    fun asCellLayout self = (GObjectObjectClass.C.withPtr ---> GtkCellLayoutClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkTreeViewColumnClass.C.fromPtr false) new_ ()
    fun newWithArea area = (GObjectObjectClass.C.withPtr ---> GtkTreeViewColumnClass.C.fromPtr false) newWithArea_ area
    fun addAttribute self cellRenderer attribute column =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> FFI.String.C.withConstPtr
         &&&> FFI.Int32.C.withVal
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
            GObjectObjectClass.C.withPtr
             &&&> GObjectObjectClass.C.withPtr
             &&&> FFI.Int32.C.withRefVal
             &&&> FFI.Int32.C.withRefVal
             ---> FFI.Int32.C.fromVal
                   && FFI.Int32.C.fromVal
                   && FFI.Bool.C.fromVal
          )
            cellGetPosition_
            (
              self
               & cellRenderer
               & FFI.Int32.null
               & FFI.Int32.null
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
            GObjectObjectClass.C.withPtr
             &&&> CairoRectangleIntRecord.C.withOptPtr
             &&&> FFI.Int32.C.withRefVal
             &&&> FFI.Int32.C.withRefVal
             &&&> FFI.Int32.C.withRefVal
             &&&> FFI.Int32.C.withRefVal
             ---> FFI.Int32.C.fromVal
                   && FFI.Int32.C.fromVal
                   && FFI.Int32.C.fromVal
                   && FFI.Int32.C.fromVal
                   && I
          )
            cellGetSize_
            (
              self
               & cellArea
               & FFI.Int32.null
               & FFI.Int32.null
               & FFI.Int32.null
               & FFI.Int32.null
            )
      in
        (
          xOffset,
          yOffset,
          width,
          height
        )
      end
    fun cellIsVisible self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) cellIsVisible_ self
    fun cellSetCellData self treeModel iter isExpander isExpanded =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
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
    fun clear self = (GObjectObjectClass.C.withPtr ---> I) clear_ self
    fun clearAttributes self cellRenderer = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> I) clearAttributes_ (self & cellRenderer)
    fun clicked self = (GObjectObjectClass.C.withPtr ---> I) clicked_ self
    fun focusCell self cell = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> I) focusCell_ (self & cell)
    fun getAlignment self = (GObjectObjectClass.C.withPtr ---> FFI.Float.C.fromVal) getAlignment_ self
    fun getButton self = (GObjectObjectClass.C.withPtr ---> GtkWidgetClass.C.fromPtr false) getButton_ self
    fun getClickable self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getClickable_ self
    fun getExpand self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getExpand_ self
    fun getFixedWidth self = (GObjectObjectClass.C.withPtr ---> FFI.Int32.C.fromVal) getFixedWidth_ self
    fun getMaxWidth self = (GObjectObjectClass.C.withPtr ---> FFI.Int32.C.fromVal) getMaxWidth_ self
    fun getMinWidth self = (GObjectObjectClass.C.withPtr ---> FFI.Int32.C.fromVal) getMinWidth_ self
    fun getReorderable self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getReorderable_ self
    fun getResizable self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getResizable_ self
    fun getSizing self = (GObjectObjectClass.C.withPtr ---> GtkTreeViewColumnSizing.C.fromVal) getSizing_ self
    fun getSortColumnId self = (GObjectObjectClass.C.withPtr ---> FFI.Int32.C.fromVal) getSortColumnId_ self
    fun getSortIndicator self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getSortIndicator_ self
    fun getSortOrder self = (GObjectObjectClass.C.withPtr ---> GtkSortType.C.fromVal) getSortOrder_ self
    fun getSpacing self = (GObjectObjectClass.C.withPtr ---> FFI.Int32.C.fromVal) getSpacing_ self
    fun getTitle self = (GObjectObjectClass.C.withPtr ---> FFI.String.C.fromPtr false) getTitle_ self
    fun getTreeView self = (GObjectObjectClass.C.withPtr ---> GtkWidgetClass.C.fromPtr false) getTreeView_ self
    fun getVisible self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getVisible_ self
    fun getWidget self = (GObjectObjectClass.C.withPtr ---> GtkWidgetClass.C.fromPtr false) getWidget_ self
    fun getWidth self = (GObjectObjectClass.C.withPtr ---> FFI.Int32.C.fromVal) getWidth_ self
    fun getXOffset self = (GObjectObjectClass.C.withPtr ---> FFI.Int32.C.fromVal) getXOffset_ self
    fun packEnd self cell expand =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
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
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> FFI.Bool.C.withVal
         ---> I
      )
        packStart_
        (
          self
           & cell
           & expand
        )
    fun queueResize self = (GObjectObjectClass.C.withPtr ---> I) queueResize_ self
    fun setAlignment self xalign = (GObjectObjectClass.C.withPtr &&&> FFI.Float.C.withVal ---> I) setAlignment_ (self & xalign)
    fun setClickable self clickable = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setClickable_ (self & clickable)
    fun setExpand self expand = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setExpand_ (self & expand)
    fun setFixedWidth self fixedWidth = (GObjectObjectClass.C.withPtr &&&> FFI.Int32.C.withVal ---> I) setFixedWidth_ (self & fixedWidth)
    fun setMaxWidth self maxWidth = (GObjectObjectClass.C.withPtr &&&> FFI.Int32.C.withVal ---> I) setMaxWidth_ (self & maxWidth)
    fun setMinWidth self minWidth = (GObjectObjectClass.C.withPtr &&&> FFI.Int32.C.withVal ---> I) setMinWidth_ (self & minWidth)
    fun setReorderable self reorderable = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setReorderable_ (self & reorderable)
    fun setResizable self resizable = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setResizable_ (self & resizable)
    fun setSizing self type' = (GObjectObjectClass.C.withPtr &&&> GtkTreeViewColumnSizing.C.withVal ---> I) setSizing_ (self & type')
    fun setSortColumnId self sortColumnId = (GObjectObjectClass.C.withPtr &&&> FFI.Int32.C.withVal ---> I) setSortColumnId_ (self & sortColumnId)
    fun setSortIndicator self setting = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setSortIndicator_ (self & setting)
    fun setSortOrder self order = (GObjectObjectClass.C.withPtr &&&> GtkSortType.C.withVal ---> I) setSortOrder_ (self & order)
    fun setSpacing self spacing = (GObjectObjectClass.C.withPtr &&&> FFI.Int32.C.withVal ---> I) setSpacing_ (self & spacing)
    fun setTitle self title = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstPtr ---> I) setTitle_ (self & title)
    fun setVisible self visible = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setVisible_ (self & visible)
    fun setWidget self widget = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withOptPtr ---> I) setWidget_ (self & widget)
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
