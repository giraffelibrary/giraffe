structure GtkActionable :>
  GTK_ACTIONABLE
    where type 'a class = 'a GtkActionableClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_actionable_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val getActionName_ = call (getSymbol "gtk_actionable_get_action_name") (GtkActionableClass.PolyML.cPtr --> Utf8.PolyML.cOutOptPtr)
      val getActionTargetValue_ = call (getSymbol "gtk_actionable_get_action_target_value") (GtkActionableClass.PolyML.cPtr --> GLibVariantRecord.PolyML.cPtr)
      val setActionName_ = call (getSymbol "gtk_actionable_set_action_name") (GtkActionableClass.PolyML.cPtr &&> Utf8.PolyML.cInOptPtr --> cVoid)
      val setActionTargetValue_ = call (getSymbol "gtk_actionable_set_action_target_value") (GtkActionableClass.PolyML.cPtr &&> GLibVariantRecord.PolyML.cPtr --> cVoid)
      val setDetailedActionName_ = call (getSymbol "gtk_actionable_set_detailed_action_name") (GtkActionableClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> cVoid)
    end
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
