structure GtkEventBox :>
  GTK_EVENT_BOX
    where type 'a class_t = 'a GtkEventBoxClass.t
    where type 'a buildableclass_t = 'a GtkBuildableClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_event_box_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val new_ = call (load_sym libgtk "gtk_event_box_new") (FFI.PolyML.VOID --> GObjectObjectClass.PolyML.PTR)
      val getAboveChild_ = call (load_sym libgtk "gtk_event_box_get_above_child") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.Bool.VAL)
      val getVisibleWindow_ = call (load_sym libgtk "gtk_event_box_get_visible_window") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.Bool.VAL)
      val setAboveChild_ = call (load_sym libgtk "gtk_event_box_set_above_child") (GObjectObjectClass.PolyML.PTR &&> FFI.PolyML.Bool.VAL --> FFI.PolyML.VOID)
      val setVisibleWindow_ = call (load_sym libgtk "gtk_event_box_set_visible_window") (GObjectObjectClass.PolyML.PTR &&> FFI.PolyML.Bool.VAL --> FFI.PolyML.VOID)
    end
    type 'a class_t = 'a GtkEventBoxClass.t
    type 'a buildableclass_t = 'a GtkBuildableClass.t
    fun asImplementorIface self = (GObjectObjectClass.C.withPtr ---> AtkImplementorIfaceClass.C.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkEventBoxClass.C.fromPtr false) new_ ()
    fun getAboveChild self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.fromVal) getAboveChild_ self
    fun getVisibleWindow self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.fromVal) getVisibleWindow_ self
    fun setAboveChild self aboveChild = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.withVal ---> I) setAboveChild_ (self & aboveChild)
    fun setVisibleWindow self visibleWindow = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.withVal ---> I) setVisibleWindow_ (self & visibleWindow)
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
