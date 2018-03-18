structure GtkPopoverMenu :>
  GTK_POPOVER_MENU
    where type 'a class = 'a GtkPopoverMenuClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class =
  struct
    val getType_ = _import "gtk_popover_menu_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "gtk_popover_menu_new" : unit -> GtkWidgetClass.FFI.notnull GtkWidgetClass.FFI.p;
    val openSubmenu_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_popover_menu_open_submenu" :
              GtkPopoverMenuClass.FFI.notnull GtkPopoverMenuClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
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
