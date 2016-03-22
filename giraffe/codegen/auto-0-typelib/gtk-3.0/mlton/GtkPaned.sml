structure GtkPaned :>
  GTK_PANED
    where type 'a class = 'a GtkPanedClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type 'a orientable_class = 'a GtkOrientableClass.class
    where type orientation_t = GtkOrientation.t
    where type 'a widget_class = 'a GtkWidgetClass.class
    where type scroll_type_t = GtkScrollType.t =
  struct
    val getType_ = _import "gtk_paned_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "gtk_paned_new" : GtkOrientation.C.val_ -> GtkWidgetClass.C.notnull GtkWidgetClass.C.p;
    val add1_ = fn x1 & x2 => (_import "gtk_paned_add1" : GtkPanedClass.C.notnull GtkPanedClass.C.p * GtkWidgetClass.C.notnull GtkWidgetClass.C.p -> unit;) (x1, x2)
    val add2_ = fn x1 & x2 => (_import "gtk_paned_add2" : GtkPanedClass.C.notnull GtkPanedClass.C.p * GtkWidgetClass.C.notnull GtkWidgetClass.C.p -> unit;) (x1, x2)
    val getChild1_ = _import "gtk_paned_get_child1" : GtkPanedClass.C.notnull GtkPanedClass.C.p -> unit GtkWidgetClass.C.p;
    val getChild2_ = _import "gtk_paned_get_child2" : GtkPanedClass.C.notnull GtkPanedClass.C.p -> unit GtkWidgetClass.C.p;
    val getHandleWindow_ = _import "gtk_paned_get_handle_window" : GtkPanedClass.C.notnull GtkPanedClass.C.p -> GdkWindowClass.C.notnull GdkWindowClass.C.p;
    val getPosition_ = _import "gtk_paned_get_position" : GtkPanedClass.C.notnull GtkPanedClass.C.p -> FFI.Int32.C.val_;
    val pack1_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "gtk_paned_pack1" :
              GtkPanedClass.C.notnull GtkPanedClass.C.p
               * GtkWidgetClass.C.notnull GtkWidgetClass.C.p
               * FFI.Bool.C.val_
               * FFI.Bool.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val pack2_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "gtk_paned_pack2" :
              GtkPanedClass.C.notnull GtkPanedClass.C.p
               * GtkWidgetClass.C.notnull GtkWidgetClass.C.p
               * FFI.Bool.C.val_
               * FFI.Bool.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val setPosition_ = fn x1 & x2 => (_import "gtk_paned_set_position" : GtkPanedClass.C.notnull GtkPanedClass.C.p * FFI.Int32.C.val_ -> unit;) (x1, x2)
    type 'a class = 'a GtkPanedClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type 'a orientable_class = 'a GtkOrientableClass.class
    type orientation_t = GtkOrientation.t
    type 'a widget_class = 'a GtkWidgetClass.class
    type scroll_type_t = GtkScrollType.t
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.C.withPtr ---> AtkImplementorIfaceClass.C.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    fun asOrientable self = (GObjectObjectClass.C.withPtr ---> GtkOrientableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new orientation = (GtkOrientation.C.withVal ---> GtkPanedClass.C.fromPtr false) new_ orientation
    fun add1 self child = (GtkPanedClass.C.withPtr &&&> GtkWidgetClass.C.withPtr ---> I) add1_ (self & child)
    fun add2 self child = (GtkPanedClass.C.withPtr &&&> GtkWidgetClass.C.withPtr ---> I) add2_ (self & child)
    fun getChild1 self = (GtkPanedClass.C.withPtr ---> GtkWidgetClass.C.fromOptPtr false) getChild1_ self
    fun getChild2 self = (GtkPanedClass.C.withPtr ---> GtkWidgetClass.C.fromOptPtr false) getChild2_ self
    fun getHandleWindow self = (GtkPanedClass.C.withPtr ---> GdkWindowClass.C.fromPtr false) getHandleWindow_ self
    fun getPosition self = (GtkPanedClass.C.withPtr ---> FFI.Int32.C.fromVal) getPosition_ self
    fun pack1 self child resize shrink =
      (
        GtkPanedClass.C.withPtr
         &&&> GtkWidgetClass.C.withPtr
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
        GtkPanedClass.C.withPtr
         &&&> GtkWidgetClass.C.withPtr
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
    fun setPosition self position = (GtkPanedClass.C.withPtr &&&> FFI.Int32.C.withVal ---> I) setPosition_ (self & position)
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
