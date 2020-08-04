structure GtkSearchEntry :>
  GTK_SEARCH_ENTRY
    where type 'a class = 'a GtkSearchEntryClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type 'a cell_editable_class = 'a GtkCellEditableClass.class
    where type 'a editable_class = 'a GtkEditableClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_search_entry_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "gtk_search_entry_new") (cVoid --> GtkWidgetClass.PolyML.cPtr)
      val handleEvent_ = call (getSymbol "gtk_search_entry_handle_event") (GtkSearchEntryClass.PolyML.cPtr &&> GdkEvent.PolyML.cPtr --> GBool.PolyML.cVal)
    end
    type 'a class = 'a GtkSearchEntryClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type 'a cell_editable_class = 'a GtkCellEditableClass.class
    type 'a editable_class = 'a GtkEditableClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr false ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr false ---> GtkBuildableClass.FFI.fromPtr false) I self
    fun asCellEditable self = (GObjectObjectClass.FFI.withPtr false ---> GtkCellEditableClass.FFI.fromPtr false) I self
    fun asEditable self = (GObjectObjectClass.FFI.withPtr false ---> GtkEditableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkSearchEntryClass.FFI.fromPtr false) new_ ()
    fun handleEvent self event = (GtkSearchEntryClass.FFI.withPtr false &&&> GdkEvent.FFI.withPtr false ---> GBool.FFI.fromVal) handleEvent_ (self & event)
    local
      open ClosureMarshal Signal
    in
      fun nextMatchSig f = signal "next-match" (void ---> ret_void) f
      fun previousMatchSig f = signal "previous-match" (void ---> ret_void) f
      fun searchChangedSig f = signal "search-changed" (void ---> ret_void) f
      fun stopSearchSig f = signal "stop-search" (void ---> ret_void) f
    end
  end
