structure GtkLinkButton :>
  GTK_LINK_BUTTON
    where type 'a class = 'a GtkLinkButtonClass.class
    where type 'a activatable_class = 'a GtkActivatableClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class =
  struct
    val getType_ = _import "gtk_link_button_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "mlton_gtk_link_button_new" : Utf8.MLton.p1 * Utf8.C.notnull Utf8.MLton.p2 -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val newWithLabel_ =
      fn
        (x1, x2) & (x3, x4) =>
          (
            _import "mlton_gtk_link_button_new_with_label" :
              Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * Utf8.MLton.p1
               * unit Utf8.MLton.p2
               -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val getUri_ = _import "gtk_link_button_get_uri" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> Utf8.C.notnull Utf8.C.out_p;
    val getVisited_ = _import "gtk_link_button_get_visited" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    val setUri_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_link_button_set_uri" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setVisited_ = fn x1 & x2 => (_import "gtk_link_button_set_visited" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
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
