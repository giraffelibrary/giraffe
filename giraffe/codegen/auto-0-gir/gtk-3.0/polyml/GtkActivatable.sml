structure GtkActivatable :>
  GTK_ACTIVATABLE
    where type 'a class = 'a GtkActivatableClass.class
    where type 'a action_class = 'a GtkActionClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_activatable_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val doSetRelatedAction_ = call (getSymbol "gtk_activatable_do_set_related_action") (GtkActivatableClass.PolyML.cPtr &&> GtkActionClass.PolyML.cPtr --> cVoid)
      val getRelatedAction_ = call (getSymbol "gtk_activatable_get_related_action") (GtkActivatableClass.PolyML.cPtr --> GtkActionClass.PolyML.cPtr)
      val getUseActionAppearance_ = call (getSymbol "gtk_activatable_get_use_action_appearance") (GtkActivatableClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val setRelatedAction_ = call (getSymbol "gtk_activatable_set_related_action") (GtkActivatableClass.PolyML.cPtr &&> GtkActionClass.PolyML.cPtr --> cVoid)
      val setUseActionAppearance_ = call (getSymbol "gtk_activatable_set_use_action_appearance") (GtkActivatableClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val syncActionProperties_ = call (getSymbol "gtk_activatable_sync_action_properties") (GtkActivatableClass.PolyML.cPtr &&> GtkActionClass.PolyML.cOptPtr --> cVoid)
    end
    type 'a class = 'a GtkActivatableClass.class
    type 'a action_class = 'a GtkActionClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun doSetRelatedAction self action = (GtkActivatableClass.FFI.withPtr false &&&> GtkActionClass.FFI.withPtr false ---> I) doSetRelatedAction_ (self & action)
    fun getRelatedAction self = (GtkActivatableClass.FFI.withPtr false ---> GtkActionClass.FFI.fromPtr false) getRelatedAction_ self before GtkActivatableClass.FFI.touchPtr self
    fun getUseActionAppearance self = (GtkActivatableClass.FFI.withPtr false ---> GBool.FFI.fromVal) getUseActionAppearance_ self
    fun setRelatedAction self action = (GtkActivatableClass.FFI.withPtr false &&&> GtkActionClass.FFI.withPtr false ---> I) setRelatedAction_ (self & action)
    fun setUseActionAppearance self useAppearance = (GtkActivatableClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setUseActionAppearance_ (self & useAppearance)
    fun syncActionProperties self action = (GtkActivatableClass.FFI.withPtr false &&&> GtkActionClass.FFI.withOptPtr false ---> I) syncActionProperties_ (self & action)
    local
      open ValueAccessor
    in
      val relatedActionProp =
        {
          name = "related-action",
          gtype = fn () => C.gtype GtkActionClass.tOpt (),
          get = fn x => fn () => C.get GtkActionClass.tOpt x,
          set = fn x => C.set GtkActionClass.tOpt x,
          init = fn x => C.set GtkActionClass.tOpt x
        }
      val useActionAppearanceProp =
        {
          name = "use-action-appearance",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
    end
  end
