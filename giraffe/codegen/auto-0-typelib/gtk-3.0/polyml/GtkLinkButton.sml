structure GtkLinkButton :>
  GTK_LINK_BUTTON
    where type 'a class = 'a GtkLinkButtonClass.class
    where type 'a activatable_class = 'a GtkActivatableClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_link_button_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libgtk "gtk_link_button_new") (Utf8.PolyML.cInPtr --> GtkWidgetClass.PolyML.cPtr)
      val newWithLabel_ = call (load_sym libgtk "gtk_link_button_new_with_label") (Utf8.PolyML.cInPtr &&> Utf8.PolyML.cInOptPtr --> GtkWidgetClass.PolyML.cPtr)
      val getUri_ = call (load_sym libgtk "gtk_link_button_get_uri") (GtkLinkButtonClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getVisited_ = call (load_sym libgtk "gtk_link_button_get_visited") (GtkLinkButtonClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val setUri_ = call (load_sym libgtk "gtk_link_button_set_uri") (GtkLinkButtonClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> FFI.PolyML.cVoid)
      val setVisited_ = call (load_sym libgtk "gtk_link_button_set_visited") (GtkLinkButtonClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> FFI.PolyML.cVoid)
    end
    type 'a class = 'a GtkLinkButtonClass.class
    type 'a activatable_class = 'a GtkActivatableClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.C.withPtr ---> AtkImplementorIfaceClass.C.fromPtr false) I self
    fun asActivatable self = (GObjectObjectClass.C.withPtr ---> GtkActivatableClass.C.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new uri = (Utf8.C.withPtr ---> GtkLinkButtonClass.C.fromPtr false) new_ uri
    fun newWithLabel uri label = (Utf8.C.withPtr &&&> Utf8.C.withOptPtr ---> GtkLinkButtonClass.C.fromPtr false) newWithLabel_ (uri & label)
    fun getUri self = (GtkLinkButtonClass.C.withPtr ---> Utf8.C.fromPtr false) getUri_ self
    fun getVisited self = (GtkLinkButtonClass.C.withPtr ---> FFI.Bool.C.fromVal) getVisited_ self
    fun setUri self uri = (GtkLinkButtonClass.C.withPtr &&&> Utf8.C.withPtr ---> I) setUri_ (self & uri)
    fun setVisited self visited = (GtkLinkButtonClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setVisited_ (self & visited)
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
