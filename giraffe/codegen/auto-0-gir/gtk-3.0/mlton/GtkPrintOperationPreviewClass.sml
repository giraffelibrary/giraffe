structure GtkPrintOperationPreviewClass :>
  GTK_PRINT_OPERATION_PREVIEW_CLASS
    where type C.opt = GObjectObjectClass.C.opt
    where type C.non_opt = GObjectObjectClass.C.non_opt
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a print_operation_preview = unit
    type 'a class = 'a print_operation_preview class
  end
