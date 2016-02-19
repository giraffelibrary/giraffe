structure GtkLinkButton :>
  GTK_LINK_BUTTON
    where type 'a class_t = 'a GtkLinkButtonClass.t
    where type 'a activatable_class_t = 'a GtkActivatableClass.t
    where type 'a buildable_class_t = 'a GtkBuildableClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_link_button_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val new_ = call (load_sym libgtk "gtk_link_button_new") (Utf8.PolyML.INPTR --> GObjectObjectClass.PolyML.PTR)
      val newWithLabel_ = call (load_sym libgtk "gtk_link_button_new_with_label") (Utf8.PolyML.INPTR &&> Utf8.PolyML.INOPTPTR --> GObjectObjectClass.PolyML.PTR)
      val getUri_ = call (load_sym libgtk "gtk_link_button_get_uri") (GObjectObjectClass.PolyML.PTR --> Utf8.PolyML.RETPTR)
      val getVisited_ = call (load_sym libgtk "gtk_link_button_get_visited") (GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val setUri_ = call (load_sym libgtk "gtk_link_button_set_uri") (GObjectObjectClass.PolyML.PTR &&> Utf8.PolyML.INPTR --> FFI.PolyML.VOID)
      val setVisited_ = call (load_sym libgtk "gtk_link_button_set_visited") (GObjectObjectClass.PolyML.PTR &&> FFI.Bool.PolyML.VAL --> FFI.PolyML.VOID)
    end
    type 'a class_t = 'a GtkLinkButtonClass.t
    type 'a activatable_class_t = 'a GtkActivatableClass.t
    type 'a buildable_class_t = 'a GtkBuildableClass.t
    type t = base class_t
    fun asImplementorIface self = (GObjectObjectClass.C.withPtr ---> AtkImplementorIfaceClass.C.fromPtr false) I self
    fun asActivatable self = (GObjectObjectClass.C.withPtr ---> GtkActivatableClass.C.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new uri = (Utf8.C.withPtr ---> GtkLinkButtonClass.C.fromPtr false) new_ uri
    fun newWithLabel uri label = (Utf8.C.withPtr &&&> Utf8.C.withOptPtr ---> GtkLinkButtonClass.C.fromPtr false) newWithLabel_ (uri & label)
    fun getUri self = (GObjectObjectClass.C.withPtr ---> Utf8.C.fromPtr false) getUri_ self
    fun getVisited self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getVisited_ self
    fun setUri self uri = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withPtr ---> I) setUri_ (self & uri)
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
