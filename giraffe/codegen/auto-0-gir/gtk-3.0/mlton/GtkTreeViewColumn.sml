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
    val new_ = _import "gtk_tree_view_column_new" : unit -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val newWithArea_ = _import "gtk_tree_view_column_new_with_area" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val addAttribute_ =
      fn
        x1
         & x2
         & (x3, x4)
         & x5 =>
          (
            _import "mlton_gtk_tree_view_column_add_attribute" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * FFI.Int.C.val_
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.Int.C.ref_
               * FFI.Int.C.ref_
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * unit GdkRectangleRecord.C.p
               * FFI.Int.C.ref_
               * FFI.Int.C.ref_
               * FFI.Int.C.ref_
               * FFI.Int.C.ref_
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
    val cellIsVisible_ = _import "gtk_tree_view_column_cell_is_visible" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    val cellSetCellData_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5 =>
          (
            _import "gtk_tree_view_column_cell_set_cell_data" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
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
    val clear_ = _import "gtk_tree_view_column_clear" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;
    val clearAttributes_ = fn x1 & x2 => (_import "gtk_tree_view_column_clear_attributes" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;) (x1, x2)
    val clicked_ = _import "gtk_tree_view_column_clicked" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;
    val focusCell_ = fn x1 & x2 => (_import "gtk_tree_view_column_focus_cell" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;) (x1, x2)
    val getAlignment_ = _import "gtk_tree_view_column_get_alignment" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Float.C.val_;
    val getButton_ = _import "gtk_tree_view_column_get_button" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val getClickable_ = _import "gtk_tree_view_column_get_clickable" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    val getExpand_ = _import "gtk_tree_view_column_get_expand" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    val getFixedWidth_ = _import "gtk_tree_view_column_get_fixed_width" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Int.C.val_;
    val getMaxWidth_ = _import "gtk_tree_view_column_get_max_width" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Int.C.val_;
    val getMinWidth_ = _import "gtk_tree_view_column_get_min_width" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Int.C.val_;
    val getReorderable_ = _import "gtk_tree_view_column_get_reorderable" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    val getResizable_ = _import "gtk_tree_view_column_get_resizable" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    val getSizing_ = _import "gtk_tree_view_column_get_sizing" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GtkTreeViewColumnSizing.C.val_;
    val getSortColumnId_ = _import "gtk_tree_view_column_get_sort_column_id" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Int.C.val_;
    val getSortIndicator_ = _import "gtk_tree_view_column_get_sort_indicator" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    val getSortOrder_ = _import "gtk_tree_view_column_get_sort_order" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GtkSortType.C.val_;
    val getSpacing_ = _import "gtk_tree_view_column_get_spacing" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Int.C.val_;
    val getTitle_ = _import "gtk_tree_view_column_get_title" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> Utf8.C.notnull Utf8.C.out_p;
    val getTreeView_ = _import "gtk_tree_view_column_get_tree_view" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val getVisible_ = _import "gtk_tree_view_column_get_visible" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    val getWidget_ = _import "gtk_tree_view_column_get_widget" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val getWidth_ = _import "gtk_tree_view_column_get_width" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Int.C.val_;
    val getXOffset_ = _import "gtk_tree_view_column_get_x_offset" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Int.C.val_;
    val packEnd_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_tree_view_column_pack_end" :
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
    val packStart_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_tree_view_column_pack_start" :
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
    val queueResize_ = _import "gtk_tree_view_column_queue_resize" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;
    val setAlignment_ = fn x1 & x2 => (_import "gtk_tree_view_column_set_alignment" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Float.C.val_ -> unit;) (x1, x2)
    val setClickable_ = fn x1 & x2 => (_import "gtk_tree_view_column_set_clickable" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setExpand_ = fn x1 & x2 => (_import "gtk_tree_view_column_set_expand" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setFixedWidth_ = fn x1 & x2 => (_import "gtk_tree_view_column_set_fixed_width" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Int.C.val_ -> unit;) (x1, x2)
    val setMaxWidth_ = fn x1 & x2 => (_import "gtk_tree_view_column_set_max_width" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Int.C.val_ -> unit;) (x1, x2)
    val setMinWidth_ = fn x1 & x2 => (_import "gtk_tree_view_column_set_min_width" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Int.C.val_ -> unit;) (x1, x2)
    val setReorderable_ = fn x1 & x2 => (_import "gtk_tree_view_column_set_reorderable" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setResizable_ = fn x1 & x2 => (_import "gtk_tree_view_column_set_resizable" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setSizing_ = fn x1 & x2 => (_import "gtk_tree_view_column_set_sizing" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GtkTreeViewColumnSizing.C.val_ -> unit;) (x1, x2)
    val setSortColumnId_ = fn x1 & x2 => (_import "gtk_tree_view_column_set_sort_column_id" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Int.C.val_ -> unit;) (x1, x2)
    val setSortIndicator_ = fn x1 & x2 => (_import "gtk_tree_view_column_set_sort_indicator" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setSortOrder_ = fn x1 & x2 => (_import "gtk_tree_view_column_set_sort_order" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GtkSortType.C.val_ -> unit;) (x1, x2)
    val setSpacing_ = fn x1 & x2 => (_import "gtk_tree_view_column_set_spacing" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Int.C.val_ -> unit;) (x1, x2)
    val setTitle_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_tree_view_column_set_title" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setVisible_ = fn x1 & x2 => (_import "gtk_tree_view_column_set_visible" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setWidget_ = fn x1 & x2 => (_import "gtk_tree_view_column_set_widget" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * unit GObjectObjectClass.C.p -> unit;) (x1, x2)
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
    fun newWithArea area = (GObjectObjectClass.C.withPtr ---> GtkTreeViewColumnClass.C.fromPtr false) newWithArea_ area
    fun addAttribute self cellRenderer attribute column =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
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
            GObjectObjectClass.C.withPtr
             &&&> GObjectObjectClass.C.withPtr
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
            GObjectObjectClass.C.withPtr
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
    fun getFixedWidth self = (GObjectObjectClass.C.withPtr ---> FFI.Int.C.fromVal) getFixedWidth_ self
    fun getMaxWidth self = (GObjectObjectClass.C.withPtr ---> FFI.Int.C.fromVal) getMaxWidth_ self
    fun getMinWidth self = (GObjectObjectClass.C.withPtr ---> FFI.Int.C.fromVal) getMinWidth_ self
    fun getReorderable self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getReorderable_ self
    fun getResizable self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getResizable_ self
    fun getSizing self = (GObjectObjectClass.C.withPtr ---> GtkTreeViewColumnSizing.C.fromVal) getSizing_ self
    fun getSortColumnId self = (GObjectObjectClass.C.withPtr ---> FFI.Int.C.fromVal) getSortColumnId_ self
    fun getSortIndicator self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getSortIndicator_ self
    fun getSortOrder self = (GObjectObjectClass.C.withPtr ---> GtkSortType.C.fromVal) getSortOrder_ self
    fun getSpacing self = (GObjectObjectClass.C.withPtr ---> FFI.Int.C.fromVal) getSpacing_ self
    fun getTitle self = (GObjectObjectClass.C.withPtr ---> Utf8.C.fromPtr false) getTitle_ self
    fun getTreeView self = (GObjectObjectClass.C.withPtr ---> GtkWidgetClass.C.fromPtr false) getTreeView_ self
    fun getVisible self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getVisible_ self
    fun getWidget self = (GObjectObjectClass.C.withPtr ---> GtkWidgetClass.C.fromPtr false) getWidget_ self
    fun getWidth self = (GObjectObjectClass.C.withPtr ---> FFI.Int.C.fromVal) getWidth_ self
    fun getXOffset self = (GObjectObjectClass.C.withPtr ---> FFI.Int.C.fromVal) getXOffset_ self
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
    fun setFixedWidth self fixedWidth = (GObjectObjectClass.C.withPtr &&&> FFI.Int.C.withVal ---> I) setFixedWidth_ (self & fixedWidth)
    fun setMaxWidth self maxWidth = (GObjectObjectClass.C.withPtr &&&> FFI.Int.C.withVal ---> I) setMaxWidth_ (self & maxWidth)
    fun setMinWidth self minWidth = (GObjectObjectClass.C.withPtr &&&> FFI.Int.C.withVal ---> I) setMinWidth_ (self & minWidth)
    fun setReorderable self reorderable = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setReorderable_ (self & reorderable)
    fun setResizable self resizable = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setResizable_ (self & resizable)
    fun setSizing self type' = (GObjectObjectClass.C.withPtr &&&> GtkTreeViewColumnSizing.C.withVal ---> I) setSizing_ (self & type')
    fun setSortColumnId self sortColumnId = (GObjectObjectClass.C.withPtr &&&> FFI.Int.C.withVal ---> I) setSortColumnId_ (self & sortColumnId)
    fun setSortIndicator self setting = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setSortIndicator_ (self & setting)
    fun setSortOrder self order = (GObjectObjectClass.C.withPtr &&&> GtkSortType.C.withVal ---> I) setSortOrder_ (self & order)
    fun setSpacing self spacing = (GObjectObjectClass.C.withPtr &&&> FFI.Int.C.withVal ---> I) setSpacing_ (self & spacing)
    fun setTitle self title = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withPtr ---> I) setTitle_ (self & title)
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
