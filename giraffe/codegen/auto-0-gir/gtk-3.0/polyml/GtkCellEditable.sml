structure GtkCellEditable :>
  GTK_CELL_EDITABLE
    where type 'a class = 'a GtkCellEditableClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_cell_editable_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val editingDone_ = call (load_sym libgtk "gtk_cell_editable_editing_done") (GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val removeWidget_ = call (load_sym libgtk "gtk_cell_editable_remove_widget") (GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val startEditing_ = call (load_sym libgtk "gtk_cell_editable_start_editing") (GObjectObjectClass.PolyML.cPtr &&> GdkEvent.PolyML.cOptPtr --> FFI.PolyML.cVoid)
    end
    type 'a class = 'a GtkCellEditableClass.class
    type t = base class
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
