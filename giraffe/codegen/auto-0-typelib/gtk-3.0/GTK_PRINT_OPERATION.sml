signature GTK_PRINT_OPERATION =
  sig
    type 'a class_t
    type printoperationaction_t
    type printoperationresult_t
    type 'a windowclass_t
    type 'a printoperationpreviewclass_t
    type 'a printcontextclass_t
    type 'a widgetclass_t
    type 'a pagesetupclass_t
    type 'a printsettingsclass_t
    type printstatus_t
    type unit_t
    type t = base class_t
    val asPrintOperationPreview : 'a class_t -> base printoperationpreviewclass_t
    val getType : unit -> GObject.Type.t
    val new : unit -> base class_t
    val cancel : 'a class_t -> unit
    val drawPageFinish : 'a class_t -> unit
    val getDefaultPageSetup : 'a class_t -> base pagesetupclass_t
    val getEmbedPageSetup : 'a class_t -> bool
    val getError : 'a class_t -> unit
    val getHasSelection : 'a class_t -> bool
    val getNPagesToPrint : 'a class_t -> LargeInt.int
    val getPrintSettings : 'a class_t -> base printsettingsclass_t
    val getStatus : 'a class_t -> printstatus_t
    val getStatusString : 'a class_t -> string
    val getSupportSelection : 'a class_t -> bool
    val isFinished : 'a class_t -> bool
    val run :
      'a class_t
       -> printoperationaction_t
       -> 'b windowclass_t option
       -> printoperationresult_t
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
       -> 'b pagesetupclass_t option
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
       -> 'b printsettingsclass_t option
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
    val beginPrintSig : (base printcontextclass_t -> unit) -> 'a class_t Signal.signal
    val createCustomWidgetSig : (unit -> 'a GObject.ObjectClass.t) -> 'b class_t Signal.signal
    val customWidgetApplySig : (base widgetclass_t -> unit) -> 'a class_t Signal.signal
    val doneSig : (printoperationresult_t -> unit) -> 'a class_t Signal.signal
    val drawPageSig :
      (base printcontextclass_t
        -> LargeInt.int
        -> unit)
       -> 'a class_t Signal.signal
    val endPrintSig : (base printcontextclass_t -> unit) -> 'a class_t Signal.signal
    val paginateSig : (base printcontextclass_t -> bool) -> 'a class_t Signal.signal
    val previewSig :
      (base printoperationpreviewclass_t
        -> base printcontextclass_t
        -> base windowclass_t option
        -> bool)
       -> 'a class_t Signal.signal
    val requestPageSetupSig :
      (base printcontextclass_t
        -> LargeInt.int
        -> base pagesetupclass_t
        -> unit)
       -> 'a class_t Signal.signal
    val statusChangedSig : (unit -> unit) -> 'a class_t Signal.signal
    val updateCustomWidgetSig :
      (base widgetclass_t
        -> base pagesetupclass_t
        -> base printsettingsclass_t
        -> unit)
       -> 'a class_t Signal.signal
    val allowAsyncProp : ('a class_t, bool, bool) Property.readwrite
    val currentPageProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
    val customTabLabelProp : ('a class_t, string option, string option) Property.readwrite
    val defaultPageSetupProp : ('a class_t, base pagesetupclass_t option, 'b pagesetupclass_t option) Property.readwrite
    val embedPageSetupProp : ('a class_t, bool, bool) Property.readwrite
    val exportFilenameProp : ('a class_t, string option, string option) Property.readwrite
    val hasSelectionProp : ('a class_t, bool, bool) Property.readwrite
    val jobNameProp : ('a class_t, string option, string option) Property.readwrite
    val nPagesProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
    val nPagesToPrintProp : ('a class_t, LargeInt.int) Property.readonly
    val printSettingsProp : ('a class_t, base printsettingsclass_t option, 'b printsettingsclass_t option) Property.readwrite
    val showProgressProp : ('a class_t, bool, bool) Property.readwrite
    val statusProp : ('a class_t, printstatus_t) Property.readonly
    val statusStringProp : ('a class_t, string option) Property.readonly
    val supportSelectionProp : ('a class_t, bool, bool) Property.readwrite
    val trackPrintStatusProp : ('a class_t, bool, bool) Property.readwrite
    val unitProp : ('a class_t, unit_t, unit_t) Property.readwrite
    val useFullPageProp : ('a class_t, bool, bool) Property.readwrite
  end
