structure GtkAccessible :>
  GTK_ACCESSIBLE
    where type 'a class = 'a GtkAccessibleClass.class
    where type 'a widget_class = 'a GtkWidgetClass.class =
  struct
    val getType_ = _import "gtk_accessible_get_type" : unit -> GObjectType.FFI.val_;
    val connectWidgetDestroyed_ = _import "gtk_accessible_connect_widget_destroyed" : GtkAccessibleClass.FFI.non_opt GtkAccessibleClass.FFI.p -> unit;
    val getWidget_ = _import "gtk_accessible_get_widget" : GtkAccessibleClass.FFI.non_opt GtkAccessibleClass.FFI.p -> GtkWidgetClass.FFI.opt GtkWidgetClass.FFI.p;
    val setWidget_ = fn x1 & x2 => (_import "gtk_accessible_set_widget" : GtkAccessibleClass.FFI.non_opt GtkAccessibleClass.FFI.p * GtkWidgetClass.FFI.opt GtkWidgetClass.FFI.p -> unit;) (x1, x2)
    type 'a class = 'a GtkAccessibleClass.class
    type 'a widget_class = 'a GtkWidgetClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun connectWidgetDestroyed self = (GtkAccessibleClass.FFI.withPtr false ---> I) connectWidgetDestroyed_ self
    fun getWidget self = (GtkAccessibleClass.FFI.withPtr false ---> GtkWidgetClass.FFI.fromOptPtr false) getWidget_ self
    fun setWidget self widget = (GtkAccessibleClass.FFI.withPtr false &&&> GtkWidgetClass.FFI.withOptPtr false ---> I) setWidget_ (self & widget)
    local
      open Property
    in
      val widgetProp =
        {
          get = fn x => get "widget" GtkWidgetClass.tOpt x,
          set = fn x => set "widget" GtkWidgetClass.tOpt x,
          new = fn x => new "widget" GtkWidgetClass.tOpt x
        }
    end
  end
