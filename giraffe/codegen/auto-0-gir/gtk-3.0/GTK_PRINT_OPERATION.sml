signature GTK_PRINT_OPERATION =
  sig
    type 'a class_t
    type print_operation_action_t
    type print_operation_result_t
    type 'a window_class_t
    type 'a print_operation_preview_class_t
    type 'a print_context_class_t
    type 'a widget_class_t
    type 'a page_setup_class_t
    type 'a print_settings_class_t
    type print_status_t
    type unit_t
    type t = base class_t
    val asPrintOperationPreview : 'a class_t -> base print_operation_preview_class_t
    val getType : unit -> GObject.Type.t
    val new : unit -> base class_t
    val cancel : 'a class_t -> unit
    val drawPageFinish : 'a class_t -> unit
    val getDefaultPageSetup : 'a class_t -> base page_setup_class_t
    val getEmbedPageSetup : 'a class_t -> bool
    val getError : 'a class_t -> unit
    val getHasSelection : 'a class_t -> bool
    val getNPagesToPrint : 'a class_t -> LargeInt.int
    val getPrintSettings : 'a class_t -> base print_settings_class_t
    val getStatus : 'a class_t -> print_status_t
    val getStatusString : 'a class_t -> string
    val getSupportSelection : 'a class_t -> bool
    val isFinished : 'a class_t -> bool
    val run :
      'a class_t
       -> print_operation_action_t
       -> 'b window_class_t option
       -> print_operation_result_t
    val setAllowAsync :
      'a class_t
       -> bool
       -> unit
    val setCurrentPage :
      'a class_t
       -> LargeInt.int
       -> unit
    val setCustomTabLabel :
      'a class_t
       -> string option
       -> unit
    val setDefaultPageSetup :
      'a class_t
       -> 'b page_setup_class_t option
       -> unit
    val setDeferDrawing : 'a class_t -> unit
    val setEmbedPageSetup :
      'a class_t
       -> bool
       -> unit
    val setExportFilename :
      'a class_t
       -> string
       -> unit
    val setHasSelection :
      'a class_t
       -> bool
       -> unit
    val setJobName :
      'a class_t
       -> string
       -> unit
    val setNPages :
      'a class_t
       -> LargeInt.int
       -> unit
    val setPrintSettings :
      'a class_t
       -> 'b print_settings_class_t option
       -> unit
    val setShowProgress :
      'a class_t
       -> bool
       -> unit
    val setSupportSelection :
      'a class_t
       -> bool
       -> unit
    val setTrackPrintStatus :
      'a class_t
       -> bool
       -> unit
    val setUnit :
      'a class_t
       -> unit_t
       -> unit
    val setUseFullPage :
      'a class_t
       -> bool
       -> unit
    val beginPrintSig : (base print_context_class_t -> unit) -> 'a class_t Signal.signal
    val createCustomWidgetSig : (unit -> 'a GObject.ObjectClass.t) -> 'b class_t Signal.signal
    val customWidgetApplySig : (base widget_class_t -> unit) -> 'a class_t Signal.signal
    val doneSig : (print_operation_result_t -> unit) -> 'a class_t Signal.signal
    val drawPageSig :
      (base print_context_class_t
        -> LargeInt.int
        -> unit)
       -> 'a class_t Signal.signal
    val endPrintSig : (base print_context_class_t -> unit) -> 'a class_t Signal.signal
    val paginateSig : (base print_context_class_t -> bool) -> 'a class_t Signal.signal
    val previewSig :
      (base print_operation_preview_class_t
        -> base print_context_class_t
        -> base window_class_t option
        -> bool)
       -> 'a class_t Signal.signal
    val requestPageSetupSig :
      (base print_context_class_t
        -> LargeInt.int
        -> base page_setup_class_t
        -> unit)
       -> 'a class_t Signal.signal
    val statusChangedSig : (unit -> unit) -> 'a class_t Signal.signal
    val updateCustomWidgetSig :
      (base widget_class_t
        -> base page_setup_class_t
        -> base print_settings_class_t
        -> unit)
       -> 'a class_t Signal.signal
    val allowAsyncProp : ('a class_t, bool, bool) Property.readwrite
    val currentPageProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
    val customTabLabelProp : ('a class_t, string option, string option) Property.readwrite
    val defaultPageSetupProp : ('a class_t, base page_setup_class_t option, 'b page_setup_class_t option) Property.readwrite
    val embedPageSetupProp : ('a class_t, bool, bool) Property.readwrite
    val exportFilenameProp : ('a class_t, string option, string option) Property.readwrite
    val hasSelectionProp : ('a class_t, bool, bool) Property.readwrite
    val jobNameProp : ('a class_t, string option, string option) Property.readwrite
    val nPagesProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
    val nPagesToPrintProp : ('a class_t, LargeInt.int) Property.readonly
    val printSettingsProp : ('a class_t, base print_settings_class_t option, 'b print_settings_class_t option) Property.readwrite
    val showProgressProp : ('a class_t, bool, bool) Property.readwrite
    val statusProp : ('a class_t, print_status_t) Property.readonly
    val statusStringProp : ('a class_t, string option) Property.readonly
    val supportSelectionProp : ('a class_t, bool, bool) Property.readwrite
    val trackPrintStatusProp : ('a class_t, bool, bool) Property.readwrite
    val unitProp : ('a class_t, unit_t, unit_t) Property.readwrite
    val useFullPageProp : ('a class_t, bool, bool) Property.readwrite
  end
