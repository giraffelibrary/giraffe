structure GtkPrintOperationPreviewClass :>
  GTK_PRINT_OPERATION_PREVIEW_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    type 'a print_operation_preview = unit
    type 'a t = 'a print_operation_preview GObjectObjectClass.t
    fun toBase obj = obj
    val t = GObjectObjectClass.t
    val tOpt = GObjectObjectClass.tOpt
    structure C = GObjectObjectClass.C
  end
