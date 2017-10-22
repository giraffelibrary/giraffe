structure GtkActionable :>
  GTK_ACTIONABLE
    where type 'a class = 'a GtkActionableClass.class =
  struct
    val getType_ = _import "gtk_actionable_get_type" : unit -> GObjectType.FFI.val_;
    val getActionName_ = _import "gtk_actionable_get_action_name" : GtkActionableClass.FFI.notnull GtkActionableClass.FFI.p -> unit Utf8.FFI.out_p;
    val getActionTargetValue_ = _import "gtk_actionable_get_action_target_value" : GtkActionableClass.FFI.notnull GtkActionableClass.FFI.p -> GLibVariantRecord.FFI.notnull GLibVariantRecord.FFI.p;
    val setActionName_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_actionable_set_action_name" :
              GtkActionableClass.FFI.notnull GtkActionableClass.FFI.p
               * Utf8.MLton.p1
               * unit Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setActionTargetValue_ = fn x1 & x2 => (_import "gtk_actionable_set_action_target_value" : GtkActionableClass.FFI.notnull GtkActionableClass.FFI.p * GLibVariantRecord.FFI.notnull GLibVariantRecord.FFI.p -> unit;) (x1, x2)
    val setDetailedActionName_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_actionable_set_detailed_action_name" :
              GtkActionableClass.FFI.notnull GtkActionableClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    type 'a class = 'a GtkActionableClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun getActionName self = (GtkActionableClass.FFI.withPtr ---> Utf8.FFI.fromOptPtr 0) getActionName_ self
    fun getActionTargetValue self = (GtkActionableClass.FFI.withPtr ---> GLibVariantRecord.FFI.fromPtr false) getActionTargetValue_ self
    fun setActionName self actionName = (GtkActionableClass.FFI.withPtr &&&> Utf8.FFI.withOptPtr ---> I) setActionName_ (self & actionName)
    fun setActionTargetValue self targetValue = (GtkActionableClass.FFI.withPtr &&&> GLibVariantRecord.FFI.withPtr ---> I) setActionTargetValue_ (self & targetValue)
    fun setDetailedActionName self detailedActionName = (GtkActionableClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> I) setDetailedActionName_ (self & detailedActionName)
    local
      open Property
    in
      val actionNameProp =
        {
          get = fn x => get "action-name" stringOpt x,
          set = fn x => set "action-name" stringOpt x
        }
      val actionTargetProp =
        {
          get = fn x => get "action-target" GLibVariantRecord.tOpt x,
          set = fn x => set "action-target" GLibVariantRecord.tOpt x
        }
    end
  end
