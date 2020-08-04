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
    val getType_ = _import "gtk_tree_view_column_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "gtk_tree_view_column_new" : unit -> GtkTreeViewColumnClass.FFI.non_opt GtkTreeViewColumnClass.FFI.p;
    val newWithArea_ = _import "gtk_tree_view_column_new_with_area" : GtkCellAreaClass.FFI.non_opt GtkCellAreaClass.FFI.p -> GtkTreeViewColumnClass.FFI.non_opt GtkTreeViewColumnClass.FFI.p;
    val addAttribute_ =
      fn
        x1
         & x2
         & (x3, x4)
         & x5 =>
          (
            _import "mlton_gtk_tree_view_column_add_attribute" :
              GtkTreeViewColumnClass.FFI.non_opt GtkTreeViewColumnClass.FFI.p
               * GtkCellRendererClass.FFI.non_opt GtkCellRendererClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GInt32.FFI.val_
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
              GtkTreeViewColumnClass.FFI.non_opt GtkTreeViewColumnClass.FFI.p
               * GtkCellRendererClass.FFI.non_opt GtkCellRendererClass.FFI.p
               * GInt32.FFI.ref_
               * GInt32.FFI.ref_
               -> GBool.FFI.val_;
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
              GtkTreeViewColumnClass.FFI.non_opt GtkTreeViewColumnClass.FFI.p
               * GdkRectangleRecord.FFI.opt GdkRectangleRecord.FFI.p
               * GInt32.FFI.ref_
               * GInt32.FFI.ref_
               * GInt32.FFI.ref_
               * GInt32.FFI.ref_
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
    val cellIsVisible_ = _import "gtk_tree_view_column_cell_is_visible" : GtkTreeViewColumnClass.FFI.non_opt GtkTreeViewColumnClass.FFI.p -> GBool.FFI.val_;
    val cellSetCellData_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5 =>
          (
            _import "gtk_tree_view_column_cell_set_cell_data" :
              GtkTreeViewColumnClass.FFI.non_opt GtkTreeViewColumnClass.FFI.p
               * GtkTreeModelClass.FFI.non_opt GtkTreeModelClass.FFI.p
               * GtkTreeIterRecord.FFI.non_opt GtkTreeIterRecord.FFI.p
               * GBool.FFI.val_
               * GBool.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val clear_ = _import "gtk_tree_view_column_clear" : GtkTreeViewColumnClass.FFI.non_opt GtkTreeViewColumnClass.FFI.p -> unit;
    val clearAttributes_ = fn x1 & x2 => (_import "gtk_tree_view_column_clear_attributes" : GtkTreeViewColumnClass.FFI.non_opt GtkTreeViewColumnClass.FFI.p * GtkCellRendererClass.FFI.non_opt GtkCellRendererClass.FFI.p -> unit;) (x1, x2)
    val clicked_ = _import "gtk_tree_view_column_clicked" : GtkTreeViewColumnClass.FFI.non_opt GtkTreeViewColumnClass.FFI.p -> unit;
    val focusCell_ = fn x1 & x2 => (_import "gtk_tree_view_column_focus_cell" : GtkTreeViewColumnClass.FFI.non_opt GtkTreeViewColumnClass.FFI.p * GtkCellRendererClass.FFI.non_opt GtkCellRendererClass.FFI.p -> unit;) (x1, x2)
    val getAlignment_ = _import "gtk_tree_view_column_get_alignment" : GtkTreeViewColumnClass.FFI.non_opt GtkTreeViewColumnClass.FFI.p -> GFloat.FFI.val_;
    val getButton_ = _import "gtk_tree_view_column_get_button" : GtkTreeViewColumnClass.FFI.non_opt GtkTreeViewColumnClass.FFI.p -> GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p;
    val getClickable_ = _import "gtk_tree_view_column_get_clickable" : GtkTreeViewColumnClass.FFI.non_opt GtkTreeViewColumnClass.FFI.p -> GBool.FFI.val_;
    val getExpand_ = _import "gtk_tree_view_column_get_expand" : GtkTreeViewColumnClass.FFI.non_opt GtkTreeViewColumnClass.FFI.p -> GBool.FFI.val_;
    val getFixedWidth_ = _import "gtk_tree_view_column_get_fixed_width" : GtkTreeViewColumnClass.FFI.non_opt GtkTreeViewColumnClass.FFI.p -> GInt32.FFI.val_;
    val getMaxWidth_ = _import "gtk_tree_view_column_get_max_width" : GtkTreeViewColumnClass.FFI.non_opt GtkTreeViewColumnClass.FFI.p -> GInt32.FFI.val_;
    val getMinWidth_ = _import "gtk_tree_view_column_get_min_width" : GtkTreeViewColumnClass.FFI.non_opt GtkTreeViewColumnClass.FFI.p -> GInt32.FFI.val_;
    val getReorderable_ = _import "gtk_tree_view_column_get_reorderable" : GtkTreeViewColumnClass.FFI.non_opt GtkTreeViewColumnClass.FFI.p -> GBool.FFI.val_;
    val getResizable_ = _import "gtk_tree_view_column_get_resizable" : GtkTreeViewColumnClass.FFI.non_opt GtkTreeViewColumnClass.FFI.p -> GBool.FFI.val_;
    val getSizing_ = _import "gtk_tree_view_column_get_sizing" : GtkTreeViewColumnClass.FFI.non_opt GtkTreeViewColumnClass.FFI.p -> GtkTreeViewColumnSizing.FFI.val_;
    val getSortColumnId_ = _import "gtk_tree_view_column_get_sort_column_id" : GtkTreeViewColumnClass.FFI.non_opt GtkTreeViewColumnClass.FFI.p -> GInt32.FFI.val_;
    val getSortIndicator_ = _import "gtk_tree_view_column_get_sort_indicator" : GtkTreeViewColumnClass.FFI.non_opt GtkTreeViewColumnClass.FFI.p -> GBool.FFI.val_;
    val getSortOrder_ = _import "gtk_tree_view_column_get_sort_order" : GtkTreeViewColumnClass.FFI.non_opt GtkTreeViewColumnClass.FFI.p -> GtkSortType.FFI.val_;
    val getSpacing_ = _import "gtk_tree_view_column_get_spacing" : GtkTreeViewColumnClass.FFI.non_opt GtkTreeViewColumnClass.FFI.p -> GInt32.FFI.val_;
    val getTitle_ = _import "gtk_tree_view_column_get_title" : GtkTreeViewColumnClass.FFI.non_opt GtkTreeViewColumnClass.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val getTreeView_ = _import "gtk_tree_view_column_get_tree_view" : GtkTreeViewColumnClass.FFI.non_opt GtkTreeViewColumnClass.FFI.p -> GtkWidgetClass.FFI.opt GtkWidgetClass.FFI.p;
    val getVisible_ = _import "gtk_tree_view_column_get_visible" : GtkTreeViewColumnClass.FFI.non_opt GtkTreeViewColumnClass.FFI.p -> GBool.FFI.val_;
    val getWidget_ = _import "gtk_tree_view_column_get_widget" : GtkTreeViewColumnClass.FFI.non_opt GtkTreeViewColumnClass.FFI.p -> GtkWidgetClass.FFI.opt GtkWidgetClass.FFI.p;
    val getWidth_ = _import "gtk_tree_view_column_get_width" : GtkTreeViewColumnClass.FFI.non_opt GtkTreeViewColumnClass.FFI.p -> GInt32.FFI.val_;
    val getXOffset_ = _import "gtk_tree_view_column_get_x_offset" : GtkTreeViewColumnClass.FFI.non_opt GtkTreeViewColumnClass.FFI.p -> GInt32.FFI.val_;
    val packEnd_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_tree_view_column_pack_end" :
              GtkTreeViewColumnClass.FFI.non_opt GtkTreeViewColumnClass.FFI.p
               * GtkCellRendererClass.FFI.non_opt GtkCellRendererClass.FFI.p
               * GBool.FFI.val_
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
              GtkTreeViewColumnClass.FFI.non_opt GtkTreeViewColumnClass.FFI.p
               * GtkCellRendererClass.FFI.non_opt GtkCellRendererClass.FFI.p
               * GBool.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val queueResize_ = _import "gtk_tree_view_column_queue_resize" : GtkTreeViewColumnClass.FFI.non_opt GtkTreeViewColumnClass.FFI.p -> unit;
    val setAlignment_ = fn x1 & x2 => (_import "gtk_tree_view_column_set_alignment" : GtkTreeViewColumnClass.FFI.non_opt GtkTreeViewColumnClass.FFI.p * GFloat.FFI.val_ -> unit;) (x1, x2)
    val setClickable_ = fn x1 & x2 => (_import "gtk_tree_view_column_set_clickable" : GtkTreeViewColumnClass.FFI.non_opt GtkTreeViewColumnClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setExpand_ = fn x1 & x2 => (_import "gtk_tree_view_column_set_expand" : GtkTreeViewColumnClass.FFI.non_opt GtkTreeViewColumnClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setFixedWidth_ = fn x1 & x2 => (_import "gtk_tree_view_column_set_fixed_width" : GtkTreeViewColumnClass.FFI.non_opt GtkTreeViewColumnClass.FFI.p * GInt32.FFI.val_ -> unit;) (x1, x2)
    val setMaxWidth_ = fn x1 & x2 => (_import "gtk_tree_view_column_set_max_width" : GtkTreeViewColumnClass.FFI.non_opt GtkTreeViewColumnClass.FFI.p * GInt32.FFI.val_ -> unit;) (x1, x2)
    val setMinWidth_ = fn x1 & x2 => (_import "gtk_tree_view_column_set_min_width" : GtkTreeViewColumnClass.FFI.non_opt GtkTreeViewColumnClass.FFI.p * GInt32.FFI.val_ -> unit;) (x1, x2)
    val setReorderable_ = fn x1 & x2 => (_import "gtk_tree_view_column_set_reorderable" : GtkTreeViewColumnClass.FFI.non_opt GtkTreeViewColumnClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setResizable_ = fn x1 & x2 => (_import "gtk_tree_view_column_set_resizable" : GtkTreeViewColumnClass.FFI.non_opt GtkTreeViewColumnClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setSizing_ = fn x1 & x2 => (_import "gtk_tree_view_column_set_sizing" : GtkTreeViewColumnClass.FFI.non_opt GtkTreeViewColumnClass.FFI.p * GtkTreeViewColumnSizing.FFI.val_ -> unit;) (x1, x2)
    val setSortColumnId_ = fn x1 & x2 => (_import "gtk_tree_view_column_set_sort_column_id" : GtkTreeViewColumnClass.FFI.non_opt GtkTreeViewColumnClass.FFI.p * GInt32.FFI.val_ -> unit;) (x1, x2)
    val setSortIndicator_ = fn x1 & x2 => (_import "gtk_tree_view_column_set_sort_indicator" : GtkTreeViewColumnClass.FFI.non_opt GtkTreeViewColumnClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setSortOrder_ = fn x1 & x2 => (_import "gtk_tree_view_column_set_sort_order" : GtkTreeViewColumnClass.FFI.non_opt GtkTreeViewColumnClass.FFI.p * GtkSortType.FFI.val_ -> unit;) (x1, x2)
    val setSpacing_ = fn x1 & x2 => (_import "gtk_tree_view_column_set_spacing" : GtkTreeViewColumnClass.FFI.non_opt GtkTreeViewColumnClass.FFI.p * GInt32.FFI.val_ -> unit;) (x1, x2)
    val setTitle_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_tree_view_column_set_title" :
              GtkTreeViewColumnClass.FFI.non_opt GtkTreeViewColumnClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setVisible_ = fn x1 & x2 => (_import "gtk_tree_view_column_set_visible" : GtkTreeViewColumnClass.FFI.non_opt GtkTreeViewColumnClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setWidget_ = fn x1 & x2 => (_import "gtk_tree_view_column_set_widget" : GtkTreeViewColumnClass.FFI.non_opt GtkTreeViewColumnClass.FFI.p * GtkWidgetClass.FFI.opt GtkWidgetClass.FFI.p -> unit;) (x1, x2)
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
    fun newWithArea area = (GtkCellAreaClass.FFI.withPtr false ---> GtkTreeViewColumnClass.FFI.fromPtr false) newWithArea_ area
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
    fun getButton self = (GtkTreeViewColumnClass.FFI.withPtr false ---> GtkWidgetClass.FFI.fromPtr false) getButton_ self
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
    fun getTitle self = (GtkTreeViewColumnClass.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getTitle_ self
    fun getTreeView self = (GtkTreeViewColumnClass.FFI.withPtr false ---> GtkWidgetClass.FFI.fromOptPtr false) getTreeView_ self
    fun getVisible self = (GtkTreeViewColumnClass.FFI.withPtr false ---> GBool.FFI.fromVal) getVisible_ self
    fun getWidget self = (GtkTreeViewColumnClass.FFI.withPtr false ---> GtkWidgetClass.FFI.fromOptPtr false) getWidget_ self
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
      open Property
    in
      val alignmentProp =
        {
          get = fn x => get "alignment" float x,
          set = fn x => set "alignment" float x,
          new = fn x => new "alignment" float x
        }
      val cellAreaProp =
        {
          get = fn x => get "cell-area" GtkCellAreaClass.tOpt x,
          new = fn x => new "cell-area" GtkCellAreaClass.tOpt x
        }
      val clickableProp =
        {
          get = fn x => get "clickable" boolean x,
          set = fn x => set "clickable" boolean x,
          new = fn x => new "clickable" boolean x
        }
      val expandProp =
        {
          get = fn x => get "expand" boolean x,
          set = fn x => set "expand" boolean x,
          new = fn x => new "expand" boolean x
        }
      val fixedWidthProp =
        {
          get = fn x => get "fixed-width" int x,
          set = fn x => set "fixed-width" int x,
          new = fn x => new "fixed-width" int x
        }
      val maxWidthProp =
        {
          get = fn x => get "max-width" int x,
          set = fn x => set "max-width" int x,
          new = fn x => new "max-width" int x
        }
      val minWidthProp =
        {
          get = fn x => get "min-width" int x,
          set = fn x => set "min-width" int x,
          new = fn x => new "min-width" int x
        }
      val reorderableProp =
        {
          get = fn x => get "reorderable" boolean x,
          set = fn x => set "reorderable" boolean x,
          new = fn x => new "reorderable" boolean x
        }
      val resizableProp =
        {
          get = fn x => get "resizable" boolean x,
          set = fn x => set "resizable" boolean x,
          new = fn x => new "resizable" boolean x
        }
      val sizingProp =
        {
          get = fn x => get "sizing" GtkTreeViewColumnSizing.t x,
          set = fn x => set "sizing" GtkTreeViewColumnSizing.t x,
          new = fn x => new "sizing" GtkTreeViewColumnSizing.t x
        }
      val sortColumnIdProp =
        {
          get = fn x => get "sort-column-id" int x,
          set = fn x => set "sort-column-id" int x,
          new = fn x => new "sort-column-id" int x
        }
      val sortIndicatorProp =
        {
          get = fn x => get "sort-indicator" boolean x,
          set = fn x => set "sort-indicator" boolean x,
          new = fn x => new "sort-indicator" boolean x
        }
      val sortOrderProp =
        {
          get = fn x => get "sort-order" GtkSortType.t x,
          set = fn x => set "sort-order" GtkSortType.t x,
          new = fn x => new "sort-order" GtkSortType.t x
        }
      val spacingProp =
        {
          get = fn x => get "spacing" int x,
          set = fn x => set "spacing" int x,
          new = fn x => new "spacing" int x
        }
      val titleProp =
        {
          get = fn x => get "title" stringOpt x,
          set = fn x => set "title" stringOpt x,
          new = fn x => new "title" stringOpt x
        }
      val visibleProp =
        {
          get = fn x => get "visible" boolean x,
          set = fn x => set "visible" boolean x,
          new = fn x => new "visible" boolean x
        }
      val widgetProp =
        {
          get = fn x => get "widget" GtkWidgetClass.tOpt x,
          set = fn x => set "widget" GtkWidgetClass.tOpt x,
          new = fn x => new "widget" GtkWidgetClass.tOpt x
        }
      val widthProp = {get = fn x => get "width" int x}
      val xOffsetProp = {get = fn x => get "x-offset" int x}
    end
  end
