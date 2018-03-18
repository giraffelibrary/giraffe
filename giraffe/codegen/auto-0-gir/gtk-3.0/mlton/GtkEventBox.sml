structure GtkEventBox :>
  GTK_EVENT_BOX
    where type 'a class = 'a GtkEventBoxClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class =
  struct
    val getType_ = _import "gtk_event_box_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "gtk_event_box_new" : unit -> GtkWidgetClass.FFI.notnull GtkWidgetClass.FFI.p;
    val getAboveChild_ = _import "gtk_event_box_get_above_child" : GtkEventBoxClass.FFI.notnull GtkEventBoxClass.FFI.p -> GBool.FFI.val_;
    val getVisibleWindow_ = _import "gtk_event_box_get_visible_window" : GtkEventBoxClass.FFI.notnull GtkEventBoxClass.FFI.p -> GBool.FFI.val_;
    val setAboveChild_ = fn x1 & x2 => (_import "gtk_event_box_set_above_child" : GtkEventBoxClass.FFI.notnull GtkEventBoxClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setVisibleWindow_ = fn x1 & x2 => (_import "gtk_event_box_set_visible_window" : GtkEventBoxClass.FFI.notnull GtkEventBoxClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    type 'a class = 'a GtkEventBoxClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr ---> GtkBuildableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkEventBoxClass.FFI.fromPtr false) new_ ()
    fun getAboveChild self = (GtkEventBoxClass.FFI.withPtr ---> GBool.FFI.fromVal) getAboveChild_ self
    fun getVisibleWindow self = (GtkEventBoxClass.FFI.withPtr ---> GBool.FFI.fromVal) getVisibleWindow_ self
    fun setAboveChild self aboveChild = (GtkEventBoxClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setAboveChild_ (self & aboveChild)
    fun setVisibleWindow self visibleWindow = (GtkEventBoxClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setVisibleWindow_ (self & visibleWindow)
    local
      open Property
    in
      val aboveChildProp =
        {
          get = fn x => get "above-child" boolean x,
          set = fn x => set "above-child" boolean x,
          new = fn x => new "above-child" boolean x
        }
      val visibleWindowProp =
        {
          get = fn x => get "visible-window" boolean x,
          set = fn x => set "visible-window" boolean x,
          new = fn x => new "visible-window" boolean x
        }
    end
  end
