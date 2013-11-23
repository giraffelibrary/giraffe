structure GtkPrintOperationPreview :>
  GTK_PRINT_OPERATION_PREVIEW
    where type 'a class_t = 'a GtkPrintOperationPreviewClass.t
    where type 'a pagesetupclass_t = 'a GtkPageSetupClass.t
    where type 'a printcontextclass_t = 'a GtkPrintContextClass.t =
  struct
    val getType_ = _import "gtk_print_operation_preview_get_type" : unit -> GObjectType.C.val_;
    val endPreview_ = _import "gtk_print_operation_preview_end_preview" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;
    val isSelected_ = fn x1 & x2 => (_import "gtk_print_operation_preview_is_selected" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Int.C.val_ -> FFI.Bool.C.val_;) (x1, x2)
    val renderPage_ = fn x1 & x2 => (_import "gtk_print_operation_preview_render_page" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Int.C.val_ -> unit;) (x1, x2)
    type 'a class_t = 'a GtkPrintOperationPreviewClass.t
    type 'a pagesetupclass_t = 'a GtkPageSetupClass.t
    type 'a printcontextclass_t = 'a GtkPrintContextClass.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun endPreview self = (GObjectObjectClass.C.withPtr ---> I) endPreview_ self
    fun isSelected self pageNr = (GObjectObjectClass.C.withPtr &&&> FFI.Int.C.withVal ---> FFI.Bool.C.fromVal) isSelected_ (self & pageNr)
    fun renderPage self pageNr = (GObjectObjectClass.C.withPtr &&&> FFI.Int.C.withVal ---> I) renderPage_ (self & pageNr)
    local
      open ClosureMarshal Signal
    in
      fun gotPageSizeSig f = signal "got-page-size" (get 0w1 GtkPrintContextClass.t &&&> get 0w2 GtkPageSetupClass.t ---> ret_void) (fn context & pageSetup => f context pageSetup)
      fun readySig f = signal "ready" (get 0w1 GtkPrintContextClass.t ---> ret_void) f
    end
  end
