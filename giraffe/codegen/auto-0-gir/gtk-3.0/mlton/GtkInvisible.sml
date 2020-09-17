structure GtkInvisible :>
  GTK_INVISIBLE
    where type 'a class = 'a GtkInvisibleClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class =
  struct
    val getType_ = _import "gtk_invisible_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "gtk_invisible_new" : unit -> GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p;
    val newForScreen_ = _import "gtk_invisible_new_for_screen" : GdkScreenClass.FFI.non_opt GdkScreenClass.FFI.p -> GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p;
    val getScreen_ = _import "gtk_invisible_get_screen" : GtkInvisibleClass.FFI.non_opt GtkInvisibleClass.FFI.p -> GdkScreenClass.FFI.non_opt GdkScreenClass.FFI.p;
    val setScreen_ = fn x1 & x2 => (_import "gtk_invisible_set_screen" : GtkInvisibleClass.FFI.non_opt GtkInvisibleClass.FFI.p * GdkScreenClass.FFI.non_opt GdkScreenClass.FFI.p -> unit;) (x1, x2)
    type 'a class = 'a GtkInvisibleClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr false ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr false ---> GtkBuildableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkInvisibleClass.FFI.fromPtr false) new_ ()
    fun newForScreen screen = (GdkScreenClass.FFI.withPtr false ---> GtkInvisibleClass.FFI.fromPtr false) newForScreen_ screen before GdkScreenClass.FFI.touchPtr screen
    fun getScreen self = (GtkInvisibleClass.FFI.withPtr false ---> GdkScreenClass.FFI.fromPtr false) getScreen_ self before GtkInvisibleClass.FFI.touchPtr self
    fun setScreen self screen = (GtkInvisibleClass.FFI.withPtr false &&&> GdkScreenClass.FFI.withPtr false ---> I) setScreen_ (self & screen)
    local
      open ValueAccessor
    in
      val screenProp =
        {
          name = "screen",
          gtype = fn () => C.gtype GdkScreenClass.tOpt (),
          get = fn x => fn () => C.get GdkScreenClass.tOpt x,
          set = fn x => C.set GdkScreenClass.tOpt x,
          init = fn x => C.set GdkScreenClass.tOpt x
        }
    end
  end
