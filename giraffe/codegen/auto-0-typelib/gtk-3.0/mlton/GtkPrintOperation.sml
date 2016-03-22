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
    val getType_ = _import "gtk_print_operation_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "gtk_print_operation_new" : unit -> GtkPrintOperationClass.C.notnull GtkPrintOperationClass.C.p;
    val cancel_ = _import "gtk_print_operation_cancel" : GtkPrintOperationClass.C.notnull GtkPrintOperationClass.C.p -> unit;
    val drawPageFinish_ = _import "gtk_print_operation_draw_page_finish" : GtkPrintOperationClass.C.notnull GtkPrintOperationClass.C.p -> unit;
    val getDefaultPageSetup_ = _import "gtk_print_operation_get_default_page_setup" : GtkPrintOperationClass.C.notnull GtkPrintOperationClass.C.p -> GtkPageSetupClass.C.notnull GtkPageSetupClass.C.p;
    val getEmbedPageSetup_ = _import "gtk_print_operation_get_embed_page_setup" : GtkPrintOperationClass.C.notnull GtkPrintOperationClass.C.p -> FFI.Bool.C.val_;
    val getError_ = fn x1 & x2 => (_import "gtk_print_operation_get_error" : GtkPrintOperationClass.C.notnull GtkPrintOperationClass.C.p * (unit, unit) GLibErrorRecord.C.r -> unit;) (x1, x2)
    val getHasSelection_ = _import "gtk_print_operation_get_has_selection" : GtkPrintOperationClass.C.notnull GtkPrintOperationClass.C.p -> FFI.Bool.C.val_;
    val getNPagesToPrint_ = _import "gtk_print_operation_get_n_pages_to_print" : GtkPrintOperationClass.C.notnull GtkPrintOperationClass.C.p -> FFI.Int32.C.val_;
    val getPrintSettings_ = _import "gtk_print_operation_get_print_settings" : GtkPrintOperationClass.C.notnull GtkPrintOperationClass.C.p -> GtkPrintSettingsClass.C.notnull GtkPrintSettingsClass.C.p;
    val getStatus_ = _import "gtk_print_operation_get_status" : GtkPrintOperationClass.C.notnull GtkPrintOperationClass.C.p -> GtkPrintStatus.C.val_;
    val getStatusString_ = _import "gtk_print_operation_get_status_string" : GtkPrintOperationClass.C.notnull GtkPrintOperationClass.C.p -> Utf8.C.notnull Utf8.C.out_p;
    val getSupportSelection_ = _import "gtk_print_operation_get_support_selection" : GtkPrintOperationClass.C.notnull GtkPrintOperationClass.C.p -> FFI.Bool.C.val_;
    val isFinished_ = _import "gtk_print_operation_is_finished" : GtkPrintOperationClass.C.notnull GtkPrintOperationClass.C.p -> FFI.Bool.C.val_;
    val run_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "gtk_print_operation_run" :
              GtkPrintOperationClass.C.notnull GtkPrintOperationClass.C.p
               * GtkPrintOperationAction.C.val_
               * unit GtkWindowClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> GtkPrintOperationResult.C.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val setAllowAsync_ = fn x1 & x2 => (_import "gtk_print_operation_set_allow_async" : GtkPrintOperationClass.C.notnull GtkPrintOperationClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setCurrentPage_ = fn x1 & x2 => (_import "gtk_print_operation_set_current_page" : GtkPrintOperationClass.C.notnull GtkPrintOperationClass.C.p * FFI.Int32.C.val_ -> unit;) (x1, x2)
    val setCustomTabLabel_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_print_operation_set_custom_tab_label" :
              GtkPrintOperationClass.C.notnull GtkPrintOperationClass.C.p
               * Utf8.MLton.p1
               * unit Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setDefaultPageSetup_ = fn x1 & x2 => (_import "gtk_print_operation_set_default_page_setup" : GtkPrintOperationClass.C.notnull GtkPrintOperationClass.C.p * unit GtkPageSetupClass.C.p -> unit;) (x1, x2)
    val setDeferDrawing_ = _import "gtk_print_operation_set_defer_drawing" : GtkPrintOperationClass.C.notnull GtkPrintOperationClass.C.p -> unit;
    val setEmbedPageSetup_ = fn x1 & x2 => (_import "gtk_print_operation_set_embed_page_setup" : GtkPrintOperationClass.C.notnull GtkPrintOperationClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setExportFilename_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_print_operation_set_export_filename" :
              GtkPrintOperationClass.C.notnull GtkPrintOperationClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setHasSelection_ = fn x1 & x2 => (_import "gtk_print_operation_set_has_selection" : GtkPrintOperationClass.C.notnull GtkPrintOperationClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setJobName_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_print_operation_set_job_name" :
              GtkPrintOperationClass.C.notnull GtkPrintOperationClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setNPages_ = fn x1 & x2 => (_import "gtk_print_operation_set_n_pages" : GtkPrintOperationClass.C.notnull GtkPrintOperationClass.C.p * FFI.Int32.C.val_ -> unit;) (x1, x2)
    val setPrintSettings_ = fn x1 & x2 => (_import "gtk_print_operation_set_print_settings" : GtkPrintOperationClass.C.notnull GtkPrintOperationClass.C.p * unit GtkPrintSettingsClass.C.p -> unit;) (x1, x2)
    val setShowProgress_ = fn x1 & x2 => (_import "gtk_print_operation_set_show_progress" : GtkPrintOperationClass.C.notnull GtkPrintOperationClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setSupportSelection_ = fn x1 & x2 => (_import "gtk_print_operation_set_support_selection" : GtkPrintOperationClass.C.notnull GtkPrintOperationClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setTrackPrintStatus_ = fn x1 & x2 => (_import "gtk_print_operation_set_track_print_status" : GtkPrintOperationClass.C.notnull GtkPrintOperationClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setUnit_ = fn x1 & x2 => (_import "gtk_print_operation_set_unit" : GtkPrintOperationClass.C.notnull GtkPrintOperationClass.C.p * GtkUnit.C.val_ -> unit;) (x1, x2)
    val setUseFullPage_ = fn x1 & x2 => (_import "gtk_print_operation_set_use_full_page" : GtkPrintOperationClass.C.notnull GtkPrintOperationClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
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
    fun cancel self = (GtkPrintOperationClass.C.withPtr ---> I) cancel_ self
    fun drawPageFinish self = (GtkPrintOperationClass.C.withPtr ---> I) drawPageFinish_ self
    fun getDefaultPageSetup self = (GtkPrintOperationClass.C.withPtr ---> GtkPageSetupClass.C.fromPtr false) getDefaultPageSetup_ self
    fun getEmbedPageSetup self = (GtkPrintOperationClass.C.withPtr ---> FFI.Bool.C.fromVal) getEmbedPageSetup_ self
    fun getError self = (GtkPrintOperationClass.C.withPtr &&&> GLibErrorRecord.handleError ---> I) getError_ (self & [])
    fun getHasSelection self = (GtkPrintOperationClass.C.withPtr ---> FFI.Bool.C.fromVal) getHasSelection_ self
    fun getNPagesToPrint self = (GtkPrintOperationClass.C.withPtr ---> FFI.Int32.C.fromVal) getNPagesToPrint_ self
    fun getPrintSettings self = (GtkPrintOperationClass.C.withPtr ---> GtkPrintSettingsClass.C.fromPtr false) getPrintSettings_ self
    fun getStatus self = (GtkPrintOperationClass.C.withPtr ---> GtkPrintStatus.C.fromVal) getStatus_ self
    fun getStatusString self = (GtkPrintOperationClass.C.withPtr ---> Utf8.C.fromPtr false) getStatusString_ self
    fun getSupportSelection self = (GtkPrintOperationClass.C.withPtr ---> FFI.Bool.C.fromVal) getSupportSelection_ self
    fun isFinished self = (GtkPrintOperationClass.C.withPtr ---> FFI.Bool.C.fromVal) isFinished_ self
    fun run self action parent =
      (
        GtkPrintOperationClass.C.withPtr
         &&&> GtkPrintOperationAction.C.withVal
         &&&> GtkWindowClass.C.withOptPtr
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
    fun setAllowAsync self allowAsync = (GtkPrintOperationClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setAllowAsync_ (self & allowAsync)
    fun setCurrentPage self currentPage = (GtkPrintOperationClass.C.withPtr &&&> FFI.Int32.C.withVal ---> I) setCurrentPage_ (self & currentPage)
    fun setCustomTabLabel self label = (GtkPrintOperationClass.C.withPtr &&&> Utf8.C.withOptPtr ---> I) setCustomTabLabel_ (self & label)
    fun setDefaultPageSetup self defaultPageSetup = (GtkPrintOperationClass.C.withPtr &&&> GtkPageSetupClass.C.withOptPtr ---> I) setDefaultPageSetup_ (self & defaultPageSetup)
    fun setDeferDrawing self = (GtkPrintOperationClass.C.withPtr ---> I) setDeferDrawing_ self
    fun setEmbedPageSetup self embed = (GtkPrintOperationClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setEmbedPageSetup_ (self & embed)
    fun setExportFilename self filename = (GtkPrintOperationClass.C.withPtr &&&> Utf8.C.withPtr ---> I) setExportFilename_ (self & filename)
    fun setHasSelection self hasSelection = (GtkPrintOperationClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setHasSelection_ (self & hasSelection)
    fun setJobName self jobName = (GtkPrintOperationClass.C.withPtr &&&> Utf8.C.withPtr ---> I) setJobName_ (self & jobName)
    fun setNPages self nPages = (GtkPrintOperationClass.C.withPtr &&&> FFI.Int32.C.withVal ---> I) setNPages_ (self & nPages)
    fun setPrintSettings self printSettings = (GtkPrintOperationClass.C.withPtr &&&> GtkPrintSettingsClass.C.withOptPtr ---> I) setPrintSettings_ (self & printSettings)
    fun setShowProgress self showProgress = (GtkPrintOperationClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setShowProgress_ (self & showProgress)
    fun setSupportSelection self supportSelection = (GtkPrintOperationClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setSupportSelection_ (self & supportSelection)
    fun setTrackPrintStatus self trackStatus = (GtkPrintOperationClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setTrackPrintStatus_ (self & trackStatus)
    fun setUnit self unit = (GtkPrintOperationClass.C.withPtr &&&> GtkUnit.C.withVal ---> I) setUnit_ (self & unit)
    fun setUseFullPage self fullPage = (GtkPrintOperationClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setUseFullPage_ (self & fullPage)
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
