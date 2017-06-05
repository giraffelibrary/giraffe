structure GtkPaned :>
  GTK_PANED
    where type 'a class = 'a GtkPanedClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type 'a orientable_class = 'a GtkOrientableClass.class
    where type orientation_t = GtkOrientation.t
    where type 'a widget_class = 'a GtkWidgetClass.class
    where type scroll_type_t = GtkScrollType.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_paned_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libgtk "gtk_paned_new") (GtkOrientation.PolyML.cVal --> GtkWidgetClass.PolyML.cPtr)
      val add1_ = call (load_sym libgtk "gtk_paned_add1") (GtkPanedClass.PolyML.cPtr &&> GtkWidgetClass.PolyML.cPtr --> PolyMLFFI.cVoid)
      val add2_ = call (load_sym libgtk "gtk_paned_add2") (GtkPanedClass.PolyML.cPtr &&> GtkWidgetClass.PolyML.cPtr --> PolyMLFFI.cVoid)
      val getChild1_ = call (load_sym libgtk "gtk_paned_get_child1") (GtkPanedClass.PolyML.cPtr --> GtkWidgetClass.PolyML.cOptPtr)
      val getChild2_ = call (load_sym libgtk "gtk_paned_get_child2") (GtkPanedClass.PolyML.cPtr --> GtkWidgetClass.PolyML.cOptPtr)
      val getHandleWindow_ = call (load_sym libgtk "gtk_paned_get_handle_window") (GtkPanedClass.PolyML.cPtr --> GdkWindowClass.PolyML.cPtr)
      val getPosition_ = call (load_sym libgtk "gtk_paned_get_position") (GtkPanedClass.PolyML.cPtr --> GInt.PolyML.cVal)
      val pack1_ =
        call (load_sym libgtk "gtk_paned_pack1")
          (
            GtkPanedClass.PolyML.cPtr
             &&> GtkWidgetClass.PolyML.cPtr
             &&> GBool.PolyML.cVal
             &&> GBool.PolyML.cVal
             --> PolyMLFFI.cVoid
          )
      val pack2_ =
        call (load_sym libgtk "gtk_paned_pack2")
          (
            GtkPanedClass.PolyML.cPtr
             &&> GtkWidgetClass.PolyML.cPtr
             &&> GBool.PolyML.cVal
             &&> GBool.PolyML.cVal
             --> PolyMLFFI.cVoid
          )
      val setPosition_ = call (load_sym libgtk "gtk_paned_set_position") (GtkPanedClass.PolyML.cPtr &&> GInt.PolyML.cVal --> PolyMLFFI.cVoid)
    end
    type 'a class = 'a GtkPanedClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type 'a orientable_class = 'a GtkOrientableClass.class
    type orientation_t = GtkOrientation.t
    type 'a widget_class = 'a GtkWidgetClass.class
    type scroll_type_t = GtkScrollType.t
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr ---> GtkBuildableClass.FFI.fromPtr false) I self
    fun asOrientable self = (GObjectObjectClass.FFI.withPtr ---> GtkOrientableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new orientation = (GtkOrientation.FFI.withVal ---> GtkPanedClass.FFI.fromPtr false) new_ orientation
    fun add1 self child = (GtkPanedClass.FFI.withPtr &&&> GtkWidgetClass.FFI.withPtr ---> I) add1_ (self & child)
    fun add2 self child = (GtkPanedClass.FFI.withPtr &&&> GtkWidgetClass.FFI.withPtr ---> I) add2_ (self & child)
    fun getChild1 self = (GtkPanedClass.FFI.withPtr ---> GtkWidgetClass.FFI.fromOptPtr false) getChild1_ self
    fun getChild2 self = (GtkPanedClass.FFI.withPtr ---> GtkWidgetClass.FFI.fromOptPtr false) getChild2_ self
    fun getHandleWindow self = (GtkPanedClass.FFI.withPtr ---> GdkWindowClass.FFI.fromPtr false) getHandleWindow_ self
    fun getPosition self = (GtkPanedClass.FFI.withPtr ---> GInt.FFI.fromVal) getPosition_ self
    fun pack1 self child resize shrink =
      (
        GtkPanedClass.FFI.withPtr
         &&&> GtkWidgetClass.FFI.withPtr
         &&&> GBool.FFI.withVal
         &&&> GBool.FFI.withVal
         ---> I
      )
        pack1_
        (
          self
           & child
           & resize
           & shrink
        )
    fun pack2 self child resize shrink =
      (
        GtkPanedClass.FFI.withPtr
         &&&> GtkWidgetClass.FFI.withPtr
         &&&> GBool.FFI.withVal
         &&&> GBool.FFI.withVal
         ---> I
      )
        pack2_
        (
          self
           & child
           & resize
           & shrink
        )
    fun setPosition self position = (GtkPanedClass.FFI.withPtr &&&> GInt.FFI.withVal ---> I) setPosition_ (self & position)
    local
      open ClosureMarshal Signal
    in
      fun acceptPositionSig f = signal "accept-position" (void ---> ret boolean) f
      fun cancelPositionSig f = signal "cancel-position" (void ---> ret boolean) f
      fun cycleChildFocusSig f = signal "cycle-child-focus" (get 0w1 boolean ---> ret boolean) f
      fun cycleHandleFocusSig f = signal "cycle-handle-focus" (get 0w1 boolean ---> ret boolean) f
      fun moveHandleSig f = signal "move-handle" (get 0w1 GtkScrollType.t ---> ret boolean) f
      fun toggleHandleFocusSig f = signal "toggle-handle-focus" (void ---> ret boolean) f
    end
    local
      open Property
    in
      val maxPositionProp = {get = fn x => get "max-position" int x}
      val minPositionProp = {get = fn x => get "min-position" int x}
      val positionProp =
        {
          get = fn x => get "position" int x,
          set = fn x => set "position" int x
        }
      val positionSetProp =
        {
          get = fn x => get "position-set" boolean x,
          set = fn x => set "position-set" boolean x
        }
    end
  end
