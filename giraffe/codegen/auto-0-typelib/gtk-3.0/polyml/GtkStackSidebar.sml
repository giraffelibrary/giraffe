structure GtkStackSidebar :>
  GTK_STACK_SIDEBAR
    where type 'a class = 'a GtkStackSidebarClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type 'a stack_class = 'a GtkStackClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_stack_sidebar_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "gtk_stack_sidebar_new") (cVoid --> GtkWidgetClass.PolyML.cPtr)
      val getStack_ = call (getSymbol "gtk_stack_sidebar_get_stack") (GtkStackSidebarClass.PolyML.cPtr --> GtkStackClass.PolyML.cOptPtr)
      val setStack_ = call (getSymbol "gtk_stack_sidebar_set_stack") (GtkStackSidebarClass.PolyML.cPtr &&> GtkStackClass.PolyML.cPtr --> cVoid)
    end
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
