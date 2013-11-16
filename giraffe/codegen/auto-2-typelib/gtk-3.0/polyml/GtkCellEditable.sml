structure GtkCellEditable :>
  GTK_CELL_EDITABLE
    where type 'a class_t = 'a GtkCellEditableClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_cell_editable_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val editingDone_ = call (load_sym libgtk "gtk_cell_editable_editing_done") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val removeWidget_ = call (load_sym libgtk "gtk_cell_editable_remove_widget") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val startEditing_ = call (load_sym libgtk "gtk_cell_editable_start_editing") (GObjectObjectClass.PolyML.PTR &&> GdkEvent.PolyML.OPTPTR --> FFI.PolyML.VOID)
    end
    type 'a class_t = 'a GtkCellEditableClass.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun editingDone self = (GObjectObjectClass.C.withPtr ---> I) editingDone_ self
    fun removeWidget self = (GObjectObjectClass.C.withPtr ---> I) removeWidget_ self
    fun startEditing self event = (GObjectObjectClass.C.withPtr &&&> GdkEvent.C.withOptPtr ---> I) startEditing_ (self & event)
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
