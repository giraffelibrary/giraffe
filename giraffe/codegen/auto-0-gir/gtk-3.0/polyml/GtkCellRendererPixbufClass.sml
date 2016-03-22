structure GtkCellRendererPixbufClass :>
  GTK_CELL_RENDERER_PIXBUF_CLASS
    where type 'a cell_renderer_class = 'a GtkCellRendererClass.class
    where type C.notnull = GtkCellRendererClass.C.notnull
    where type 'a C.p = 'a GtkCellRendererClass.C.p =
  struct
    type 'a cell_renderer_class = 'a GtkCellRendererClass.class
    open GtkCellRendererClass
    type 'a cell_renderer_pixbuf = unit
    type 'a class = 'a cell_renderer_pixbuf class
  end
