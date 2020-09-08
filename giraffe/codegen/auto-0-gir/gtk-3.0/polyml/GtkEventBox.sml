structure GtkEventBox :>
  GTK_EVENT_BOX
    where type 'a class = 'a GtkEventBoxClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_event_box_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "gtk_event_box_new") (cVoid --> GtkWidgetClass.PolyML.cPtr)
      val getAboveChild_ = call (getSymbol "gtk_event_box_get_above_child") (GtkEventBoxClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getVisibleWindow_ = call (getSymbol "gtk_event_box_get_visible_window") (GtkEventBoxClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val setAboveChild_ = call (getSymbol "gtk_event_box_set_above_child") (GtkEventBoxClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setVisibleWindow_ = call (getSymbol "gtk_event_box_set_visible_window") (GtkEventBoxClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
    end
    type 'a class = 'a GtkEventBoxClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr false ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr false ---> GtkBuildableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkEventBoxClass.FFI.fromPtr false) new_ ()
    fun getAboveChild self = (GtkEventBoxClass.FFI.withPtr false ---> GBool.FFI.fromVal) getAboveChild_ self
    fun getVisibleWindow self = (GtkEventBoxClass.FFI.withPtr false ---> GBool.FFI.fromVal) getVisibleWindow_ self
    fun setAboveChild self aboveChild = (GtkEventBoxClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setAboveChild_ (self & aboveChild)
    fun setVisibleWindow self visibleWindow = (GtkEventBoxClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setVisibleWindow_ (self & visibleWindow)
    local
      open ValueAccessor
    in
      val aboveChildProp =
        {
          name = "above-child",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val visibleWindowProp =
        {
          name = "visible-window",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
    end
  end
