structure GtkActivatable :>
  GTK_ACTIVATABLE
    where type 'a class_t = 'a GtkActivatableClass.t
    where type 'a actionclass_t = 'a GtkActionClass.t =
  struct
    val getType_ = _import "gtk_activatable_get_type" : unit -> GObjectType.C.val_;
    val doSetRelatedAction_ = fn x1 & x2 => (_import "gtk_activatable_do_set_related_action" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;) (x1, x2)
    val getRelatedAction_ = _import "gtk_activatable_get_related_action" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val getUseActionAppearance_ = _import "gtk_activatable_get_use_action_appearance" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    val setRelatedAction_ = fn x1 & x2 => (_import "gtk_activatable_set_related_action" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;) (x1, x2)
    val setUseActionAppearance_ = fn x1 & x2 => (_import "gtk_activatable_set_use_action_appearance" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val syncActionProperties_ = fn x1 & x2 => (_import "gtk_activatable_sync_action_properties" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * unit GObjectObjectClass.C.p -> unit;) (x1, x2)
    type 'a class_t = 'a GtkActivatableClass.t
    type 'a actionclass_t = 'a GtkActionClass.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun doSetRelatedAction self action = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> I) doSetRelatedAction_ (self & action)
    fun getRelatedAction self = (GObjectObjectClass.C.withPtr ---> GtkActionClass.C.fromPtr false) getRelatedAction_ self
    fun getUseActionAppearance self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getUseActionAppearance_ self
    fun setRelatedAction self action = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> I) setRelatedAction_ (self & action)
    fun setUseActionAppearance self useAppearance = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setUseActionAppearance_ (self & useAppearance)
    fun syncActionProperties self action = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withOptPtr ---> I) syncActionProperties_ (self & action)
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
