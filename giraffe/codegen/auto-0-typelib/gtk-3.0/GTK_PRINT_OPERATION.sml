signature GTK_PRINT_OPERATION =
  sig
    type 'a class
    type print_operation_action_t
    type print_operation_result_t
    type 'a window_class
    type 'a print_operation_preview_class
    type 'a print_context_class
    type 'a widget_class
    type 'a page_setup_class
    type 'a print_settings_class
    type print_status_t
    type unit_t
    type t = base class
    val asPrintOperationPreview : 'a class -> base print_operation_preview_class
    val getType : unit -> GObject.Type.t
    val new : unit -> base class
    val cancel : 'a class -> unit
    val drawPageFinish : 'a class -> unit
    val getDefaultPageSetup : 'a class -> base page_setup_class
    val getEmbedPageSetup : 'a class -> bool
    val getError : 'a class -> unit
    val getHasSelection : 'a class -> bool
    val getNPagesToPrint : 'a class -> LargeInt.int
    val getPrintSettings : 'a class -> base print_settings_class
    val getStatus : 'a class -> print_status_t
    val getStatusString : 'a class -> string
    val getSupportSelection : 'a class -> bool
    val isFinished : 'a class -> bool
    val run :
      'a class
       -> print_operation_action_t
       -> 'b window_class option
       -> print_operation_result_t
    val setAllowAsync :
      'a class
       -> bool
       -> unit
    val setCurrentPage :
      'a class
       -> LargeInt.int
       -> unit
    val setCustomTabLabel :
      'a class
       -> string option
       -> unit
    val setDefaultPageSetup :
      'a class
       -> 'b page_setup_class option
       -> unit
    val setDeferDrawing : 'a class -> unit
    val setEmbedPageSetup :
      'a class
       -> bool
       -> unit
    val setExportFilename :
      'a class
       -> string
       -> unit
    val setHasSelection :
      'a class
       -> bool
       -> unit
    val setJobName :
      'a class
       -> string
       -> unit
    val setNPages :
      'a class
       -> LargeInt.int
       -> unit
    val setPrintSettings :
      'a class
       -> 'b print_settings_class option
       -> unit
    val setShowProgress :
      'a class
       -> bool
       -> unit
    val setSupportSelection :
      'a class
       -> bool
       -> unit
    val setTrackPrintStatus :
      'a class
       -> bool
       -> unit
    val setUnit :
      'a class
       -> unit_t
       -> unit
    val setUseFullPage :
      'a class
       -> bool
       -> unit
    val beginPrintSig : (base print_context_class -> unit) -> 'a class Signal.signal
    val createCustomWidgetSig : (unit -> 'a GObject.ObjectClass.class) -> 'b class Signal.signal
    val customWidgetApplySig : (base widget_class -> unit) -> 'a class Signal.signal
    val doneSig : (print_operation_result_t -> unit) -> 'a class Signal.signal
    val drawPageSig :
      (base print_context_class
        -> LargeInt.int
        -> unit)
       -> 'a class Signal.signal
    val endPrintSig : (base print_context_class -> unit) -> 'a class Signal.signal
    val paginateSig : (base print_context_class -> bool) -> 'a class Signal.signal
    val previewSig :
      (base print_operation_preview_class
        -> base print_context_class
        -> base window_class option
        -> bool)
       -> 'a class Signal.signal
    val requestPageSetupSig :
      (base print_context_class
        -> LargeInt.int
        -> base page_setup_class
        -> unit)
       -> 'a class Signal.signal
    val statusChangedSig : (unit -> unit) -> 'a class Signal.signal
    val updateCustomWidgetSig :
      (base widget_class
        -> base page_setup_class
        -> base print_settings_class
        -> unit)
       -> 'a class Signal.signal
    val allowAsyncProp : ('a class, bool, bool) Property.readwrite
    val currentPageProp : ('a class, LargeInt.int, LargeInt.int) Property.readwrite
    val customTabLabelProp : ('a class, string option, string option) Property.readwrite
    val defaultPageSetupProp : ('a class, base page_setup_class option, 'b page_setup_class option) Property.readwrite
    val embedPageSetupProp : ('a class, bool, bool) Property.readwrite
    val exportFilenameProp : ('a class, string option, string option) Property.readwrite
    val hasSelectionProp : ('a class, bool, bool) Property.readwrite
    val jobNameProp : ('a class, string option, string option) Property.readwrite
    val nPagesProp : ('a class, LargeInt.int, LargeInt.int) Property.readwrite
    val nPagesToPrintProp : ('a class, LargeInt.int) Property.readonly
    val printSettingsProp : ('a class, base print_settings_class option, 'b print_settings_class option) Property.readwrite
    val showProgressProp : ('a class, bool, bool) Property.readwrite
    val statusProp : ('a class, print_status_t) Property.readonly
    val statusStringProp : ('a class, string option) Property.readonly
    val supportSelectionProp : ('a class, bool, bool) Property.readwrite
    val trackPrintStatusProp : ('a class, bool, bool) Property.readwrite
    val unitProp : ('a class, unit_t, unit_t) Property.readwrite
    val useFullPageProp : ('a class, bool, bool) Property.readwrite
  end
