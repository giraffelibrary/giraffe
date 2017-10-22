structure GtkStackSwitcher :>
  GTK_STACK_SWITCHER
    where type 'a class = 'a GtkStackSwitcherClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type 'a orientable_class = 'a GtkOrientableClass.class
    where type 'a stack_class = 'a GtkStackClass.class =
  struct
    val getType_ = _import "gtk_stack_switcher_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "gtk_stack_switcher_new" : unit -> GtkWidgetClass.FFI.notnull GtkWidgetClass.FFI.p;
    val getStack_ = _import "gtk_stack_switcher_get_stack" : GtkStackSwitcherClass.FFI.notnull GtkStackSwitcherClass.FFI.p -> unit GtkStackClass.FFI.p;
    val setStack_ = fn x1 & x2 => (_import "gtk_stack_switcher_set_stack" : GtkStackSwitcherClass.FFI.notnull GtkStackSwitcherClass.FFI.p * unit GtkStackClass.FFI.p -> unit;) (x1, x2)
    type 'a class = 'a GtkStackSwitcherClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type 'a orientable_class = 'a GtkOrientableClass.class
    type 'a stack_class = 'a GtkStackClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr ---> GtkBuildableClass.FFI.fromPtr false) I self
    fun asOrientable self = (GObjectObjectClass.FFI.withPtr ---> GtkOrientableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkStackSwitcherClass.FFI.fromPtr false) new_ ()
    fun getStack self = (GtkStackSwitcherClass.FFI.withPtr ---> GtkStackClass.FFI.fromOptPtr false) getStack_ self
    fun setStack self stack = (GtkStackSwitcherClass.FFI.withPtr &&&> GtkStackClass.FFI.withOptPtr ---> I) setStack_ (self & stack)
    local
      open Property
    in
      val iconSizeProp =
        {
          get = fn x => get "icon-size" int x,
          set = fn x => set "icon-size" int x
        }
      val stackProp =
        {
          get = fn x => get "stack" GtkStackClass.tOpt x,
          set = fn x => set "stack" GtkStackClass.tOpt x
        }
    end
  end
