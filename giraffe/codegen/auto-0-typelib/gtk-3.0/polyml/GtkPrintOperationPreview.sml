structure GtkPrintOperationPreview :>
  GTK_PRINT_OPERATION_PREVIEW
    where type 'a class_t = 'a GtkPrintOperationPreviewClass.t
    where type 'a pagesetupclass_t = 'a GtkPageSetupClass.t
    where type 'a printcontextclass_t = 'a GtkPrintContextClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_print_operation_preview_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val endPreview_ = call (load_sym libgtk "gtk_print_operation_preview_end_preview") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val isSelected_ = call (load_sym libgtk "gtk_print_operation_preview_is_selected") (GObjectObjectClass.PolyML.PTR &&> FFI.Int32.PolyML.VAL --> FFI.Bool.PolyML.VAL)
      val renderPage_ = call (load_sym libgtk "gtk_print_operation_preview_render_page") (GObjectObjectClass.PolyML.PTR &&> FFI.Int32.PolyML.VAL --> FFI.PolyML.VOID)
    end
    type 'a class_t = 'a GtkPrintOperationPreviewClass.t
    type 'a pagesetupclass_t = 'a GtkPageSetupClass.t
    type 'a printcontextclass_t = 'a GtkPrintContextClass.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun endPreview self = (GObjectObjectClass.C.withPtr ---> I) endPreview_ self
    fun isSelected self pageNr = (GObjectObjectClass.C.withPtr &&&> FFI.Int32.C.withVal ---> FFI.Bool.C.fromVal) isSelected_ (self & pageNr)
    fun renderPage self pageNr = (GObjectObjectClass.C.withPtr &&&> FFI.Int32.C.withVal ---> I) renderPage_ (self & pageNr)
    local
      open ClosureMarshal Signal
    in
      fun gotPageSizeSig f = signal "got-page-size" (get 0w1 GtkPrintContextClass.t &&&> get 0w2 GtkPageSetupClass.t ---> ret_void) (fn context & pageSetup => f context pageSetup)
      fun readySig f = signal "ready" (get 0w1 GtkPrintContextClass.t ---> ret_void) f
    end
  end
