structure GtkPrintOperation :>
  GTK_PRINT_OPERATION
    where type 'a class = 'a GtkPrintOperationClass.class
    where type print_operation_action_t = GtkPrintOperationAction.t
    where type print_operation_result_t = GtkPrintOperationResult.t
    where type 'a window_class = 'a GtkWindowClass.class
    where type 'a print_operation_preview_class = 'a GtkPrintOperationPreviewClass.class
    where type 'a print_context_class = 'a GtkPrintContextClass.class
    where type 'a widget_class = 'a GtkWidgetClass.class
    where type 'a page_setup_class = 'a GtkPageSetupClass.class
    where type 'a print_settings_class = 'a GtkPrintSettingsClass.class
    where type print_status_t = GtkPrintStatus.t
    where type unit_t = GtkUnit.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_print_operation_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libgtk "gtk_print_operation_new") (FFI.PolyML.cVoid --> GObjectObjectClass.PolyML.cPtr)
      val cancel_ = call (load_sym libgtk "gtk_print_operation_cancel") (GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val drawPageFinish_ = call (load_sym libgtk "gtk_print_operation_draw_page_finish") (GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val getDefaultPageSetup_ = call (load_sym libgtk "gtk_print_operation_get_default_page_setup") (GObjectObjectClass.PolyML.cPtr --> GObjectObjectClass.PolyML.cPtr)
      val getEmbedPageSetup_ = call (load_sym libgtk "gtk_print_operation_get_embed_page_setup") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getError_ = call (load_sym libgtk "gtk_print_operation_get_error") (GObjectObjectClass.PolyML.cPtr &&> GLibErrorRecord.PolyML.cOutOptRef --> FFI.PolyML.cVoid)
      val getHasSelection_ = call (load_sym libgtk "gtk_print_operation_get_has_selection") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getNPagesToPrint_ = call (load_sym libgtk "gtk_print_operation_get_n_pages_to_print") (GObjectObjectClass.PolyML.cPtr --> FFI.Int.PolyML.cVal)
      val getPrintSettings_ = call (load_sym libgtk "gtk_print_operation_get_print_settings") (GObjectObjectClass.PolyML.cPtr --> GObjectObjectClass.PolyML.cPtr)
      val getStatus_ = call (load_sym libgtk "gtk_print_operation_get_status") (GObjectObjectClass.PolyML.cPtr --> GtkPrintStatus.PolyML.cVal)
      val getStatusString_ = call (load_sym libgtk "gtk_print_operation_get_status_string") (GObjectObjectClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getSupportSelection_ = call (load_sym libgtk "gtk_print_operation_get_support_selection") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val isFinished_ = call (load_sym libgtk "gtk_print_operation_is_finished") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val run_ =
        call (load_sym libgtk "gtk_print_operation_run")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GtkPrintOperationAction.PolyML.cVal
             &&> GObjectObjectClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GtkPrintOperationResult.PolyML.cVal
          )
      val setAllowAsync_ = call (load_sym libgtk "gtk_print_operation_set_allow_async") (GObjectObjectClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> FFI.PolyML.cVoid)
      val setCurrentPage_ = call (load_sym libgtk "gtk_print_operation_set_current_page") (GObjectObjectClass.PolyML.cPtr &&> FFI.Int.PolyML.cVal --> FFI.PolyML.cVoid)
      val setCustomTabLabel_ = call (load_sym libgtk "gtk_print_operation_set_custom_tab_label") (GObjectObjectClass.PolyML.cPtr &&> Utf8.PolyML.cInOptPtr --> FFI.PolyML.cVoid)
      val setDefaultPageSetup_ = call (load_sym libgtk "gtk_print_operation_set_default_page_setup") (GObjectObjectClass.PolyML.cPtr &&> GObjectObjectClass.PolyML.cOptPtr --> FFI.PolyML.cVoid)
      val setDeferDrawing_ = call (load_sym libgtk "gtk_print_operation_set_defer_drawing") (GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val setEmbedPageSetup_ = call (load_sym libgtk "gtk_print_operation_set_embed_page_setup") (GObjectObjectClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> FFI.PolyML.cVoid)
      val setExportFilename_ = call (load_sym libgtk "gtk_print_operation_set_export_filename") (GObjectObjectClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> FFI.PolyML.cVoid)
      val setHasSelection_ = call (load_sym libgtk "gtk_print_operation_set_has_selection") (GObjectObjectClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> FFI.PolyML.cVoid)
      val setJobName_ = call (load_sym libgtk "gtk_print_operation_set_job_name") (GObjectObjectClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> FFI.PolyML.cVoid)
      val setNPages_ = call (load_sym libgtk "gtk_print_operation_set_n_pages") (GObjectObjectClass.PolyML.cPtr &&> FFI.Int.PolyML.cVal --> FFI.PolyML.cVoid)
      val setPrintSettings_ = call (load_sym libgtk "gtk_print_operation_set_print_settings") (GObjectObjectClass.PolyML.cPtr &&> GObjectObjectClass.PolyML.cOptPtr --> FFI.PolyML.cVoid)
      val setShowProgress_ = call (load_sym libgtk "gtk_print_operation_set_show_progress") (GObjectObjectClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> FFI.PolyML.cVoid)
      val setSupportSelection_ = call (load_sym libgtk "gtk_print_operation_set_support_selection") (GObjectObjectClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> FFI.PolyML.cVoid)
      val setTrackPrintStatus_ = call (load_sym libgtk "gtk_print_operation_set_track_print_status") (GObjectObjectClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> FFI.PolyML.cVoid)
      val setUnit_ = call (load_sym libgtk "gtk_print_operation_set_unit") (GObjectObjectClass.PolyML.cPtr &&> GtkUnit.PolyML.cVal --> FFI.PolyML.cVoid)
      val setUseFullPage_ = call (load_sym libgtk "gtk_print_operation_set_use_full_page") (GObjectObjectClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> FFI.PolyML.cVoid)
    end
    type 'a class = 'a GtkPrintOperationClass.class
    type print_operation_action_t = GtkPrintOperationAction.t
    type print_operation_result_t = GtkPrintOperationResult.t
    type 'a window_class = 'a GtkWindowClass.class
    type 'a print_operation_preview_class = 'a GtkPrintOperationPreviewClass.class
    type 'a print_context_class = 'a GtkPrintContextClass.class
    type 'a widget_class = 'a GtkWidgetClass.class
    type 'a page_setup_class = 'a GtkPageSetupClass.class
    type 'a print_settings_class = 'a GtkPrintSettingsClass.class
    type print_status_t = GtkPrintStatus.t
    type unit_t = GtkUnit.t
    type t = base class
    fun asPrintOperationPreview self = (GObjectObjectClass.C.withPtr ---> GtkPrintOperationPreviewClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkPrintOperationClass.C.fromPtr true) new_ ()
    fun cancel self = (GObjectObjectClass.C.withPtr ---> I) cancel_ self
    fun drawPageFinish self = (GObjectObjectClass.C.withPtr ---> I) drawPageFinish_ self
    fun getDefaultPageSetup self = (GObjectObjectClass.C.withPtr ---> GtkPageSetupClass.C.fromPtr false) getDefaultPageSetup_ self
    fun getEmbedPageSetup self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getEmbedPageSetup_ self
    fun getError self = (GObjectObjectClass.C.withPtr &&&> GLibErrorRecord.handleError ---> I) getError_ (self & [])
    fun getHasSelection self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getHasSelection_ self
    fun getNPagesToPrint self = (GObjectObjectClass.C.withPtr ---> FFI.Int.C.fromVal) getNPagesToPrint_ self
    fun getPrintSettings self = (GObjectObjectClass.C.withPtr ---> GtkPrintSettingsClass.C.fromPtr false) getPrintSettings_ self
    fun getStatus self = (GObjectObjectClass.C.withPtr ---> GtkPrintStatus.C.fromVal) getStatus_ self
    fun getStatusString self = (GObjectObjectClass.C.withPtr ---> Utf8.C.fromPtr false) getStatusString_ self
    fun getSupportSelection self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getSupportSelection_ self
    fun isFinished self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) isFinished_ self
    fun run self action parent =
      (
        GObjectObjectClass.C.withPtr
         &&&> GtkPrintOperationAction.C.withVal
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> GtkPrintOperationResult.C.fromVal
      )
        run_
        (
          self
           & action
           & parent
           & []
        )
    fun setAllowAsync self allowAsync = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setAllowAsync_ (self & allowAsync)
    fun setCurrentPage self currentPage = (GObjectObjectClass.C.withPtr &&&> FFI.Int.C.withVal ---> I) setCurrentPage_ (self & currentPage)
    fun setCustomTabLabel self label = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withOptPtr ---> I) setCustomTabLabel_ (self & label)
    fun setDefaultPageSetup self defaultPageSetup = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withOptPtr ---> I) setDefaultPageSetup_ (self & defaultPageSetup)
    fun setDeferDrawing self = (GObjectObjectClass.C.withPtr ---> I) setDeferDrawing_ self
    fun setEmbedPageSetup self embed = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setEmbedPageSetup_ (self & embed)
    fun setExportFilename self filename = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withPtr ---> I) setExportFilename_ (self & filename)
    fun setHasSelection self hasSelection = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setHasSelection_ (self & hasSelection)
    fun setJobName self jobName = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withPtr ---> I) setJobName_ (self & jobName)
    fun setNPages self nPages = (GObjectObjectClass.C.withPtr &&&> FFI.Int.C.withVal ---> I) setNPages_ (self & nPages)
    fun setPrintSettings self printSettings = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withOptPtr ---> I) setPrintSettings_ (self & printSettings)
    fun setShowProgress self showProgress = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setShowProgress_ (self & showProgress)
    fun setSupportSelection self supportSelection = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setSupportSelection_ (self & supportSelection)
    fun setTrackPrintStatus self trackStatus = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setTrackPrintStatus_ (self & trackStatus)
    fun setUnit self unit = (GObjectObjectClass.C.withPtr &&&> GtkUnit.C.withVal ---> I) setUnit_ (self & unit)
    fun setUseFullPage self fullPage = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setUseFullPage_ (self & fullPage)
    local
      open ClosureMarshal Signal
    in
      fun beginPrintSig f = signal "begin-print" (get 0w1 GtkPrintContextClass.t ---> ret_void) f
      fun createCustomWidgetSig f = signal "create-custom-widget" (void ---> ret GObjectObjectClass.t) f
      fun customWidgetApplySig f = signal "custom-widget-apply" (get 0w1 GtkWidgetClass.t ---> ret_void) f
      fun doneSig f = signal "done" (get 0w1 GtkPrintOperationResult.t ---> ret_void) f
      fun drawPageSig f = signal "draw-page" (get 0w1 GtkPrintContextClass.t &&&> get 0w2 int ---> ret_void) (fn context & pageNr => f context pageNr)
      fun endPrintSig f = signal "end-print" (get 0w1 GtkPrintContextClass.t ---> ret_void) f
      fun paginateSig f = signal "paginate" (get 0w1 GtkPrintContextClass.t ---> ret boolean) f
      fun previewSig f =
        signal "preview"
          (
            get 0w1 GtkPrintOperationPreviewClass.t
             &&&> get 0w2 GtkPrintContextClass.t
             &&&> get 0w3 GtkWindowClass.tOpt
             ---> ret boolean
          )
          (
            fn
              preview
               & context
               & parent =>
                f preview context parent
          )
      fun requestPageSetupSig f =
        signal "request-page-setup"
          (
            get 0w1 GtkPrintContextClass.t
             &&&> get 0w2 int
             &&&> get 0w3 GtkPageSetupClass.t
             ---> ret_void
          )
          (
            fn
              context
               & pageNr
               & setup =>
                f context pageNr setup
          )
      fun statusChangedSig f = signal "status-changed" (void ---> ret_void) f
      fun updateCustomWidgetSig f =
        signal "update-custom-widget"
          (
            get 0w1 GtkWidgetClass.t
             &&&> get 0w2 GtkPageSetupClass.t
             &&&> get 0w3 GtkPrintSettingsClass.t
             ---> ret_void
          )
          (
            fn
              widget
               & setup
               & settings =>
                f widget setup settings
          )
    end
    local
      open Property
    in
      val allowAsyncProp =
        {
          get = fn x => get "allow-async" boolean x,
          set = fn x => set "allow-async" boolean x
        }
      val currentPageProp =
        {
          get = fn x => get "current-page" int x,
          set = fn x => set "current-page" int x
        }
      val customTabLabelProp =
        {
          get = fn x => get "custom-tab-label" stringOpt x,
          set = fn x => set "custom-tab-label" stringOpt x
        }
      val defaultPageSetupProp =
        {
          get = fn x => get "default-page-setup" GtkPageSetupClass.tOpt x,
          set = fn x => set "default-page-setup" GtkPageSetupClass.tOpt x
        }
      val embedPageSetupProp =
        {
          get = fn x => get "embed-page-setup" boolean x,
          set = fn x => set "embed-page-setup" boolean x
        }
      val exportFilenameProp =
        {
          get = fn x => get "export-filename" stringOpt x,
          set = fn x => set "export-filename" stringOpt x
        }
      val hasSelectionProp =
        {
          get = fn x => get "has-selection" boolean x,
          set = fn x => set "has-selection" boolean x
        }
      val jobNameProp =
        {
          get = fn x => get "job-name" stringOpt x,
          set = fn x => set "job-name" stringOpt x
        }
      val nPagesProp =
        {
          get = fn x => get "n-pages" int x,
          set = fn x => set "n-pages" int x
        }
      val nPagesToPrintProp = {get = fn x => get "n-pages-to-print" int x}
      val printSettingsProp =
        {
          get = fn x => get "print-settings" GtkPrintSettingsClass.tOpt x,
          set = fn x => set "print-settings" GtkPrintSettingsClass.tOpt x
        }
      val showProgressProp =
        {
          get = fn x => get "show-progress" boolean x,
          set = fn x => set "show-progress" boolean x
        }
      val statusProp = {get = fn x => get "status" GtkPrintStatus.t x}
      val statusStringProp = {get = fn x => get "status-string" stringOpt x}
      val supportSelectionProp =
        {
          get = fn x => get "support-selection" boolean x,
          set = fn x => set "support-selection" boolean x
        }
      val trackPrintStatusProp =
        {
          get = fn x => get "track-print-status" boolean x,
          set = fn x => set "track-print-status" boolean x
        }
      val unitProp =
        {
          get = fn x => get "unit" GtkUnit.t x,
          set = fn x => set "unit" GtkUnit.t x
        }
      val useFullPageProp =
        {
          get = fn x => get "use-full-page" boolean x,
          set = fn x => set "use-full-page" boolean x
        }
    end
  end
