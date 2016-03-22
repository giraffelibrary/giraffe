structure GtkPrintContextClass :>
  GTK_PRINT_CONTEXT_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a print_context = unit
    type 'a class = 'a print_context class
  end
