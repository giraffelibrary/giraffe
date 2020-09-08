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
       -> print_operation_action_t * 'b window_class option
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
    val beginPrintSig : (base print_context_class -> unit) -> 'a class Signal.t
    val createCustomWidgetSig : (unit -> 'a GObject.ObjectClass.class) -> 'b class Signal.t
    val customWidgetApplySig : (base widget_class -> unit) -> 'a class Signal.t
    val doneSig : (print_operation_result_t -> unit) -> 'a class Signal.t
    val drawPageSig : (base print_context_class * LargeInt.int -> unit) -> 'a class Signal.t
    val endPrintSig : (base print_context_class -> unit) -> 'a class Signal.t
    val paginateSig : (base print_context_class -> bool) -> 'a class Signal.t
    val previewSig :
      (base print_operation_preview_class
        * base print_context_class
        * base window_class option
        -> bool)
       -> 'a class Signal.t
    val requestPageSetupSig :
      (base print_context_class
        * LargeInt.int
        * base page_setup_class
        -> unit)
       -> 'a class Signal.t
    val statusChangedSig : (unit -> unit) -> 'a class Signal.t
    val updateCustomWidgetSig :
      (base widget_class
        * base page_setup_class
        * base print_settings_class
        -> unit)
       -> 'a class Signal.t
    val allowAsyncProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val currentPageProp : ('a class, unit -> LargeInt.int, LargeInt.int -> unit, LargeInt.int -> unit) Property.t
    val customTabLabelProp : ('a class, unit -> string option, string option -> unit, string option -> unit) Property.t
    val defaultPageSetupProp : ('a class, unit -> base page_setup_class option, 'b page_setup_class option -> unit, 'b page_setup_class option -> unit) Property.t
    val embedPageSetupProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val exportFilenameProp : ('a class, unit -> string option, string option -> unit, string option -> unit) Property.t
    val hasSelectionProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val jobNameProp : ('a class, unit -> string option, string option -> unit, string option -> unit) Property.t
    val nPagesProp : ('a class, unit -> LargeInt.int, LargeInt.int -> unit, LargeInt.int -> unit) Property.t
    val nPagesToPrintProp : ('a class, unit -> LargeInt.int, unit, unit) Property.t
    val printSettingsProp : ('a class, unit -> base print_settings_class option, 'b print_settings_class option -> unit, 'b print_settings_class option -> unit) Property.t
    val showProgressProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val statusProp : ('a class, unit -> print_status_t, unit, unit) Property.t
    val statusStringProp : ('a class, unit -> string option, unit, unit) Property.t
    val supportSelectionProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val trackPrintStatusProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val unitProp : ('a class, unit -> unit_t, unit_t -> unit, unit_t -> unit) Property.t
    val useFullPageProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
  end
