structure GtkPrintOperationPreview :>
  GTK_PRINT_OPERATION_PREVIEW
    where type 'a class = 'a GtkPrintOperationPreviewClass.class
    where type 'a page_setup_class = 'a GtkPageSetupClass.class
    where type 'a print_context_class = 'a GtkPrintContextClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_print_operation_preview_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val endPreview_ = call (getSymbol "gtk_print_operation_preview_end_preview") (GtkPrintOperationPreviewClass.PolyML.cPtr --> cVoid)
      val isSelected_ = call (getSymbol "gtk_print_operation_preview_is_selected") (GtkPrintOperationPreviewClass.PolyML.cPtr &&> GInt32.PolyML.cVal --> GBool.PolyML.cVal)
      val renderPage_ = call (getSymbol "gtk_print_operation_preview_render_page") (GtkPrintOperationPreviewClass.PolyML.cPtr &&> GInt32.PolyML.cVal --> cVoid)
    end
    type 'a class = 'a GtkPrintOperationPreviewClass.class
    type 'a page_setup_class = 'a GtkPageSetupClass.class
    type 'a print_context_class = 'a GtkPrintContextClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun endPreview self = (GtkPrintOperationPreviewClass.FFI.withPtr ---> I) endPreview_ self
    fun isSelected self pageNr = (GtkPrintOperationPreviewClass.FFI.withPtr &&&> GInt32.FFI.withVal ---> GBool.FFI.fromVal) isSelected_ (self & pageNr)
    fun renderPage self pageNr = (GtkPrintOperationPreviewClass.FFI.withPtr &&&> GInt32.FFI.withVal ---> I) renderPage_ (self & pageNr)
    local
      open ClosureMarshal Signal
    in
      fun gotPageSizeSig f = signal "got-page-size" (get 0w1 GtkPrintContextClass.t &&&> get 0w2 GtkPageSetupClass.t ---> ret_void) (fn context & pageSetup => f (context, pageSetup))
      fun readySig f = signal "ready" (get 0w1 GtkPrintContextClass.t ---> ret_void) f
    end
  end
