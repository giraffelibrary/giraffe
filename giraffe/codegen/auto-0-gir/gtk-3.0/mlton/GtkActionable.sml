structure GtkActionable :>
  GTK_ACTIONABLE
    where type 'a class = 'a GtkActionableClass.class =
  struct
    val getType_ = _import "gtk_actionable_get_type" : unit -> GObjectType.FFI.val_;
    val getActionName_ = _import "gtk_actionable_get_action_name" : GtkActionableClass.FFI.non_opt GtkActionableClass.FFI.p -> Utf8.FFI.opt Utf8.FFI.out_p;
    val getActionTargetValue_ = _import "gtk_actionable_get_action_target_value" : GtkActionableClass.FFI.non_opt GtkActionableClass.FFI.p -> GLibVariantRecord.FFI.non_opt GLibVariantRecord.FFI.p;
    val setActionName_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_actionable_set_action_name" :
              GtkActionableClass.FFI.non_opt GtkActionableClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.opt Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setActionTargetValue_ = fn x1 & x2 => (_import "gtk_actionable_set_action_target_value" : GtkActionableClass.FFI.non_opt GtkActionableClass.FFI.p * GLibVariantRecord.FFI.non_opt GLibVariantRecord.FFI.p -> unit;) (x1, x2)
    val setDetailedActionName_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_actionable_set_detailed_action_name" :
              GtkActionableClass.FFI.non_opt GtkActionableClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
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
    fun getActionName self = (GtkActionableClass.FFI.withPtr false ---> Utf8.FFI.fromOptPtr 0) getActionName_ self before GtkActionableClass.FFI.touchPtr self
    fun getActionTargetValue self = (GtkActionableClass.FFI.withPtr false ---> GLibVariantRecord.FFI.fromPtr false) getActionTargetValue_ self before GtkActionableClass.FFI.touchPtr self
    fun setActionName self actionName = (GtkActionableClass.FFI.withPtr false &&&> Utf8.FFI.withOptPtr 0 ---> I) setActionName_ (self & actionName)
    fun setActionTargetValue self targetValue = (GtkActionableClass.FFI.withPtr false &&&> GLibVariantRecord.FFI.withPtr false ---> I) setActionTargetValue_ (self & targetValue)
    fun setDetailedActionName self detailedActionName = (GtkActionableClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> I) setDetailedActionName_ (self & detailedActionName)
    local
      open ValueAccessor
    in
      val actionNameProp =
        {
          name = "action-name",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = fn x => C.set stringOpt x,
          init = fn x => C.set stringOpt x
        }
      val actionTargetProp =
        {
          name = "action-target",
          gtype = fn () => C.gtype GLibVariantRecord.tOpt (),
          get = fn x => fn () => C.get GLibVariantRecord.tOpt x,
          set = fn x => C.set GLibVariantRecord.tOpt x,
          init = fn x => C.set GLibVariantRecord.tOpt x
        }
    end
  end
