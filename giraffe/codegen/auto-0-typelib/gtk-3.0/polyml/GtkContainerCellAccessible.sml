structure GtkContainerCellAccessible :>
  GTK_CONTAINER_CELL_ACCESSIBLE
    where type 'a class = 'a GtkContainerCellAccessibleClass.class
    where type 'a cell_accessible_class = 'a GtkCellAccessibleClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_container_cell_accessible_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "gtk_container_cell_accessible_new") (cVoid --> GtkContainerCellAccessibleClass.PolyML.cPtr)
      val addChild_ = call (getSymbol "gtk_container_cell_accessible_add_child") (GtkContainerCellAccessibleClass.PolyML.cPtr &&> GtkCellAccessibleClass.PolyML.cPtr --> cVoid)
      val removeChild_ = call (getSymbol "gtk_container_cell_accessible_remove_child") (GtkContainerCellAccessibleClass.PolyML.cPtr &&> GtkCellAccessibleClass.PolyML.cPtr --> cVoid)
    end
    type 'a class = 'a GtkContainerCellAccessibleClass.class
    type 'a cell_accessible_class = 'a GtkCellAccessibleClass.class
    type t = base class
    fun asAction self = (GObjectObjectClass.FFI.withPtr false ---> AtkActionClass.FFI.fromPtr false) I self
    fun asComponent self = (GObjectObjectClass.FFI.withPtr false ---> AtkComponentClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkContainerCellAccessibleClass.FFI.fromPtr true) new_ ()
    fun addChild self child = (GtkContainerCellAccessibleClass.FFI.withPtr false &&&> GtkCellAccessibleClass.FFI.withPtr false ---> I) addChild_ (self & child)
    fun removeChild self child = (GtkContainerCellAccessibleClass.FFI.withPtr false &&&> GtkCellAccessibleClass.FFI.withPtr false ---> I) removeChild_ (self & child)
  end
