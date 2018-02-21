structure GtkApplicationWindow :>
  GTK_APPLICATION_WINDOW
    where type 'a class = 'a GtkApplicationWindowClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type 'a application_class = 'a GtkApplicationClass.class
    where type 'a shortcuts_window_class = 'a GtkShortcutsWindowClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_application_window_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "gtk_application_window_new") (GtkApplicationClass.PolyML.cPtr --> GtkWidgetClass.PolyML.cPtr)
      val getHelpOverlay_ = call (getSymbol "gtk_application_window_get_help_overlay") (GtkApplicationWindowClass.PolyML.cPtr --> GtkShortcutsWindowClass.PolyML.cOptPtr)
      val getId_ = call (getSymbol "gtk_application_window_get_id") (GtkApplicationWindowClass.PolyML.cPtr --> GUInt.PolyML.cVal)
      val getShowMenubar_ = call (getSymbol "gtk_application_window_get_show_menubar") (GtkApplicationWindowClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val setHelpOverlay_ = call (getSymbol "gtk_application_window_set_help_overlay") (GtkApplicationWindowClass.PolyML.cPtr &&> GtkShortcutsWindowClass.PolyML.cOptPtr --> cVoid)
      val setShowMenubar_ = call (getSymbol "gtk_application_window_set_show_menubar") (GtkApplicationWindowClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
    end
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
    fun getHelpOverlay self = (GtkApplicationWindowClass.FFI.withPtr ---> GtkShortcutsWindowClass.FFI.fromOptPtr false) getHelpOverlay_ self
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
