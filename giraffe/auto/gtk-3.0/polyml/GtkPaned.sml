structure GtkPaned :>
  GTK_PANED
    where type 'a class_t = 'a GtkPanedClass.t
    where type 'a buildableclass_t = 'a GtkBuildableClass.t
    where type 'a orientableclass_t = 'a GtkOrientableClass.t
    where type orientation_t = GtkOrientation.t
    where type 'a widgetclass_t = 'a GtkWidgetClass.t
    where type scrolltype_t = GtkScrollType.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_paned_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val new_ = call (load_sym libgtk "gtk_paned_new") (GtkOrientation.PolyML.VAL --> GObjectObjectClass.PolyML.PTR)
      val add1_ = call (load_sym libgtk "gtk_paned_add1") (GObjectObjectClass.PolyML.PTR &&> GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val add2_ = call (load_sym libgtk "gtk_paned_add2") (GObjectObjectClass.PolyML.PTR &&> GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val getChild1_ = call (load_sym libgtk "gtk_paned_get_child1") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.OPTPTR)
      val getChild2_ = call (load_sym libgtk "gtk_paned_get_child2") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.OPTPTR)
      val getHandleWindow_ = call (load_sym libgtk "gtk_paned_get_handle_window") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val getPosition_ = call (load_sym libgtk "gtk_paned_get_position") (GObjectObjectClass.PolyML.PTR --> FFI.Int32.PolyML.VAL)
      val pack1_ =
        call (load_sym libgtk "gtk_paned_pack1")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> FFI.Bool.PolyML.VAL
             &&> FFI.Bool.PolyML.VAL
             --> FFI.PolyML.VOID
          )
      val pack2_ =
        call (load_sym libgtk "gtk_paned_pack2")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> FFI.Bool.PolyML.VAL
             &&> FFI.Bool.PolyML.VAL
             --> FFI.PolyML.VOID
          )
      val setPosition_ = call (load_sym libgtk "gtk_paned_set_position") (GObjectObjectClass.PolyML.PTR &&> FFI.Int32.PolyML.VAL --> FFI.PolyML.VOID)
    end
    type 'a class_t = 'a GtkPanedClass.t
    type 'a buildableclass_t = 'a GtkBuildableClass.t
    type 'a orientableclass_t = 'a GtkOrientableClass.t
    type orientation_t = GtkOrientation.t
    type 'a widgetclass_t = 'a GtkWidgetClass.t
    type scrolltype_t = GtkScrollType.t
    fun asImplementorIface self = (GObjectObjectClass.C.withPtr ---> AtkImplementorIfaceClass.C.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    fun asOrientable self = (GObjectObjectClass.C.withPtr ---> GtkOrientableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new orientation = (GtkOrientation.C.withVal ---> GtkPanedClass.C.fromPtr false) new_ orientation
    fun add1 self child = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> I) add1_ (self & child)
    fun add2 self child = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> I) add2_ (self & child)
    fun getChild1 self = (GObjectObjectClass.C.withPtr ---> GtkWidgetClass.C.fromOptPtr false) getChild1_ self
    fun getChild2 self = (GObjectObjectClass.C.withPtr ---> GtkWidgetClass.C.fromOptPtr false) getChild2_ self
    fun getHandleWindow self = (GObjectObjectClass.C.withPtr ---> GdkWindowClass.C.fromPtr false) getHandleWindow_ self
    fun getPosition self = (GObjectObjectClass.C.withPtr ---> FFI.Int32.C.fromVal) getPosition_ self
    fun pack1 self child resize shrink =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> FFI.Bool.C.withVal
         &&&> FFI.Bool.C.withVal
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
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> FFI.Bool.C.withVal
         &&&> FFI.Bool.C.withVal
         ---> I
      )
        pack2_
        (
          self
           & child
           & resize
           & shrink
        )
    fun setPosition self position = (GObjectObjectClass.C.withPtr &&&> FFI.Int32.C.withVal ---> I) setPosition_ (self & position)
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
