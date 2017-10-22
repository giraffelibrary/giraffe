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
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_flow_box_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "gtk_flow_box_new") (cVoid --> GtkWidgetClass.PolyML.cPtr)
      val getActivateOnSingleClick_ = call (getSymbol "gtk_flow_box_get_activate_on_single_click") (GtkFlowBoxClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getChildAtIndex_ = call (getSymbol "gtk_flow_box_get_child_at_index") (GtkFlowBoxClass.PolyML.cPtr &&> GInt32.PolyML.cVal --> GtkFlowBoxChildClass.PolyML.cOptPtr)
      val getChildAtPos_ =
        call (getSymbol "gtk_flow_box_get_child_at_pos")
          (
            GtkFlowBoxClass.PolyML.cPtr
             &&> GInt32.PolyML.cVal
             &&> GInt32.PolyML.cVal
             --> GtkFlowBoxChildClass.PolyML.cOptPtr
          )
      val getColumnSpacing_ = call (getSymbol "gtk_flow_box_get_column_spacing") (GtkFlowBoxClass.PolyML.cPtr --> GUInt32.PolyML.cVal)
      val getHomogeneous_ = call (getSymbol "gtk_flow_box_get_homogeneous") (GtkFlowBoxClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getMaxChildrenPerLine_ = call (getSymbol "gtk_flow_box_get_max_children_per_line") (GtkFlowBoxClass.PolyML.cPtr --> GUInt32.PolyML.cVal)
      val getMinChildrenPerLine_ = call (getSymbol "gtk_flow_box_get_min_children_per_line") (GtkFlowBoxClass.PolyML.cPtr --> GUInt32.PolyML.cVal)
      val getRowSpacing_ = call (getSymbol "gtk_flow_box_get_row_spacing") (GtkFlowBoxClass.PolyML.cPtr --> GUInt32.PolyML.cVal)
      val getSelectionMode_ = call (getSymbol "gtk_flow_box_get_selection_mode") (GtkFlowBoxClass.PolyML.cPtr --> GtkSelectionMode.PolyML.cVal)
      val insert_ =
        call (getSymbol "gtk_flow_box_insert")
          (
            GtkFlowBoxClass.PolyML.cPtr
             &&> GtkWidgetClass.PolyML.cPtr
             &&> GInt32.PolyML.cVal
             --> cVoid
          )
      val invalidateFilter_ = call (getSymbol "gtk_flow_box_invalidate_filter") (GtkFlowBoxClass.PolyML.cPtr --> cVoid)
      val invalidateSort_ = call (getSymbol "gtk_flow_box_invalidate_sort") (GtkFlowBoxClass.PolyML.cPtr --> cVoid)
      val selectAll_ = call (getSymbol "gtk_flow_box_select_all") (GtkFlowBoxClass.PolyML.cPtr --> cVoid)
      val selectChild_ = call (getSymbol "gtk_flow_box_select_child") (GtkFlowBoxClass.PolyML.cPtr &&> GtkFlowBoxChildClass.PolyML.cPtr --> cVoid)
      val setActivateOnSingleClick_ = call (getSymbol "gtk_flow_box_set_activate_on_single_click") (GtkFlowBoxClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setColumnSpacing_ = call (getSymbol "gtk_flow_box_set_column_spacing") (GtkFlowBoxClass.PolyML.cPtr &&> GUInt32.PolyML.cVal --> cVoid)
      val setHadjustment_ = call (getSymbol "gtk_flow_box_set_hadjustment") (GtkFlowBoxClass.PolyML.cPtr &&> GtkAdjustmentClass.PolyML.cPtr --> cVoid)
      val setHomogeneous_ = call (getSymbol "gtk_flow_box_set_homogeneous") (GtkFlowBoxClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setMaxChildrenPerLine_ = call (getSymbol "gtk_flow_box_set_max_children_per_line") (GtkFlowBoxClass.PolyML.cPtr &&> GUInt32.PolyML.cVal --> cVoid)
      val setMinChildrenPerLine_ = call (getSymbol "gtk_flow_box_set_min_children_per_line") (GtkFlowBoxClass.PolyML.cPtr &&> GUInt32.PolyML.cVal --> cVoid)
      val setRowSpacing_ = call (getSymbol "gtk_flow_box_set_row_spacing") (GtkFlowBoxClass.PolyML.cPtr &&> GUInt32.PolyML.cVal --> cVoid)
      val setSelectionMode_ = call (getSymbol "gtk_flow_box_set_selection_mode") (GtkFlowBoxClass.PolyML.cPtr &&> GtkSelectionMode.PolyML.cVal --> cVoid)
      val setVadjustment_ = call (getSymbol "gtk_flow_box_set_vadjustment") (GtkFlowBoxClass.PolyML.cPtr &&> GtkAdjustmentClass.PolyML.cPtr --> cVoid)
      val unselectAll_ = call (getSymbol "gtk_flow_box_unselect_all") (GtkFlowBoxClass.PolyML.cPtr --> cVoid)
      val unselectChild_ = call (getSymbol "gtk_flow_box_unselect_child") (GtkFlowBoxClass.PolyML.cPtr &&> GtkFlowBoxChildClass.PolyML.cPtr --> cVoid)
    end
    type 'a class = 'a GtkFlowBoxClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type 'a orientable_class = 'a GtkOrientableClass.class
    type 'a widget_class = 'a GtkWidgetClass.class
    type 'a adjustment_class = 'a GtkAdjustmentClass.class
    type 'a flow_box_child_class = 'a GtkFlowBoxChildClass.class
    type movement_step_t = GtkMovementStep.t
    type selection_mode_t = GtkSelectionMode.t
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr ---> GtkBuildableClass.FFI.fromPtr false) I self
    fun asOrientable self = (GObjectObjectClass.FFI.withPtr ---> GtkOrientableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkFlowBoxClass.FFI.fromPtr false) new_ ()
    fun getActivateOnSingleClick self = (GtkFlowBoxClass.FFI.withPtr ---> GBool.FFI.fromVal) getActivateOnSingleClick_ self
    fun getChildAtIndex self idx = (GtkFlowBoxClass.FFI.withPtr &&&> GInt32.FFI.withVal ---> GtkFlowBoxChildClass.FFI.fromOptPtr false) getChildAtIndex_ (self & idx)
    fun getChildAtPos self (x, y) =
      (
        GtkFlowBoxClass.FFI.withPtr
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         ---> GtkFlowBoxChildClass.FFI.fromOptPtr false
      )
        getChildAtPos_
        (
          self
           & x
           & y
        )
    fun getColumnSpacing self = (GtkFlowBoxClass.FFI.withPtr ---> GUInt32.FFI.fromVal) getColumnSpacing_ self
    fun getHomogeneous self = (GtkFlowBoxClass.FFI.withPtr ---> GBool.FFI.fromVal) getHomogeneous_ self
    fun getMaxChildrenPerLine self = (GtkFlowBoxClass.FFI.withPtr ---> GUInt32.FFI.fromVal) getMaxChildrenPerLine_ self
    fun getMinChildrenPerLine self = (GtkFlowBoxClass.FFI.withPtr ---> GUInt32.FFI.fromVal) getMinChildrenPerLine_ self
    fun getRowSpacing self = (GtkFlowBoxClass.FFI.withPtr ---> GUInt32.FFI.fromVal) getRowSpacing_ self
    fun getSelectionMode self = (GtkFlowBoxClass.FFI.withPtr ---> GtkSelectionMode.FFI.fromVal) getSelectionMode_ self
    fun insert self (widget, position) =
      (
        GtkFlowBoxClass.FFI.withPtr
         &&&> GtkWidgetClass.FFI.withPtr
         &&&> GInt32.FFI.withVal
         ---> I
      )
        insert_
        (
          self
           & widget
           & position
        )
    fun invalidateFilter self = (GtkFlowBoxClass.FFI.withPtr ---> I) invalidateFilter_ self
    fun invalidateSort self = (GtkFlowBoxClass.FFI.withPtr ---> I) invalidateSort_ self
    fun selectAll self = (GtkFlowBoxClass.FFI.withPtr ---> I) selectAll_ self
    fun selectChild self child = (GtkFlowBoxClass.FFI.withPtr &&&> GtkFlowBoxChildClass.FFI.withPtr ---> I) selectChild_ (self & child)
    fun setActivateOnSingleClick self single = (GtkFlowBoxClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setActivateOnSingleClick_ (self & single)
    fun setColumnSpacing self spacing = (GtkFlowBoxClass.FFI.withPtr &&&> GUInt32.FFI.withVal ---> I) setColumnSpacing_ (self & spacing)
    fun setHadjustment self adjustment = (GtkFlowBoxClass.FFI.withPtr &&&> GtkAdjustmentClass.FFI.withPtr ---> I) setHadjustment_ (self & adjustment)
    fun setHomogeneous self homogeneous = (GtkFlowBoxClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setHomogeneous_ (self & homogeneous)
    fun setMaxChildrenPerLine self nChildren = (GtkFlowBoxClass.FFI.withPtr &&&> GUInt32.FFI.withVal ---> I) setMaxChildrenPerLine_ (self & nChildren)
    fun setMinChildrenPerLine self nChildren = (GtkFlowBoxClass.FFI.withPtr &&&> GUInt32.FFI.withVal ---> I) setMinChildrenPerLine_ (self & nChildren)
    fun setRowSpacing self spacing = (GtkFlowBoxClass.FFI.withPtr &&&> GUInt32.FFI.withVal ---> I) setRowSpacing_ (self & spacing)
    fun setSelectionMode self mode = (GtkFlowBoxClass.FFI.withPtr &&&> GtkSelectionMode.FFI.withVal ---> I) setSelectionMode_ (self & mode)
    fun setVadjustment self adjustment = (GtkFlowBoxClass.FFI.withPtr &&&> GtkAdjustmentClass.FFI.withPtr ---> I) setVadjustment_ (self & adjustment)
    fun unselectAll self = (GtkFlowBoxClass.FFI.withPtr ---> I) unselectAll_ self
    fun unselectChild self child = (GtkFlowBoxClass.FFI.withPtr &&&> GtkFlowBoxChildClass.FFI.withPtr ---> I) unselectChild_ (self & child)
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
      open Property
    in
      val activateOnSingleClickProp =
        {
          get = fn x => get "activate-on-single-click" boolean x,
          set = fn x => set "activate-on-single-click" boolean x
        }
      val columnSpacingProp =
        {
          get = fn x => get "column-spacing" uint x,
          set = fn x => set "column-spacing" uint x
        }
      val homogeneousProp =
        {
          get = fn x => get "homogeneous" boolean x,
          set = fn x => set "homogeneous" boolean x
        }
      val maxChildrenPerLineProp =
        {
          get = fn x => get "max-children-per-line" uint x,
          set = fn x => set "max-children-per-line" uint x
        }
      val minChildrenPerLineProp =
        {
          get = fn x => get "min-children-per-line" uint x,
          set = fn x => set "min-children-per-line" uint x
        }
      val rowSpacingProp =
        {
          get = fn x => get "row-spacing" uint x,
          set = fn x => set "row-spacing" uint x
        }
      val selectionModeProp =
        {
          get = fn x => get "selection-mode" GtkSelectionMode.t x,
          set = fn x => set "selection-mode" GtkSelectionMode.t x
        }
    end
  end
