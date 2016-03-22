structure GtkOverlay :>
  GTK_OVERLAY
    where type 'a class = 'a GtkOverlayClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type 'a widget_class = 'a GtkWidgetClass.class =
  struct
    val getType_ = _import "gtk_overlay_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "gtk_overlay_new" : unit -> GtkWidgetClass.C.notnull GtkWidgetClass.C.p;
    val addOverlay_ = fn x1 & x2 => (_import "gtk_overlay_add_overlay" : GtkOverlayClass.C.notnull GtkOverlayClass.C.p * GtkWidgetClass.C.notnull GtkWidgetClass.C.p -> unit;) (x1, x2)
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
