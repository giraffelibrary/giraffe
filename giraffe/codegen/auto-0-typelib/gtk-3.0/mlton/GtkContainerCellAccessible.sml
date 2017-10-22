structure GtkContainerCellAccessible :>
  GTK_CONTAINER_CELL_ACCESSIBLE
    where type 'a class = 'a GtkContainerCellAccessibleClass.class
    where type 'a cell_accessible_class = 'a GtkCellAccessibleClass.class =
  struct
    val getType_ = _import "gtk_container_cell_accessible_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "gtk_container_cell_accessible_new" : unit -> GtkContainerCellAccessibleClass.FFI.notnull GtkContainerCellAccessibleClass.FFI.p;
    val addChild_ = fn x1 & x2 => (_import "gtk_container_cell_accessible_add_child" : GtkContainerCellAccessibleClass.FFI.notnull GtkContainerCellAccessibleClass.FFI.p * GtkCellAccessibleClass.FFI.notnull GtkCellAccessibleClass.FFI.p -> unit;) (x1, x2)
    val removeChild_ = fn x1 & x2 => (_import "gtk_container_cell_accessible_remove_child" : GtkContainerCellAccessibleClass.FFI.notnull GtkContainerCellAccessibleClass.FFI.p * GtkCellAccessibleClass.FFI.notnull GtkCellAccessibleClass.FFI.p -> unit;) (x1, x2)
    type 'a class = 'a GtkContainerCellAccessibleClass.class
    type 'a cell_accessible_class = 'a GtkCellAccessibleClass.class
    type t = base class
    fun asAction self = (GObjectObjectClass.FFI.withPtr ---> AtkActionClass.FFI.fromPtr false) I self
    fun asComponent self = (GObjectObjectClass.FFI.withPtr ---> AtkComponentClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkContainerCellAccessibleClass.FFI.fromPtr true) new_ ()
    fun addChild self child = (GtkContainerCellAccessibleClass.FFI.withPtr &&&> GtkCellAccessibleClass.FFI.withPtr ---> I) addChild_ (self & child)
    fun removeChild self child = (GtkContainerCellAccessibleClass.FFI.withPtr &&&> GtkCellAccessibleClass.FFI.withPtr ---> I) removeChild_ (self & child)
  end
