structure GtkLinkButton :>
  GTK_LINK_BUTTON
    where type 'a class = 'a GtkLinkButtonClass.class
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
    type 'a activatable_class = 'a GtkActivatableClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asActivatable self = (GObjectObjectClass.FFI.withPtr ---> GtkActivatableClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr ---> GtkBuildableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new uri = (Utf8.FFI.withPtr ---> GtkLinkButtonClass.FFI.fromPtr false) new_ uri
    fun newWithLabel (uri, label) = (Utf8.FFI.withPtr &&&> Utf8.FFI.withOptPtr ---> GtkLinkButtonClass.FFI.fromPtr false) newWithLabel_ (uri & label)
    fun getUri self = (GtkLinkButtonClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getUri_ self
    fun getVisited self = (GtkLinkButtonClass.FFI.withPtr ---> GBool.FFI.fromVal) getVisited_ self
    fun setUri self uri = (GtkLinkButtonClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> I) setUri_ (self & uri)
    fun setVisited self visited = (GtkLinkButtonClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setVisited_ (self & visited)
    local
      open ClosureMarshal Signal
    in
      fun activateLinkSig f = signal "activate-link" (void ---> ret boolean) f
    end
    local
      open Property
    in
      val uriProp =
        {
          get = fn x => get "uri" stringOpt x,
          set = fn x => set "uri" stringOpt x
        }
      val visitedProp =
        {
          get = fn x => get "visited" boolean x,
          set = fn x => set "visited" boolean x
        }
    end
  end
