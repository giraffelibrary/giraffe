structure GtkLinkButton :>
  GTK_LINK_BUTTON
    where type 'a class = 'a GtkLinkButtonClass.class
    where type 'a actionable_class = 'a GtkActionableClass.class
    where type 'a activatable_class = 'a GtkActivatableClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_link_button_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "gtk_link_button_new") (Utf8.PolyML.cInPtr --> GtkWidgetClass.PolyML.cPtr)
      val newWithLabel_ = call (getSymbol "gtk_link_button_new_with_label") (Utf8.PolyML.cInPtr &&> Utf8.PolyML.cInOptPtr --> GtkWidgetClass.PolyML.cPtr)
      val getUri_ = call (getSymbol "gtk_link_button_get_uri") (GtkLinkButtonClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getVisited_ = call (getSymbol "gtk_link_button_get_visited") (GtkLinkButtonClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val setUri_ = call (getSymbol "gtk_link_button_set_uri") (GtkLinkButtonClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> cVoid)
      val setVisited_ = call (getSymbol "gtk_link_button_set_visited") (GtkLinkButtonClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
    end
    type 'a class = 'a GtkLinkButtonClass.class
    type 'a actionable_class = 'a GtkActionableClass.class
    type 'a activatable_class = 'a GtkActivatableClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr false ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asActionable self = (GObjectObjectClass.FFI.withPtr false ---> GtkActionableClass.FFI.fromPtr false) I self
    fun asActivatable self = (GObjectObjectClass.FFI.withPtr false ---> GtkActivatableClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr false ---> GtkBuildableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new uri = (Utf8.FFI.withPtr 0 ---> GtkLinkButtonClass.FFI.fromPtr false) new_ uri before Utf8.FFI.touchPtr uri
    fun newWithLabel (uri, label) = (Utf8.FFI.withPtr 0 &&&> Utf8.FFI.withOptPtr 0 ---> GtkLinkButtonClass.FFI.fromPtr false) newWithLabel_ (uri & label) before Utf8.FFI.touchPtr uri before Utf8.FFI.touchOptPtr label
    fun getUri self = (GtkLinkButtonClass.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getUri_ self before GtkLinkButtonClass.FFI.touchPtr self
    fun getVisited self = (GtkLinkButtonClass.FFI.withPtr false ---> GBool.FFI.fromVal) getVisited_ self
    fun setUri self uri = (GtkLinkButtonClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> I) setUri_ (self & uri)
    fun setVisited self visited = (GtkLinkButtonClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setVisited_ (self & visited)
    local
      open ClosureMarshal Signal
    in
      fun activateLinkSig f = signal "activate-link" (void ---> ret boolean) f
    end
    local
      open ValueAccessor
    in
      val uriProp =
        {
          name = "uri",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = fn x => C.set stringOpt x,
          init = fn x => C.set stringOpt x
        }
      val visitedProp =
        {
          name = "visited",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
    end
  end
