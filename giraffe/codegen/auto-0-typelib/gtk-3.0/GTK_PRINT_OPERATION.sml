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
    val allowAsyncProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
    val currentPageProp :
      {
        get : 'a class -> LargeInt.int,
        set :
          LargeInt.int
           -> 'a class
           -> unit,
        new : LargeInt.int -> 'a class Property.t
      }
    val customTabLabelProp :
      {
        get : 'a class -> string option,
        set :
          string option
           -> 'a class
           -> unit,
        new : string option -> 'a class Property.t
      }
    val defaultPageSetupProp :
      {
        get : 'a class -> base page_setup_class option,
        set :
          'b page_setup_class option
           -> 'a class
           -> unit,
        new : 'b page_setup_class option -> 'a class Property.t
      }
    val embedPageSetupProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
    val exportFilenameProp :
      {
        get : 'a class -> string option,
        set :
          string option
           -> 'a class
           -> unit,
        new : string option -> 'a class Property.t
      }
    val hasSelectionProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
    val jobNameProp :
      {
        get : 'a class -> string option,
        set :
          string option
           -> 'a class
           -> unit,
        new : string option -> 'a class Property.t
      }
    val nPagesProp :
      {
        get : 'a class -> LargeInt.int,
        set :
          LargeInt.int
           -> 'a class
           -> unit,
        new : LargeInt.int -> 'a class Property.t
      }
    val nPagesToPrintProp : {get : 'a class -> LargeInt.int}
    val printSettingsProp :
      {
        get : 'a class -> base print_settings_class option,
        set :
          'b print_settings_class option
           -> 'a class
           -> unit,
        new : 'b print_settings_class option -> 'a class Property.t
      }
    val showProgressProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
    val statusProp : {get : 'a class -> print_status_t}
    val statusStringProp : {get : 'a class -> string option}
    val supportSelectionProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
    val trackPrintStatusProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
    val unitProp :
      {
        get : 'a class -> unit_t,
        set :
          unit_t
           -> 'a class
           -> unit,
        new : unit_t -> 'a class Property.t
      }
    val useFullPageProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
  end
