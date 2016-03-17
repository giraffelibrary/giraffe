structure GtkEventBox :>
  GTK_EVENT_BOX
    where type 'a class = 'a GtkEventBoxClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class =
  struct
    val getType_ = _import "gtk_event_box_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "gtk_event_box_new" : unit -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val getAboveChild_ = _import "gtk_event_box_get_above_child" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    val getVisibleWindow_ = _import "gtk_event_box_get_visible_window" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    val setAboveChild_ = fn x1 & x2 => (_import "gtk_event_box_set_above_child" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setVisibleWindow_ = fn x1 & x2 => (_import "gtk_event_box_set_visible_window" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    type 'a class = 'a GtkEventBoxClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.C.withPtr ---> AtkImplementorIfaceClass.C.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkEventBoxClass.C.fromPtr false) new_ ()
    fun getAboveChild self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getAboveChild_ self
    fun getVisibleWindow self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getVisibleWindow_ self
    fun setAboveChild self aboveChild = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setAboveChild_ (self & aboveChild)
    fun setVisibleWindow self visibleWindow = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setVisibleWindow_ (self & visibleWindow)
    local
      open Property
    in
      val aboveChildProp =
        {
          get = fn x => get "above-child" boolean x,
          set = fn x => set "above-child" boolean x
        }
      val visibleWindowProp =
        {
          get = fn x => get "visible-window" boolean x,
          set = fn x => set "visible-window" boolean x
        }
    end
  end
