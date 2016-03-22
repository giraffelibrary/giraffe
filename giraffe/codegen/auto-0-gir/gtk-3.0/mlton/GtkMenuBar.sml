structure GtkMenuBar :>
  GTK_MENU_BAR
    where type 'a class = 'a GtkMenuBarClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type pack_direction_t = GtkPackDirection.t =
  struct
    val getType_ = _import "gtk_menu_bar_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "gtk_menu_bar_new" : unit -> GtkWidgetClass.C.notnull GtkWidgetClass.C.p;
    val getChildPackDirection_ = _import "gtk_menu_bar_get_child_pack_direction" : GtkMenuBarClass.C.notnull GtkMenuBarClass.C.p -> GtkPackDirection.C.val_;
    val getPackDirection_ = _import "gtk_menu_bar_get_pack_direction" : GtkMenuBarClass.C.notnull GtkMenuBarClass.C.p -> GtkPackDirection.C.val_;
    val setChildPackDirection_ = fn x1 & x2 => (_import "gtk_menu_bar_set_child_pack_direction" : GtkMenuBarClass.C.notnull GtkMenuBarClass.C.p * GtkPackDirection.C.val_ -> unit;) (x1, x2)
    val setPackDirection_ = fn x1 & x2 => (_import "gtk_menu_bar_set_pack_direction" : GtkMenuBarClass.C.notnull GtkMenuBarClass.C.p * GtkPackDirection.C.val_ -> unit;) (x1, x2)
    type 'a class = 'a GtkMenuBarClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type pack_direction_t = GtkPackDirection.t
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.C.withPtr ---> AtkImplementorIfaceClass.C.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkMenuBarClass.C.fromPtr false) new_ ()
    fun getChildPackDirection self = (GtkMenuBarClass.C.withPtr ---> GtkPackDirection.C.fromVal) getChildPackDirection_ self
    fun getPackDirection self = (GtkMenuBarClass.C.withPtr ---> GtkPackDirection.C.fromVal) getPackDirection_ self
    fun setChildPackDirection self childPackDir = (GtkMenuBarClass.C.withPtr &&&> GtkPackDirection.C.withVal ---> I) setChildPackDirection_ (self & childPackDir)
    fun setPackDirection self packDir = (GtkMenuBarClass.C.withPtr &&&> GtkPackDirection.C.withVal ---> I) setPackDirection_ (self & packDir)
    local
      open Property
    in
      val childPackDirectionProp =
        {
          get = fn x => get "child-pack-direction" GtkPackDirection.t x,
          set = fn x => set "child-pack-direction" GtkPackDirection.t x
        }
      val packDirectionProp =
        {
          get = fn x => get "pack-direction" GtkPackDirection.t x,
          set = fn x => set "pack-direction" GtkPackDirection.t x
        }
    end
  end
