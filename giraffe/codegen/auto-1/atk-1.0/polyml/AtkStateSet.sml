structure AtkStateSet :>
  ATK_STATE_SET
    where type 'a class_t = 'a AtkStateSetClass.t
    where type statetype_t = AtkStateType.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libatk "atk_state_set_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val new_ = call (load_sym libatk "atk_state_set_new") (FFI.PolyML.VOID --> GObjectObjectClass.PolyML.PTR)
      val addState_ = call (load_sym libatk "atk_state_set_add_state") (GObjectObjectClass.PolyML.PTR &&> AtkStateType.PolyML.VAL --> FFI.PolyML.Bool.VAL)
      val andSets_ = call (load_sym libatk "atk_state_set_and_sets") (GObjectObjectClass.PolyML.PTR &&> GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val clearStates_ = call (load_sym libatk "atk_state_set_clear_states") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val containsState_ = call (load_sym libatk "atk_state_set_contains_state") (GObjectObjectClass.PolyML.PTR &&> AtkStateType.PolyML.VAL --> FFI.PolyML.Bool.VAL)
      val isEmpty_ = call (load_sym libatk "atk_state_set_is_empty") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.Bool.VAL)
      val orSets_ = call (load_sym libatk "atk_state_set_or_sets") (GObjectObjectClass.PolyML.PTR &&> GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val removeState_ = call (load_sym libatk "atk_state_set_remove_state") (GObjectObjectClass.PolyML.PTR &&> AtkStateType.PolyML.VAL --> FFI.PolyML.Bool.VAL)
      val xorSets_ = call (load_sym libatk "atk_state_set_xor_sets") (GObjectObjectClass.PolyML.PTR &&> GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
    end
    type 'a class_t = 'a AtkStateSetClass.t
    type statetype_t = AtkStateType.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> AtkStateSetClass.C.fromPtr true) new_ ()
    fun addState self type' = (GObjectObjectClass.C.withPtr &&&> AtkStateType.C.withVal ---> FFI.Bool.fromVal) addState_ (self & type')
    fun andSets self compareSet = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> AtkStateSetClass.C.fromPtr true) andSets_ (self & compareSet)
    fun clearStates self = (GObjectObjectClass.C.withPtr ---> I) clearStates_ self
    fun containsState self type' = (GObjectObjectClass.C.withPtr &&&> AtkStateType.C.withVal ---> FFI.Bool.fromVal) containsState_ (self & type')
    fun isEmpty self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.fromVal) isEmpty_ self
    fun orSets self compareSet = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> AtkStateSetClass.C.fromPtr true) orSets_ (self & compareSet)
    fun removeState self type' = (GObjectObjectClass.C.withPtr &&&> AtkStateType.C.withVal ---> FFI.Bool.fromVal) removeState_ (self & type')
    fun xorSets self compareSet = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> AtkStateSetClass.C.fromPtr true) xorSets_ (self & compareSet)
  end
