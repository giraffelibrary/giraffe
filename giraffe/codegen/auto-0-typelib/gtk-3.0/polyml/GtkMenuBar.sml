structure GtkMenuBar :>
  GTK_MENU_BAR
    where type 'a class = 'a GtkMenuBarClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type pack_direction_t = GtkPackDirection.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_menu_bar_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "gtk_menu_bar_new") (cVoid --> GtkWidgetClass.PolyML.cPtr)
      val newFromModel_ = call (getSymbol "gtk_menu_bar_new_from_model") (GioMenuModelClass.PolyML.cPtr --> GtkWidgetClass.PolyML.cPtr)
      val getChildPackDirection_ = call (getSymbol "gtk_menu_bar_get_child_pack_direction") (GtkMenuBarClass.PolyML.cPtr --> GtkPackDirection.PolyML.cVal)
      val getPackDirection_ = call (getSymbol "gtk_menu_bar_get_pack_direction") (GtkMenuBarClass.PolyML.cPtr --> GtkPackDirection.PolyML.cVal)
      val setChildPackDirection_ = call (getSymbol "gtk_menu_bar_set_child_pack_direction") (GtkMenuBarClass.PolyML.cPtr &&> GtkPackDirection.PolyML.cVal --> cVoid)
      val setPackDirection_ = call (getSymbol "gtk_menu_bar_set_pack_direction") (GtkMenuBarClass.PolyML.cPtr &&> GtkPackDirection.PolyML.cVal --> cVoid)
    end
    type 'a class = 'a GtkMenuBarClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type pack_direction_t = GtkPackDirection.t
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr false ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr false ---> GtkBuildableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkMenuBarClass.FFI.fromPtr false) new_ ()
    fun newFromModel model = (GioMenuModelClass.FFI.withPtr false ---> GtkMenuBarClass.FFI.fromPtr false) newFromModel_ model before GioMenuModelClass.FFI.touchPtr model
    fun getChildPackDirection self = (GtkMenuBarClass.FFI.withPtr false ---> GtkPackDirection.FFI.fromVal) getChildPackDirection_ self
    fun getPackDirection self = (GtkMenuBarClass.FFI.withPtr false ---> GtkPackDirection.FFI.fromVal) getPackDirection_ self
    fun setChildPackDirection self childPackDir = (GtkMenuBarClass.FFI.withPtr false &&&> GtkPackDirection.FFI.withVal ---> I) setChildPackDirection_ (self & childPackDir)
    fun setPackDirection self packDir = (GtkMenuBarClass.FFI.withPtr false &&&> GtkPackDirection.FFI.withVal ---> I) setPackDirection_ (self & packDir)
    local
      open ValueAccessor
    in
      val childPackDirectionProp =
        {
          name = "child-pack-direction",
          gtype = fn () => C.gtype GtkPackDirection.t (),
          get = fn x => fn () => C.get GtkPackDirection.t x,
          set = fn x => C.set GtkPackDirection.t x,
          init = fn x => C.set GtkPackDirection.t x
        }
      val packDirectionProp =
        {
          name = "pack-direction",
          gtype = fn () => C.gtype GtkPackDirection.t (),
          get = fn x => fn () => C.get GtkPackDirection.t x,
          set = fn x => C.set GtkPackDirection.t x,
          init = fn x => C.set GtkPackDirection.t x
        }
    end
  end
