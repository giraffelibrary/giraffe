structure GtkMountOperation :>
  GTK_MOUNT_OPERATION
    where type 'a class_t = 'a GtkMountOperationClass.t
    where type 'a window_class_t = 'a GtkWindowClass.t =
  struct
    val getType_ = _import "gtk_mount_operation_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "gtk_mount_operation_new" : unit GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val getParent_ = _import "gtk_mount_operation_get_parent" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val getScreen_ = _import "gtk_mount_operation_get_screen" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val isShowing_ = _import "gtk_mount_operation_is_showing" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    val setParent_ = fn x1 & x2 => (_import "gtk_mount_operation_set_parent" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * unit GObjectObjectClass.C.p -> unit;) (x1, x2)
    val setScreen_ = fn x1 & x2 => (_import "gtk_mount_operation_set_screen" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;) (x1, x2)
    type 'a class_t = 'a GtkMountOperationClass.t
    type 'a window_class_t = 'a GtkWindowClass.t
    type t = base class_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new parent = (GObjectObjectClass.C.withOptPtr ---> GtkMountOperationClass.C.fromPtr true) new_ parent
    fun getParent self = (GObjectObjectClass.C.withPtr ---> GtkWindowClass.C.fromPtr false) getParent_ self
    fun getScreen self = (GObjectObjectClass.C.withPtr ---> GdkScreenClass.C.fromPtr false) getScreen_ self
    fun isShowing self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) isShowing_ self
    fun setParent self parent = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withOptPtr ---> I) setParent_ (self & parent)
    fun setScreen self screen = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> I) setScreen_ (self & screen)
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
