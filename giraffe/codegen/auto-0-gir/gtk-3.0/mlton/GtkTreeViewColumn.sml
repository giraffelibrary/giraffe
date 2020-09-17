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
               * GInt.FFI.val_
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
               * GInt.FFI.ref_
               * GInt.FFI.ref_
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
               * GInt.FFI.ref_
               * GInt.FFI.ref_
               * GInt.FFI.ref_
               * GInt.FFI.ref_
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
    val getFixedWidth_ = _import "gtk_tree_view_column_get_fixed_width" : GtkTreeViewColumnClass.FFI.non_opt GtkTreeViewColumnClass.FFI.p -> GInt.FFI.val_;
    val getMaxWidth_ = _import "gtk_tree_view_column_get_max_width" : GtkTreeViewColumnClass.FFI.non_opt GtkTreeViewColumnClass.FFI.p -> GInt.FFI.val_;
    val getMinWidth_ = _import "gtk_tree_view_column_get_min_width" : GtkTreeViewColumnClass.FFI.non_opt GtkTreeViewColumnClass.FFI.p -> GInt.FFI.val_;
    val getReorderable_ = _import "gtk_tree_view_column_get_reorderable" : GtkTreeViewColumnClass.FFI.non_opt GtkTreeViewColumnClass.FFI.p -> GBool.FFI.val_;
    val getResizable_ = _import "gtk_tree_view_column_get_resizable" : GtkTreeViewColumnClass.FFI.non_opt GtkTreeViewColumnClass.FFI.p -> GBool.FFI.val_;
    val getSizing_ = _import "gtk_tree_view_column_get_sizing" : GtkTreeViewColumnClass.FFI.non_opt GtkTreeViewColumnClass.FFI.p -> GtkTreeViewColumnSizing.FFI.val_;
    val getSortColumnId_ = _import "gtk_tree_view_column_get_sort_column_id" : GtkTreeViewColumnClass.FFI.non_opt GtkTreeViewColumnClass.FFI.p -> GInt.FFI.val_;
    val getSortIndicator_ = _import "gtk_tree_view_column_get_sort_indicator" : GtkTreeViewColumnClass.FFI.non_opt GtkTreeViewColumnClass.FFI.p -> GBool.FFI.val_;
    val getSortOrder_ = _import "gtk_tree_view_column_get_sort_order" : GtkTreeViewColumnClass.FFI.non_opt GtkTreeViewColumnClass.FFI.p -> GtkSortType.FFI.val_;
    val getSpacing_ = _import "gtk_tree_view_column_get_spacing" : GtkTreeViewColumnClass.FFI.non_opt GtkTreeViewColumnClass.FFI.p -> GInt.FFI.val_;
    val getTitle_ = _import "gtk_tree_view_column_get_title" : GtkTreeViewColumnClass.FFI.non_opt GtkTreeViewColumnClass.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val getTreeView_ = _import "gtk_tree_view_column_get_tree_view" : GtkTreeViewColumnClass.FFI.non_opt GtkTreeViewColumnClass.FFI.p -> GtkWidgetClass.FFI.opt GtkWidgetClass.FFI.p;
    val getVisible_ = _import "gtk_tree_view_column_get_visible" : GtkTreeViewColumnClass.FFI.non_opt GtkTreeViewColumnClass.FFI.p -> GBool.FFI.val_;
    val getWidget_ = _import "gtk_tree_view_column_get_widget" : GtkTreeViewColumnClass.FFI.non_opt GtkTreeViewColumnClass.FFI.p -> GtkWidgetClass.FFI.opt GtkWidgetClass.FFI.p;
    val getWidth_ = _import "gtk_tree_view_column_get_width" : GtkTreeViewColumnClass.FFI.non_opt GtkTreeViewColumnClass.FFI.p -> GInt.FFI.val_;
    val getXOffset_ = _import "gtk_tree_view_column_get_x_offset" : GtkTreeViewColumnClass.FFI.non_opt GtkTreeViewColumnClass.FFI.p -> GInt.FFI.val_;
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
    val setFixedWidth_ = fn x1 & x2 => (_import "gtk_tree_view_column_set_fixed_width" : GtkTreeViewColumnClass.FFI.non_opt GtkTreeViewColumnClass.FFI.p * GInt.FFI.val_ -> unit;) (x1, x2)
    val setMaxWidth_ = fn x1 & x2 => (_import "gtk_tree_view_column_set_max_width" : GtkTreeViewColumnClass.FFI.non_opt GtkTreeViewColumnClass.FFI.p * GInt.FFI.val_ -> unit;) (x1, x2)
    val setMinWidth_ = fn x1 & x2 => (_import "gtk_tree_view_column_set_min_width" : GtkTreeViewColumnClass.FFI.non_opt GtkTreeViewColumnClass.FFI.p * GInt.FFI.val_ -> unit;) (x1, x2)
    val setReorderable_ = fn x1 & x2 => (_import "gtk_tree_view_column_set_reorderable" : GtkTreeViewColumnClass.FFI.non_opt GtkTreeViewColumnClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setResizable_ = fn x1 & x2 => (_import "gtk_tree_view_column_set_resizable" : GtkTreeViewColumnClass.FFI.non_opt GtkTreeViewColumnClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setSizing_ = fn x1 & x2 => (_import "gtk_tree_view_column_set_sizing" : GtkTreeViewColumnClass.FFI.non_opt GtkTreeViewColumnClass.FFI.p * GtkTreeViewColumnSizing.FFI.val_ -> unit;) (x1, x2)
    val setSortColumnId_ = fn x1 & x2 => (_import "gtk_tree_view_column_set_sort_column_id" : GtkTreeViewColumnClass.FFI.non_opt GtkTreeViewColumnClass.FFI.p * GInt.FFI.val_ -> unit;) (x1, x2)
    val setSortIndicator_ = fn x1 & x2 => (_import "gtk_tree_view_column_set_sort_indicator" : GtkTreeViewColumnClass.FFI.non_opt GtkTreeViewColumnClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setSortOrder_ = fn x1 & x2 => (_import "gtk_tree_view_column_set_sort_order" : GtkTreeViewColumnClass.FFI.non_opt GtkTreeViewColumnClass.FFI.p * GtkSortType.FFI.val_ -> unit;) (x1, x2)
    val setSpacing_ = fn x1 & x2 => (_import "gtk_tree_view_column_set_spacing" : GtkTreeViewColumnClass.FFI.non_opt GtkTreeViewColumnClass.FFI.p * GInt.FFI.val_ -> unit;) (x1, x2)
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
            GtkTreeViewColumnClass.FFI.withPtr false
             &&&> GtkCellRendererClass.FFI.withPtr false
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
            GtkTreeViewColumnClass.FFI.withPtr false
             &&&> GdkRectangleRecord.FFI.withOptPtr false
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
    fun getFixedWidth self = (GtkTreeViewColumnClass.FFI.withPtr false ---> GInt.FFI.fromVal) getFixedWidth_ self
    fun getMaxWidth self = (GtkTreeViewColumnClass.FFI.withPtr false ---> GInt.FFI.fromVal) getMaxWidth_ self
    fun getMinWidth self = (GtkTreeViewColumnClass.FFI.withPtr false ---> GInt.FFI.fromVal) getMinWidth_ self
    fun getReorderable self = (GtkTreeViewColumnClass.FFI.withPtr false ---> GBool.FFI.fromVal) getReorderable_ self
    fun getResizable self = (GtkTreeViewColumnClass.FFI.withPtr false ---> GBool.FFI.fromVal) getResizable_ self
    fun getSizing self = (GtkTreeViewColumnClass.FFI.withPtr false ---> GtkTreeViewColumnSizing.FFI.fromVal) getSizing_ self
    fun getSortColumnId self = (GtkTreeViewColumnClass.FFI.withPtr false ---> GInt.FFI.fromVal) getSortColumnId_ self
    fun getSortIndicator self = (GtkTreeViewColumnClass.FFI.withPtr false ---> GBool.FFI.fromVal) getSortIndicator_ self
    fun getSortOrder self = (GtkTreeViewColumnClass.FFI.withPtr false ---> GtkSortType.FFI.fromVal) getSortOrder_ self
    fun getSpacing self = (GtkTreeViewColumnClass.FFI.withPtr false ---> GInt.FFI.fromVal) getSpacing_ self
    fun getTitle self = (GtkTreeViewColumnClass.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getTitle_ self before GtkTreeViewColumnClass.FFI.touchPtr self
    fun getTreeView self = (GtkTreeViewColumnClass.FFI.withPtr false ---> GtkWidgetClass.FFI.fromOptPtr false) getTreeView_ self before GtkTreeViewColumnClass.FFI.touchPtr self
    fun getVisible self = (GtkTreeViewColumnClass.FFI.withPtr false ---> GBool.FFI.fromVal) getVisible_ self
    fun getWidget self = (GtkTreeViewColumnClass.FFI.withPtr false ---> GtkWidgetClass.FFI.fromOptPtr false) getWidget_ self before GtkTreeViewColumnClass.FFI.touchPtr self
    fun getWidth self = (GtkTreeViewColumnClass.FFI.withPtr false ---> GInt.FFI.fromVal) getWidth_ self
    fun getXOffset self = (GtkTreeViewColumnClass.FFI.withPtr false ---> GInt.FFI.fromVal) getXOffset_ self
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
    fun setFixedWidth self fixedWidth = (GtkTreeViewColumnClass.FFI.withPtr false &&&> GInt.FFI.withVal ---> I) setFixedWidth_ (self & fixedWidth)
    fun setMaxWidth self maxWidth = (GtkTreeViewColumnClass.FFI.withPtr false &&&> GInt.FFI.withVal ---> I) setMaxWidth_ (self & maxWidth)
    fun setMinWidth self minWidth = (GtkTreeViewColumnClass.FFI.withPtr false &&&> GInt.FFI.withVal ---> I) setMinWidth_ (self & minWidth)
    fun setReorderable self reorderable = (GtkTreeViewColumnClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setReorderable_ (self & reorderable)
    fun setResizable self resizable = (GtkTreeViewColumnClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setResizable_ (self & resizable)
    fun setSizing self type' = (GtkTreeViewColumnClass.FFI.withPtr false &&&> GtkTreeViewColumnSizing.FFI.withVal ---> I) setSizing_ (self & type')
    fun setSortColumnId self sortColumnId = (GtkTreeViewColumnClass.FFI.withPtr false &&&> GInt.FFI.withVal ---> I) setSortColumnId_ (self & sortColumnId)
    fun setSortIndicator self setting = (GtkTreeViewColumnClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setSortIndicator_ (self & setting)
    fun setSortOrder self order = (GtkTreeViewColumnClass.FFI.withPtr false &&&> GtkSortType.FFI.withVal ---> I) setSortOrder_ (self & order)
    fun setSpacing self spacing = (GtkTreeViewColumnClass.FFI.withPtr false &&&> GInt.FFI.withVal ---> I) setSpacing_ (self & spacing)
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
