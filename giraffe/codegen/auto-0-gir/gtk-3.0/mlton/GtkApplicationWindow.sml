structure GtkApplicationWindow :>
  GTK_APPLICATION_WINDOW
    where type 'a class = 'a GtkApplicationWindowClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type 'a application_class = 'a GtkApplicationClass.class
    where type 'a shortcuts_window_class = 'a GtkShortcutsWindowClass.class =
  struct
    val getType_ = _import "gtk_application_window_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "gtk_application_window_new" : GtkApplicationClass.FFI.non_opt GtkApplicationClass.FFI.p -> GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p;
    val getHelpOverlay_ = _import "gtk_application_window_get_help_overlay" : GtkApplicationWindowClass.FFI.non_opt GtkApplicationWindowClass.FFI.p -> GtkShortcutsWindowClass.FFI.opt GtkShortcutsWindowClass.FFI.p;
    val getId_ = _import "gtk_application_window_get_id" : GtkApplicationWindowClass.FFI.non_opt GtkApplicationWindowClass.FFI.p -> GUInt.FFI.val_;
    val getShowMenubar_ = _import "gtk_application_window_get_show_menubar" : GtkApplicationWindowClass.FFI.non_opt GtkApplicationWindowClass.FFI.p -> GBool.FFI.val_;
    val setHelpOverlay_ = fn x1 & x2 => (_import "gtk_application_window_set_help_overlay" : GtkApplicationWindowClass.FFI.non_opt GtkApplicationWindowClass.FFI.p * GtkShortcutsWindowClass.FFI.opt GtkShortcutsWindowClass.FFI.p -> unit;) (x1, x2)
    val setShowMenubar_ = fn x1 & x2 => (_import "gtk_application_window_set_show_menubar" : GtkApplicationWindowClass.FFI.non_opt GtkApplicationWindowClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    type 'a class = 'a GtkApplicationWindowClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type 'a application_class = 'a GtkApplicationClass.class
    type 'a shortcuts_window_class = 'a GtkShortcutsWindowClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr false ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asActionGroup self = (GObjectObjectClass.FFI.withPtr false ---> GioActionGroupClass.FFI.fromPtr false) I self
    fun asActionMap self = (GObjectObjectClass.FFI.withPtr false ---> GioActionMapClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr false ---> GtkBuildableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new application = (GtkApplicationClass.FFI.withPtr false ---> GtkApplicationWindowClass.FFI.fromPtr false) new_ application
    fun getHelpOverlay self = (GtkApplicationWindowClass.FFI.withPtr false ---> GtkShortcutsWindowClass.FFI.fromOptPtr false) getHelpOverlay_ self
    fun getId self = (GtkApplicationWindowClass.FFI.withPtr false ---> GUInt.FFI.fromVal) getId_ self
    fun getShowMenubar self = (GtkApplicationWindowClass.FFI.withPtr false ---> GBool.FFI.fromVal) getShowMenubar_ self
    fun setHelpOverlay self helpOverlay = (GtkApplicationWindowClass.FFI.withPtr false &&&> GtkShortcutsWindowClass.FFI.withOptPtr false ---> I) setHelpOverlay_ (self & helpOverlay)
    fun setShowMenubar self showMenubar = (GtkApplicationWindowClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setShowMenubar_ (self & showMenubar)
    local
      open ValueAccessor
    in
      val showMenubarProp =
        {
          name = "show-menubar",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
    end
  end
