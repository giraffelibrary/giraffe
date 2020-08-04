structure GtkCellAccessibleParent :>
  GTK_CELL_ACCESSIBLE_PARENT
    where type 'a class = 'a GtkCellAccessibleParentClass.class
    where type cell_renderer_state_t = GtkCellRendererState.t
    where type 'a cell_accessible_class = 'a GtkCellAccessibleClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_cell_accessible_parent_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val activate_ = call (getSymbol "gtk_cell_accessible_parent_activate") (GtkCellAccessibleParentClass.PolyML.cPtr &&> GtkCellAccessibleClass.PolyML.cPtr --> cVoid)
      val edit_ = call (getSymbol "gtk_cell_accessible_parent_edit") (GtkCellAccessibleParentClass.PolyML.cPtr &&> GtkCellAccessibleClass.PolyML.cPtr --> cVoid)
      val expandCollapse_ = call (getSymbol "gtk_cell_accessible_parent_expand_collapse") (GtkCellAccessibleParentClass.PolyML.cPtr &&> GtkCellAccessibleClass.PolyML.cPtr --> cVoid)
      val getCellArea_ =
        call (getSymbol "gtk_cell_accessible_parent_get_cell_area")
          (
            GtkCellAccessibleParentClass.PolyML.cPtr
             &&> GtkCellAccessibleClass.PolyML.cPtr
             &&> GdkRectangleRecord.PolyML.cPtr
             --> cVoid
          )
      val getChildIndex_ = call (getSymbol "gtk_cell_accessible_parent_get_child_index") (GtkCellAccessibleParentClass.PolyML.cPtr &&> GtkCellAccessibleClass.PolyML.cPtr --> GInt.PolyML.cVal)
      val getRendererState_ = call (getSymbol "gtk_cell_accessible_parent_get_renderer_state") (GtkCellAccessibleParentClass.PolyML.cPtr &&> GtkCellAccessibleClass.PolyML.cPtr --> GtkCellRendererState.PolyML.cVal)
      val grabFocus_ = call (getSymbol "gtk_cell_accessible_parent_grab_focus") (GtkCellAccessibleParentClass.PolyML.cPtr &&> GtkCellAccessibleClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val updateRelationset_ =
        call (getSymbol "gtk_cell_accessible_parent_update_relationset")
          (
            GtkCellAccessibleParentClass.PolyML.cPtr
             &&> GtkCellAccessibleClass.PolyML.cPtr
             &&> AtkRelationSetClass.PolyML.cPtr
             --> cVoid
          )
    end
    type 'a class = 'a GtkCellAccessibleParentClass.class
    type cell_renderer_state_t = GtkCellRendererState.t
    type 'a cell_accessible_class = 'a GtkCellAccessibleClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun activate self cell = (GtkCellAccessibleParentClass.FFI.withPtr false &&&> GtkCellAccessibleClass.FFI.withPtr false ---> I) activate_ (self & cell)
    fun edit self cell = (GtkCellAccessibleParentClass.FFI.withPtr false &&&> GtkCellAccessibleClass.FFI.withPtr false ---> I) edit_ (self & cell)
    fun expandCollapse self cell = (GtkCellAccessibleParentClass.FFI.withPtr false &&&> GtkCellAccessibleClass.FFI.withPtr false ---> I) expandCollapse_ (self & cell)
    fun getCellArea self (cell, cellRect) =
      (
        GtkCellAccessibleParentClass.FFI.withPtr false
         &&&> GtkCellAccessibleClass.FFI.withPtr false
         &&&> GdkRectangleRecord.FFI.withPtr false
         ---> I
      )
        getCellArea_
        (
          self
           & cell
           & cellRect
        )
    fun getChildIndex self cell = (GtkCellAccessibleParentClass.FFI.withPtr false &&&> GtkCellAccessibleClass.FFI.withPtr false ---> GInt.FFI.fromVal) getChildIndex_ (self & cell)
    fun getRendererState self cell = (GtkCellAccessibleParentClass.FFI.withPtr false &&&> GtkCellAccessibleClass.FFI.withPtr false ---> GtkCellRendererState.FFI.fromVal) getRendererState_ (self & cell)
    fun grabFocus self cell = (GtkCellAccessibleParentClass.FFI.withPtr false &&&> GtkCellAccessibleClass.FFI.withPtr false ---> GBool.FFI.fromVal) grabFocus_ (self & cell)
    fun updateRelationset self (cell, relationset) =
      (
        GtkCellAccessibleParentClass.FFI.withPtr false
         &&&> GtkCellAccessibleClass.FFI.withPtr false
         &&&> AtkRelationSetClass.FFI.withPtr false
         ---> I
      )
        updateRelationset_
        (
          self
           & cell
           & relationset
        )
  end
