structure GtkFileChooser :>
  GTK_FILE_CHOOSER
    where type 'a class_t = 'a GtkFileChooserClass.t
    where type file_chooser_confirmation_t = GtkFileChooserConfirmation.t
    where type file_chooser_action_t = GtkFileChooserAction.t
    where type 'a file_filter_class_t = 'a GtkFileFilterClass.t
    where type 'a widget_class_t = 'a GtkWidgetClass.t =
  struct
    val getType_ = _import "gtk_file_chooser_get_type" : unit -> GObjectType.C.val_;
    val addFilter_ = fn x1 & x2 => (_import "gtk_file_chooser_add_filter" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;) (x1, x2)
    val addShortcutFolder_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_gtk_file_chooser_add_shortcut_folder" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val addShortcutFolderUri_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_gtk_file_chooser_add_shortcut_folder_uri" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val getAction_ = _import "gtk_file_chooser_get_action" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GtkFileChooserAction.C.val_;
    val getCreateFolders_ = _import "gtk_file_chooser_get_create_folders" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    val getCurrentFolder_ = _import "gtk_file_chooser_get_current_folder" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit Utf8.C.out_p;
    val getCurrentFolderFile_ = _import "gtk_file_chooser_get_current_folder_file" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val getCurrentFolderUri_ = _import "gtk_file_chooser_get_current_folder_uri" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit Utf8.C.out_p;
    val getDoOverwriteConfirmation_ = _import "gtk_file_chooser_get_do_overwrite_confirmation" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    val getExtraWidget_ = _import "gtk_file_chooser_get_extra_widget" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit GObjectObjectClass.C.p;
    val getFile_ = _import "gtk_file_chooser_get_file" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val getFilename_ = _import "gtk_file_chooser_get_filename" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit Utf8.C.out_p;
    val getFilter_ = _import "gtk_file_chooser_get_filter" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit GObjectObjectClass.C.p;
    val getLocalOnly_ = _import "gtk_file_chooser_get_local_only" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    val getPreviewFile_ = _import "gtk_file_chooser_get_preview_file" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit GObjectObjectClass.C.p;
    val getPreviewFilename_ = _import "gtk_file_chooser_get_preview_filename" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit Utf8.C.out_p;
    val getPreviewUri_ = _import "gtk_file_chooser_get_preview_uri" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit Utf8.C.out_p;
    val getPreviewWidget_ = _import "gtk_file_chooser_get_preview_widget" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit GObjectObjectClass.C.p;
    val getPreviewWidgetActive_ = _import "gtk_file_chooser_get_preview_widget_active" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    val getSelectMultiple_ = _import "gtk_file_chooser_get_select_multiple" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    val getShowHidden_ = _import "gtk_file_chooser_get_show_hidden" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    val getUri_ = _import "gtk_file_chooser_get_uri" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit Utf8.C.out_p;
    val getUsePreviewLabel_ = _import "gtk_file_chooser_get_use_preview_label" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    val removeFilter_ = fn x1 & x2 => (_import "gtk_file_chooser_remove_filter" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;) (x1, x2)
    val removeShortcutFolder_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_gtk_file_chooser_remove_shortcut_folder" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val removeShortcutFolderUri_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_gtk_file_chooser_remove_shortcut_folder_uri" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val selectAll_ = _import "gtk_file_chooser_select_all" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;
    val selectFile_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_file_chooser_select_file" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val selectFilename_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_file_chooser_select_filename" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val selectUri_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_file_chooser_select_uri" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val setAction_ = fn x1 & x2 => (_import "gtk_file_chooser_set_action" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GtkFileChooserAction.C.val_ -> unit;) (x1, x2)
    val setCreateFolders_ = fn x1 & x2 => (_import "gtk_file_chooser_set_create_folders" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setCurrentFolder_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_file_chooser_set_current_folder" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val setCurrentFolderFile_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_file_chooser_set_current_folder_file" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val setCurrentFolderUri_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_file_chooser_set_current_folder_uri" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val setCurrentName_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_file_chooser_set_current_name" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setDoOverwriteConfirmation_ = fn x1 & x2 => (_import "gtk_file_chooser_set_do_overwrite_confirmation" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setExtraWidget_ = fn x1 & x2 => (_import "gtk_file_chooser_set_extra_widget" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;) (x1, x2)
    val setFile_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_file_chooser_set_file" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val setFilename_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_file_chooser_set_filename" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val setFilter_ = fn x1 & x2 => (_import "gtk_file_chooser_set_filter" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;) (x1, x2)
    val setLocalOnly_ = fn x1 & x2 => (_import "gtk_file_chooser_set_local_only" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setPreviewWidget_ = fn x1 & x2 => (_import "gtk_file_chooser_set_preview_widget" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;) (x1, x2)
    val setPreviewWidgetActive_ = fn x1 & x2 => (_import "gtk_file_chooser_set_preview_widget_active" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setSelectMultiple_ = fn x1 & x2 => (_import "gtk_file_chooser_set_select_multiple" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setShowHidden_ = fn x1 & x2 => (_import "gtk_file_chooser_set_show_hidden" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setUri_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_file_chooser_set_uri" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val setUsePreviewLabel_ = fn x1 & x2 => (_import "gtk_file_chooser_set_use_preview_label" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val unselectAll_ = _import "gtk_file_chooser_unselect_all" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;
    val unselectFile_ = fn x1 & x2 => (_import "gtk_file_chooser_unselect_file" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;) (x1, x2)
    val unselectFilename_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_file_chooser_unselect_filename" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val unselectUri_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_file_chooser_unselect_uri" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    type 'a class_t = 'a GtkFileChooserClass.t
    type file_chooser_confirmation_t = GtkFileChooserConfirmation.t
    type file_chooser_action_t = GtkFileChooserAction.t
    type 'a file_filter_class_t = 'a GtkFileFilterClass.t
    type 'a widget_class_t = 'a GtkWidgetClass.t
    type t = base class_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun addFilter self filter = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> I) addFilter_ (self & filter)
    fun addShortcutFolder self folder =
      (
        GObjectObjectClass.C.withPtr
         &&&> Utf8.C.withConstPtr
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
         &&&> Utf8.C.withConstPtr
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
    fun getCurrentFolder self = (GObjectObjectClass.C.withPtr ---> Utf8.C.fromOptPtr true) getCurrentFolder_ self
    fun getCurrentFolderFile self = (GObjectObjectClass.C.withPtr ---> GioFileClass.C.fromPtr true) getCurrentFolderFile_ self
    fun getCurrentFolderUri self = (GObjectObjectClass.C.withPtr ---> Utf8.C.fromOptPtr true) getCurrentFolderUri_ self
    fun getDoOverwriteConfirmation self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getDoOverwriteConfirmation_ self
    fun getExtraWidget self = (GObjectObjectClass.C.withPtr ---> GtkWidgetClass.C.fromOptPtr false) getExtraWidget_ self
    fun getFile self = (GObjectObjectClass.C.withPtr ---> GioFileClass.C.fromPtr true) getFile_ self
    fun getFilename self = (GObjectObjectClass.C.withPtr ---> Utf8.C.fromOptPtr true) getFilename_ self
    fun getFilter self = (GObjectObjectClass.C.withPtr ---> GtkFileFilterClass.C.fromOptPtr false) getFilter_ self
    fun getLocalOnly self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getLocalOnly_ self
    fun getPreviewFile self = (GObjectObjectClass.C.withPtr ---> GioFileClass.C.fromOptPtr true) getPreviewFile_ self
    fun getPreviewFilename self = (GObjectObjectClass.C.withPtr ---> Utf8.C.fromOptPtr true) getPreviewFilename_ self
    fun getPreviewUri self = (GObjectObjectClass.C.withPtr ---> Utf8.C.fromOptPtr true) getPreviewUri_ self
    fun getPreviewWidget self = (GObjectObjectClass.C.withPtr ---> GtkWidgetClass.C.fromOptPtr false) getPreviewWidget_ self
    fun getPreviewWidgetActive self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getPreviewWidgetActive_ self
    fun getSelectMultiple self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getSelectMultiple_ self
    fun getShowHidden self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getShowHidden_ self
    fun getUri self = (GObjectObjectClass.C.withPtr ---> Utf8.C.fromOptPtr true) getUri_ self
    fun getUsePreviewLabel self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getUsePreviewLabel_ self
    fun removeFilter self filter = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> I) removeFilter_ (self & filter)
    fun removeShortcutFolder self folder =
      (
        GObjectObjectClass.C.withPtr
         &&&> Utf8.C.withConstPtr
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
         &&&> Utf8.C.withConstPtr
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
    fun selectFilename self filename = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withConstPtr ---> FFI.Bool.C.fromVal) selectFilename_ (self & filename)
    fun selectUri self uri = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withConstPtr ---> FFI.Bool.C.fromVal) selectUri_ (self & uri)
    fun setAction self action = (GObjectObjectClass.C.withPtr &&&> GtkFileChooserAction.C.withVal ---> I) setAction_ (self & action)
    fun setCreateFolders self createFolders = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setCreateFolders_ (self & createFolders)
    fun setCurrentFolder self filename = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withConstPtr ---> FFI.Bool.C.fromVal) setCurrentFolder_ (self & filename)
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
    fun setCurrentFolderUri self uri = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withConstPtr ---> FFI.Bool.C.fromVal) setCurrentFolderUri_ (self & uri)
    fun setCurrentName self name = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withConstPtr ---> I) setCurrentName_ (self & name)
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
    fun setFilename self filename = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withConstPtr ---> FFI.Bool.C.fromVal) setFilename_ (self & filename)
    fun setFilter self filter = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> I) setFilter_ (self & filter)
    fun setLocalOnly self localOnly = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setLocalOnly_ (self & localOnly)
    fun setPreviewWidget self previewWidget = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> I) setPreviewWidget_ (self & previewWidget)
    fun setPreviewWidgetActive self active = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setPreviewWidgetActive_ (self & active)
    fun setSelectMultiple self selectMultiple = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setSelectMultiple_ (self & selectMultiple)
    fun setShowHidden self showHidden = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setShowHidden_ (self & showHidden)
    fun setUri self uri = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withConstPtr ---> FFI.Bool.C.fromVal) setUri_ (self & uri)
    fun setUsePreviewLabel self useLabel = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setUsePreviewLabel_ (self & useLabel)
    fun unselectAll self = (GObjectObjectClass.C.withPtr ---> I) unselectAll_ self
    fun unselectFile self file = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> I) unselectFile_ (self & file)
    fun unselectFilename self filename = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withConstPtr ---> I) unselectFilename_ (self & filename)
    fun unselectUri self uri = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withConstPtr ---> I) unselectUri_ (self & uri)
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
