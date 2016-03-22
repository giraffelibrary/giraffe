structure GioSimpleAction :>
  GIO_SIMPLE_ACTION
    where type 'a class = 'a GioSimpleActionClass.class
    where type 'a action_class = 'a GioActionClass.class =
  struct
    val getType_ = _import "g_simple_action_get_type" : unit -> GObjectType.C.val_;
    val new_ =
      fn
        (x1, x2) & x3 =>
          (
            _import "mlton_g_simple_action_new" :
              Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * unit GLibVariantTypeRecord.C.p
               -> GioSimpleActionClass.C.notnull GioSimpleActionClass.C.p;
          )
            (
              x1,
              x2,
              x3
            )
    val newStateful_ =
      fn
        (x1, x2)
         & x3
         & x4 =>
          (
            _import "mlton_g_simple_action_new_stateful" :
              Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * unit GLibVariantTypeRecord.C.p
               * GLibVariantRecord.C.notnull GLibVariantRecord.C.p
               -> GioSimpleActionClass.C.notnull GioSimpleActionClass.C.p;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val setEnabled_ = fn x1 & x2 => (_import "g_simple_action_set_enabled" : GioSimpleActionClass.C.notnull GioSimpleActionClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setState_ = fn x1 & x2 => (_import "g_simple_action_set_state" : GioSimpleActionClass.C.notnull GioSimpleActionClass.C.p * GLibVariantRecord.C.notnull GLibVariantRecord.C.p -> unit;) (x1, x2)
    type 'a class = 'a GioSimpleActionClass.class
    type 'a action_class = 'a GioActionClass.class
    type t = base class
    fun asAction self = (GObjectObjectClass.C.withPtr ---> GioActionClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new name parameterType = (Utf8.C.withPtr &&&> GLibVariantTypeRecord.C.withOptPtr ---> GioSimpleActionClass.C.fromPtr true) new_ (name & parameterType)
    fun newStateful name parameterType state =
      (
        Utf8.C.withPtr
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
    fun setEnabled self enabled = (GioSimpleActionClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setEnabled_ (self & enabled)
    fun setState self value = (GioSimpleActionClass.C.withPtr &&&> GLibVariantRecord.C.withPtr ---> I) setState_ (self & value)
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
