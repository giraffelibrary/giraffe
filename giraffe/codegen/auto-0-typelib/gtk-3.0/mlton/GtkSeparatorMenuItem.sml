structure GtkSeparatorMenuItem :>
  GTK_SEPARATOR_MENU_ITEM
    where type 'a class = 'a GtkSeparatorMenuItemClass.class
    where type 'a activatable_class = 'a GtkActivatableClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class =
  struct
    val getType_ = _import "gtk_separator_menu_item_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "gtk_separator_menu_item_new" : unit -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    type 'a class = 'a GtkSeparatorMenuItemClass.class
    type 'a activatable_class = 'a GtkActivatableClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.C.withPtr ---> AtkImplementorIfaceClass.C.fromPtr false) I self
    fun asActivatable self = (GObjectObjectClass.C.withPtr ---> GtkActivatableClass.C.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkSeparatorMenuItemClass.C.fromPtr false) new_ ()
  end
