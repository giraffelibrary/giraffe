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
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr false ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr false ---> GtkBuildableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkPopoverMenuClass.FFI.fromPtr false) new_ ()
    fun openSubmenu self name = (GtkPopoverMenuClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> I) openSubmenu_ (self & name)
    local
      open ValueAccessor
    in
      val visibleSubmenuProp =
        {
          name = "visible-submenu",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = fn x => C.set stringOpt x,
          init = fn x => C.set stringOpt x
        }
    end
  end
