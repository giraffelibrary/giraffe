structure GtkActivatable :>
  GTK_ACTIVATABLE
    where type 'a class = 'a GtkActivatableClass.class
    where type 'a action_class = 'a GtkActionClass.class =
  struct
    val getType_ = _import "gtk_activatable_get_type" : unit -> GObjectType.C.val_;
    val doSetRelatedAction_ = fn x1 & x2 => (_import "gtk_activatable_do_set_related_action" : GtkActivatableClass.C.notnull GtkActivatableClass.C.p * GtkActionClass.C.notnull GtkActionClass.C.p -> unit;) (x1, x2)
    val getRelatedAction_ = _import "gtk_activatable_get_related_action" : GtkActivatableClass.C.notnull GtkActivatableClass.C.p -> GtkActionClass.C.notnull GtkActionClass.C.p;
    val getUseActionAppearance_ = _import "gtk_activatable_get_use_action_appearance" : GtkActivatableClass.C.notnull GtkActivatableClass.C.p -> FFI.Bool.C.val_;
    val setRelatedAction_ = fn x1 & x2 => (_import "gtk_activatable_set_related_action" : GtkActivatableClass.C.notnull GtkActivatableClass.C.p * GtkActionClass.C.notnull GtkActionClass.C.p -> unit;) (x1, x2)
    val setUseActionAppearance_ = fn x1 & x2 => (_import "gtk_activatable_set_use_action_appearance" : GtkActivatableClass.C.notnull GtkActivatableClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val syncActionProperties_ = fn x1 & x2 => (_import "gtk_activatable_sync_action_properties" : GtkActivatableClass.C.notnull GtkActivatableClass.C.p * unit GtkActionClass.C.p -> unit;) (x1, x2)
    type 'a class = 'a GtkActivatableClass.class
    type 'a action_class = 'a GtkActionClass.class
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun doSetRelatedAction self action = (GtkActivatableClass.C.withPtr &&&> GtkActionClass.C.withPtr ---> I) doSetRelatedAction_ (self & action)
    fun getRelatedAction self = (GtkActivatableClass.C.withPtr ---> GtkActionClass.C.fromPtr false) getRelatedAction_ self
    fun getUseActionAppearance self = (GtkActivatableClass.C.withPtr ---> FFI.Bool.C.fromVal) getUseActionAppearance_ self
    fun setRelatedAction self action = (GtkActivatableClass.C.withPtr &&&> GtkActionClass.C.withPtr ---> I) setRelatedAction_ (self & action)
    fun setUseActionAppearance self useAppearance = (GtkActivatableClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setUseActionAppearance_ (self & useAppearance)
    fun syncActionProperties self action = (GtkActivatableClass.C.withPtr &&&> GtkActionClass.C.withOptPtr ---> I) syncActionProperties_ (self & action)
    local
      open Property
    in
      val relatedActionProp =
        {
          get = fn x => get "related-action" GtkActionClass.tOpt x,
          set = fn x => set "related-action" GtkActionClass.tOpt x
        }
      val useActionAppearanceProp =
        {
          get = fn x => get "use-action-appearance" boolean x,
          set = fn x => set "use-action-appearance" boolean x
        }
    end
  end
