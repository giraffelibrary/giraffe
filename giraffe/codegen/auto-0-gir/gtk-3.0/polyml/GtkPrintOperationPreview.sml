structure GtkPrintOperationPreview :>
  GTK_PRINT_OPERATION_PREVIEW
    where type 'a class_t = 'a GtkPrintOperationPreviewClass.t
    where type 'a page_setup_class_t = 'a GtkPageSetupClass.t
    where type 'a print_context_class_t = 'a GtkPrintContextClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_print_operation_preview_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val endPreview_ = call (load_sym libgtk "gtk_print_operation_preview_end_preview") (GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val isSelected_ = call (load_sym libgtk "gtk_print_operation_preview_is_selected") (GObjectObjectClass.PolyML.cPtr &&> FFI.Int.PolyML.cVal --> FFI.Bool.PolyML.cVal)
      val renderPage_ = call (load_sym libgtk "gtk_print_operation_preview_render_page") (GObjectObjectClass.PolyML.cPtr &&> FFI.Int.PolyML.cVal --> FFI.PolyML.cVoid)
    end
    type 'a class_t = 'a GtkPrintOperationPreviewClass.t
    type 'a page_setup_class_t = 'a GtkPageSetupClass.t
    type 'a print_context_class_t = 'a GtkPrintContextClass.t
    type t = base class_t
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
