structure GtkCellEditable :>
  GTK_CELL_EDITABLE
    where type 'a class = 'a GtkCellEditableClass.class =
  struct
    val getType_ = _import "gtk_cell_editable_get_type" : unit -> GObjectType.FFI.val_;
    val editingDone_ = _import "gtk_cell_editable_editing_done" : GtkCellEditableClass.FFI.notnull GtkCellEditableClass.FFI.p -> unit;
    val removeWidget_ = _import "gtk_cell_editable_remove_widget" : GtkCellEditableClass.FFI.notnull GtkCellEditableClass.FFI.p -> unit;
    val startEditing_ = fn x1 & x2 => (_import "gtk_cell_editable_start_editing" : GtkCellEditableClass.FFI.notnull GtkCellEditableClass.FFI.p * unit GdkEvent.FFI.p -> unit;) (x1, x2)
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
