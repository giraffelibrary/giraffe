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
      val getType_ = call (getSymbol "gtk_print_operation_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "gtk_print_operation_new") (cVoid --> GtkPrintOperationClass.PolyML.cPtr)
      val cancel_ = call (getSymbol "gtk_print_operation_cancel") (GtkPrintOperationClass.PolyML.cPtr --> cVoid)
      val drawPageFinish_ = call (getSymbol "gtk_print_operation_draw_page_finish") (GtkPrintOperationClass.PolyML.cPtr --> cVoid)
      val getDefaultPageSetup_ = call (getSymbol "gtk_print_operation_get_default_page_setup") (GtkPrintOperationClass.PolyML.cPtr --> GtkPageSetupClass.PolyML.cPtr)
      val getEmbedPageSetup_ = call (getSymbol "gtk_print_operation_get_embed_page_setup") (GtkPrintOperationClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getError_ = call (getSymbol "gtk_print_operation_get_error") (GtkPrintOperationClass.PolyML.cPtr &&> GLibErrorRecord.PolyML.cOutOptRef --> cVoid)
      val getHasSelection_ = call (getSymbol "gtk_print_operation_get_has_selection") (GtkPrintOperationClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getNPagesToPrint_ = call (getSymbol "gtk_print_operation_get_n_pages_to_print") (GtkPrintOperationClass.PolyML.cPtr --> GInt32.PolyML.cVal)
      val getPrintSettings_ = call (getSymbol "gtk_print_operation_get_print_settings") (GtkPrintOperationClass.PolyML.cPtr --> GtkPrintSettingsClass.PolyML.cPtr)
      val getStatus_ = call (getSymbol "gtk_print_operation_get_status") (GtkPrintOperationClass.PolyML.cPtr --> GtkPrintStatus.PolyML.cVal)
      val getStatusString_ = call (getSymbol "gtk_print_operation_get_status_string") (GtkPrintOperationClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getSupportSelection_ = call (getSymbol "gtk_print_operation_get_support_selection") (GtkPrintOperationClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val isFinished_ = call (getSymbol "gtk_print_operation_is_finished") (GtkPrintOperationClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val run_ =
        call (getSymbol "gtk_print_operation_run")
          (
            GtkPrintOperationClass.PolyML.cPtr
             &&> GtkPrintOperationAction.PolyML.cVal
             &&> GtkWindowClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GtkPrintOperationResult.PolyML.cVal
          )
      val setAllowAsync_ = call (getSymbol "gtk_print_operation_set_allow_async") (GtkPrintOperationClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setCurrentPage_ = call (getSymbol "gtk_print_operation_set_current_page") (GtkPrintOperationClass.PolyML.cPtr &&> GInt32.PolyML.cVal --> cVoid)
      val setCustomTabLabel_ = call (getSymbol "gtk_print_operation_set_custom_tab_label") (GtkPrintOperationClass.PolyML.cPtr &&> Utf8.PolyML.cInOptPtr --> cVoid)
      val setDefaultPageSetup_ = call (getSymbol "gtk_print_operation_set_default_page_setup") (GtkPrintOperationClass.PolyML.cPtr &&> GtkPageSetupClass.PolyML.cOptPtr --> cVoid)
      val setDeferDrawing_ = call (getSymbol "gtk_print_operation_set_defer_drawing") (GtkPrintOperationClass.PolyML.cPtr --> cVoid)
      val setEmbedPageSetup_ = call (getSymbol "gtk_print_operation_set_embed_page_setup") (GtkPrintOperationClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setExportFilename_ = call (getSymbol "gtk_print_operation_set_export_filename") (GtkPrintOperationClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> cVoid)
      val setHasSelection_ = call (getSymbol "gtk_print_operation_set_has_selection") (GtkPrintOperationClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setJobName_ = call (getSymbol "gtk_print_operation_set_job_name") (GtkPrintOperationClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> cVoid)
      val setNPages_ = call (getSymbol "gtk_print_operation_set_n_pages") (GtkPrintOperationClass.PolyML.cPtr &&> GInt32.PolyML.cVal --> cVoid)
      val setPrintSettings_ = call (getSymbol "gtk_print_operation_set_print_settings") (GtkPrintOperationClass.PolyML.cPtr &&> GtkPrintSettingsClass.PolyML.cOptPtr --> cVoid)
      val setShowProgress_ = call (getSymbol "gtk_print_operation_set_show_progress") (GtkPrintOperationClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setSupportSelection_ = call (getSymbol "gtk_print_operation_set_support_selection") (GtkPrintOperationClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setTrackPrintStatus_ = call (getSymbol "gtk_print_operation_set_track_print_status") (GtkPrintOperationClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setUnit_ = call (getSymbol "gtk_print_operation_set_unit") (GtkPrintOperationClass.PolyML.cPtr &&> GtkUnit.PolyML.cVal --> cVoid)
      val setUseFullPage_ = call (getSymbol "gtk_print_operation_set_use_full_page") (GtkPrintOperationClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
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
    fun asPrintOperationPreview self = (GObjectObjectClass.FFI.withPtr false ---> GtkPrintOperationPreviewClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkPrintOperationClass.FFI.fromPtr true) new_ ()
    fun cancel self = (GtkPrintOperationClass.FFI.withPtr false ---> I) cancel_ self
    fun drawPageFinish self = (GtkPrintOperationClass.FFI.withPtr false ---> I) drawPageFinish_ self
    fun getDefaultPageSetup self = (GtkPrintOperationClass.FFI.withPtr false ---> GtkPageSetupClass.FFI.fromPtr false) getDefaultPageSetup_ self
    fun getEmbedPageSetup self = (GtkPrintOperationClass.FFI.withPtr false ---> GBool.FFI.fromVal) getEmbedPageSetup_ self
    fun getError self = (GtkPrintOperationClass.FFI.withPtr false &&&> GLibErrorRecord.handleError ---> I) getError_ (self & [])
    fun getHasSelection self = (GtkPrintOperationClass.FFI.withPtr false ---> GBool.FFI.fromVal) getHasSelection_ self
    fun getNPagesToPrint self = (GtkPrintOperationClass.FFI.withPtr false ---> GInt32.FFI.fromVal) getNPagesToPrint_ self
    fun getPrintSettings self = (GtkPrintOperationClass.FFI.withPtr false ---> GtkPrintSettingsClass.FFI.fromPtr false) getPrintSettings_ self
    fun getStatus self = (GtkPrintOperationClass.FFI.withPtr false ---> GtkPrintStatus.FFI.fromVal) getStatus_ self
    fun getStatusString self = (GtkPrintOperationClass.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getStatusString_ self
    fun getSupportSelection self = (GtkPrintOperationClass.FFI.withPtr false ---> GBool.FFI.fromVal) getSupportSelection_ self
    fun isFinished self = (GtkPrintOperationClass.FFI.withPtr false ---> GBool.FFI.fromVal) isFinished_ self
    fun run self (action, parent) =
      (
        GtkPrintOperationClass.FFI.withPtr false
         &&&> GtkPrintOperationAction.FFI.withVal
         &&&> GtkWindowClass.FFI.withOptPtr false
         &&&> GLibErrorRecord.handleError
         ---> GtkPrintOperationResult.FFI.fromVal
      )
        run_
        (
          self
           & action
           & parent
           & []
        )
    fun setAllowAsync self allowAsync = (GtkPrintOperationClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setAllowAsync_ (self & allowAsync)
    fun setCurrentPage self currentPage = (GtkPrintOperationClass.FFI.withPtr false &&&> GInt32.FFI.withVal ---> I) setCurrentPage_ (self & currentPage)
    fun setCustomTabLabel self label = (GtkPrintOperationClass.FFI.withPtr false &&&> Utf8.FFI.withOptPtr 0 ---> I) setCustomTabLabel_ (self & label)
    fun setDefaultPageSetup self defaultPageSetup = (GtkPrintOperationClass.FFI.withPtr false &&&> GtkPageSetupClass.FFI.withOptPtr false ---> I) setDefaultPageSetup_ (self & defaultPageSetup)
    fun setDeferDrawing self = (GtkPrintOperationClass.FFI.withPtr false ---> I) setDeferDrawing_ self
    fun setEmbedPageSetup self embed = (GtkPrintOperationClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setEmbedPageSetup_ (self & embed)
    fun setExportFilename self filename = (GtkPrintOperationClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> I) setExportFilename_ (self & filename)
    fun setHasSelection self hasSelection = (GtkPrintOperationClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setHasSelection_ (self & hasSelection)
    fun setJobName self jobName = (GtkPrintOperationClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> I) setJobName_ (self & jobName)
    fun setNPages self nPages = (GtkPrintOperationClass.FFI.withPtr false &&&> GInt32.FFI.withVal ---> I) setNPages_ (self & nPages)
    fun setPrintSettings self printSettings = (GtkPrintOperationClass.FFI.withPtr false &&&> GtkPrintSettingsClass.FFI.withOptPtr false ---> I) setPrintSettings_ (self & printSettings)
    fun setShowProgress self showProgress = (GtkPrintOperationClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setShowProgress_ (self & showProgress)
    fun setSupportSelection self supportSelection = (GtkPrintOperationClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setSupportSelection_ (self & supportSelection)
    fun setTrackPrintStatus self trackStatus = (GtkPrintOperationClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setTrackPrintStatus_ (self & trackStatus)
    fun setUnit self unit = (GtkPrintOperationClass.FFI.withPtr false &&&> GtkUnit.FFI.withVal ---> I) setUnit_ (self & unit)
    fun setUseFullPage self fullPage = (GtkPrintOperationClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setUseFullPage_ (self & fullPage)
    local
      open ClosureMarshal Signal
    in
      fun beginPrintSig f = signal "begin-print" (get 0w1 GtkPrintContextClass.t ---> ret_void) f
      fun createCustomWidgetSig f = signal "create-custom-widget" (void ---> ret GObjectObjectClass.t) f
      fun customWidgetApplySig f = signal "custom-widget-apply" (get 0w1 GtkWidgetClass.t ---> ret_void) f
      fun doneSig f = signal "done" (get 0w1 GtkPrintOperationResult.t ---> ret_void) f
      fun drawPageSig f = signal "draw-page" (get 0w1 GtkPrintContextClass.t &&&> get 0w2 int ---> ret_void) (fn context & pageNr => f (context, pageNr))
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
                f
                  (
                    preview,
                    context,
                    parent
                  )
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
                f
                  (
                    context,
                    pageNr,
                    setup
                  )
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
                f
                  (
                    widget,
                    setup,
                    settings
                  )
          )
    end
    local
      open ValueAccessor
    in
      val allowAsyncProp =
        {
          name = "allow-async",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val currentPageProp =
        {
          name = "current-page",
          gtype = fn () => C.gtype int (),
          get = fn x => fn () => C.get int x,
          set = fn x => C.set int x,
          init = fn x => C.set int x
        }
      val customTabLabelProp =
        {
          name = "custom-tab-label",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = fn x => C.set stringOpt x,
          init = fn x => C.set stringOpt x
        }
      val defaultPageSetupProp =
        {
          name = "default-page-setup",
          gtype = fn () => C.gtype GtkPageSetupClass.tOpt (),
          get = fn x => fn () => C.get GtkPageSetupClass.tOpt x,
          set = fn x => C.set GtkPageSetupClass.tOpt x,
          init = fn x => C.set GtkPageSetupClass.tOpt x
        }
      val embedPageSetupProp =
        {
          name = "embed-page-setup",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val exportFilenameProp =
        {
          name = "export-filename",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = fn x => C.set stringOpt x,
          init = fn x => C.set stringOpt x
        }
      val hasSelectionProp =
        {
          name = "has-selection",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val jobNameProp =
        {
          name = "job-name",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = fn x => C.set stringOpt x,
          init = fn x => C.set stringOpt x
        }
      val nPagesProp =
        {
          name = "n-pages",
          gtype = fn () => C.gtype int (),
          get = fn x => fn () => C.get int x,
          set = fn x => C.set int x,
          init = fn x => C.set int x
        }
      val nPagesToPrintProp =
        {
          name = "n-pages-to-print",
          gtype = fn () => C.gtype int (),
          get = fn x => fn () => C.get int x,
          set = ignore,
          init = ignore
        }
      val printSettingsProp =
        {
          name = "print-settings",
          gtype = fn () => C.gtype GtkPrintSettingsClass.tOpt (),
          get = fn x => fn () => C.get GtkPrintSettingsClass.tOpt x,
          set = fn x => C.set GtkPrintSettingsClass.tOpt x,
          init = fn x => C.set GtkPrintSettingsClass.tOpt x
        }
      val showProgressProp =
        {
          name = "show-progress",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val statusProp =
        {
          name = "status",
          gtype = fn () => C.gtype GtkPrintStatus.t (),
          get = fn x => fn () => C.get GtkPrintStatus.t x,
          set = ignore,
          init = ignore
        }
      val statusStringProp =
        {
          name = "status-string",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = ignore,
          init = ignore
        }
      val supportSelectionProp =
        {
          name = "support-selection",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val trackPrintStatusProp =
        {
          name = "track-print-status",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val unitProp =
        {
          name = "unit",
          gtype = fn () => C.gtype GtkUnit.t (),
          get = fn x => fn () => C.get GtkUnit.t x,
          set = fn x => C.set GtkUnit.t x,
          init = fn x => C.set GtkUnit.t x
        }
      val useFullPageProp =
        {
          name = "use-full-page",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
    end
  end
