signature GTK_FILE_CHOOSER =
  sig
    type 'a class
    type file_chooser_confirmation_t
    type file_chooser_action_t
    type 'a file_filter_class
    type 'a widget_class
    type t = base class
    val getType : unit -> GObject.Type.t
    val addChoice :
      'a class
       -> string
           * string
           * string
           * string
       -> unit
    val addShortcutFolder :
      'a class
       -> string
       -> unit
    val addShortcutFolderUri :
      'a class
       -> string
       -> unit
    val getAction : 'a class -> file_chooser_action_t
    val getChoice :
      'a class
       -> string
       -> string
    val getCreateFolders : 'a class -> bool
    val getCurrentFolder : 'a class -> string option
    val getCurrentFolderFile : 'a class -> base Gio.FileClass.class
    val getCurrentFolderUri : 'a class -> string option
    val getCurrentName : 'a class -> string
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
    val removeChoice :
      'a class
       -> string
       -> unit
    val removeFilter :
      'a class
       -> 'b file_filter_class
       -> unit
    val removeShortcutFolder :
      'a class
       -> string
       -> unit
    val removeShortcutFolderUri :
      'a class
       -> string
       -> unit
    val selectAll : 'a class -> unit
    val selectFile :
      'a class
       -> 'b Gio.FileClass.class
       -> unit
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
    val setChoice :
      'a class
       -> string * string
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
       -> unit
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
       -> unit
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
    val confirmOverwriteSig : (unit -> file_chooser_confirmation_t) -> 'a class Signal.t
    val currentFolderChangedSig : (unit -> unit) -> 'a class Signal.t
    val fileActivatedSig : (unit -> unit) -> 'a class Signal.t
    val selectionChangedSig : (unit -> unit) -> 'a class Signal.t
    val updatePreviewSig : (unit -> unit) -> 'a class Signal.t
    val actionProp :
      {
        get : 'a class -> file_chooser_action_t,
        set :
          file_chooser_action_t
           -> 'a class
           -> unit,
        new : file_chooser_action_t -> 'a class Property.t
      }
    val createFoldersProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
    val doOverwriteConfirmationProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
    val extraWidgetProp :
      {
        get : 'a class -> base widget_class option,
        set :
          'b widget_class option
           -> 'a class
           -> unit,
        new : 'b widget_class option -> 'a class Property.t
      }
    val filterProp :
      {
        get : 'a class -> base file_filter_class option,
        set :
          'b file_filter_class option
           -> 'a class
           -> unit,
        new : 'b file_filter_class option -> 'a class Property.t
      }
    val localOnlyProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
    val previewWidgetProp :
      {
        get : 'a class -> base widget_class option,
        set :
          'b widget_class option
           -> 'a class
           -> unit,
        new : 'b widget_class option -> 'a class Property.t
      }
    val previewWidgetActiveProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
    val selectMultipleProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
    val showHiddenProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
    val usePreviewLabelProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
  end