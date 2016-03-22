structure GtkMountOperation :>
  GTK_MOUNT_OPERATION
    where type 'a class = 'a GtkMountOperationClass.class
    where type 'a window_class = 'a GtkWindowClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_mount_operation_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libgtk "gtk_mount_operation_new") (GtkWindowClass.PolyML.cOptPtr --> GioMountOperationClass.PolyML.cPtr)
      val getParent_ = call (load_sym libgtk "gtk_mount_operation_get_parent") (GtkMountOperationClass.PolyML.cPtr --> GtkWindowClass.PolyML.cPtr)
      val getScreen_ = call (load_sym libgtk "gtk_mount_operation_get_screen") (GtkMountOperationClass.PolyML.cPtr --> GdkScreenClass.PolyML.cPtr)
      val isShowing_ = call (load_sym libgtk "gtk_mount_operation_is_showing") (GtkMountOperationClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val setParent_ = call (load_sym libgtk "gtk_mount_operation_set_parent") (GtkMountOperationClass.PolyML.cPtr &&> GtkWindowClass.PolyML.cOptPtr --> FFI.PolyML.cVoid)
      val setScreen_ = call (load_sym libgtk "gtk_mount_operation_set_screen") (GtkMountOperationClass.PolyML.cPtr &&> GdkScreenClass.PolyML.cPtr --> FFI.PolyML.cVoid)
    end
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
