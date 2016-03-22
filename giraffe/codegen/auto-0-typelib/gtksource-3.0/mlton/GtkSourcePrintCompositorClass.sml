structure GtkSourcePrintCompositorClass :>
  GTK_SOURCE_PRINT_COMPOSITOR_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a print_compositor = unit
    type 'a class = 'a print_compositor class
  end
