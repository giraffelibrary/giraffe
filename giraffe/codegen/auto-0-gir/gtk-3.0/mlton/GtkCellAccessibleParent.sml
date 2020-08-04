structure GtkCellAccessibleParent :>
  GTK_CELL_ACCESSIBLE_PARENT
    where type 'a class = 'a GtkCellAccessibleParentClass.class
    where type cell_renderer_state_t = GtkCellRendererState.t
    where type 'a cell_accessible_class = 'a GtkCellAccessibleClass.class =
  struct
    val getType_ = _import "gtk_cell_accessible_parent_get_type" : unit -> GObjectType.FFI.val_;
    val activate_ = fn x1 & x2 => (_import "gtk_cell_accessible_parent_activate" : GtkCellAccessibleParentClass.FFI.non_opt GtkCellAccessibleParentClass.FFI.p * GtkCellAccessibleClass.FFI.non_opt GtkCellAccessibleClass.FFI.p -> unit;) (x1, x2)
    val edit_ = fn x1 & x2 => (_import "gtk_cell_accessible_parent_edit" : GtkCellAccessibleParentClass.FFI.non_opt GtkCellAccessibleParentClass.FFI.p * GtkCellAccessibleClass.FFI.non_opt GtkCellAccessibleClass.FFI.p -> unit;) (x1, x2)
    val expandCollapse_ = fn x1 & x2 => (_import "gtk_cell_accessible_parent_expand_collapse" : GtkCellAccessibleParentClass.FFI.non_opt GtkCellAccessibleParentClass.FFI.p * GtkCellAccessibleClass.FFI.non_opt GtkCellAccessibleClass.FFI.p -> unit;) (x1, x2)
    val getCellArea_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_cell_accessible_parent_get_cell_area" :
              GtkCellAccessibleParentClass.FFI.non_opt GtkCellAccessibleParentClass.FFI.p
               * GtkCellAccessibleClass.FFI.non_opt GtkCellAccessibleClass.FFI.p
               * GdkRectangleRecord.FFI.non_opt GdkRectangleRecord.FFI.p
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val getChildIndex_ = fn x1 & x2 => (_import "gtk_cell_accessible_parent_get_child_index" : GtkCellAccessibleParentClass.FFI.non_opt GtkCellAccessibleParentClass.FFI.p * GtkCellAccessibleClass.FFI.non_opt GtkCellAccessibleClass.FFI.p -> GInt.FFI.val_;) (x1, x2)
    val getRendererState_ = fn x1 & x2 => (_import "gtk_cell_accessible_parent_get_renderer_state" : GtkCellAccessibleParentClass.FFI.non_opt GtkCellAccessibleParentClass.FFI.p * GtkCellAccessibleClass.FFI.non_opt GtkCellAccessibleClass.FFI.p -> GtkCellRendererState.FFI.val_;) (x1, x2)
    val grabFocus_ = fn x1 & x2 => (_import "gtk_cell_accessible_parent_grab_focus" : GtkCellAccessibleParentClass.FFI.non_opt GtkCellAccessibleParentClass.FFI.p * GtkCellAccessibleClass.FFI.non_opt GtkCellAccessibleClass.FFI.p -> GBool.FFI.val_;) (x1, x2)
    val updateRelationset_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_cell_accessible_parent_update_relationset" :
              GtkCellAccessibleParentClass.FFI.non_opt GtkCellAccessibleParentClass.FFI.p
               * GtkCellAccessibleClass.FFI.non_opt GtkCellAccessibleClass.FFI.p
               * AtkRelationSetClass.FFI.non_opt AtkRelationSetClass.FFI.p
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
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
