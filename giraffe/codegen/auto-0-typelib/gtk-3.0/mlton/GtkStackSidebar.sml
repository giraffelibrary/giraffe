structure GtkStackSidebar :>
  GTK_STACK_SIDEBAR
    where type 'a class = 'a GtkStackSidebarClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type 'a stack_class = 'a GtkStackClass.class =
  struct
    val getType_ = _import "gtk_stack_sidebar_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "gtk_stack_sidebar_new" : unit -> GtkWidgetClass.FFI.notnull GtkWidgetClass.FFI.p;
    val getStack_ = _import "gtk_stack_sidebar_get_stack" : GtkStackSidebarClass.FFI.notnull GtkStackSidebarClass.FFI.p -> unit GtkStackClass.FFI.p;
    val setStack_ = fn x1 & x2 => (_import "gtk_stack_sidebar_set_stack" : GtkStackSidebarClass.FFI.notnull GtkStackSidebarClass.FFI.p * GtkStackClass.FFI.notnull GtkStackClass.FFI.p -> unit;) (x1, x2)
    type 'a class = 'a GtkStackSidebarClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type 'a stack_class = 'a GtkStackClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr ---> GtkBuildableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkStackSidebarClass.FFI.fromPtr false) new_ ()
    fun getStack self = (GtkStackSidebarClass.FFI.withPtr ---> GtkStackClass.FFI.fromOptPtr false) getStack_ self
    fun setStack self stack = (GtkStackSidebarClass.FFI.withPtr &&&> GtkStackClass.FFI.withPtr ---> I) setStack_ (self & stack)
    local
      open Property
    in
      val stackProp =
        {
          get = fn x => get "stack" GtkStackClass.tOpt x,
          set = fn x => set "stack" GtkStackClass.tOpt x
        }
    end
  end
