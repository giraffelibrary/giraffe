structure GtkCellLayout :>
  GTK_CELL_LAYOUT
    where type 'a class = 'a GtkCellLayoutClass.class
    where type 'a cell_area_class = 'a GtkCellAreaClass.class
    where type 'a cell_renderer_class = 'a GtkCellRendererClass.class =
  struct
    val getType_ = _import "gtk_cell_layout_get_type" : unit -> GObjectType.FFI.val_;
    val addAttribute_ =
      fn
        x1
         & x2
         & (x3, x4)
         & x5 =>
          (
            _import "mlton_gtk_cell_layout_add_attribute" :
              GtkCellLayoutClass.FFI.notnull GtkCellLayoutClass.FFI.p
               * GtkCellRendererClass.FFI.notnull GtkCellRendererClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * GInt32.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val clear_ = _import "gtk_cell_layout_clear" : GtkCellLayoutClass.FFI.notnull GtkCellLayoutClass.FFI.p -> unit;
    val clearAttributes_ = fn x1 & x2 => (_import "gtk_cell_layout_clear_attributes" : GtkCellLayoutClass.FFI.notnull GtkCellLayoutClass.FFI.p * GtkCellRendererClass.FFI.notnull GtkCellRendererClass.FFI.p -> unit;) (x1, x2)
    val getArea_ = _import "gtk_cell_layout_get_area" : GtkCellLayoutClass.FFI.notnull GtkCellLayoutClass.FFI.p -> GtkCellAreaClass.FFI.notnull GtkCellAreaClass.FFI.p;
    val packEnd_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_cell_layout_pack_end" :
              GtkCellLayoutClass.FFI.notnull GtkCellLayoutClass.FFI.p
               * GtkCellRendererClass.FFI.notnull GtkCellRendererClass.FFI.p
               * GBool.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val packStart_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_cell_layout_pack_start" :
              GtkCellLayoutClass.FFI.notnull GtkCellLayoutClass.FFI.p
               * GtkCellRendererClass.FFI.notnull GtkCellRendererClass.FFI.p
               * GBool.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val reorder_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_cell_layout_reorder" :
              GtkCellLayoutClass.FFI.notnull GtkCellLayoutClass.FFI.p
               * GtkCellRendererClass.FFI.notnull GtkCellRendererClass.FFI.p
               * GInt32.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    type 'a class = 'a GtkCellLayoutClass.class
    type 'a cell_area_class = 'a GtkCellAreaClass.class
    type 'a cell_renderer_class = 'a GtkCellRendererClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun addAttribute
      self
      (
        cell,
        attribute,
        column
      ) =
      (
        GtkCellLayoutClass.FFI.withPtr
         &&&> GtkCellRendererClass.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GInt32.FFI.withVal
         ---> I
      )
        addAttribute_
        (
          self
           & cell
           & attribute
           & column
        )
    fun clear self = (GtkCellLayoutClass.FFI.withPtr ---> I) clear_ self
    fun clearAttributes self cell = (GtkCellLayoutClass.FFI.withPtr &&&> GtkCellRendererClass.FFI.withPtr ---> I) clearAttributes_ (self & cell)
    fun getArea self = (GtkCellLayoutClass.FFI.withPtr ---> GtkCellAreaClass.FFI.fromPtr false) getArea_ self
    fun packEnd self (cell, expand) =
      (
        GtkCellLayoutClass.FFI.withPtr
         &&&> GtkCellRendererClass.FFI.withPtr
         &&&> GBool.FFI.withVal
         ---> I
      )
        packEnd_
        (
          self
           & cell
           & expand
        )
    fun packStart self (cell, expand) =
      (
        GtkCellLayoutClass.FFI.withPtr
         &&&> GtkCellRendererClass.FFI.withPtr
         &&&> GBool.FFI.withVal
         ---> I
      )
        packStart_
        (
          self
           & cell
           & expand
        )
    fun reorder self (cell, position) =
      (
        GtkCellLayoutClass.FFI.withPtr
         &&&> GtkCellRendererClass.FFI.withPtr
         &&&> GInt32.FFI.withVal
         ---> I
      )
        reorder_
        (
          self
           & cell
           & position
        )
  end
