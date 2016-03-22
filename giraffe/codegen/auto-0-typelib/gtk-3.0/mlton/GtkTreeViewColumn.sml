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
    val getType_ = _import "gtk_tree_view_column_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "gtk_tree_view_column_new" : unit -> GtkTreeViewColumnClass.C.notnull GtkTreeViewColumnClass.C.p;
    val newWithArea_ = _import "gtk_tree_view_column_new_with_area" : GtkCellAreaClass.C.notnull GtkCellAreaClass.C.p -> GtkTreeViewColumnClass.C.notnull GtkTreeViewColumnClass.C.p;
    val addAttribute_ =
      fn
        x1
         & x2
         & (x3, x4)
         & x5 =>
          (
            _import "mlton_gtk_tree_view_column_add_attribute" :
              GtkTreeViewColumnClass.C.notnull GtkTreeViewColumnClass.C.p
               * GtkCellRendererClass.C.notnull GtkCellRendererClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * FFI.Int32.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val cellGetPosition_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "gtk_tree_view_column_cell_get_position" :
              GtkTreeViewColumnClass.C.notnull GtkTreeViewColumnClass.C.p
               * GtkCellRendererClass.C.notnull GtkCellRendererClass.C.p
               * FFI.Int32.C.ref_
               * FFI.Int32.C.ref_
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val cellGetSize_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5
         & x6 =>
          (
            _import "gtk_tree_view_column_cell_get_size" :
              GtkTreeViewColumnClass.C.notnull GtkTreeViewColumnClass.C.p
               * unit CairoRectangleIntRecord.C.p
               * FFI.Int32.C.ref_
               * FFI.Int32.C.ref_
               * FFI.Int32.C.ref_
               * FFI.Int32.C.ref_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6
            )
    val cellIsVisible_ = _import "gtk_tree_view_column_cell_is_visible" : GtkTreeViewColumnClass.C.notnull GtkTreeViewColumnClass.C.p -> FFI.Bool.C.val_;
    val cellSetCellData_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5 =>
          (
            _import "gtk_tree_view_column_cell_set_cell_data" :
              GtkTreeViewColumnClass.C.notnull GtkTreeViewColumnClass.C.p
               * GtkTreeModelClass.C.notnull GtkTreeModelClass.C.p
               * GtkTreeIterRecord.C.notnull GtkTreeIterRecord.C.p
               * FFI.Bool.C.val_
               * FFI.Bool.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val clear_ = _import "gtk_tree_view_column_clear" : GtkTreeViewColumnClass.C.notnull GtkTreeViewColumnClass.C.p -> unit;
    val clearAttributes_ = fn x1 & x2 => (_import "gtk_tree_view_column_clear_attributes" : GtkTreeViewColumnClass.C.notnull GtkTreeViewColumnClass.C.p * GtkCellRendererClass.C.notnull GtkCellRendererClass.C.p -> unit;) (x1, x2)
    val clicked_ = _import "gtk_tree_view_column_clicked" : GtkTreeViewColumnClass.C.notnull GtkTreeViewColumnClass.C.p -> unit;
    val focusCell_ = fn x1 & x2 => (_import "gtk_tree_view_column_focus_cell" : GtkTreeViewColumnClass.C.notnull GtkTreeViewColumnClass.C.p * GtkCellRendererClass.C.notnull GtkCellRendererClass.C.p -> unit;) (x1, x2)
    val getAlignment_ = _import "gtk_tree_view_column_get_alignment" : GtkTreeViewColumnClass.C.notnull GtkTreeViewColumnClass.C.p -> FFI.Float.C.val_;
    val getButton_ = _import "gtk_tree_view_column_get_button" : GtkTreeViewColumnClass.C.notnull GtkTreeViewColumnClass.C.p -> GtkWidgetClass.C.notnull GtkWidgetClass.C.p;
    val getClickable_ = _import "gtk_tree_view_column_get_clickable" : GtkTreeViewColumnClass.C.notnull GtkTreeViewColumnClass.C.p -> FFI.Bool.C.val_;
    val getExpand_ = _import "gtk_tree_view_column_get_expand" : GtkTreeViewColumnClass.C.notnull GtkTreeViewColumnClass.C.p -> FFI.Bool.C.val_;
    val getFixedWidth_ = _import "gtk_tree_view_column_get_fixed_width" : GtkTreeViewColumnClass.C.notnull GtkTreeViewColumnClass.C.p -> FFI.Int32.C.val_;
    val getMaxWidth_ = _import "gtk_tree_view_column_get_max_width" : GtkTreeViewColumnClass.C.notnull GtkTreeViewColumnClass.C.p -> FFI.Int32.C.val_;
    val getMinWidth_ = _import "gtk_tree_view_column_get_min_width" : GtkTreeViewColumnClass.C.notnull GtkTreeViewColumnClass.C.p -> FFI.Int32.C.val_;
    val getReorderable_ = _import "gtk_tree_view_column_get_reorderable" : GtkTreeViewColumnClass.C.notnull GtkTreeViewColumnClass.C.p -> FFI.Bool.C.val_;
    val getResizable_ = _import "gtk_tree_view_column_get_resizable" : GtkTreeViewColumnClass.C.notnull GtkTreeViewColumnClass.C.p -> FFI.Bool.C.val_;
    val getSizing_ = _import "gtk_tree_view_column_get_sizing" : GtkTreeViewColumnClass.C.notnull GtkTreeViewColumnClass.C.p -> GtkTreeViewColumnSizing.C.val_;
    val getSortColumnId_ = _import "gtk_tree_view_column_get_sort_column_id" : GtkTreeViewColumnClass.C.notnull GtkTreeViewColumnClass.C.p -> FFI.Int32.C.val_;
    val getSortIndicator_ = _import "gtk_tree_view_column_get_sort_indicator" : GtkTreeViewColumnClass.C.notnull GtkTreeViewColumnClass.C.p -> FFI.Bool.C.val_;
    val getSortOrder_ = _import "gtk_tree_view_column_get_sort_order" : GtkTreeViewColumnClass.C.notnull GtkTreeViewColumnClass.C.p -> GtkSortType.C.val_;
    val getSpacing_ = _import "gtk_tree_view_column_get_spacing" : GtkTreeViewColumnClass.C.notnull GtkTreeViewColumnClass.C.p -> FFI.Int32.C.val_;
    val getTitle_ = _import "gtk_tree_view_column_get_title" : GtkTreeViewColumnClass.C.notnull GtkTreeViewColumnClass.C.p -> Utf8.C.notnull Utf8.C.out_p;
    val getTreeView_ = _import "gtk_tree_view_column_get_tree_view" : GtkTreeViewColumnClass.C.notnull GtkTreeViewColumnClass.C.p -> GtkWidgetClass.C.notnull GtkWidgetClass.C.p;
    val getVisible_ = _import "gtk_tree_view_column_get_visible" : GtkTreeViewColumnClass.C.notnull GtkTreeViewColumnClass.C.p -> FFI.Bool.C.val_;
    val getWidget_ = _import "gtk_tree_view_column_get_widget" : GtkTreeViewColumnClass.C.notnull GtkTreeViewColumnClass.C.p -> GtkWidgetClass.C.notnull GtkWidgetClass.C.p;
    val getWidth_ = _import "gtk_tree_view_column_get_width" : GtkTreeViewColumnClass.C.notnull GtkTreeViewColumnClass.C.p -> FFI.Int32.C.val_;
    val getXOffset_ = _import "gtk_tree_view_column_get_x_offset" : GtkTreeViewColumnClass.C.notnull GtkTreeViewColumnClass.C.p -> FFI.Int32.C.val_;
    val packEnd_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_tree_view_column_pack_end" :
              GtkTreeViewColumnClass.C.notnull GtkTreeViewColumnClass.C.p
               * GtkCellRendererClass.C.notnull GtkCellRendererClass.C.p
               * FFI.Bool.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val packStart_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_tree_view_column_pack_start" :
              GtkTreeViewColumnClass.C.notnull GtkTreeViewColumnClass.C.p
               * GtkCellRendererClass.C.notnull GtkCellRendererClass.C.p
               * FFI.Bool.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val queueResize_ = _import "gtk_tree_view_column_queue_resize" : GtkTreeViewColumnClass.C.notnull GtkTreeViewColumnClass.C.p -> unit;
    val setAlignment_ = fn x1 & x2 => (_import "gtk_tree_view_column_set_alignment" : GtkTreeViewColumnClass.C.notnull GtkTreeViewColumnClass.C.p * FFI.Float.C.val_ -> unit;) (x1, x2)
    val setClickable_ = fn x1 & x2 => (_import "gtk_tree_view_column_set_clickable" : GtkTreeViewColumnClass.C.notnull GtkTreeViewColumnClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setExpand_ = fn x1 & x2 => (_import "gtk_tree_view_column_set_expand" : GtkTreeViewColumnClass.C.notnull GtkTreeViewColumnClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setFixedWidth_ = fn x1 & x2 => (_import "gtk_tree_view_column_set_fixed_width" : GtkTreeViewColumnClass.C.notnull GtkTreeViewColumnClass.C.p * FFI.Int32.C.val_ -> unit;) (x1, x2)
    val setMaxWidth_ = fn x1 & x2 => (_import "gtk_tree_view_column_set_max_width" : GtkTreeViewColumnClass.C.notnull GtkTreeViewColumnClass.C.p * FFI.Int32.C.val_ -> unit;) (x1, x2)
    val setMinWidth_ = fn x1 & x2 => (_import "gtk_tree_view_column_set_min_width" : GtkTreeViewColumnClass.C.notnull GtkTreeViewColumnClass.C.p * FFI.Int32.C.val_ -> unit;) (x1, x2)
    val setReorderable_ = fn x1 & x2 => (_import "gtk_tree_view_column_set_reorderable" : GtkTreeViewColumnClass.C.notnull GtkTreeViewColumnClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setResizable_ = fn x1 & x2 => (_import "gtk_tree_view_column_set_resizable" : GtkTreeViewColumnClass.C.notnull GtkTreeViewColumnClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setSizing_ = fn x1 & x2 => (_import "gtk_tree_view_column_set_sizing" : GtkTreeViewColumnClass.C.notnull GtkTreeViewColumnClass.C.p * GtkTreeViewColumnSizing.C.val_ -> unit;) (x1, x2)
    val setSortColumnId_ = fn x1 & x2 => (_import "gtk_tree_view_column_set_sort_column_id" : GtkTreeViewColumnClass.C.notnull GtkTreeViewColumnClass.C.p * FFI.Int32.C.val_ -> unit;) (x1, x2)
    val setSortIndicator_ = fn x1 & x2 => (_import "gtk_tree_view_column_set_sort_indicator" : GtkTreeViewColumnClass.C.notnull GtkTreeViewColumnClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setSortOrder_ = fn x1 & x2 => (_import "gtk_tree_view_column_set_sort_order" : GtkTreeViewColumnClass.C.notnull GtkTreeViewColumnClass.C.p * GtkSortType.C.val_ -> unit;) (x1, x2)
    val setSpacing_ = fn x1 & x2 => (_import "gtk_tree_view_column_set_spacing" : GtkTreeViewColumnClass.C.notnull GtkTreeViewColumnClass.C.p * FFI.Int32.C.val_ -> unit;) (x1, x2)
    val setTitle_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_tree_view_column_set_title" :
              GtkTreeViewColumnClass.C.notnull GtkTreeViewColumnClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setVisible_ = fn x1 & x2 => (_import "gtk_tree_view_column_set_visible" : GtkTreeViewColumnClass.C.notnull GtkTreeViewColumnClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setWidget_ = fn x1 & x2 => (_import "gtk_tree_view_column_set_widget" : GtkTreeViewColumnClass.C.notnull GtkTreeViewColumnClass.C.p * unit GtkWidgetClass.C.p -> unit;) (x1, x2)
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
            GtkTreeViewColumnClass.C.withPtr
             &&&> GtkCellRendererClass.C.withPtr
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
            GtkTreeViewColumnClass.C.withPtr
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
    fun getFixedWidth self = (GtkTreeViewColumnClass.C.withPtr ---> FFI.Int32.C.fromVal) getFixedWidth_ self
    fun getMaxWidth self = (GtkTreeViewColumnClass.C.withPtr ---> FFI.Int32.C.fromVal) getMaxWidth_ self
    fun getMinWidth self = (GtkTreeViewColumnClass.C.withPtr ---> FFI.Int32.C.fromVal) getMinWidth_ self
    fun getReorderable self = (GtkTreeViewColumnClass.C.withPtr ---> FFI.Bool.C.fromVal) getReorderable_ self
    fun getResizable self = (GtkTreeViewColumnClass.C.withPtr ---> FFI.Bool.C.fromVal) getResizable_ self
    fun getSizing self = (GtkTreeViewColumnClass.C.withPtr ---> GtkTreeViewColumnSizing.C.fromVal) getSizing_ self
    fun getSortColumnId self = (GtkTreeViewColumnClass.C.withPtr ---> FFI.Int32.C.fromVal) getSortColumnId_ self
    fun getSortIndicator self = (GtkTreeViewColumnClass.C.withPtr ---> FFI.Bool.C.fromVal) getSortIndicator_ self
    fun getSortOrder self = (GtkTreeViewColumnClass.C.withPtr ---> GtkSortType.C.fromVal) getSortOrder_ self
    fun getSpacing self = (GtkTreeViewColumnClass.C.withPtr ---> FFI.Int32.C.fromVal) getSpacing_ self
    fun getTitle self = (GtkTreeViewColumnClass.C.withPtr ---> Utf8.C.fromPtr false) getTitle_ self
    fun getTreeView self = (GtkTreeViewColumnClass.C.withPtr ---> GtkWidgetClass.C.fromPtr false) getTreeView_ self
    fun getVisible self = (GtkTreeViewColumnClass.C.withPtr ---> FFI.Bool.C.fromVal) getVisible_ self
    fun getWidget self = (GtkTreeViewColumnClass.C.withPtr ---> GtkWidgetClass.C.fromPtr false) getWidget_ self
    fun getWidth self = (GtkTreeViewColumnClass.C.withPtr ---> FFI.Int32.C.fromVal) getWidth_ self
    fun getXOffset self = (GtkTreeViewColumnClass.C.withPtr ---> FFI.Int32.C.fromVal) getXOffset_ self
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
    fun setFixedWidth self fixedWidth = (GtkTreeViewColumnClass.C.withPtr &&&> FFI.Int32.C.withVal ---> I) setFixedWidth_ (self & fixedWidth)
    fun setMaxWidth self maxWidth = (GtkTreeViewColumnClass.C.withPtr &&&> FFI.Int32.C.withVal ---> I) setMaxWidth_ (self & maxWidth)
    fun setMinWidth self minWidth = (GtkTreeViewColumnClass.C.withPtr &&&> FFI.Int32.C.withVal ---> I) setMinWidth_ (self & minWidth)
    fun setReorderable self reorderable = (GtkTreeViewColumnClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setReorderable_ (self & reorderable)
    fun setResizable self resizable = (GtkTreeViewColumnClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setResizable_ (self & resizable)
    fun setSizing self type' = (GtkTreeViewColumnClass.C.withPtr &&&> GtkTreeViewColumnSizing.C.withVal ---> I) setSizing_ (self & type')
    fun setSortColumnId self sortColumnId = (GtkTreeViewColumnClass.C.withPtr &&&> FFI.Int32.C.withVal ---> I) setSortColumnId_ (self & sortColumnId)
    fun setSortIndicator self setting = (GtkTreeViewColumnClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setSortIndicator_ (self & setting)
    fun setSortOrder self order = (GtkTreeViewColumnClass.C.withPtr &&&> GtkSortType.C.withVal ---> I) setSortOrder_ (self & order)
    fun setSpacing self spacing = (GtkTreeViewColumnClass.C.withPtr &&&> FFI.Int32.C.withVal ---> I) setSpacing_ (self & spacing)
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
