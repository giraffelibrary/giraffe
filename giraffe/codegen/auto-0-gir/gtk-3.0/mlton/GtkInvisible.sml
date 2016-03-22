structure GtkInvisible :>
  GTK_INVISIBLE
    where type 'a class = 'a GtkInvisibleClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class =
  struct
    val getType_ = _import "gtk_invisible_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "gtk_invisible_new" : unit -> GtkWidgetClass.C.notnull GtkWidgetClass.C.p;
    val newForScreen_ = _import "gtk_invisible_new_for_screen" : GdkScreenClass.C.notnull GdkScreenClass.C.p -> GtkWidgetClass.C.notnull GtkWidgetClass.C.p;
    val getScreen_ = _import "gtk_invisible_get_screen" : GtkInvisibleClass.C.notnull GtkInvisibleClass.C.p -> GdkScreenClass.C.notnull GdkScreenClass.C.p;
    val setScreen_ = fn x1 & x2 => (_import "gtk_invisible_set_screen" : GtkInvisibleClass.C.notnull GtkInvisibleClass.C.p * GdkScreenClass.C.notnull GdkScreenClass.C.p -> unit;) (x1, x2)
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
