structure GtkFileChooser :>
  GTK_FILE_CHOOSER
    where type 'a class = 'a GtkFileChooserClass.class
    where type file_chooser_confirmation_t = GtkFileChooserConfirmation.t
    where type file_chooser_action_t = GtkFileChooserAction.t
    where type 'a file_filter_class = 'a GtkFileFilterClass.class
    where type 'a widget_class = 'a GtkWidgetClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_file_chooser_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val addChoice_ =
        call (getSymbol "gtk_file_chooser_add_choice")
          (
            GtkFileChooserClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             --> cVoid
          )
      val addFilter_ = call (getSymbol "gtk_file_chooser_add_filter") (GtkFileChooserClass.PolyML.cPtr &&> GtkFileFilterClass.PolyML.cPtr --> cVoid)
      val addShortcutFolder_ =
        call (getSymbol "gtk_file_chooser_add_shortcut_folder")
          (
            GtkFileChooserClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
      val addShortcutFolderUri_ =
        call (getSymbol "gtk_file_chooser_add_shortcut_folder_uri")
          (
            GtkFileChooserClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
      val getAction_ = call (getSymbol "gtk_file_chooser_get_action") (GtkFileChooserClass.PolyML.cPtr --> GtkFileChooserAction.PolyML.cVal)
      val getChoice_ = call (getSymbol "gtk_file_chooser_get_choice") (GtkFileChooserClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> Utf8.PolyML.cOutPtr)
      val getCreateFolders_ = call (getSymbol "gtk_file_chooser_get_create_folders") (GtkFileChooserClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getCurrentFolder_ = call (getSymbol "gtk_file_chooser_get_current_folder") (GtkFileChooserClass.PolyML.cPtr --> Utf8.PolyML.cOutOptPtr)
      val getCurrentFolderFile_ = call (getSymbol "gtk_file_chooser_get_current_folder_file") (GtkFileChooserClass.PolyML.cPtr --> GioFileClass.PolyML.cPtr)
      val getCurrentFolderUri_ = call (getSymbol "gtk_file_chooser_get_current_folder_uri") (GtkFileChooserClass.PolyML.cPtr --> Utf8.PolyML.cOutOptPtr)
      val getCurrentName_ = call (getSymbol "gtk_file_chooser_get_current_name") (GtkFileChooserClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getDoOverwriteConfirmation_ = call (getSymbol "gtk_file_chooser_get_do_overwrite_confirmation") (GtkFileChooserClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getExtraWidget_ = call (getSymbol "gtk_file_chooser_get_extra_widget") (GtkFileChooserClass.PolyML.cPtr --> GtkWidgetClass.PolyML.cOptPtr)
      val getFile_ = call (getSymbol "gtk_file_chooser_get_file") (GtkFileChooserClass.PolyML.cPtr --> GioFileClass.PolyML.cPtr)
      val getFilename_ = call (getSymbol "gtk_file_chooser_get_filename") (GtkFileChooserClass.PolyML.cPtr --> Utf8.PolyML.cOutOptPtr)
      val getFilter_ = call (getSymbol "gtk_file_chooser_get_filter") (GtkFileChooserClass.PolyML.cPtr --> GtkFileFilterClass.PolyML.cOptPtr)
      val getLocalOnly_ = call (getSymbol "gtk_file_chooser_get_local_only") (GtkFileChooserClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getPreviewFile_ = call (getSymbol "gtk_file_chooser_get_preview_file") (GtkFileChooserClass.PolyML.cPtr --> GioFileClass.PolyML.cOptPtr)
      val getPreviewFilename_ = call (getSymbol "gtk_file_chooser_get_preview_filename") (GtkFileChooserClass.PolyML.cPtr --> Utf8.PolyML.cOutOptPtr)
      val getPreviewUri_ = call (getSymbol "gtk_file_chooser_get_preview_uri") (GtkFileChooserClass.PolyML.cPtr --> Utf8.PolyML.cOutOptPtr)
      val getPreviewWidget_ = call (getSymbol "gtk_file_chooser_get_preview_widget") (GtkFileChooserClass.PolyML.cPtr --> GtkWidgetClass.PolyML.cOptPtr)
      val getPreviewWidgetActive_ = call (getSymbol "gtk_file_chooser_get_preview_widget_active") (GtkFileChooserClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getSelectMultiple_ = call (getSymbol "gtk_file_chooser_get_select_multiple") (GtkFileChooserClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getShowHidden_ = call (getSymbol "gtk_file_chooser_get_show_hidden") (GtkFileChooserClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getUri_ = call (getSymbol "gtk_file_chooser_get_uri") (GtkFileChooserClass.PolyML.cPtr --> Utf8.PolyML.cOutOptPtr)
      val getUsePreviewLabel_ = call (getSymbol "gtk_file_chooser_get_use_preview_label") (GtkFileChooserClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val removeChoice_ = call (getSymbol "gtk_file_chooser_remove_choice") (GtkFileChooserClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> cVoid)
      val removeFilter_ = call (getSymbol "gtk_file_chooser_remove_filter") (GtkFileChooserClass.PolyML.cPtr &&> GtkFileFilterClass.PolyML.cPtr --> cVoid)
      val removeShortcutFolder_ =
        call (getSymbol "gtk_file_chooser_remove_shortcut_folder")
          (
            GtkFileChooserClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
      val removeShortcutFolderUri_ =
        call (getSymbol "gtk_file_chooser_remove_shortcut_folder_uri")
          (
            GtkFileChooserClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
      val selectAll_ = call (getSymbol "gtk_file_chooser_select_all") (GtkFileChooserClass.PolyML.cPtr --> cVoid)
      val selectFile_ =
        call (getSymbol "gtk_file_chooser_select_file")
          (
            GtkFileChooserClass.PolyML.cPtr
             &&> GioFileClass.PolyML.cPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
      val selectFilename_ = call (getSymbol "gtk_file_chooser_select_filename") (GtkFileChooserClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GBool.PolyML.cVal)
      val selectUri_ = call (getSymbol "gtk_file_chooser_select_uri") (GtkFileChooserClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GBool.PolyML.cVal)
      val setAction_ = call (getSymbol "gtk_file_chooser_set_action") (GtkFileChooserClass.PolyML.cPtr &&> GtkFileChooserAction.PolyML.cVal --> cVoid)
      val setChoice_ =
        call (getSymbol "gtk_file_chooser_set_choice")
          (
            GtkFileChooserClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             --> cVoid
          )
      val setCreateFolders_ = call (getSymbol "gtk_file_chooser_set_create_folders") (GtkFileChooserClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setCurrentFolder_ = call (getSymbol "gtk_file_chooser_set_current_folder") (GtkFileChooserClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GBool.PolyML.cVal)
      val setCurrentFolderFile_ =
        call (getSymbol "gtk_file_chooser_set_current_folder_file")
          (
            GtkFileChooserClass.PolyML.cPtr
             &&> GioFileClass.PolyML.cPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
      val setCurrentFolderUri_ = call (getSymbol "gtk_file_chooser_set_current_folder_uri") (GtkFileChooserClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GBool.PolyML.cVal)
      val setCurrentName_ = call (getSymbol "gtk_file_chooser_set_current_name") (GtkFileChooserClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> cVoid)
      val setDoOverwriteConfirmation_ = call (getSymbol "gtk_file_chooser_set_do_overwrite_confirmation") (GtkFileChooserClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setExtraWidget_ = call (getSymbol "gtk_file_chooser_set_extra_widget") (GtkFileChooserClass.PolyML.cPtr &&> GtkWidgetClass.PolyML.cPtr --> cVoid)
      val setFile_ =
        call (getSymbol "gtk_file_chooser_set_file")
          (
            GtkFileChooserClass.PolyML.cPtr
             &&> GioFileClass.PolyML.cPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
      val setFilename_ = call (getSymbol "gtk_file_chooser_set_filename") (GtkFileChooserClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GBool.PolyML.cVal)
      val setFilter_ = call (getSymbol "gtk_file_chooser_set_filter") (GtkFileChooserClass.PolyML.cPtr &&> GtkFileFilterClass.PolyML.cPtr --> cVoid)
      val setLocalOnly_ = call (getSymbol "gtk_file_chooser_set_local_only") (GtkFileChooserClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setPreviewWidget_ = call (getSymbol "gtk_file_chooser_set_preview_widget") (GtkFileChooserClass.PolyML.cPtr &&> GtkWidgetClass.PolyML.cPtr --> cVoid)
      val setPreviewWidgetActive_ = call (getSymbol "gtk_file_chooser_set_preview_widget_active") (GtkFileChooserClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setSelectMultiple_ = call (getSymbol "gtk_file_chooser_set_select_multiple") (GtkFileChooserClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setShowHidden_ = call (getSymbol "gtk_file_chooser_set_show_hidden") (GtkFileChooserClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setUri_ = call (getSymbol "gtk_file_chooser_set_uri") (GtkFileChooserClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GBool.PolyML.cVal)
      val setUsePreviewLabel_ = call (getSymbol "gtk_file_chooser_set_use_preview_label") (GtkFileChooserClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val unselectAll_ = call (getSymbol "gtk_file_chooser_unselect_all") (GtkFileChooserClass.PolyML.cPtr --> cVoid)
      val unselectFile_ = call (getSymbol "gtk_file_chooser_unselect_file") (GtkFileChooserClass.PolyML.cPtr &&> GioFileClass.PolyML.cPtr --> cVoid)
      val unselectFilename_ = call (getSymbol "gtk_file_chooser_unselect_filename") (GtkFileChooserClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> cVoid)
      val unselectUri_ = call (getSymbol "gtk_file_chooser_unselect_uri") (GtkFileChooserClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> cVoid)
    end
    type 'a class = 'a GtkFileChooserClass.class
    type file_chooser_confirmation_t = GtkFileChooserConfirmation.t
    type file_chooser_action_t = GtkFileChooserAction.t
    type 'a file_filter_class = 'a GtkFileFilterClass.class
    type 'a widget_class = 'a GtkWidgetClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun addChoice
      self
      (
        id,
        label,
        options,
        optionLabels
      ) =
      (
        GtkFileChooserClass.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         ---> I
      )
        addChoice_
        (
          self
           & id
           & label
           & options
           & optionLabels
        )
    fun addFilter self filter = (GtkFileChooserClass.FFI.withPtr &&&> GtkFileFilterClass.FFI.withDupPtr ---> I) addFilter_ (self & filter)
    fun addShortcutFolder self folder =
      (
        GtkFileChooserClass.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GLibErrorRecord.handleError
         ---> ignore
      )
        addShortcutFolder_
        (
          self
           & folder
           & []
        )
    fun addShortcutFolderUri self uri =
      (
        GtkFileChooserClass.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GLibErrorRecord.handleError
         ---> ignore
      )
        addShortcutFolderUri_
        (
          self
           & uri
           & []
        )
    fun getAction self = (GtkFileChooserClass.FFI.withPtr ---> GtkFileChooserAction.FFI.fromVal) getAction_ self
    fun getChoice self id = (GtkFileChooserClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getChoice_ (self & id)
    fun getCreateFolders self = (GtkFileChooserClass.FFI.withPtr ---> GBool.FFI.fromVal) getCreateFolders_ self
    fun getCurrentFolder self = (GtkFileChooserClass.FFI.withPtr ---> Utf8.FFI.fromOptPtr 1) getCurrentFolder_ self
    fun getCurrentFolderFile self = (GtkFileChooserClass.FFI.withPtr ---> GioFileClass.FFI.fromPtr true) getCurrentFolderFile_ self
    fun getCurrentFolderUri self = (GtkFileChooserClass.FFI.withPtr ---> Utf8.FFI.fromOptPtr 1) getCurrentFolderUri_ self
    fun getCurrentName self = (GtkFileChooserClass.FFI.withPtr ---> Utf8.FFI.fromPtr 1) getCurrentName_ self
    fun getDoOverwriteConfirmation self = (GtkFileChooserClass.FFI.withPtr ---> GBool.FFI.fromVal) getDoOverwriteConfirmation_ self
    fun getExtraWidget self = (GtkFileChooserClass.FFI.withPtr ---> GtkWidgetClass.FFI.fromOptPtr false) getExtraWidget_ self
    fun getFile self = (GtkFileChooserClass.FFI.withPtr ---> GioFileClass.FFI.fromPtr true) getFile_ self
    fun getFilename self = (GtkFileChooserClass.FFI.withPtr ---> Utf8.FFI.fromOptPtr 1) getFilename_ self
    fun getFilter self = (GtkFileChooserClass.FFI.withPtr ---> GtkFileFilterClass.FFI.fromOptPtr false) getFilter_ self
    fun getLocalOnly self = (GtkFileChooserClass.FFI.withPtr ---> GBool.FFI.fromVal) getLocalOnly_ self
    fun getPreviewFile self = (GtkFileChooserClass.FFI.withPtr ---> GioFileClass.FFI.fromOptPtr true) getPreviewFile_ self
    fun getPreviewFilename self = (GtkFileChooserClass.FFI.withPtr ---> Utf8.FFI.fromOptPtr 1) getPreviewFilename_ self
    fun getPreviewUri self = (GtkFileChooserClass.FFI.withPtr ---> Utf8.FFI.fromOptPtr 1) getPreviewUri_ self
    fun getPreviewWidget self = (GtkFileChooserClass.FFI.withPtr ---> GtkWidgetClass.FFI.fromOptPtr false) getPreviewWidget_ self
    fun getPreviewWidgetActive self = (GtkFileChooserClass.FFI.withPtr ---> GBool.FFI.fromVal) getPreviewWidgetActive_ self
    fun getSelectMultiple self = (GtkFileChooserClass.FFI.withPtr ---> GBool.FFI.fromVal) getSelectMultiple_ self
    fun getShowHidden self = (GtkFileChooserClass.FFI.withPtr ---> GBool.FFI.fromVal) getShowHidden_ self
    fun getUri self = (GtkFileChooserClass.FFI.withPtr ---> Utf8.FFI.fromOptPtr 1) getUri_ self
    fun getUsePreviewLabel self = (GtkFileChooserClass.FFI.withPtr ---> GBool.FFI.fromVal) getUsePreviewLabel_ self
    fun removeChoice self id = (GtkFileChooserClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> I) removeChoice_ (self & id)
    fun removeFilter self filter = (GtkFileChooserClass.FFI.withPtr &&&> GtkFileFilterClass.FFI.withPtr ---> I) removeFilter_ (self & filter)
    fun removeShortcutFolder self folder =
      (
        GtkFileChooserClass.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GLibErrorRecord.handleError
         ---> ignore
      )
        removeShortcutFolder_
        (
          self
           & folder
           & []
        )
    fun removeShortcutFolderUri self uri =
      (
        GtkFileChooserClass.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GLibErrorRecord.handleError
         ---> ignore
      )
        removeShortcutFolderUri_
        (
          self
           & uri
           & []
        )
    fun selectAll self = (GtkFileChooserClass.FFI.withPtr ---> I) selectAll_ self
    fun selectFile self file =
      (
        GtkFileChooserClass.FFI.withPtr
         &&&> GioFileClass.FFI.withPtr
         &&&> GLibErrorRecord.handleError
         ---> ignore
      )
        selectFile_
        (
          self
           & file
           & []
        )
    fun selectFilename self filename = (GtkFileChooserClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> GBool.FFI.fromVal) selectFilename_ (self & filename)
    fun selectUri self uri = (GtkFileChooserClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> GBool.FFI.fromVal) selectUri_ (self & uri)
    fun setAction self action = (GtkFileChooserClass.FFI.withPtr &&&> GtkFileChooserAction.FFI.withVal ---> I) setAction_ (self & action)
    fun setChoice self (id, option) =
      (
        GtkFileChooserClass.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         ---> I
      )
        setChoice_
        (
          self
           & id
           & option
        )
    fun setCreateFolders self createFolders = (GtkFileChooserClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setCreateFolders_ (self & createFolders)
    fun setCurrentFolder self filename = (GtkFileChooserClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> GBool.FFI.fromVal) setCurrentFolder_ (self & filename)
    fun setCurrentFolderFile self file =
      (
        GtkFileChooserClass.FFI.withPtr
         &&&> GioFileClass.FFI.withPtr
         &&&> GLibErrorRecord.handleError
         ---> ignore
      )
        setCurrentFolderFile_
        (
          self
           & file
           & []
        )
    fun setCurrentFolderUri self uri = (GtkFileChooserClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> GBool.FFI.fromVal) setCurrentFolderUri_ (self & uri)
    fun setCurrentName self name = (GtkFileChooserClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> I) setCurrentName_ (self & name)
    fun setDoOverwriteConfirmation self doOverwriteConfirmation = (GtkFileChooserClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setDoOverwriteConfirmation_ (self & doOverwriteConfirmation)
    fun setExtraWidget self extraWidget = (GtkFileChooserClass.FFI.withPtr &&&> GtkWidgetClass.FFI.withPtr ---> I) setExtraWidget_ (self & extraWidget)
    fun setFile self file =
      (
        GtkFileChooserClass.FFI.withPtr
         &&&> GioFileClass.FFI.withPtr
         &&&> GLibErrorRecord.handleError
         ---> ignore
      )
        setFile_
        (
          self
           & file
           & []
        )
    fun setFilename self filename = (GtkFileChooserClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> GBool.FFI.fromVal) setFilename_ (self & filename)
    fun setFilter self filter = (GtkFileChooserClass.FFI.withPtr &&&> GtkFileFilterClass.FFI.withPtr ---> I) setFilter_ (self & filter)
    fun setLocalOnly self localOnly = (GtkFileChooserClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setLocalOnly_ (self & localOnly)
    fun setPreviewWidget self previewWidget = (GtkFileChooserClass.FFI.withPtr &&&> GtkWidgetClass.FFI.withPtr ---> I) setPreviewWidget_ (self & previewWidget)
    fun setPreviewWidgetActive self active = (GtkFileChooserClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setPreviewWidgetActive_ (self & active)
    fun setSelectMultiple self selectMultiple = (GtkFileChooserClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setSelectMultiple_ (self & selectMultiple)
    fun setShowHidden self showHidden = (GtkFileChooserClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setShowHidden_ (self & showHidden)
    fun setUri self uri = (GtkFileChooserClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> GBool.FFI.fromVal) setUri_ (self & uri)
    fun setUsePreviewLabel self useLabel = (GtkFileChooserClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setUsePreviewLabel_ (self & useLabel)
    fun unselectAll self = (GtkFileChooserClass.FFI.withPtr ---> I) unselectAll_ self
    fun unselectFile self file = (GtkFileChooserClass.FFI.withPtr &&&> GioFileClass.FFI.withPtr ---> I) unselectFile_ (self & file)
    fun unselectFilename self filename = (GtkFileChooserClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> I) unselectFilename_ (self & filename)
    fun unselectUri self uri = (GtkFileChooserClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> I) unselectUri_ (self & uri)
    local
      open ClosureMarshal Signal
    in
      fun confirmOverwriteSig f = signal "confirm-overwrite" (void ---> ret GtkFileChooserConfirmation.t) f
      fun currentFolderChangedSig f = signal "current-folder-changed" (void ---> ret_void) f
      fun fileActivatedSig f = signal "file-activated" (void ---> ret_void) f
      fun selectionChangedSig f = signal "selection-changed" (void ---> ret_void) f
      fun updatePreviewSig f = signal "update-preview" (void ---> ret_void) f
    end
    local
      open Property
    in
      val actionProp =
        {
          get = fn x => get "action" GtkFileChooserAction.t x,
          set = fn x => set "action" GtkFileChooserAction.t x,
          new = fn x => new "action" GtkFileChooserAction.t x
        }
      val createFoldersProp =
        {
          get = fn x => get "create-folders" boolean x,
          set = fn x => set "create-folders" boolean x,
          new = fn x => new "create-folders" boolean x
        }
      val doOverwriteConfirmationProp =
        {
          get = fn x => get "do-overwrite-confirmation" boolean x,
          set = fn x => set "do-overwrite-confirmation" boolean x,
          new = fn x => new "do-overwrite-confirmation" boolean x
        }
      val extraWidgetProp =
        {
          get = fn x => get "extra-widget" GtkWidgetClass.tOpt x,
          set = fn x => set "extra-widget" GtkWidgetClass.tOpt x,
          new = fn x => new "extra-widget" GtkWidgetClass.tOpt x
        }
      val filterProp =
        {
          get = fn x => get "filter" GtkFileFilterClass.tOpt x,
          set = fn x => set "filter" GtkFileFilterClass.tOpt x,
          new = fn x => new "filter" GtkFileFilterClass.tOpt x
        }
      val localOnlyProp =
        {
          get = fn x => get "local-only" boolean x,
          set = fn x => set "local-only" boolean x,
          new = fn x => new "local-only" boolean x
        }
      val previewWidgetProp =
        {
          get = fn x => get "preview-widget" GtkWidgetClass.tOpt x,
          set = fn x => set "preview-widget" GtkWidgetClass.tOpt x,
          new = fn x => new "preview-widget" GtkWidgetClass.tOpt x
        }
      val previewWidgetActiveProp =
        {
          get = fn x => get "preview-widget-active" boolean x,
          set = fn x => set "preview-widget-active" boolean x,
          new = fn x => new "preview-widget-active" boolean x
        }
      val selectMultipleProp =
        {
          get = fn x => get "select-multiple" boolean x,
          set = fn x => set "select-multiple" boolean x,
          new = fn x => new "select-multiple" boolean x
        }
      val showHiddenProp =
        {
          get = fn x => get "show-hidden" boolean x,
          set = fn x => set "show-hidden" boolean x,
          new = fn x => new "show-hidden" boolean x
        }
      val usePreviewLabelProp =
        {
          get = fn x => get "use-preview-label" boolean x,
          set = fn x => set "use-preview-label" boolean x,
          new = fn x => new "use-preview-label" boolean x
        }
    end
  end
