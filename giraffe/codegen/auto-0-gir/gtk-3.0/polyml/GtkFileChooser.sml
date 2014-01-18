structure GtkFileChooser :>
  GTK_FILE_CHOOSER
    where type 'a class_t = 'a GtkFileChooserClass.t
    where type filechooserconfirmation_t = GtkFileChooserConfirmation.t
    where type filechooseraction_t = GtkFileChooserAction.t
    where type 'a filefilterclass_t = 'a GtkFileFilterClass.t
    where type 'a widgetclass_t = 'a GtkWidgetClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_file_chooser_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val addFilter_ = call (load_sym libgtk "gtk_file_chooser_add_filter") (GObjectObjectClass.PolyML.PTR &&> GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val addShortcutFolder_ =
        call (load_sym libgtk "gtk_file_chooser_add_shortcut_folder")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.String.PolyML.INPTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> FFI.Bool.PolyML.VAL
          )
      val addShortcutFolderUri_ =
        call (load_sym libgtk "gtk_file_chooser_add_shortcut_folder_uri")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.String.PolyML.INPTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> FFI.Bool.PolyML.VAL
          )
      val getAction_ = call (load_sym libgtk "gtk_file_chooser_get_action") (GObjectObjectClass.PolyML.PTR --> GtkFileChooserAction.PolyML.VAL)
      val getCreateFolders_ = call (load_sym libgtk "gtk_file_chooser_get_create_folders") (GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val getCurrentFolder_ = call (load_sym libgtk "gtk_file_chooser_get_current_folder") (GObjectObjectClass.PolyML.PTR --> FFI.String.PolyML.RETOPTPTR)
      val getCurrentFolderFile_ = call (load_sym libgtk "gtk_file_chooser_get_current_folder_file") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val getCurrentFolderUri_ = call (load_sym libgtk "gtk_file_chooser_get_current_folder_uri") (GObjectObjectClass.PolyML.PTR --> FFI.String.PolyML.RETOPTPTR)
      val getDoOverwriteConfirmation_ = call (load_sym libgtk "gtk_file_chooser_get_do_overwrite_confirmation") (GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val getExtraWidget_ = call (load_sym libgtk "gtk_file_chooser_get_extra_widget") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.OPTPTR)
      val getFile_ = call (load_sym libgtk "gtk_file_chooser_get_file") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val getFilename_ = call (load_sym libgtk "gtk_file_chooser_get_filename") (GObjectObjectClass.PolyML.PTR --> FFI.String.PolyML.RETOPTPTR)
      val getFilter_ = call (load_sym libgtk "gtk_file_chooser_get_filter") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.OPTPTR)
      val getLocalOnly_ = call (load_sym libgtk "gtk_file_chooser_get_local_only") (GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val getPreviewFile_ = call (load_sym libgtk "gtk_file_chooser_get_preview_file") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.OPTPTR)
      val getPreviewFilename_ = call (load_sym libgtk "gtk_file_chooser_get_preview_filename") (GObjectObjectClass.PolyML.PTR --> FFI.String.PolyML.RETOPTPTR)
      val getPreviewUri_ = call (load_sym libgtk "gtk_file_chooser_get_preview_uri") (GObjectObjectClass.PolyML.PTR --> FFI.String.PolyML.RETOPTPTR)
      val getPreviewWidget_ = call (load_sym libgtk "gtk_file_chooser_get_preview_widget") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.OPTPTR)
      val getPreviewWidgetActive_ = call (load_sym libgtk "gtk_file_chooser_get_preview_widget_active") (GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val getSelectMultiple_ = call (load_sym libgtk "gtk_file_chooser_get_select_multiple") (GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val getShowHidden_ = call (load_sym libgtk "gtk_file_chooser_get_show_hidden") (GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val getUri_ = call (load_sym libgtk "gtk_file_chooser_get_uri") (GObjectObjectClass.PolyML.PTR --> FFI.String.PolyML.RETOPTPTR)
      val getUsePreviewLabel_ = call (load_sym libgtk "gtk_file_chooser_get_use_preview_label") (GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val removeFilter_ = call (load_sym libgtk "gtk_file_chooser_remove_filter") (GObjectObjectClass.PolyML.PTR &&> GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val removeShortcutFolder_ =
        call (load_sym libgtk "gtk_file_chooser_remove_shortcut_folder")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.String.PolyML.INPTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> FFI.Bool.PolyML.VAL
          )
      val removeShortcutFolderUri_ =
        call (load_sym libgtk "gtk_file_chooser_remove_shortcut_folder_uri")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.String.PolyML.INPTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> FFI.Bool.PolyML.VAL
          )
      val selectAll_ = call (load_sym libgtk "gtk_file_chooser_select_all") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val selectFile_ =
        call (load_sym libgtk "gtk_file_chooser_select_file")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> FFI.Bool.PolyML.VAL
          )
      val selectFilename_ = call (load_sym libgtk "gtk_file_chooser_select_filename") (GObjectObjectClass.PolyML.PTR &&> FFI.String.PolyML.INPTR --> FFI.Bool.PolyML.VAL)
      val selectUri_ = call (load_sym libgtk "gtk_file_chooser_select_uri") (GObjectObjectClass.PolyML.PTR &&> FFI.String.PolyML.INPTR --> FFI.Bool.PolyML.VAL)
      val setAction_ = call (load_sym libgtk "gtk_file_chooser_set_action") (GObjectObjectClass.PolyML.PTR &&> GtkFileChooserAction.PolyML.VAL --> FFI.PolyML.VOID)
      val setCreateFolders_ = call (load_sym libgtk "gtk_file_chooser_set_create_folders") (GObjectObjectClass.PolyML.PTR &&> FFI.Bool.PolyML.VAL --> FFI.PolyML.VOID)
      val setCurrentFolder_ = call (load_sym libgtk "gtk_file_chooser_set_current_folder") (GObjectObjectClass.PolyML.PTR &&> FFI.String.PolyML.INPTR --> FFI.Bool.PolyML.VAL)
      val setCurrentFolderFile_ =
        call (load_sym libgtk "gtk_file_chooser_set_current_folder_file")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> FFI.Bool.PolyML.VAL
          )
      val setCurrentFolderUri_ = call (load_sym libgtk "gtk_file_chooser_set_current_folder_uri") (GObjectObjectClass.PolyML.PTR &&> FFI.String.PolyML.INPTR --> FFI.Bool.PolyML.VAL)
      val setCurrentName_ = call (load_sym libgtk "gtk_file_chooser_set_current_name") (GObjectObjectClass.PolyML.PTR &&> FFI.String.PolyML.INPTR --> FFI.PolyML.VOID)
      val setDoOverwriteConfirmation_ = call (load_sym libgtk "gtk_file_chooser_set_do_overwrite_confirmation") (GObjectObjectClass.PolyML.PTR &&> FFI.Bool.PolyML.VAL --> FFI.PolyML.VOID)
      val setExtraWidget_ = call (load_sym libgtk "gtk_file_chooser_set_extra_widget") (GObjectObjectClass.PolyML.PTR &&> GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val setFile_ =
        call (load_sym libgtk "gtk_file_chooser_set_file")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> FFI.Bool.PolyML.VAL
          )
      val setFilename_ = call (load_sym libgtk "gtk_file_chooser_set_filename") (GObjectObjectClass.PolyML.PTR &&> FFI.String.PolyML.INPTR --> FFI.Bool.PolyML.VAL)
      val setFilter_ = call (load_sym libgtk "gtk_file_chooser_set_filter") (GObjectObjectClass.PolyML.PTR &&> GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val setLocalOnly_ = call (load_sym libgtk "gtk_file_chooser_set_local_only") (GObjectObjectClass.PolyML.PTR &&> FFI.Bool.PolyML.VAL --> FFI.PolyML.VOID)
      val setPreviewWidget_ = call (load_sym libgtk "gtk_file_chooser_set_preview_widget") (GObjectObjectClass.PolyML.PTR &&> GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val setPreviewWidgetActive_ = call (load_sym libgtk "gtk_file_chooser_set_preview_widget_active") (GObjectObjectClass.PolyML.PTR &&> FFI.Bool.PolyML.VAL --> FFI.PolyML.VOID)
      val setSelectMultiple_ = call (load_sym libgtk "gtk_file_chooser_set_select_multiple") (GObjectObjectClass.PolyML.PTR &&> FFI.Bool.PolyML.VAL --> FFI.PolyML.VOID)
      val setShowHidden_ = call (load_sym libgtk "gtk_file_chooser_set_show_hidden") (GObjectObjectClass.PolyML.PTR &&> FFI.Bool.PolyML.VAL --> FFI.PolyML.VOID)
      val setUri_ = call (load_sym libgtk "gtk_file_chooser_set_uri") (GObjectObjectClass.PolyML.PTR &&> FFI.String.PolyML.INPTR --> FFI.Bool.PolyML.VAL)
      val setUsePreviewLabel_ = call (load_sym libgtk "gtk_file_chooser_set_use_preview_label") (GObjectObjectClass.PolyML.PTR &&> FFI.Bool.PolyML.VAL --> FFI.PolyML.VOID)
      val unselectAll_ = call (load_sym libgtk "gtk_file_chooser_unselect_all") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val unselectFile_ = call (load_sym libgtk "gtk_file_chooser_unselect_file") (GObjectObjectClass.PolyML.PTR &&> GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val unselectFilename_ = call (load_sym libgtk "gtk_file_chooser_unselect_filename") (GObjectObjectClass.PolyML.PTR &&> FFI.String.PolyML.INPTR --> FFI.PolyML.VOID)
      val unselectUri_ = call (load_sym libgtk "gtk_file_chooser_unselect_uri") (GObjectObjectClass.PolyML.PTR &&> FFI.String.PolyML.INPTR --> FFI.PolyML.VOID)
    end
    type 'a class_t = 'a GtkFileChooserClass.t
    type filechooserconfirmation_t = GtkFileChooserConfirmation.t
    type filechooseraction_t = GtkFileChooserAction.t
    type 'a filefilterclass_t = 'a GtkFileFilterClass.t
    type 'a widgetclass_t = 'a GtkWidgetClass.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun addFilter self filter = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> I) addFilter_ (self & filter)
    fun addShortcutFolder self folder =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.String.C.withConstPtr
         &&&> GLibErrorRecord.C.handleError
         ---> FFI.Bool.C.fromVal
      )
        addShortcutFolder_
        (
          self
           & folder
           & []
        )
    fun addShortcutFolderUri self uri =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.String.C.withConstPtr
         &&&> GLibErrorRecord.C.handleError
         ---> FFI.Bool.C.fromVal
      )
        addShortcutFolderUri_
        (
          self
           & uri
           & []
        )
    fun getAction self = (GObjectObjectClass.C.withPtr ---> GtkFileChooserAction.C.fromVal) getAction_ self
    fun getCreateFolders self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getCreateFolders_ self
    fun getCurrentFolder self = (GObjectObjectClass.C.withPtr ---> FFI.String.C.fromOptPtr true) getCurrentFolder_ self
    fun getCurrentFolderFile self = (GObjectObjectClass.C.withPtr ---> GioFileClass.C.fromPtr true) getCurrentFolderFile_ self
    fun getCurrentFolderUri self = (GObjectObjectClass.C.withPtr ---> FFI.String.C.fromOptPtr true) getCurrentFolderUri_ self
    fun getDoOverwriteConfirmation self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getDoOverwriteConfirmation_ self
    fun getExtraWidget self = (GObjectObjectClass.C.withPtr ---> GtkWidgetClass.C.fromOptPtr false) getExtraWidget_ self
    fun getFile self = (GObjectObjectClass.C.withPtr ---> GioFileClass.C.fromPtr true) getFile_ self
    fun getFilename self = (GObjectObjectClass.C.withPtr ---> FFI.String.C.fromOptPtr true) getFilename_ self
    fun getFilter self = (GObjectObjectClass.C.withPtr ---> GtkFileFilterClass.C.fromOptPtr false) getFilter_ self
    fun getLocalOnly self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getLocalOnly_ self
    fun getPreviewFile self = (GObjectObjectClass.C.withPtr ---> GioFileClass.C.fromOptPtr true) getPreviewFile_ self
    fun getPreviewFilename self = (GObjectObjectClass.C.withPtr ---> FFI.String.C.fromOptPtr true) getPreviewFilename_ self
    fun getPreviewUri self = (GObjectObjectClass.C.withPtr ---> FFI.String.C.fromOptPtr true) getPreviewUri_ self
    fun getPreviewWidget self = (GObjectObjectClass.C.withPtr ---> GtkWidgetClass.C.fromOptPtr false) getPreviewWidget_ self
    fun getPreviewWidgetActive self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getPreviewWidgetActive_ self
    fun getSelectMultiple self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getSelectMultiple_ self
    fun getShowHidden self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getShowHidden_ self
    fun getUri self = (GObjectObjectClass.C.withPtr ---> FFI.String.C.fromOptPtr true) getUri_ self
    fun getUsePreviewLabel self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getUsePreviewLabel_ self
    fun removeFilter self filter = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> I) removeFilter_ (self & filter)
    fun removeShortcutFolder self folder =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.String.C.withConstPtr
         &&&> GLibErrorRecord.C.handleError
         ---> FFI.Bool.C.fromVal
      )
        removeShortcutFolder_
        (
          self
           & folder
           & []
        )
    fun removeShortcutFolderUri self uri =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.String.C.withConstPtr
         &&&> GLibErrorRecord.C.handleError
         ---> FFI.Bool.C.fromVal
      )
        removeShortcutFolderUri_
        (
          self
           & uri
           & []
        )
    fun selectAll self = (GObjectObjectClass.C.withPtr ---> I) selectAll_ self
    fun selectFile self file =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> GLibErrorRecord.C.handleError
         ---> FFI.Bool.C.fromVal
      )
        selectFile_
        (
          self
           & file
           & []
        )
    fun selectFilename self filename = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstPtr ---> FFI.Bool.C.fromVal) selectFilename_ (self & filename)
    fun selectUri self uri = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstPtr ---> FFI.Bool.C.fromVal) selectUri_ (self & uri)
    fun setAction self action = (GObjectObjectClass.C.withPtr &&&> GtkFileChooserAction.C.withVal ---> I) setAction_ (self & action)
    fun setCreateFolders self createFolders = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setCreateFolders_ (self & createFolders)
    fun setCurrentFolder self filename = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstPtr ---> FFI.Bool.C.fromVal) setCurrentFolder_ (self & filename)
    fun setCurrentFolderFile self file =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> GLibErrorRecord.C.handleError
         ---> FFI.Bool.C.fromVal
      )
        setCurrentFolderFile_
        (
          self
           & file
           & []
        )
    fun setCurrentFolderUri self uri = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstPtr ---> FFI.Bool.C.fromVal) setCurrentFolderUri_ (self & uri)
    fun setCurrentName self name = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstPtr ---> I) setCurrentName_ (self & name)
    fun setDoOverwriteConfirmation self doOverwriteConfirmation = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setDoOverwriteConfirmation_ (self & doOverwriteConfirmation)
    fun setExtraWidget self extraWidget = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> I) setExtraWidget_ (self & extraWidget)
    fun setFile self file =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> GLibErrorRecord.C.handleError
         ---> FFI.Bool.C.fromVal
      )
        setFile_
        (
          self
           & file
           & []
        )
    fun setFilename self filename = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstPtr ---> FFI.Bool.C.fromVal) setFilename_ (self & filename)
    fun setFilter self filter = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> I) setFilter_ (self & filter)
    fun setLocalOnly self localOnly = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setLocalOnly_ (self & localOnly)
    fun setPreviewWidget self previewWidget = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> I) setPreviewWidget_ (self & previewWidget)
    fun setPreviewWidgetActive self active = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setPreviewWidgetActive_ (self & active)
    fun setSelectMultiple self selectMultiple = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setSelectMultiple_ (self & selectMultiple)
    fun setShowHidden self showHidden = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setShowHidden_ (self & showHidden)
    fun setUri self uri = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstPtr ---> FFI.Bool.C.fromVal) setUri_ (self & uri)
    fun setUsePreviewLabel self useLabel = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setUsePreviewLabel_ (self & useLabel)
    fun unselectAll self = (GObjectObjectClass.C.withPtr ---> I) unselectAll_ self
    fun unselectFile self file = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> I) unselectFile_ (self & file)
    fun unselectFilename self filename = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstPtr ---> I) unselectFilename_ (self & filename)
    fun unselectUri self uri = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstPtr ---> I) unselectUri_ (self & uri)
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
          set = fn x => set "action" GtkFileChooserAction.t x
        }
      val createFoldersProp =
        {
          get = fn x => get "create-folders" boolean x,
          set = fn x => set "create-folders" boolean x
        }
      val doOverwriteConfirmationProp =
        {
          get = fn x => get "do-overwrite-confirmation" boolean x,
          set = fn x => set "do-overwrite-confirmation" boolean x
        }
      val extraWidgetProp =
        {
          get = fn x => get "extra-widget" GtkWidgetClass.tOpt x,
          set = fn x => set "extra-widget" GtkWidgetClass.tOpt x
        }
      val filterProp =
        {
          get = fn x => get "filter" GtkFileFilterClass.tOpt x,
          set = fn x => set "filter" GtkFileFilterClass.tOpt x
        }
      val localOnlyProp =
        {
          get = fn x => get "local-only" boolean x,
          set = fn x => set "local-only" boolean x
        }
      val previewWidgetProp =
        {
          get = fn x => get "preview-widget" GtkWidgetClass.tOpt x,
          set = fn x => set "preview-widget" GtkWidgetClass.tOpt x
        }
      val previewWidgetActiveProp =
        {
          get = fn x => get "preview-widget-active" boolean x,
          set = fn x => set "preview-widget-active" boolean x
        }
      val selectMultipleProp =
        {
          get = fn x => get "select-multiple" boolean x,
          set = fn x => set "select-multiple" boolean x
        }
      val showHiddenProp =
        {
          get = fn x => get "show-hidden" boolean x,
          set = fn x => set "show-hidden" boolean x
        }
      val usePreviewLabelProp =
        {
          get = fn x => get "use-preview-label" boolean x,
          set = fn x => set "use-preview-label" boolean x
        }
    end
  end