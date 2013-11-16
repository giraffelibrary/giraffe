signature GTK_FILE_CHOOSER =
  sig
    type 'a class_t
    type 'a widgetclass_t
    type 'a filefilterclass_t
    type filechooseraction_t
    type filechooserconfirmation_t
    val getType : unit -> GObject.Type.t
    val addFilter :
      'a class_t
       -> 'b filefilterclass_t
       -> unit
    val addShortcutFolder :
      'a class_t
       -> string
       -> bool
    val addShortcutFolderUri :
      'a class_t
       -> string
       -> bool
    val getAction : 'a class_t -> filechooseraction_t
    val getCreateFolders : 'a class_t -> bool
    val getCurrentFolder : 'a class_t -> string option
    val getCurrentFolderFile : 'a class_t -> base Gio.FileClass.t
    val getCurrentFolderUri : 'a class_t -> string option
    val getDoOverwriteConfirmation : 'a class_t -> bool
    val getExtraWidget : 'a class_t -> base widgetclass_t option
    val getFile : 'a class_t -> base Gio.FileClass.t
    val getFilename : 'a class_t -> string option
    val getFilter : 'a class_t -> base filefilterclass_t option
    val getLocalOnly : 'a class_t -> bool
    val getPreviewFile : 'a class_t -> base Gio.FileClass.t option
    val getPreviewFilename : 'a class_t -> string option
    val getPreviewUri : 'a class_t -> string option
    val getPreviewWidget : 'a class_t -> base widgetclass_t option
    val getPreviewWidgetActive : 'a class_t -> bool
    val getSelectMultiple : 'a class_t -> bool
    val getShowHidden : 'a class_t -> bool
    val getUri : 'a class_t -> string option
    val getUsePreviewLabel : 'a class_t -> bool
    val removeFilter :
      'a class_t
       -> 'b filefilterclass_t
       -> unit
    val removeShortcutFolder :
      'a class_t
       -> string
       -> bool
    val removeShortcutFolderUri :
      'a class_t
       -> string
       -> bool
    val selectAll : 'a class_t -> unit
    val selectFile :
      'a class_t
       -> 'b Gio.FileClass.t
       -> bool
    val selectFilename :
      'a class_t
       -> string
       -> bool
    val selectUri :
      'a class_t
       -> string
       -> bool
    val setAction :
      'a class_t
       -> filechooseraction_t
       -> unit
    val setCreateFolders :
      'a class_t
       -> bool
       -> unit
    val setCurrentFolder :
      'a class_t
       -> string
       -> bool
    val setCurrentFolderFile :
      'a class_t
       -> 'b Gio.FileClass.t
       -> bool
    val setCurrentFolderUri :
      'a class_t
       -> string
       -> bool
    val setCurrentName :
      'a class_t
       -> string
       -> unit
    val setDoOverwriteConfirmation :
      'a class_t
       -> bool
       -> unit
    val setExtraWidget :
      'a class_t
       -> 'b widgetclass_t
       -> unit
    val setFile :
      'a class_t
       -> 'b Gio.FileClass.t
       -> bool
    val setFilename :
      'a class_t
       -> string
       -> bool
    val setFilter :
      'a class_t
       -> 'b filefilterclass_t
       -> unit
    val setLocalOnly :
      'a class_t
       -> bool
       -> unit
    val setPreviewWidget :
      'a class_t
       -> 'b widgetclass_t
       -> unit
    val setPreviewWidgetActive :
      'a class_t
       -> bool
       -> unit
    val setSelectMultiple :
      'a class_t
       -> bool
       -> unit
    val setShowHidden :
      'a class_t
       -> bool
       -> unit
    val setUri :
      'a class_t
       -> string
       -> bool
    val setUsePreviewLabel :
      'a class_t
       -> bool
       -> unit
    val unselectAll : 'a class_t -> unit
    val unselectFile :
      'a class_t
       -> 'b Gio.FileClass.t
       -> unit
    val unselectFilename :
      'a class_t
       -> string
       -> unit
    val unselectUri :
      'a class_t
       -> string
       -> unit
    val confirmOverwriteSig : (unit -> filechooserconfirmation_t) -> 'a class_t Signal.signal
    val currentFolderChangedSig : (unit -> unit) -> 'a class_t Signal.signal
    val fileActivatedSig : (unit -> unit) -> 'a class_t Signal.signal
    val selectionChangedSig : (unit -> unit) -> 'a class_t Signal.signal
    val updatePreviewSig : (unit -> unit) -> 'a class_t Signal.signal
    val actionProp : ('a class_t, filechooseraction_t, filechooseraction_t) Property.readwrite
    val createFoldersProp : ('a class_t, bool, bool) Property.readwrite
    val doOverwriteConfirmationProp : ('a class_t, bool, bool) Property.readwrite
    val extraWidgetProp : ('a class_t, base widgetclass_t option, 'b widgetclass_t option) Property.readwrite
    val filterProp : ('a class_t, base filefilterclass_t option, 'b filefilterclass_t option) Property.readwrite
    val localOnlyProp : ('a class_t, bool, bool) Property.readwrite
    val previewWidgetProp : ('a class_t, base widgetclass_t option, 'b widgetclass_t option) Property.readwrite
    val previewWidgetActiveProp : ('a class_t, bool, bool) Property.readwrite
    val selectMultipleProp : ('a class_t, bool, bool) Property.readwrite
    val showHiddenProp : ('a class_t, bool, bool) Property.readwrite
    val usePreviewLabelProp : ('a class_t, bool, bool) Property.readwrite
  end
