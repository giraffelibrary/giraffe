structure GtkApplicationWindow :>
  GTK_APPLICATION_WINDOW
    where type 'a class = 'a GtkApplicationWindowClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type 'a application_class = 'a GtkApplicationClass.class
    where type 'a shortcuts_window_class = 'a GtkShortcutsWindowClass.class =
  struct
    val getType_ = _import "gtk_application_window_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "gtk_application_window_new" : GtkApplicationClass.FFI.notnull GtkApplicationClass.FFI.p -> GtkWidgetClass.FFI.notnull GtkWidgetClass.FFI.p;
    val getHelpOverlay_ = _import "gtk_application_window_get_help_overlay" : GtkApplicationWindowClass.FFI.notnull GtkApplicationWindowClass.FFI.p -> GtkShortcutsWindowClass.FFI.notnull GtkShortcutsWindowClass.FFI.p;
    val getId_ = _import "gtk_application_window_get_id" : GtkApplicationWindowClass.FFI.notnull GtkApplicationWindowClass.FFI.p -> GUInt.FFI.val_;
    val getShowMenubar_ = _import "gtk_application_window_get_show_menubar" : GtkApplicationWindowClass.FFI.notnull GtkApplicationWindowClass.FFI.p -> GBool.FFI.val_;
    val setHelpOverlay_ = fn x1 & x2 => (_import "gtk_application_window_set_help_overlay" : GtkApplicationWindowClass.FFI.notnull GtkApplicationWindowClass.FFI.p * unit GtkShortcutsWindowClass.FFI.p -> unit;) (x1, x2)
    val setShowMenubar_ = fn x1 & x2 => (_import "gtk_application_window_set_show_menubar" : GtkApplicationWindowClass.FFI.notnull GtkApplicationWindowClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    type 'a class = 'a GtkApplicationWindowClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type 'a application_class = 'a GtkApplicationClass.class
    type 'a shortcuts_window_class = 'a GtkShortcutsWindowClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asActionGroup self = (GObjectObjectClass.FFI.withPtr ---> GioActionGroupClass.FFI.fromPtr false) I self
    fun asActionMap self = (GObjectObjectClass.FFI.withPtr ---> GioActionMapClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr ---> GtkBuildableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new application = (GtkApplicationClass.FFI.withPtr ---> GtkApplicationWindowClass.FFI.fromPtr false) new_ application
    fun getHelpOverlay self = (GtkApplicationWindowClass.FFI.withPtr ---> GtkShortcutsWindowClass.FFI.fromPtr false) getHelpOverlay_ self
    fun getId self = (GtkApplicationWindowClass.FFI.withPtr ---> GUInt.FFI.fromVal) getId_ self
    fun getShowMenubar self = (GtkApplicationWindowClass.FFI.withPtr ---> GBool.FFI.fromVal) getShowMenubar_ self
    fun setHelpOverlay self helpOverlay = (GtkApplicationWindowClass.FFI.withPtr &&&> GtkShortcutsWindowClass.FFI.withOptPtr ---> I) setHelpOverlay_ (self & helpOverlay)
    fun setShowMenubar self showMenubar = (GtkApplicationWindowClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setShowMenubar_ (self & showMenubar)
    local
      open Property
    in
      val showMenubarProp =
        {
          get = fn x => get "show-menubar" boolean x,
          set = fn x => set "show-menubar" boolean x
        }
    end
  end
