structure GtkMountOperation :>
  GTK_MOUNT_OPERATION
    where type 'a class = 'a GtkMountOperationClass.class
    where type 'a window_class = 'a GtkWindowClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_mount_operation_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "gtk_mount_operation_new") (GtkWindowClass.PolyML.cOptPtr --> GioMountOperationClass.PolyML.cPtr)
      val getParent_ = call (getSymbol "gtk_mount_operation_get_parent") (GtkMountOperationClass.PolyML.cPtr --> GtkWindowClass.PolyML.cPtr)
      val getScreen_ = call (getSymbol "gtk_mount_operation_get_screen") (GtkMountOperationClass.PolyML.cPtr --> GdkScreenClass.PolyML.cPtr)
      val isShowing_ = call (getSymbol "gtk_mount_operation_is_showing") (GtkMountOperationClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val setParent_ = call (getSymbol "gtk_mount_operation_set_parent") (GtkMountOperationClass.PolyML.cPtr &&> GtkWindowClass.PolyML.cOptPtr --> cVoid)
      val setScreen_ = call (getSymbol "gtk_mount_operation_set_screen") (GtkMountOperationClass.PolyML.cPtr &&> GdkScreenClass.PolyML.cPtr --> cVoid)
    end
    type 'a class = 'a GtkMountOperationClass.class
    type 'a window_class = 'a GtkWindowClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new parent = (GtkWindowClass.FFI.withOptPtr false ---> GtkMountOperationClass.FFI.fromPtr true) new_ parent
    fun getParent self = (GtkMountOperationClass.FFI.withPtr false ---> GtkWindowClass.FFI.fromPtr false) getParent_ self
    fun getScreen self = (GtkMountOperationClass.FFI.withPtr false ---> GdkScreenClass.FFI.fromPtr false) getScreen_ self
    fun isShowing self = (GtkMountOperationClass.FFI.withPtr false ---> GBool.FFI.fromVal) isShowing_ self
    fun setParent self parent = (GtkMountOperationClass.FFI.withPtr false &&&> GtkWindowClass.FFI.withOptPtr false ---> I) setParent_ (self & parent)
    fun setScreen self screen = (GtkMountOperationClass.FFI.withPtr false &&&> GdkScreenClass.FFI.withPtr false ---> I) setScreen_ (self & screen)
    local
      open ValueAccessor
    in
      val isShowingProp =
        {
          name = "is-showing",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = ignore,
          init = ignore
        }
      val parentProp =
        {
          name = "parent",
          gtype = fn () => C.gtype GtkWindowClass.tOpt (),
          get = fn x => fn () => C.get GtkWindowClass.tOpt x,
          set = fn x => C.set GtkWindowClass.tOpt x,
          init = fn x => C.set GtkWindowClass.tOpt x
        }
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
