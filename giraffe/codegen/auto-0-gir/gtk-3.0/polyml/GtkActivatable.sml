structure GtkActivatable :>
  GTK_ACTIVATABLE
    where type 'a class = 'a GtkActivatableClass.class
    where type 'a action_class = 'a GtkActionClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_activatable_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val doSetRelatedAction_ = call (load_sym libgtk "gtk_activatable_do_set_related_action") (GtkActivatableClass.PolyML.cPtr &&> GtkActionClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val getRelatedAction_ = call (load_sym libgtk "gtk_activatable_get_related_action") (GtkActivatableClass.PolyML.cPtr --> GtkActionClass.PolyML.cPtr)
      val getUseActionAppearance_ = call (load_sym libgtk "gtk_activatable_get_use_action_appearance") (GtkActivatableClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val setRelatedAction_ = call (load_sym libgtk "gtk_activatable_set_related_action") (GtkActivatableClass.PolyML.cPtr &&> GtkActionClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val setUseActionAppearance_ = call (load_sym libgtk "gtk_activatable_set_use_action_appearance") (GtkActivatableClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> FFI.PolyML.cVoid)
      val syncActionProperties_ = call (load_sym libgtk "gtk_activatable_sync_action_properties") (GtkActivatableClass.PolyML.cPtr &&> GtkActionClass.PolyML.cOptPtr --> FFI.PolyML.cVoid)
    end
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
