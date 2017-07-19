structure GtkLinkButton :>
  GTK_LINK_BUTTON
    where type 'a class = 'a GtkLinkButtonClass.class
    where type 'a activatable_class = 'a GtkActivatableClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class =
  struct
    val getType_ = _import "gtk_link_button_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "mlton_gtk_link_button_new" : Utf8.MLton.p1 * Utf8.FFI.notnull Utf8.MLton.p2 -> GtkWidgetClass.FFI.notnull GtkWidgetClass.FFI.p;
    val newWithLabel_ =
      fn
        (x1, x2) & (x3, x4) =>
          (
            _import "mlton_gtk_link_button_new_with_label" :
              Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * Utf8.MLton.p1
               * unit Utf8.MLton.p2
               -> GtkWidgetClass.FFI.notnull GtkWidgetClass.FFI.p;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val getUri_ = _import "gtk_link_button_get_uri" : GtkLinkButtonClass.FFI.notnull GtkLinkButtonClass.FFI.p -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val getVisited_ = _import "gtk_link_button_get_visited" : GtkLinkButtonClass.FFI.notnull GtkLinkButtonClass.FFI.p -> GBool.FFI.val_;
    val setUri_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_link_button_set_uri" :
              GtkLinkButtonClass.FFI.notnull GtkLinkButtonClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setVisited_ = fn x1 & x2 => (_import "gtk_link_button_set_visited" : GtkLinkButtonClass.FFI.notnull GtkLinkButtonClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
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
