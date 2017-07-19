structure GtkPrintOperationPreview :>
  GTK_PRINT_OPERATION_PREVIEW
    where type 'a class = 'a GtkPrintOperationPreviewClass.class
    where type 'a page_setup_class = 'a GtkPageSetupClass.class
    where type 'a print_context_class = 'a GtkPrintContextClass.class =
  struct
    val getType_ = _import "gtk_print_operation_preview_get_type" : unit -> GObjectType.FFI.val_;
    val endPreview_ = _import "gtk_print_operation_preview_end_preview" : GtkPrintOperationPreviewClass.FFI.notnull GtkPrintOperationPreviewClass.FFI.p -> unit;
    val isSelected_ = fn x1 & x2 => (_import "gtk_print_operation_preview_is_selected" : GtkPrintOperationPreviewClass.FFI.notnull GtkPrintOperationPreviewClass.FFI.p * GInt.FFI.val_ -> GBool.FFI.val_;) (x1, x2)
    val renderPage_ = fn x1 & x2 => (_import "gtk_print_operation_preview_render_page" : GtkPrintOperationPreviewClass.FFI.notnull GtkPrintOperationPreviewClass.FFI.p * GInt.FFI.val_ -> unit;) (x1, x2)
    type 'a class = 'a GtkPrintOperationPreviewClass.class
    type 'a page_setup_class = 'a GtkPageSetupClass.class
    type 'a print_context_class = 'a GtkPrintContextClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun endPreview self = (GtkPrintOperationPreviewClass.FFI.withPtr ---> I) endPreview_ self
    fun isSelected self pageNr = (GtkPrintOperationPreviewClass.FFI.withPtr &&&> GInt.FFI.withVal ---> GBool.FFI.fromVal) isSelected_ (self & pageNr)
    fun renderPage self pageNr = (GtkPrintOperationPreviewClass.FFI.withPtr &&&> GInt.FFI.withVal ---> I) renderPage_ (self & pageNr)
    local
      open ClosureMarshal Signal
    in
      fun gotPageSizeSig f = signal "got-page-size" (get 0w1 GtkPrintContextClass.t &&&> get 0w2 GtkPageSetupClass.t ---> ret_void) (fn context & pageSetup => f (context, pageSetup))
      fun readySig f = signal "ready" (get 0w1 GtkPrintContextClass.t ---> ret_void) f
    end
  end
