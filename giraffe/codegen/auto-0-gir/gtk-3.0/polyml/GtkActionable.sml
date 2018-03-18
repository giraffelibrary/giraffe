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
          set = fn x => set "action-name" stringOpt x,
          new = fn x => new "action-name" stringOpt x
        }
      val actionTargetProp =
        {
          get = fn x => get "action-target" GLibVariantRecord.tOpt x,
          set = fn x => set "action-target" GLibVariantRecord.tOpt x,
          new = fn x => new "action-target" GLibVariantRecord.tOpt x
        }
    end
  end
