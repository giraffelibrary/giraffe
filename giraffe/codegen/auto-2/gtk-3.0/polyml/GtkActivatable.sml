structure GtkActivatable :>
  GTK_ACTIVATABLE
    where type 'a class_t = 'a GtkActivatableClass.t
    where type 'a actionclass_t = 'a GtkActionClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_activatable_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val doSetRelatedAction_ = call (load_sym libgtk "gtk_activatable_do_set_related_action") (GObjectObjectClass.PolyML.PTR &&> GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val getRelatedAction_ = call (load_sym libgtk "gtk_activatable_get_related_action") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val getUseActionAppearance_ = call (load_sym libgtk "gtk_activatable_get_use_action_appearance") (GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val setRelatedAction_ = call (load_sym libgtk "gtk_activatable_set_related_action") (GObjectObjectClass.PolyML.PTR &&> GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val setUseActionAppearance_ = call (load_sym libgtk "gtk_activatable_set_use_action_appearance") (GObjectObjectClass.PolyML.PTR &&> FFI.Bool.PolyML.VAL --> FFI.PolyML.VOID)
      val syncActionProperties_ = call (load_sym libgtk "gtk_activatable_sync_action_properties") (GObjectObjectClass.PolyML.PTR &&> GObjectObjectClass.PolyML.OPTPTR --> FFI.PolyML.VOID)
    end
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
