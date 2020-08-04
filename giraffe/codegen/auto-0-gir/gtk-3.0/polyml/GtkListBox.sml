structure GtkListBox :>
  GTK_LIST_BOX
    where type 'a class = 'a GtkListBoxClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type 'a adjustment_class = 'a GtkAdjustmentClass.class
    where type 'a widget_class = 'a GtkWidgetClass.class
    where type movement_step_t = GtkMovementStep.t
    where type 'a list_box_row_class = 'a GtkListBoxRowClass.class
    where type selection_mode_t = GtkSelectionMode.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_list_box_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "gtk_list_box_new") (cVoid --> GtkWidgetClass.PolyML.cPtr)
      val dragHighlightRow_ = call (getSymbol "gtk_list_box_drag_highlight_row") (GtkListBoxClass.PolyML.cPtr &&> GtkListBoxRowClass.PolyML.cPtr --> cVoid)
      val dragUnhighlightRow_ = call (getSymbol "gtk_list_box_drag_unhighlight_row") (GtkListBoxClass.PolyML.cPtr --> cVoid)
      val getActivateOnSingleClick_ = call (getSymbol "gtk_list_box_get_activate_on_single_click") (GtkListBoxClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getAdjustment_ = call (getSymbol "gtk_list_box_get_adjustment") (GtkListBoxClass.PolyML.cPtr --> GtkAdjustmentClass.PolyML.cPtr)
      val getRowAtIndex_ = call (getSymbol "gtk_list_box_get_row_at_index") (GtkListBoxClass.PolyML.cPtr &&> GInt.PolyML.cVal --> GtkListBoxRowClass.PolyML.cOptPtr)
      val getRowAtY_ = call (getSymbol "gtk_list_box_get_row_at_y") (GtkListBoxClass.PolyML.cPtr &&> GInt.PolyML.cVal --> GtkListBoxRowClass.PolyML.cOptPtr)
      val getSelectedRow_ = call (getSymbol "gtk_list_box_get_selected_row") (GtkListBoxClass.PolyML.cPtr --> GtkListBoxRowClass.PolyML.cPtr)
      val getSelectionMode_ = call (getSymbol "gtk_list_box_get_selection_mode") (GtkListBoxClass.PolyML.cPtr --> GtkSelectionMode.PolyML.cVal)
      val insert_ =
        call (getSymbol "gtk_list_box_insert")
          (
            GtkListBoxClass.PolyML.cPtr
             &&> GtkWidgetClass.PolyML.cPtr
             &&> GInt.PolyML.cVal
             --> cVoid
          )
      val invalidateFilter_ = call (getSymbol "gtk_list_box_invalidate_filter") (GtkListBoxClass.PolyML.cPtr --> cVoid)
      val invalidateHeaders_ = call (getSymbol "gtk_list_box_invalidate_headers") (GtkListBoxClass.PolyML.cPtr --> cVoid)
      val invalidateSort_ = call (getSymbol "gtk_list_box_invalidate_sort") (GtkListBoxClass.PolyML.cPtr --> cVoid)
      val prepend_ = call (getSymbol "gtk_list_box_prepend") (GtkListBoxClass.PolyML.cPtr &&> GtkWidgetClass.PolyML.cPtr --> cVoid)
      val selectAll_ = call (getSymbol "gtk_list_box_select_all") (GtkListBoxClass.PolyML.cPtr --> cVoid)
      val selectRow_ = call (getSymbol "gtk_list_box_select_row") (GtkListBoxClass.PolyML.cPtr &&> GtkListBoxRowClass.PolyML.cOptPtr --> cVoid)
      val setActivateOnSingleClick_ = call (getSymbol "gtk_list_box_set_activate_on_single_click") (GtkListBoxClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setAdjustment_ = call (getSymbol "gtk_list_box_set_adjustment") (GtkListBoxClass.PolyML.cPtr &&> GtkAdjustmentClass.PolyML.cOptPtr --> cVoid)
      val setPlaceholder_ = call (getSymbol "gtk_list_box_set_placeholder") (GtkListBoxClass.PolyML.cPtr &&> GtkWidgetClass.PolyML.cOptPtr --> cVoid)
      val setSelectionMode_ = call (getSymbol "gtk_list_box_set_selection_mode") (GtkListBoxClass.PolyML.cPtr &&> GtkSelectionMode.PolyML.cVal --> cVoid)
      val unselectAll_ = call (getSymbol "gtk_list_box_unselect_all") (GtkListBoxClass.PolyML.cPtr --> cVoid)
      val unselectRow_ = call (getSymbol "gtk_list_box_unselect_row") (GtkListBoxClass.PolyML.cPtr &&> GtkListBoxRowClass.PolyML.cPtr --> cVoid)
    end
    type 'a class = 'a GtkListBoxClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type 'a adjustment_class = 'a GtkAdjustmentClass.class
    type 'a widget_class = 'a GtkWidgetClass.class
    type movement_step_t = GtkMovementStep.t
    type 'a list_box_row_class = 'a GtkListBoxRowClass.class
    type selection_mode_t = GtkSelectionMode.t
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr false ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr false ---> GtkBuildableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkListBoxClass.FFI.fromPtr false) new_ ()
    fun dragHighlightRow self row = (GtkListBoxClass.FFI.withPtr false &&&> GtkListBoxRowClass.FFI.withPtr false ---> I) dragHighlightRow_ (self & row)
    fun dragUnhighlightRow self = (GtkListBoxClass.FFI.withPtr false ---> I) dragUnhighlightRow_ self
    fun getActivateOnSingleClick self = (GtkListBoxClass.FFI.withPtr false ---> GBool.FFI.fromVal) getActivateOnSingleClick_ self
    fun getAdjustment self = (GtkListBoxClass.FFI.withPtr false ---> GtkAdjustmentClass.FFI.fromPtr false) getAdjustment_ self
    fun getRowAtIndex self index = (GtkListBoxClass.FFI.withPtr false &&&> GInt.FFI.withVal ---> GtkListBoxRowClass.FFI.fromOptPtr false) getRowAtIndex_ (self & index)
    fun getRowAtY self y = (GtkListBoxClass.FFI.withPtr false &&&> GInt.FFI.withVal ---> GtkListBoxRowClass.FFI.fromOptPtr false) getRowAtY_ (self & y)
    fun getSelectedRow self = (GtkListBoxClass.FFI.withPtr false ---> GtkListBoxRowClass.FFI.fromPtr false) getSelectedRow_ self
    fun getSelectionMode self = (GtkListBoxClass.FFI.withPtr false ---> GtkSelectionMode.FFI.fromVal) getSelectionMode_ self
    fun insert self (child, position) =
      (
        GtkListBoxClass.FFI.withPtr false
         &&&> GtkWidgetClass.FFI.withPtr false
         &&&> GInt.FFI.withVal
         ---> I
      )
        insert_
        (
          self
           & child
           & position
        )
    fun invalidateFilter self = (GtkListBoxClass.FFI.withPtr false ---> I) invalidateFilter_ self
    fun invalidateHeaders self = (GtkListBoxClass.FFI.withPtr false ---> I) invalidateHeaders_ self
    fun invalidateSort self = (GtkListBoxClass.FFI.withPtr false ---> I) invalidateSort_ self
    fun prepend self child = (GtkListBoxClass.FFI.withPtr false &&&> GtkWidgetClass.FFI.withPtr false ---> I) prepend_ (self & child)
    fun selectAll self = (GtkListBoxClass.FFI.withPtr false ---> I) selectAll_ self
    fun selectRow self row = (GtkListBoxClass.FFI.withPtr false &&&> GtkListBoxRowClass.FFI.withOptPtr false ---> I) selectRow_ (self & row)
    fun setActivateOnSingleClick self single = (GtkListBoxClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setActivateOnSingleClick_ (self & single)
    fun setAdjustment self adjustment = (GtkListBoxClass.FFI.withPtr false &&&> GtkAdjustmentClass.FFI.withOptPtr false ---> I) setAdjustment_ (self & adjustment)
    fun setPlaceholder self placeholder = (GtkListBoxClass.FFI.withPtr false &&&> GtkWidgetClass.FFI.withOptPtr false ---> I) setPlaceholder_ (self & placeholder)
    fun setSelectionMode self mode = (GtkListBoxClass.FFI.withPtr false &&&> GtkSelectionMode.FFI.withVal ---> I) setSelectionMode_ (self & mode)
    fun unselectAll self = (GtkListBoxClass.FFI.withPtr false ---> I) unselectAll_ self
    fun unselectRow self row = (GtkListBoxClass.FFI.withPtr false &&&> GtkListBoxRowClass.FFI.withPtr false ---> I) unselectRow_ (self & row)
    local
      open ClosureMarshal Signal
    in
      fun activateCursorRowSig f = signal "activate-cursor-row" (void ---> ret_void) f
      fun moveCursorSig f = signal "move-cursor" (get 0w1 GtkMovementStep.t &&&> get 0w2 int ---> ret_void) (fn object & p0 => f (object, p0))
      fun rowActivatedSig f = signal "row-activated" (get 0w1 GtkListBoxRowClass.t ---> ret_void) f
      fun rowSelectedSig f = signal "row-selected" (get 0w1 GtkListBoxRowClass.tOpt ---> ret_void) f
      fun selectAllSig f = signal "select-all" (void ---> ret_void) f
      fun selectedRowsChangedSig f = signal "selected-rows-changed" (void ---> ret_void) f
      fun toggleCursorRowSig f = signal "toggle-cursor-row" (void ---> ret_void) f
      fun unselectAllSig f = signal "unselect-all" (void ---> ret_void) f
    end
    local
      open Property
    in
      val activateOnSingleClickProp =
        {
          get = fn x => get "activate-on-single-click" boolean x,
          set = fn x => set "activate-on-single-click" boolean x,
          new = fn x => new "activate-on-single-click" boolean x
        }
      val selectionModeProp =
        {
          get = fn x => get "selection-mode" GtkSelectionMode.t x,
          set = fn x => set "selection-mode" GtkSelectionMode.t x,
          new = fn x => new "selection-mode" GtkSelectionMode.t x
        }
    end
  end
