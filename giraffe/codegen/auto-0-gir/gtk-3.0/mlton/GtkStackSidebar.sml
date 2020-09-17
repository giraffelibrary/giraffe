structure GtkStackSidebar :>
  GTK_STACK_SIDEBAR
    where type 'a class = 'a GtkStackSidebarClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type 'a stack_class = 'a GtkStackClass.class =
  struct
    val getType_ = _import "gtk_stack_sidebar_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "gtk_stack_sidebar_new" : unit -> GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p;
    val getStack_ = _import "gtk_stack_sidebar_get_stack" : GtkStackSidebarClass.FFI.non_opt GtkStackSidebarClass.FFI.p -> GtkStackClass.FFI.opt GtkStackClass.FFI.p;
    val setStack_ = fn x1 & x2 => (_import "gtk_stack_sidebar_set_stack" : GtkStackSidebarClass.FFI.non_opt GtkStackSidebarClass.FFI.p * GtkStackClass.FFI.non_opt GtkStackClass.FFI.p -> unit;) (x1, x2)
    type 'a class = 'a GtkStackSidebarClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type 'a stack_class = 'a GtkStackClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr false ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr false ---> GtkBuildableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkStackSidebarClass.FFI.fromPtr false) new_ ()
    fun getStack self = (GtkStackSidebarClass.FFI.withPtr false ---> GtkStackClass.FFI.fromOptPtr false) getStack_ self before GtkStackSidebarClass.FFI.touchPtr self
    fun setStack self stack = (GtkStackSidebarClass.FFI.withPtr false &&&> GtkStackClass.FFI.withPtr false ---> I) setStack_ (self & stack)
    local
      open ValueAccessor
    in
      val stackProp =
        {
          name = "stack",
          gtype = fn () => C.gtype GtkStackClass.tOpt (),
          get = fn x => fn () => C.get GtkStackClass.tOpt x,
          set = fn x => C.set GtkStackClass.tOpt x,
          init = fn x => C.set GtkStackClass.tOpt x
        }
    end
  end
