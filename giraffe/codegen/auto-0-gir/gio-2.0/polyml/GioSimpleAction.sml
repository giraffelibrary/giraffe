structure GioSimpleAction :>
  GIO_SIMPLE_ACTION
    where type 'a class_t = 'a GioSimpleActionClass.t
    where type 'a actionclass_t = 'a GioActionClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_simple_action_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val new_ = call (load_sym libgio "g_simple_action_new") (FFI.String.PolyML.INPTR &&> GLibVariantTypeRecord.PolyML.OPTPTR --> GObjectObjectClass.PolyML.PTR)
      val newStateful_ =
        call (load_sym libgio "g_simple_action_new_stateful")
          (
            FFI.String.PolyML.INPTR
             &&> GLibVariantTypeRecord.PolyML.OPTPTR
             &&> GLibVariantRecord.PolyML.PTR
             --> GObjectObjectClass.PolyML.PTR
          )
      val setEnabled_ = call (load_sym libgio "g_simple_action_set_enabled") (GObjectObjectClass.PolyML.PTR &&> FFI.Bool.PolyML.VAL --> FFI.PolyML.VOID)
      val setState_ = call (load_sym libgio "g_simple_action_set_state") (GObjectObjectClass.PolyML.PTR &&> GLibVariantRecord.PolyML.PTR --> FFI.PolyML.VOID)
    end
    type 'a class_t = 'a GioSimpleActionClass.t
    type 'a actionclass_t = 'a GioActionClass.t
    type t = base class_t
    fun asAction self = (GObjectObjectClass.C.withPtr ---> GioActionClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new name parameterType = (FFI.String.C.withConstPtr &&&> GLibVariantTypeRecord.C.withOptPtr ---> GioSimpleActionClass.C.fromPtr true) new_ (name & parameterType)
    fun newStateful name parameterType state =
      (
        FFI.String.C.withConstPtr
         &&&> GLibVariantTypeRecord.C.withOptPtr
         &&&> GLibVariantRecord.C.withPtr
         ---> GioSimpleActionClass.C.fromPtr true
      )
        newStateful_
        (
          name
           & parameterType
           & state
        )
    fun setEnabled self enabled = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setEnabled_ (self & enabled)
    fun setState self value = (GObjectObjectClass.C.withPtr &&&> GLibVariantRecord.C.withPtr ---> I) setState_ (self & value)
    local
      open ClosureMarshal Signal
    in
      fun activateSig f = signal "activate" (get 0w1 GLibVariantRecord.tOpt ---> ret_void) f
      fun changeStateSig f = signal "change-state" (get 0w1 GLibVariantRecord.tOpt ---> ret_void) f
    end
    local
      open Property
    in
      val enabledProp = {get = fn x => get "enabled" boolean x}
      val nameProp = {get = fn x => get "name" stringOpt x}
      val parameterTypeProp = {get = fn x => get "parameter-type" GLibVariantTypeRecord.tOpt x}
      val stateProp = {get = fn x => get "state" GLibVariantRecord.tOpt x}
      val stateTypeProp = {get = fn x => get "state-type" GLibVariantTypeRecord.tOpt x}
    end
  end
