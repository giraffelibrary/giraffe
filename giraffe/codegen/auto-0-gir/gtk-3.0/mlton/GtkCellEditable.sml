structure GtkCellEditable :>
  GTK_CELL_EDITABLE
    where type 'a class = 'a GtkCellEditableClass.class =
  struct
    val getType_ = _import "gtk_cell_editable_get_type" : unit -> GObjectType.C.val_;
    val editingDone_ = _import "gtk_cell_editable_editing_done" : GtkCellEditableClass.C.notnull GtkCellEditableClass.C.p -> unit;
    val removeWidget_ = _import "gtk_cell_editable_remove_widget" : GtkCellEditableClass.C.notnull GtkCellEditableClass.C.p -> unit;
    val startEditing_ = fn x1 & x2 => (_import "gtk_cell_editable_start_editing" : GtkCellEditableClass.C.notnull GtkCellEditableClass.C.p * unit GdkEvent.C.p -> unit;) (x1, x2)
    type 'a class = 'a GtkCellEditableClass.class
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun editingDone self = (GtkCellEditableClass.C.withPtr ---> I) editingDone_ self
    fun removeWidget self = (GtkCellEditableClass.C.withPtr ---> I) removeWidget_ self
    fun startEditing self event = (GtkCellEditableClass.C.withPtr &&&> GdkEvent.C.withOptPtr ---> I) startEditing_ (self & event)
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
          set = fn x => set "editing-canceled" boolean x
        }
    end
  end
