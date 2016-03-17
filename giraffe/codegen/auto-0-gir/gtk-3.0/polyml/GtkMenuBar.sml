structure GtkMenuBar :>
  GTK_MENU_BAR
    where type 'a class = 'a GtkMenuBarClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type pack_direction_t = GtkPackDirection.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_menu_bar_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libgtk "gtk_menu_bar_new") (FFI.PolyML.cVoid --> GObjectObjectClass.PolyML.cPtr)
      val getChildPackDirection_ = call (load_sym libgtk "gtk_menu_bar_get_child_pack_direction") (GObjectObjectClass.PolyML.cPtr --> GtkPackDirection.PolyML.cVal)
      val getPackDirection_ = call (load_sym libgtk "gtk_menu_bar_get_pack_direction") (GObjectObjectClass.PolyML.cPtr --> GtkPackDirection.PolyML.cVal)
      val setChildPackDirection_ = call (load_sym libgtk "gtk_menu_bar_set_child_pack_direction") (GObjectObjectClass.PolyML.cPtr &&> GtkPackDirection.PolyML.cVal --> FFI.PolyML.cVoid)
      val setPackDirection_ = call (load_sym libgtk "gtk_menu_bar_set_pack_direction") (GObjectObjectClass.PolyML.cPtr &&> GtkPackDirection.PolyML.cVal --> FFI.PolyML.cVoid)
    end
    type 'a class = 'a GtkMenuBarClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type pack_direction_t = GtkPackDirection.t
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.C.withPtr ---> AtkImplementorIfaceClass.C.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkMenuBarClass.C.fromPtr false) new_ ()
    fun getChildPackDirection self = (GObjectObjectClass.C.withPtr ---> GtkPackDirection.C.fromVal) getChildPackDirection_ self
    fun getPackDirection self = (GObjectObjectClass.C.withPtr ---> GtkPackDirection.C.fromVal) getPackDirection_ self
    fun setChildPackDirection self childPackDir = (GObjectObjectClass.C.withPtr &&&> GtkPackDirection.C.withVal ---> I) setChildPackDirection_ (self & childPackDir)
    fun setPackDirection self packDir = (GObjectObjectClass.C.withPtr &&&> GtkPackDirection.C.withVal ---> I) setPackDirection_ (self & packDir)
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
