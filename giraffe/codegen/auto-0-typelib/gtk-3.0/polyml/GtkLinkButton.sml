structure GtkLinkButton :>
  GTK_LINK_BUTTON
    where type 'a class_t = 'a GtkLinkButtonClass.t
    where type 'a activatableclass_t = 'a GtkActivatableClass.t
    where type 'a buildableclass_t = 'a GtkBuildableClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_link_button_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val new_ = call (load_sym libgtk "gtk_link_button_new") (FFI.String.PolyML.INPTR --> GObjectObjectClass.PolyML.PTR)
      val newWithLabel_ = call (load_sym libgtk "gtk_link_button_new_with_label") (FFI.String.PolyML.INPTR &&> FFI.String.PolyML.INOPTPTR --> GObjectObjectClass.PolyML.PTR)
      val getUri_ = call (load_sym libgtk "gtk_link_button_get_uri") (GObjectObjectClass.PolyML.PTR --> FFI.String.PolyML.RETPTR)
      val getVisited_ = call (load_sym libgtk "gtk_link_button_get_visited") (GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val setUri_ = call (load_sym libgtk "gtk_link_button_set_uri") (GObjectObjectClass.PolyML.PTR &&> FFI.String.PolyML.INPTR --> FFI.PolyML.VOID)
      val setVisited_ = call (load_sym libgtk "gtk_link_button_set_visited") (GObjectObjectClass.PolyML.PTR &&> FFI.Bool.PolyML.VAL --> FFI.PolyML.VOID)
    end
    type 'a class_t = 'a GtkLinkButtonClass.t
    type 'a activatableclass_t = 'a GtkActivatableClass.t
    type 'a buildableclass_t = 'a GtkBuildableClass.t
    fun asImplementorIface self = (GObjectObjectClass.C.withPtr ---> AtkImplementorIfaceClass.C.fromPtr false) I self
    fun asActivatable self = (GObjectObjectClass.C.withPtr ---> GtkActivatableClass.C.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new uri = (FFI.String.C.withConstPtr ---> GtkLinkButtonClass.C.fromPtr false) new_ uri
    fun newWithLabel uri label = (FFI.String.C.withConstPtr &&&> FFI.String.C.withConstOptPtr ---> GtkLinkButtonClass.C.fromPtr false) newWithLabel_ (uri & label)
    fun getUri self = (GObjectObjectClass.C.withPtr ---> FFI.String.C.fromPtr false) getUri_ self
    fun getVisited self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getVisited_ self
    fun setUri self uri = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstPtr ---> I) setUri_ (self & uri)
    fun setVisited self visited = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setVisited_ (self & visited)
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