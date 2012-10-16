structure GtkLinkButton :>
  GTK_LINK_BUTTON
    where type 'a class_t = 'a GtkLinkButtonClass.t
    where type 'a activatableclass_t = 'a GtkActivatableClass.t
    where type 'a buildableclass_t = 'a GtkBuildableClass.t =
  struct
    val getType_ = _import "gtk_link_button_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "mlton_gtk_link_button_new" : cstring * unit CPointer.t -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val newWithLabel_ =
      fn
        (x1, x2) & (x3, x4) =>
          (
            _import "mlton_gtk_link_button_new_with_label" :
              cstring
               * unit CPointer.t
               * cstring
               * unit CPointer.t
               -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val getUri_ = _import "gtk_link_button_get_uri" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.String.notnull FFI.String.out_p;
    val getVisited_ = _import "gtk_link_button_get_visited" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.val_;
    val setUri_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_link_button_set_uri" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setVisited_ = fn x1 & x2 => (_import "gtk_link_button_set_visited" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Bool.val_ -> unit;) (x1, x2)
    type 'a class_t = 'a GtkLinkButtonClass.t
    type 'a activatableclass_t = 'a GtkActivatableClass.t
    type 'a buildableclass_t = 'a GtkBuildableClass.t
    fun asImplementorIface self = (GObjectObjectClass.C.withPtr ---> AtkImplementorIfaceClass.C.fromPtr false) I self
    fun asActivatable self = (GObjectObjectClass.C.withPtr ---> GtkActivatableClass.C.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new uri = (FFI.String.withConstPtr ---> GtkLinkButtonClass.C.fromPtr false) new_ uri
    fun newWithLabel uri label = (FFI.String.withConstPtr &&&> FFI.String.withConstOptPtr ---> GtkLinkButtonClass.C.fromPtr false) newWithLabel_ (uri & label)
    fun getUri self = (GObjectObjectClass.C.withPtr ---> FFI.String.fromPtr false) getUri_ self
    fun getVisited self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.fromVal) getVisited_ self
    fun setUri self uri = (GObjectObjectClass.C.withPtr &&&> FFI.String.withConstPtr ---> I) setUri_ (self & uri)
    fun setVisited self visited = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.withVal ---> I) setVisited_ (self & visited)
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
