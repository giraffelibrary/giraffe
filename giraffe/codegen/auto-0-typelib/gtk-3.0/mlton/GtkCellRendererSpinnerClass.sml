structure GtkCellRendererSpinnerClass :>
  GTK_CELL_RENDERER_SPINNER_CLASS
    where type 'a cell_renderer_class = 'a GtkCellRendererClass.class
    where type C.notnull = GtkCellRendererClass.C.notnull
    where type 'a C.p = 'a GtkCellRendererClass.C.p =
  struct
    type 'a cell_renderer_class = 'a GtkCellRendererClass.class
    open GtkCellRendererClass
    type 'a cell_renderer_spinner = unit
    type 'a class = 'a cell_renderer_spinner class
  end
