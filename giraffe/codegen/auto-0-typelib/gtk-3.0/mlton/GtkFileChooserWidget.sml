structure GtkFileChooserWidget :>
  GTK_FILE_CHOOSER_WIDGET
    where type 'a class = 'a GtkFileChooserWidgetClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type 'a file_chooser_class = 'a GtkFileChooserClass.class
    where type 'a orientable_class = 'a GtkOrientableClass.class
    where type file_chooser_action_t = GtkFileChooserAction.t =
  struct
    val getType_ = _import "gtk_file_chooser_widget_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "gtk_file_chooser_widget_new" : GtkFileChooserAction.FFI.val_ -> GtkWidgetClass.FFI.notnull GtkWidgetClass.FFI.p;
    type 'a class = 'a GtkFileChooserWidgetClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type 'a file_chooser_class = 'a GtkFileChooserClass.class
    type 'a orientable_class = 'a GtkOrientableClass.class
    type file_chooser_action_t = GtkFileChooserAction.t
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr ---> GtkBuildableClass.FFI.fromPtr false) I self
    fun asFileChooser self = (GObjectObjectClass.FFI.withPtr ---> GtkFileChooserClass.FFI.fromPtr false) I self
    fun asOrientable self = (GObjectObjectClass.FFI.withPtr ---> GtkOrientableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new action = (GtkFileChooserAction.FFI.withVal ---> GtkFileChooserWidgetClass.FFI.fromPtr false) new_ action
    local
      open ClosureMarshal Signal
    in
      fun desktopFolderSig f = signal "desktop-folder" (void ---> ret_void) f
      fun downFolderSig f = signal "down-folder" (void ---> ret_void) f
      fun homeFolderSig f = signal "home-folder" (void ---> ret_void) f
      fun locationPopupSig f = signal "location-popup" (get 0w1 string ---> ret_void) f
      fun locationPopupOnPasteSig f = signal "location-popup-on-paste" (void ---> ret_void) f
      fun locationTogglePopupSig f = signal "location-toggle-popup" (void ---> ret_void) f
      fun placesShortcutSig f = signal "places-shortcut" (void ---> ret_void) f
      fun quickBookmarkSig f = signal "quick-bookmark" (get 0w1 int ---> ret_void) f
      fun recentShortcutSig f = signal "recent-shortcut" (void ---> ret_void) f
      fun searchShortcutSig f = signal "search-shortcut" (void ---> ret_void) f
      fun showHiddenSig f = signal "show-hidden" (void ---> ret_void) f
      fun upFolderSig f = signal "up-folder" (void ---> ret_void) f
    end
    local
      open Property
    in
      val searchModeProp =
        {
          get = fn x => get "search-mode" boolean x,
          set = fn x => set "search-mode" boolean x
        }
      val subtitleProp = {get = fn x => get "subtitle" stringOpt x}
    end
  end
