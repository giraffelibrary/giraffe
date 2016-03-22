structure GtkPrintOperationClass :>
  GTK_PRINT_OPERATION_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a print_operation = unit
    type 'a class = 'a print_operation class
  end
