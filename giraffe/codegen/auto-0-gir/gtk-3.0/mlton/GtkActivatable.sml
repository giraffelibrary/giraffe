structure GtkActivatable :>
  GTK_ACTIVATABLE
    where type 'a class = 'a GtkActivatableClass.class
    where type 'a action_class = 'a GtkActionClass.class =
  struct
    val getType_ = _import "gtk_activatable_get_type" : unit -> GObjectType.FFI.val_;
    val doSetRelatedAction_ = fn x1 & x2 => (_import "gtk_activatable_do_set_related_action" : GtkActivatableClass.FFI.non_opt GtkActivatableClass.FFI.p * GtkActionClass.FFI.non_opt GtkActionClass.FFI.p -> unit;) (x1, x2)
    val getRelatedAction_ = _import "gtk_activatable_get_related_action" : GtkActivatableClass.FFI.non_opt GtkActivatableClass.FFI.p -> GtkActionClass.FFI.non_opt GtkActionClass.FFI.p;
    val getUseActionAppearance_ = _import "gtk_activatable_get_use_action_appearance" : GtkActivatableClass.FFI.non_opt GtkActivatableClass.FFI.p -> GBool.FFI.val_;
    val setRelatedAction_ = fn x1 & x2 => (_import "gtk_activatable_set_related_action" : GtkActivatableClass.FFI.non_opt GtkActivatableClass.FFI.p * GtkActionClass.FFI.non_opt GtkActionClass.FFI.p -> unit;) (x1, x2)
    val setUseActionAppearance_ = fn x1 & x2 => (_import "gtk_activatable_set_use_action_appearance" : GtkActivatableClass.FFI.non_opt GtkActivatableClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val syncActionProperties_ = fn x1 & x2 => (_import "gtk_activatable_sync_action_properties" : GtkActivatableClass.FFI.non_opt GtkActivatableClass.FFI.p * GtkActionClass.FFI.opt GtkActionClass.FFI.p -> unit;) (x1, x2)
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
