structure GtkMountOperation :>
  GTK_MOUNT_OPERATION
    where type 'a class = 'a GtkMountOperationClass.class
    where type 'a window_class = 'a GtkWindowClass.class =
  struct
    val getType_ = _import "gtk_mount_operation_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "gtk_mount_operation_new" : GtkWindowClass.FFI.opt GtkWindowClass.FFI.p -> GioMountOperationClass.FFI.non_opt GioMountOperationClass.FFI.p;
    val getParent_ = _import "gtk_mount_operation_get_parent" : GtkMountOperationClass.FFI.non_opt GtkMountOperationClass.FFI.p -> GtkWindowClass.FFI.non_opt GtkWindowClass.FFI.p;
    val getScreen_ = _import "gtk_mount_operation_get_screen" : GtkMountOperationClass.FFI.non_opt GtkMountOperationClass.FFI.p -> GdkScreenClass.FFI.non_opt GdkScreenClass.FFI.p;
    val isShowing_ = _import "gtk_mount_operation_is_showing" : GtkMountOperationClass.FFI.non_opt GtkMountOperationClass.FFI.p -> GBool.FFI.val_;
    val setParent_ = fn x1 & x2 => (_import "gtk_mount_operation_set_parent" : GtkMountOperationClass.FFI.non_opt GtkMountOperationClass.FFI.p * GtkWindowClass.FFI.opt GtkWindowClass.FFI.p -> unit;) (x1, x2)
    val setScreen_ = fn x1 & x2 => (_import "gtk_mount_operation_set_screen" : GtkMountOperationClass.FFI.non_opt GtkMountOperationClass.FFI.p * GdkScreenClass.FFI.non_opt GdkScreenClass.FFI.p -> unit;) (x1, x2)
    type 'a class = 'a GtkMountOperationClass.class
    type 'a window_class = 'a GtkWindowClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new parent = (GtkWindowClass.FFI.withOptPtr ---> GtkMountOperationClass.FFI.fromPtr true) new_ parent
    fun getParent self = (GtkMountOperationClass.FFI.withPtr ---> GtkWindowClass.FFI.fromPtr false) getParent_ self
    fun getScreen self = (GtkMountOperationClass.FFI.withPtr ---> GdkScreenClass.FFI.fromPtr false) getScreen_ self
    fun isShowing self = (GtkMountOperationClass.FFI.withPtr ---> GBool.FFI.fromVal) isShowing_ self
    fun setParent self parent = (GtkMountOperationClass.FFI.withPtr &&&> GtkWindowClass.FFI.withOptPtr ---> I) setParent_ (self & parent)
    fun setScreen self screen = (GtkMountOperationClass.FFI.withPtr &&&> GdkScreenClass.FFI.withPtr ---> I) setScreen_ (self & screen)
    local
      open Property
    in
      val isShowingProp = {get = fn x => get "is-showing" boolean x}
      val parentProp =
        {
          get = fn x => get "parent" GtkWindowClass.tOpt x,
          set = fn x => set "parent" GtkWindowClass.tOpt x,
          new = fn x => new "parent" GtkWindowClass.tOpt x
        }
      val screenProp =
        {
          get = fn x => get "screen" GdkScreenClass.tOpt x,
          set = fn x => set "screen" GdkScreenClass.tOpt x,
          new = fn x => new "screen" GdkScreenClass.tOpt x
        }
    end
  end
