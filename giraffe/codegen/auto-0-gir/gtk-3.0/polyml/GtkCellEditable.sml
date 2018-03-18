structure GtkCellEditable :>
  GTK_CELL_EDITABLE
    where type 'a class = 'a GtkCellEditableClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_cell_editable_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val editingDone_ = call (getSymbol "gtk_cell_editable_editing_done") (GtkCellEditableClass.PolyML.cPtr --> cVoid)
      val removeWidget_ = call (getSymbol "gtk_cell_editable_remove_widget") (GtkCellEditableClass.PolyML.cPtr --> cVoid)
      val startEditing_ = call (getSymbol "gtk_cell_editable_start_editing") (GtkCellEditableClass.PolyML.cPtr &&> GdkEvent.PolyML.cOptPtr --> cVoid)
    end
    type 'a class = 'a GtkCellEditableClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun editingDone self = (GtkCellEditableClass.FFI.withPtr ---> I) editingDone_ self
    fun removeWidget self = (GtkCellEditableClass.FFI.withPtr ---> I) removeWidget_ self
    fun startEditing self event = (GtkCellEditableClass.FFI.withPtr &&&> GdkEvent.FFI.withOptPtr ---> I) startEditing_ (self & event)
    local
      open ClosureMarshal Signal
    in
      fun editingDoneSig f = signal "editing-done" (void ---> ret_void) f
      fun removeWidgetSig f = signal "remove-widget" (void ---> ret_void) f
    end
    local
      open Property
    in
      val editingCanceledProp =
        {
          get = fn x => get "editing-canceled" boolean x,
          set = fn x => set "editing-canceled" boolean x,
          new = fn x => new "editing-canceled" boolean x
        }
    end
  end
