structure GtkInvisible :>
  GTK_INVISIBLE
    where type 'a class = 'a GtkInvisibleClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_invisible_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "gtk_invisible_new") (cVoid --> GtkWidgetClass.PolyML.cPtr)
      val newForScreen_ = call (getSymbol "gtk_invisible_new_for_screen") (GdkScreenClass.PolyML.cPtr --> GtkWidgetClass.PolyML.cPtr)
      val getScreen_ = call (getSymbol "gtk_invisible_get_screen") (GtkInvisibleClass.PolyML.cPtr --> GdkScreenClass.PolyML.cPtr)
      val setScreen_ = call (getSymbol "gtk_invisible_set_screen") (GtkInvisibleClass.PolyML.cPtr &&> GdkScreenClass.PolyML.cPtr --> cVoid)
    end
    type 'a class = 'a GtkInvisibleClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr ---> GtkBuildableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkInvisibleClass.FFI.fromPtr false) new_ ()
    fun newForScreen screen = (GdkScreenClass.FFI.withPtr ---> GtkInvisibleClass.FFI.fromPtr false) newForScreen_ screen
    fun getScreen self = (GtkInvisibleClass.FFI.withPtr ---> GdkScreenClass.FFI.fromPtr false) getScreen_ self
    fun setScreen self screen = (GtkInvisibleClass.FFI.withPtr &&&> GdkScreenClass.FFI.withPtr ---> I) setScreen_ (self & screen)
    local
      open Property
    in
      val screenProp =
        {
          get = fn x => get "screen" GdkScreenClass.tOpt x,
          set = fn x => set "screen" GdkScreenClass.tOpt x
        }
    end
  end
