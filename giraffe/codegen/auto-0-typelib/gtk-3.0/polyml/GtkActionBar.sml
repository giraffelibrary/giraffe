structure GtkActionBar :>
  GTK_ACTION_BAR
    where type 'a class = 'a GtkActionBarClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type 'a widget_class = 'a GtkWidgetClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_action_bar_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "gtk_action_bar_new") (cVoid --> GtkWidgetClass.PolyML.cPtr)
      val getCenterWidget_ = call (getSymbol "gtk_action_bar_get_center_widget") (GtkActionBarClass.PolyML.cPtr --> GtkWidgetClass.PolyML.cOptPtr)
      val packEnd_ = call (getSymbol "gtk_action_bar_pack_end") (GtkActionBarClass.PolyML.cPtr &&> GtkWidgetClass.PolyML.cPtr --> cVoid)
      val packStart_ = call (getSymbol "gtk_action_bar_pack_start") (GtkActionBarClass.PolyML.cPtr &&> GtkWidgetClass.PolyML.cPtr --> cVoid)
      val setCenterWidget_ = call (getSymbol "gtk_action_bar_set_center_widget") (GtkActionBarClass.PolyML.cPtr &&> GtkWidgetClass.PolyML.cOptPtr --> cVoid)
    end
    type 'a class = 'a GtkActionBarClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type 'a widget_class = 'a GtkWidgetClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr false ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr false ---> GtkBuildableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkActionBarClass.FFI.fromPtr false) new_ ()
    fun getCenterWidget self = (GtkActionBarClass.FFI.withPtr false ---> GtkWidgetClass.FFI.fromOptPtr false) getCenterWidget_ self before GtkActionBarClass.FFI.touchPtr self
    fun packEnd self child = (GtkActionBarClass.FFI.withPtr false &&&> GtkWidgetClass.FFI.withPtr false ---> I) packEnd_ (self & child)
    fun packStart self child = (GtkActionBarClass.FFI.withPtr false &&&> GtkWidgetClass.FFI.withPtr false ---> I) packStart_ (self & child)
    fun setCenterWidget self centerWidget = (GtkActionBarClass.FFI.withPtr false &&&> GtkWidgetClass.FFI.withOptPtr false ---> I) setCenterWidget_ (self & centerWidget)
  end
