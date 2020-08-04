structure GtkOverlay :>
  GTK_OVERLAY
    where type 'a class = 'a GtkOverlayClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type 'a widget_class = 'a GtkWidgetClass.class =
  struct
    val getType_ = _import "gtk_overlay_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "gtk_overlay_new" : unit -> GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p;
    val addOverlay_ = fn x1 & x2 => (_import "gtk_overlay_add_overlay" : GtkOverlayClass.FFI.non_opt GtkOverlayClass.FFI.p * GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p -> unit;) (x1, x2)
    val getOverlayPassThrough_ = fn x1 & x2 => (_import "gtk_overlay_get_overlay_pass_through" : GtkOverlayClass.FFI.non_opt GtkOverlayClass.FFI.p * GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p -> GBool.FFI.val_;) (x1, x2)
    val reorderOverlay_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_overlay_reorder_overlay" :
              GtkOverlayClass.FFI.non_opt GtkOverlayClass.FFI.p
               * GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p
               * GInt32.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setOverlayPassThrough_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_overlay_set_overlay_pass_through" :
              GtkOverlayClass.FFI.non_opt GtkOverlayClass.FFI.p
               * GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p
               * GBool.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    type 'a class = 'a GtkOverlayClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type 'a widget_class = 'a GtkWidgetClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr false ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr false ---> GtkBuildableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkOverlayClass.FFI.fromPtr false) new_ ()
    fun addOverlay self widget = (GtkOverlayClass.FFI.withPtr false &&&> GtkWidgetClass.FFI.withPtr false ---> I) addOverlay_ (self & widget)
    fun getOverlayPassThrough self widget = (GtkOverlayClass.FFI.withPtr false &&&> GtkWidgetClass.FFI.withPtr false ---> GBool.FFI.fromVal) getOverlayPassThrough_ (self & widget)
    fun reorderOverlay self (child, position) =
      (
        GtkOverlayClass.FFI.withPtr false
         &&&> GtkWidgetClass.FFI.withPtr false
         &&&> GInt32.FFI.withVal
         ---> I
      )
        reorderOverlay_
        (
          self
           & child
           & position
        )
    fun setOverlayPassThrough self (widget, passThrough) =
      (
        GtkOverlayClass.FFI.withPtr false
         &&&> GtkWidgetClass.FFI.withPtr false
         &&&> GBool.FFI.withVal
         ---> I
      )
        setOverlayPassThrough_
        (
          self
           & widget
           & passThrough
        )
    local
      open ClosureMarshal Signal
    in
      fun getChildPositionSig f =
        signal "get-child-position" (get 0w1 GtkWidgetClass.t ---> set 0w2 GdkRectangleRecord.t && ret boolean)
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
