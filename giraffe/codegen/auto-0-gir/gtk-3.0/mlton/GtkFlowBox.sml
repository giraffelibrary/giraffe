structure GtkFlowBox :>
  GTK_FLOW_BOX
    where type 'a class = 'a GtkFlowBoxClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type 'a orientable_class = 'a GtkOrientableClass.class
    where type 'a widget_class = 'a GtkWidgetClass.class
    where type 'a adjustment_class = 'a GtkAdjustmentClass.class
    where type 'a flow_box_child_class = 'a GtkFlowBoxChildClass.class
    where type movement_step_t = GtkMovementStep.t
    where type selection_mode_t = GtkSelectionMode.t =
  struct
    val getType_ = _import "gtk_flow_box_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "gtk_flow_box_new" : unit -> GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p;
    val getActivateOnSingleClick_ = _import "gtk_flow_box_get_activate_on_single_click" : GtkFlowBoxClass.FFI.non_opt GtkFlowBoxClass.FFI.p -> GBool.FFI.val_;
    val getChildAtIndex_ = fn x1 & x2 => (_import "gtk_flow_box_get_child_at_index" : GtkFlowBoxClass.FFI.non_opt GtkFlowBoxClass.FFI.p * GInt.FFI.val_ -> GtkFlowBoxChildClass.FFI.opt GtkFlowBoxChildClass.FFI.p;) (x1, x2)
    val getChildAtPos_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_flow_box_get_child_at_pos" :
              GtkFlowBoxClass.FFI.non_opt GtkFlowBoxClass.FFI.p
               * GInt.FFI.val_
               * GInt.FFI.val_
               -> GtkFlowBoxChildClass.FFI.opt GtkFlowBoxChildClass.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    val getColumnSpacing_ = _import "gtk_flow_box_get_column_spacing" : GtkFlowBoxClass.FFI.non_opt GtkFlowBoxClass.FFI.p -> GUInt.FFI.val_;
    val getHomogeneous_ = _import "gtk_flow_box_get_homogeneous" : GtkFlowBoxClass.FFI.non_opt GtkFlowBoxClass.FFI.p -> GBool.FFI.val_;
    val getMaxChildrenPerLine_ = _import "gtk_flow_box_get_max_children_per_line" : GtkFlowBoxClass.FFI.non_opt GtkFlowBoxClass.FFI.p -> GUInt.FFI.val_;
    val getMinChildrenPerLine_ = _import "gtk_flow_box_get_min_children_per_line" : GtkFlowBoxClass.FFI.non_opt GtkFlowBoxClass.FFI.p -> GUInt.FFI.val_;
    val getRowSpacing_ = _import "gtk_flow_box_get_row_spacing" : GtkFlowBoxClass.FFI.non_opt GtkFlowBoxClass.FFI.p -> GUInt.FFI.val_;
    val getSelectionMode_ = _import "gtk_flow_box_get_selection_mode" : GtkFlowBoxClass.FFI.non_opt GtkFlowBoxClass.FFI.p -> GtkSelectionMode.FFI.val_;
    val insert_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_flow_box_insert" :
              GtkFlowBoxClass.FFI.non_opt GtkFlowBoxClass.FFI.p
               * GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p
               * GInt.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val invalidateFilter_ = _import "gtk_flow_box_invalidate_filter" : GtkFlowBoxClass.FFI.non_opt GtkFlowBoxClass.FFI.p -> unit;
    val invalidateSort_ = _import "gtk_flow_box_invalidate_sort" : GtkFlowBoxClass.FFI.non_opt GtkFlowBoxClass.FFI.p -> unit;
    val selectAll_ = _import "gtk_flow_box_select_all" : GtkFlowBoxClass.FFI.non_opt GtkFlowBoxClass.FFI.p -> unit;
    val selectChild_ = fn x1 & x2 => (_import "gtk_flow_box_select_child" : GtkFlowBoxClass.FFI.non_opt GtkFlowBoxClass.FFI.p * GtkFlowBoxChildClass.FFI.non_opt GtkFlowBoxChildClass.FFI.p -> unit;) (x1, x2)
    val setActivateOnSingleClick_ = fn x1 & x2 => (_import "gtk_flow_box_set_activate_on_single_click" : GtkFlowBoxClass.FFI.non_opt GtkFlowBoxClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setColumnSpacing_ = fn x1 & x2 => (_import "gtk_flow_box_set_column_spacing" : GtkFlowBoxClass.FFI.non_opt GtkFlowBoxClass.FFI.p * GUInt.FFI.val_ -> unit;) (x1, x2)
    val setHadjustment_ = fn x1 & x2 => (_import "gtk_flow_box_set_hadjustment" : GtkFlowBoxClass.FFI.non_opt GtkFlowBoxClass.FFI.p * GtkAdjustmentClass.FFI.non_opt GtkAdjustmentClass.FFI.p -> unit;) (x1, x2)
    val setHomogeneous_ = fn x1 & x2 => (_import "gtk_flow_box_set_homogeneous" : GtkFlowBoxClass.FFI.non_opt GtkFlowBoxClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setMaxChildrenPerLine_ = fn x1 & x2 => (_import "gtk_flow_box_set_max_children_per_line" : GtkFlowBoxClass.FFI.non_opt GtkFlowBoxClass.FFI.p * GUInt.FFI.val_ -> unit;) (x1, x2)
    val setMinChildrenPerLine_ = fn x1 & x2 => (_import "gtk_flow_box_set_min_children_per_line" : GtkFlowBoxClass.FFI.non_opt GtkFlowBoxClass.FFI.p * GUInt.FFI.val_ -> unit;) (x1, x2)
    val setRowSpacing_ = fn x1 & x2 => (_import "gtk_flow_box_set_row_spacing" : GtkFlowBoxClass.FFI.non_opt GtkFlowBoxClass.FFI.p * GUInt.FFI.val_ -> unit;) (x1, x2)
    val setSelectionMode_ = fn x1 & x2 => (_import "gtk_flow_box_set_selection_mode" : GtkFlowBoxClass.FFI.non_opt GtkFlowBoxClass.FFI.p * GtkSelectionMode.FFI.val_ -> unit;) (x1, x2)
    val setVadjustment_ = fn x1 & x2 => (_import "gtk_flow_box_set_vadjustment" : GtkFlowBoxClass.FFI.non_opt GtkFlowBoxClass.FFI.p * GtkAdjustmentClass.FFI.non_opt GtkAdjustmentClass.FFI.p -> unit;) (x1, x2)
    val unselectAll_ = _import "gtk_flow_box_unselect_all" : GtkFlowBoxClass.FFI.non_opt GtkFlowBoxClass.FFI.p -> unit;
    val unselectChild_ = fn x1 & x2 => (_import "gtk_flow_box_unselect_child" : GtkFlowBoxClass.FFI.non_opt GtkFlowBoxClass.FFI.p * GtkFlowBoxChildClass.FFI.non_opt GtkFlowBoxChildClass.FFI.p -> unit;) (x1, x2)
    type 'a class = 'a GtkFlowBoxClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type 'a orientable_class = 'a GtkOrientableClass.class
    type 'a widget_class = 'a GtkWidgetClass.class
    type 'a adjustment_class = 'a GtkAdjustmentClass.class
    type 'a flow_box_child_class = 'a GtkFlowBoxChildClass.class
    type movement_step_t = GtkMovementStep.t
    type selection_mode_t = GtkSelectionMode.t
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr false ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr false ---> GtkBuildableClass.FFI.fromPtr false) I self
    fun asOrientable self = (GObjectObjectClass.FFI.withPtr false ---> GtkOrientableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkFlowBoxClass.FFI.fromPtr false) new_ ()
    fun getActivateOnSingleClick self = (GtkFlowBoxClass.FFI.withPtr false ---> GBool.FFI.fromVal) getActivateOnSingleClick_ self
    fun getChildAtIndex self idx = (GtkFlowBoxClass.FFI.withPtr false &&&> GInt.FFI.withVal ---> GtkFlowBoxChildClass.FFI.fromOptPtr false) getChildAtIndex_ (self & idx)
    fun getChildAtPos self (x, y) =
      (
        GtkFlowBoxClass.FFI.withPtr false
         &&&> GInt.FFI.withVal
         &&&> GInt.FFI.withVal
         ---> GtkFlowBoxChildClass.FFI.fromOptPtr false
      )
        getChildAtPos_
        (
          self
           & x
           & y
        )
    fun getColumnSpacing self = (GtkFlowBoxClass.FFI.withPtr false ---> GUInt.FFI.fromVal) getColumnSpacing_ self
    fun getHomogeneous self = (GtkFlowBoxClass.FFI.withPtr false ---> GBool.FFI.fromVal) getHomogeneous_ self
    fun getMaxChildrenPerLine self = (GtkFlowBoxClass.FFI.withPtr false ---> GUInt.FFI.fromVal) getMaxChildrenPerLine_ self
    fun getMinChildrenPerLine self = (GtkFlowBoxClass.FFI.withPtr false ---> GUInt.FFI.fromVal) getMinChildrenPerLine_ self
    fun getRowSpacing self = (GtkFlowBoxClass.FFI.withPtr false ---> GUInt.FFI.fromVal) getRowSpacing_ self
    fun getSelectionMode self = (GtkFlowBoxClass.FFI.withPtr false ---> GtkSelectionMode.FFI.fromVal) getSelectionMode_ self
    fun insert self (widget, position) =
      (
        GtkFlowBoxClass.FFI.withPtr false
         &&&> GtkWidgetClass.FFI.withPtr false
         &&&> GInt.FFI.withVal
         ---> I
      )
        insert_
        (
          self
           & widget
           & position
        )
    fun invalidateFilter self = (GtkFlowBoxClass.FFI.withPtr false ---> I) invalidateFilter_ self
    fun invalidateSort self = (GtkFlowBoxClass.FFI.withPtr false ---> I) invalidateSort_ self
    fun selectAll self = (GtkFlowBoxClass.FFI.withPtr false ---> I) selectAll_ self
    fun selectChild self child = (GtkFlowBoxClass.FFI.withPtr false &&&> GtkFlowBoxChildClass.FFI.withPtr false ---> I) selectChild_ (self & child)
    fun setActivateOnSingleClick self single = (GtkFlowBoxClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setActivateOnSingleClick_ (self & single)
    fun setColumnSpacing self spacing = (GtkFlowBoxClass.FFI.withPtr false &&&> GUInt.FFI.withVal ---> I) setColumnSpacing_ (self & spacing)
    fun setHadjustment self adjustment = (GtkFlowBoxClass.FFI.withPtr false &&&> GtkAdjustmentClass.FFI.withPtr false ---> I) setHadjustment_ (self & adjustment)
    fun setHomogeneous self homogeneous = (GtkFlowBoxClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setHomogeneous_ (self & homogeneous)
    fun setMaxChildrenPerLine self nChildren = (GtkFlowBoxClass.FFI.withPtr false &&&> GUInt.FFI.withVal ---> I) setMaxChildrenPerLine_ (self & nChildren)
    fun setMinChildrenPerLine self nChildren = (GtkFlowBoxClass.FFI.withPtr false &&&> GUInt.FFI.withVal ---> I) setMinChildrenPerLine_ (self & nChildren)
    fun setRowSpacing self spacing = (GtkFlowBoxClass.FFI.withPtr false &&&> GUInt.FFI.withVal ---> I) setRowSpacing_ (self & spacing)
    fun setSelectionMode self mode = (GtkFlowBoxClass.FFI.withPtr false &&&> GtkSelectionMode.FFI.withVal ---> I) setSelectionMode_ (self & mode)
    fun setVadjustment self adjustment = (GtkFlowBoxClass.FFI.withPtr false &&&> GtkAdjustmentClass.FFI.withPtr false ---> I) setVadjustment_ (self & adjustment)
    fun unselectAll self = (GtkFlowBoxClass.FFI.withPtr false ---> I) unselectAll_ self
    fun unselectChild self child = (GtkFlowBoxClass.FFI.withPtr false &&&> GtkFlowBoxChildClass.FFI.withPtr false ---> I) unselectChild_ (self & child)
    local
      open ClosureMarshal Signal
    in
      fun activateCursorChildSig f = signal "activate-cursor-child" (void ---> ret_void) f
      fun childActivatedSig f = signal "child-activated" (get 0w1 GtkFlowBoxChildClass.t ---> ret_void) f
      fun moveCursorSig f = signal "move-cursor" (get 0w1 GtkMovementStep.t &&&> get 0w2 int ---> ret boolean) (fn step & count => f (step, count))
      fun selectAllSig f = signal "select-all" (void ---> ret_void) f
      fun selectedChildrenChangedSig f = signal "selected-children-changed" (void ---> ret_void) f
      fun toggleCursorChildSig f = signal "toggle-cursor-child" (void ---> ret_void) f
      fun unselectAllSig f = signal "unselect-all" (void ---> ret_void) f
    end
    local
      open ValueAccessor
    in
      val activateOnSingleClickProp =
        {
          name = "activate-on-single-click",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val columnSpacingProp =
        {
          name = "column-spacing",
          gtype = fn () => C.gtype uint (),
          get = fn x => fn () => C.get uint x,
          set = fn x => C.set uint x,
          init = fn x => C.set uint x
        }
      val homogeneousProp =
        {
          name = "homogeneous",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val maxChildrenPerLineProp =
        {
          name = "max-children-per-line",
          gtype = fn () => C.gtype uint (),
          get = fn x => fn () => C.get uint x,
          set = fn x => C.set uint x,
          init = fn x => C.set uint x
        }
      val minChildrenPerLineProp =
        {
          name = "min-children-per-line",
          gtype = fn () => C.gtype uint (),
          get = fn x => fn () => C.get uint x,
          set = fn x => C.set uint x,
          init = fn x => C.set uint x
        }
      val rowSpacingProp =
        {
          name = "row-spacing",
          gtype = fn () => C.gtype uint (),
          get = fn x => fn () => C.get uint x,
          set = fn x => C.set uint x,
          init = fn x => C.set uint x
        }
      val selectionModeProp =
        {
          name = "selection-mode",
          gtype = fn () => C.gtype GtkSelectionMode.t (),
          get = fn x => fn () => C.get GtkSelectionMode.t x,
          set = fn x => C.set GtkSelectionMode.t x,
          init = fn x => C.set GtkSelectionMode.t x
        }
    end
  end
