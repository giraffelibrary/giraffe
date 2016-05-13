structure GtkOverlay :>
  GTK_OVERLAY
    where type 'a class = 'a GtkOverlayClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type 'a widget_class = 'a GtkWidgetClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_overlay_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libgtk "gtk_overlay_new") (PolyMLFFI.cVoid --> GtkWidgetClass.PolyML.cPtr)
      val addOverlay_ = call (load_sym libgtk "gtk_overlay_add_overlay") (GtkOverlayClass.PolyML.cPtr &&> GtkWidgetClass.PolyML.cPtr --> PolyMLFFI.cVoid)
    end
    type 'a class = 'a GtkOverlayClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type 'a widget_class = 'a GtkWidgetClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.C.withPtr ---> AtkImplementorIfaceClass.C.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkOverlayClass.C.fromPtr false) new_ ()
    fun addOverlay self widget = (GtkOverlayClass.C.withPtr &&&> GtkWidgetClass.C.withPtr ---> I) addOverlay_ (self & widget)
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
