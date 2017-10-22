structure GtkOverlay :>
  GTK_OVERLAY
    where type 'a class = 'a GtkOverlayClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type 'a widget_class = 'a GtkWidgetClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_overlay_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "gtk_overlay_new") (cVoid --> GtkWidgetClass.PolyML.cPtr)
      val addOverlay_ = call (getSymbol "gtk_overlay_add_overlay") (GtkOverlayClass.PolyML.cPtr &&> GtkWidgetClass.PolyML.cPtr --> cVoid)
      val getOverlayPassThrough_ = call (getSymbol "gtk_overlay_get_overlay_pass_through") (GtkOverlayClass.PolyML.cPtr &&> GtkWidgetClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val reorderOverlay_ =
        call (getSymbol "gtk_overlay_reorder_overlay")
          (
            GtkOverlayClass.PolyML.cPtr
             &&> GtkWidgetClass.PolyML.cPtr
             &&> GInt.PolyML.cVal
             --> cVoid
          )
      val setOverlayPassThrough_ =
        call (getSymbol "gtk_overlay_set_overlay_pass_through")
          (
            GtkOverlayClass.PolyML.cPtr
             &&> GtkWidgetClass.PolyML.cPtr
             &&> GBool.PolyML.cVal
             --> cVoid
          )
    end
    type 'a class = 'a GtkOverlayClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type 'a widget_class = 'a GtkWidgetClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr ---> GtkBuildableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkOverlayClass.FFI.fromPtr false) new_ ()
    fun addOverlay self widget = (GtkOverlayClass.FFI.withPtr &&&> GtkWidgetClass.FFI.withPtr ---> I) addOverlay_ (self & widget)
    fun getOverlayPassThrough self widget = (GtkOverlayClass.FFI.withPtr &&&> GtkWidgetClass.FFI.withPtr ---> GBool.FFI.fromVal) getOverlayPassThrough_ (self & widget)
    fun reorderOverlay self (child, position) =
      (
        GtkOverlayClass.FFI.withPtr
         &&&> GtkWidgetClass.FFI.withPtr
         &&&> GInt.FFI.withVal
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
        GtkOverlayClass.FFI.withPtr
         &&&> GtkWidgetClass.FFI.withPtr
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
