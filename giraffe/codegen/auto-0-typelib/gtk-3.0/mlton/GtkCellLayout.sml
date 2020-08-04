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
              GtkCellLayoutClass.FFI.non_opt GtkCellLayoutClass.FFI.p
               * GtkCellRendererClass.FFI.non_opt GtkCellRendererClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
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
    val clear_ = _import "gtk_cell_layout_clear" : GtkCellLayoutClass.FFI.non_opt GtkCellLayoutClass.FFI.p -> unit;
    val clearAttributes_ = fn x1 & x2 => (_import "gtk_cell_layout_clear_attributes" : GtkCellLayoutClass.FFI.non_opt GtkCellLayoutClass.FFI.p * GtkCellRendererClass.FFI.non_opt GtkCellRendererClass.FFI.p -> unit;) (x1, x2)
    val getArea_ = _import "gtk_cell_layout_get_area" : GtkCellLayoutClass.FFI.non_opt GtkCellLayoutClass.FFI.p -> GtkCellAreaClass.FFI.opt GtkCellAreaClass.FFI.p;
    val packEnd_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_cell_layout_pack_end" :
              GtkCellLayoutClass.FFI.non_opt GtkCellLayoutClass.FFI.p
               * GtkCellRendererClass.FFI.non_opt GtkCellRendererClass.FFI.p
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
              GtkCellLayoutClass.FFI.non_opt GtkCellLayoutClass.FFI.p
               * GtkCellRendererClass.FFI.non_opt GtkCellRendererClass.FFI.p
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
              GtkCellLayoutClass.FFI.non_opt GtkCellLayoutClass.FFI.p
               * GtkCellRendererClass.FFI.non_opt GtkCellRendererClass.FFI.p
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
        GtkCellLayoutClass.FFI.withPtr false
         &&&> GtkCellRendererClass.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
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
    fun clear self = (GtkCellLayoutClass.FFI.withPtr false ---> I) clear_ self
    fun clearAttributes self cell = (GtkCellLayoutClass.FFI.withPtr false &&&> GtkCellRendererClass.FFI.withPtr false ---> I) clearAttributes_ (self & cell)
    fun getArea self = (GtkCellLayoutClass.FFI.withPtr false ---> GtkCellAreaClass.FFI.fromOptPtr false) getArea_ self
    fun packEnd self (cell, expand) =
      (
        GtkCellLayoutClass.FFI.withPtr false
         &&&> GtkCellRendererClass.FFI.withPtr false
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
        GtkCellLayoutClass.FFI.withPtr false
         &&&> GtkCellRendererClass.FFI.withPtr false
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
        GtkCellLayoutClass.FFI.withPtr false
         &&&> GtkCellRendererClass.FFI.withPtr false
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
