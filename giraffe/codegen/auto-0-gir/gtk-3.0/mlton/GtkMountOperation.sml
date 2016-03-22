structure GtkMountOperation :>
  GTK_MOUNT_OPERATION
    where type 'a class = 'a GtkMountOperationClass.class
    where type 'a window_class = 'a GtkWindowClass.class =
  struct
    val getType_ = _import "gtk_mount_operation_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "gtk_mount_operation_new" : unit GtkWindowClass.C.p -> GioMountOperationClass.C.notnull GioMountOperationClass.C.p;
    val getParent_ = _import "gtk_mount_operation_get_parent" : GtkMountOperationClass.C.notnull GtkMountOperationClass.C.p -> GtkWindowClass.C.notnull GtkWindowClass.C.p;
    val getScreen_ = _import "gtk_mount_operation_get_screen" : GtkMountOperationClass.C.notnull GtkMountOperationClass.C.p -> GdkScreenClass.C.notnull GdkScreenClass.C.p;
    val isShowing_ = _import "gtk_mount_operation_is_showing" : GtkMountOperationClass.C.notnull GtkMountOperationClass.C.p -> FFI.Bool.C.val_;
    val setParent_ = fn x1 & x2 => (_import "gtk_mount_operation_set_parent" : GtkMountOperationClass.C.notnull GtkMountOperationClass.C.p * unit GtkWindowClass.C.p -> unit;) (x1, x2)
    val setScreen_ = fn x1 & x2 => (_import "gtk_mount_operation_set_screen" : GtkMountOperationClass.C.notnull GtkMountOperationClass.C.p * GdkScreenClass.C.notnull GdkScreenClass.C.p -> unit;) (x1, x2)
    type 'a class = 'a GtkMountOperationClass.class
    type 'a window_class = 'a GtkWindowClass.class
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new parent = (GtkWindowClass.C.withOptPtr ---> GtkMountOperationClass.C.fromPtr true) new_ parent
    fun getParent self = (GtkMountOperationClass.C.withPtr ---> GtkWindowClass.C.fromPtr false) getParent_ self
    fun getScreen self = (GtkMountOperationClass.C.withPtr ---> GdkScreenClass.C.fromPtr false) getScreen_ self
    fun isShowing self = (GtkMountOperationClass.C.withPtr ---> FFI.Bool.C.fromVal) isShowing_ self
    fun setParent self parent = (GtkMountOperationClass.C.withPtr &&&> GtkWindowClass.C.withOptPtr ---> I) setParent_ (self & parent)
    fun setScreen self screen = (GtkMountOperationClass.C.withPtr &&&> GdkScreenClass.C.withPtr ---> I) setScreen_ (self & screen)
    local
      open Property
    in
      val isShowingProp = {get = fn x => get "is-showing" boolean x}
      val parentProp =
        {
          get = fn x => get "parent" GtkWindowClass.tOpt x,
          set = fn x => set "parent" GtkWindowClass.tOpt x
        }
      val screenProp =
        {
          get = fn x => get "screen" GdkScreenClass.tOpt x,
          set = fn x => set "screen" GdkScreenClass.tOpt x
        }
    end
  end
