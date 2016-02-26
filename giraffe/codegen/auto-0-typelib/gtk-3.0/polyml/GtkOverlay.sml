structure GtkOverlay :>
  GTK_OVERLAY
    where type 'a class_t = 'a GtkOverlayClass.t
    where type 'a buildable_class_t = 'a GtkBuildableClass.t
    where type 'a widget_class_t = 'a GtkWidgetClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_overlay_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libgtk "gtk_overlay_new") (FFI.PolyML.cVoid --> GObjectObjectClass.PolyML.cPtr)
      val addOverlay_ = call (load_sym libgtk "gtk_overlay_add_overlay") (GObjectObjectClass.PolyML.cPtr &&> GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
    end
    type 'a class_t = 'a GtkOverlayClass.t
    type 'a buildable_class_t = 'a GtkBuildableClass.t
    type 'a widget_class_t = 'a GtkWidgetClass.t
    type t = base class_t
    fun asImplementorIface self = (GObjectObjectClass.C.withPtr ---> AtkImplementorIfaceClass.C.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkOverlayClass.C.fromPtr false) new_ ()
    fun addOverlay self widget = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> I) addOverlay_ (self & widget)
    local
      open ClosureMarshal Signal
    in
      fun getChildPositionSig f =
        signal "get-child-position" (get 0w1 GtkWidgetClass.t ---> set 0w2 CairoRectangleIntRecord.t && ret boolean)
          (
            fn
              widget =>
                let
                  val (retVal, allocation) = f widget
                in
                  allocation & retVal
                end
          )
    end
  end
