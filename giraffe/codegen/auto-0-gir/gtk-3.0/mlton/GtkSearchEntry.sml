structure GtkSearchEntry :>
  GTK_SEARCH_ENTRY
    where type 'a class = 'a GtkSearchEntryClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type 'a cell_editable_class = 'a GtkCellEditableClass.class
    where type 'a editable_class = 'a GtkEditableClass.class =
  struct
    val getType_ = _import "gtk_search_entry_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "gtk_search_entry_new" : unit -> GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p;
    val handleEvent_ = fn x1 & x2 => (_import "gtk_search_entry_handle_event" : GtkSearchEntryClass.FFI.non_opt GtkSearchEntryClass.FFI.p * GdkEvent.FFI.non_opt GdkEvent.FFI.p -> GBool.FFI.val_;) (x1, x2)
    type 'a class = 'a GtkSearchEntryClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type 'a cell_editable_class = 'a GtkCellEditableClass.class
    type 'a editable_class = 'a GtkEditableClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr ---> GtkBuildableClass.FFI.fromPtr false) I self
    fun asCellEditable self = (GObjectObjectClass.FFI.withPtr ---> GtkCellEditableClass.FFI.fromPtr false) I self
    fun asEditable self = (GObjectObjectClass.FFI.withPtr ---> GtkEditableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkSearchEntryClass.FFI.fromPtr false) new_ ()
    fun handleEvent self event = (GtkSearchEntryClass.FFI.withPtr &&&> GdkEvent.FFI.withPtr ---> GBool.FFI.fromVal) handleEvent_ (self & event)
    local
      open ClosureMarshal Signal
    in
      fun nextMatchSig f = signal "next-match" (void ---> ret_void) f
      fun previousMatchSig f = signal "previous-match" (void ---> ret_void) f
      fun searchChangedSig f = signal "search-changed" (void ---> ret_void) f
      fun stopSearchSig f = signal "stop-search" (void ---> ret_void) f
    end
  end
