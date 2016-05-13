structure GtkEventBox :>
  GTK_EVENT_BOX
    where type 'a class = 'a GtkEventBoxClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_event_box_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libgtk "gtk_event_box_new") (PolyMLFFI.cVoid --> GtkWidgetClass.PolyML.cPtr)
      val getAboveChild_ = call (load_sym libgtk "gtk_event_box_get_above_child") (GtkEventBoxClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getVisibleWindow_ = call (load_sym libgtk "gtk_event_box_get_visible_window") (GtkEventBoxClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val setAboveChild_ = call (load_sym libgtk "gtk_event_box_set_above_child") (GtkEventBoxClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> PolyMLFFI.cVoid)
      val setVisibleWindow_ = call (load_sym libgtk "gtk_event_box_set_visible_window") (GtkEventBoxClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> PolyMLFFI.cVoid)
    end
    type 'a class = 'a GtkEventBoxClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.C.withPtr ---> AtkImplementorIfaceClass.C.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkEventBoxClass.C.fromPtr false) new_ ()
    fun getAboveChild self = (GtkEventBoxClass.C.withPtr ---> FFI.Bool.C.fromVal) getAboveChild_ self
    fun getVisibleWindow self = (GtkEventBoxClass.C.withPtr ---> FFI.Bool.C.fromVal) getVisibleWindow_ self
    fun setAboveChild self aboveChild = (GtkEventBoxClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setAboveChild_ (self & aboveChild)
    fun setVisibleWindow self visibleWindow = (GtkEventBoxClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setVisibleWindow_ (self & visibleWindow)
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
