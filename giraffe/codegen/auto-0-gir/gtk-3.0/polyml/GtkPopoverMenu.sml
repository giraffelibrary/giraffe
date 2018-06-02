structure GtkPopoverMenu :>
  GTK_POPOVER_MENU
    where type 'a class = 'a GtkPopoverMenuClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_popover_menu_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "gtk_popover_menu_new") (cVoid --> GtkWidgetClass.PolyML.cPtr)
      val openSubmenu_ = call (getSymbol "gtk_popover_menu_open_submenu") (GtkPopoverMenuClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> cVoid)
    end
    type 'a class = 'a GtkPopoverMenuClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr ---> GtkBuildableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkPopoverMenuClass.FFI.fromPtr false) new_ ()
    fun openSubmenu self name = (GtkPopoverMenuClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> I) openSubmenu_ (self & name)
    local
      open Property
    in
      val visibleSubmenuProp =
        {
          get = fn x => get "visible-submenu" stringOpt x,
          set = fn x => set "visible-submenu" stringOpt x,
          new = fn x => new "visible-submenu" stringOpt x
        }
    end
  end