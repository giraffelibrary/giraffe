structure GtkInvisible :>
  GTK_INVISIBLE
    where type 'a class = 'a GtkInvisibleClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_invisible_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libgtk "gtk_invisible_new") (PolyMLFFI.cVoid --> GtkWidgetClass.PolyML.cPtr)
      val newForScreen_ = call (load_sym libgtk "gtk_invisible_new_for_screen") (GdkScreenClass.PolyML.cPtr --> GtkWidgetClass.PolyML.cPtr)
      val getScreen_ = call (load_sym libgtk "gtk_invisible_get_screen") (GtkInvisibleClass.PolyML.cPtr --> GdkScreenClass.PolyML.cPtr)
      val setScreen_ = call (load_sym libgtk "gtk_invisible_set_screen") (GtkInvisibleClass.PolyML.cPtr &&> GdkScreenClass.PolyML.cPtr --> PolyMLFFI.cVoid)
    end
    type 'a class = 'a GtkInvisibleClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.C.withPtr ---> AtkImplementorIfaceClass.C.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkInvisibleClass.C.fromPtr false) new_ ()
    fun newForScreen screen = (GdkScreenClass.C.withPtr ---> GtkInvisibleClass.C.fromPtr false) newForScreen_ screen
    fun getScreen self = (GtkInvisibleClass.C.withPtr ---> GdkScreenClass.C.fromPtr false) getScreen_ self
    fun setScreen self screen = (GtkInvisibleClass.C.withPtr &&&> GdkScreenClass.C.withPtr ---> I) setScreen_ (self & screen)
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
