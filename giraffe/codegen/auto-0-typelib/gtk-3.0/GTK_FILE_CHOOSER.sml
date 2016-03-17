signature GTK_FILE_CHOOSER =
  sig
    type 'a class
    type file_chooser_confirmation_t
    type file_chooser_action_t
    type 'a file_filter_class
    type 'a widget_class
    type t = base class
    val getType : unit -> GObject.Type.t
    val addFilter :
      'a class
       -> 'b file_filter_class
       -> unit
    val addShortcutFolder :
      'a class
       -> string
       -> bool
    val addShortcutFolderUri :
      'a class
       -> string
       -> bool
    val getAction : 'a class -> file_chooser_action_t
    val getCreateFolders : 'a class -> bool
    val getCurrentFolder : 'a class -> string option
    val getCurrentFolderFile : 'a class -> base Gio.FileClass.class
    val getCurrentFolderUri : 'a class -> string option
    val getDoOverwriteConfirmation : 'a class -> bool
    val getExtraWidget : 'a class -> base widget_class option
    val getFile : 'a class -> base Gio.FileClass.class
    val getFilename : 'a class -> string option
    val getFilter : 'a class -> base file_filter_class option
    val getLocalOnly : 'a class -> bool
    val getPreviewFile : 'a class -> base Gio.FileClass.class option
    val getPreviewFilename : 'a class -> string option
    val getPreviewUri : 'a class -> string option
    val getPreviewWidget : 'a class -> base widget_class option
    val getPreviewWidgetActive : 'a class -> bool
    val getSelectMultiple : 'a class -> bool
    val getShowHidden : 'a class -> bool
    val getUri : 'a class -> string option
    val getUsePreviewLabel : 'a class -> bool
    val removeFilter :
      'a class
       -> 'b file_filter_class
       -> unit
    val removeShortcutFolder :
      'a class
       -> string
       -> bool
    val removeShortcutFolderUri :
      'a class
       -> string
       -> bool
    val selectAll : 'a class -> unit
    val selectFile :
      'a class
       -> 'b Gio.FileClass.class
       -> bool
    val selectFilename :
      'a class
       -> string
       -> bool
    val selectUri :
      'a class
       -> string
       -> bool
    val setAction :
      'a class
       -> file_chooser_action_t
       -> unit
    val setCreateFolders :
      'a class
       -> bool
       -> unit
    val setCurrentFolder :
      'a class
       -> string
       -> bool
    val setCurrentFolderFile :
      'a class
       -> 'b Gio.FileClass.class
       -> bool
    val setCurrentFolderUri :
      'a class
       -> string
       -> bool
    val setCurrentName :
      'a class
       -> string
       -> unit
    val setDoOverwriteConfirmation :
      'a class
       -> bool
       -> unit
    val setExtraWidget :
      'a class
       -> 'b widget_class
       -> unit
    val setFile :
      'a class
       -> 'b Gio.FileClass.class
       -> bool
    val setFilename :
      'a class
       -> string
       -> bool
    val setFilter :
      'a class
       -> 'b file_filter_class
       -> unit
    val setLocalOnly :
      'a class
       -> bool
       -> unit
    val setPreviewWidget :
      'a class
       -> 'b widget_class
       -> unit
    val setPreviewWidgetActive :
      'a class
       -> bool
       -> unit
    val setSelectMultiple :
      'a class
       -> bool
       -> unit
    val setShowHidden :
      'a class
       -> bool
       -> unit
    val setUri :
      'a class
       -> string
       -> bool
    val setUsePreviewLabel :
      'a class
       -> bool
       -> unit
    val unselectAll : 'a class -> unit
    val unselectFile :
      'a class
       -> 'b Gio.FileClass.class
       -> unit
    val unselectFilename :
      'a class
       -> string
       -> unit
    val unselectUri :
      'a class
       -> string
       -> unit
    val confirmOverwriteSig : (unit -> file_chooser_confirmation_t) -> 'a class Signal.signal
    val currentFolderChangedSig : (unit -> unit) -> 'a class Signal.signal
    val fileActivatedSig : (unit -> unit) -> 'a class Signal.signal
    val selectionChangedSig : (unit -> unit) -> 'a class Signal.signal
    val updatePreviewSig : (unit -> unit) -> 'a class Signal.signal
    val actionProp : ('a class, file_chooser_action_t, file_chooser_action_t) Property.readwrite
    val createFoldersProp : ('a class, bool, bool) Property.readwrite
    val doOverwriteConfirmationProp : ('a class, bool, bool) Property.readwrite
    val extraWidgetProp : ('a class, base widget_class option, 'b widget_class option) Property.readwrite
    val filterProp : ('a class, base file_filter_class option, 'b file_filter_class option) Property.readwrite
    val localOnlyProp : ('a class, bool, bool) Property.readwrite
    val previewWidgetProp : ('a class, base widget_class option, 'b widget_class option) Property.readwrite
    val previewWidgetActiveProp : ('a class, bool, bool) Property.readwrite
    val selectMultipleProp : ('a class, bool, bool) Property.readwrite
    val showHiddenProp : ('a class, bool, bool) Property.readwrite
    val usePreviewLabelProp : ('a class, bool, bool) Property.readwrite
  end
