structure GtkMountOperation :>
  GTK_MOUNT_OPERATION
    where type 'a class_t = 'a GtkMountOperationClass.t
    where type 'a windowclass_t = 'a GtkWindowClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_mount_operation_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val new_ = call (load_sym libgtk "gtk_mount_operation_new") (GObjectObjectClass.PolyML.OPTPTR --> GObjectObjectClass.PolyML.PTR)
      val getParent_ = call (load_sym libgtk "gtk_mount_operation_get_parent") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val getScreen_ = call (load_sym libgtk "gtk_mount_operation_get_screen") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val isShowing_ = call (load_sym libgtk "gtk_mount_operation_is_showing") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.Bool.VAL)
      val setParent_ = call (load_sym libgtk "gtk_mount_operation_set_parent") (GObjectObjectClass.PolyML.PTR &&> GObjectObjectClass.PolyML.OPTPTR --> FFI.PolyML.VOID)
      val setScreen_ = call (load_sym libgtk "gtk_mount_operation_set_screen") (GObjectObjectClass.PolyML.PTR &&> GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
    end
    type 'a class_t = 'a GtkMountOperationClass.t
    type 'a windowclass_t = 'a GtkWindowClass.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new parent = (GObjectObjectClass.C.withOptPtr ---> GtkMountOperationClass.C.fromPtr true) new_ parent
    fun getParent self = (GObjectObjectClass.C.withPtr ---> GtkWindowClass.C.fromPtr false) getParent_ self
    fun getScreen self = (GObjectObjectClass.C.withPtr ---> GdkScreenClass.C.fromPtr false) getScreen_ self
    fun isShowing self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.fromVal) isShowing_ self
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
