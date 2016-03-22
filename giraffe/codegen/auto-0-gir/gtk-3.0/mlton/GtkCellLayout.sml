structure GtkCellLayout :>
  GTK_CELL_LAYOUT
    where type 'a class = 'a GtkCellLayoutClass.class
    where type 'a cell_area_class = 'a GtkCellAreaClass.class
    where type 'a cell_renderer_class = 'a GtkCellRendererClass.class =
  struct
    val getType_ = _import "gtk_cell_layout_get_type" : unit -> GObjectType.C.val_;
    val addAttribute_ =
      fn
        x1
         & x2
         & (x3, x4)
         & x5 =>
          (
            _import "mlton_gtk_cell_layout_add_attribute" :
              GtkCellLayoutClass.C.notnull GtkCellLayoutClass.C.p
               * GtkCellRendererClass.C.notnull GtkCellRendererClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * FFI.Int.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val clear_ = _import "gtk_cell_layout_clear" : GtkCellLayoutClass.C.notnull GtkCellLayoutClass.C.p -> unit;
    val clearAttributes_ = fn x1 & x2 => (_import "gtk_cell_layout_clear_attributes" : GtkCellLayoutClass.C.notnull GtkCellLayoutClass.C.p * GtkCellRendererClass.C.notnull GtkCellRendererClass.C.p -> unit;) (x1, x2)
    val getArea_ = _import "gtk_cell_layout_get_area" : GtkCellLayoutClass.C.notnull GtkCellLayoutClass.C.p -> GtkCellAreaClass.C.notnull GtkCellAreaClass.C.p;
    val packEnd_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_cell_layout_pack_end" :
              GtkCellLayoutClass.C.notnull GtkCellLayoutClass.C.p
               * GtkCellRendererClass.C.notnull GtkCellRendererClass.C.p
               * FFI.Bool.C.val_
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
              GtkCellLayoutClass.C.notnull GtkCellLayoutClass.C.p
               * GtkCellRendererClass.C.notnull GtkCellRendererClass.C.p
               * FFI.Bool.C.val_
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
              GtkCellLayoutClass.C.notnull GtkCellLayoutClass.C.p
               * GtkCellRendererClass.C.notnull GtkCellRendererClass.C.p
               * FFI.Int.C.val_
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
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun addAttribute self cell attribute column =
      (
        GtkCellLayoutClass.C.withPtr
         &&&> GtkCellRendererClass.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> FFI.Int.C.withVal
         ---> I
      )
        addAttribute_
        (
          self
           & cell
           & attribute
           & column
        )
    fun clear self = (GtkCellLayoutClass.C.withPtr ---> I) clear_ self
    fun clearAttributes self cell = (GtkCellLayoutClass.C.withPtr &&&> GtkCellRendererClass.C.withPtr ---> I) clearAttributes_ (self & cell)
    fun getArea self = (GtkCellLayoutClass.C.withPtr ---> GtkCellAreaClass.C.fromPtr false) getArea_ self
    fun packEnd self cell expand =
      (
        GtkCellLayoutClass.C.withPtr
         &&&> GtkCellRendererClass.C.withPtr
         &&&> FFI.Bool.C.withVal
         ---> I
      )
        packEnd_
        (
          self
           & cell
           & expand
        )
    fun packStart self cell expand =
      (
        GtkCellLayoutClass.C.withPtr
         &&&> GtkCellRendererClass.C.withPtr
         &&&> FFI.Bool.C.withVal
         ---> I
      )
        packStart_
        (
          self
           & cell
           & expand
        )
    fun reorder self cell position =
      (
        GtkCellLayoutClass.C.withPtr
         &&&> GtkCellRendererClass.C.withPtr
         &&&> FFI.Int.C.withVal
         ---> I
      )
        reorder_
        (
          self
           & cell
           & position
        )
  end
