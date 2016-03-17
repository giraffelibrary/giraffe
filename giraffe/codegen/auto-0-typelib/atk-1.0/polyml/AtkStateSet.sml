structure AtkStateSet :>
  ATK_STATE_SET
    where type 'a class = 'a AtkStateSetClass.class
    where type state_type_t = AtkStateType.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libatk "atk_state_set_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libatk "atk_state_set_new") (FFI.PolyML.cVoid --> GObjectObjectClass.PolyML.cPtr)
      val addState_ = call (load_sym libatk "atk_state_set_add_state") (GObjectObjectClass.PolyML.cPtr &&> AtkStateType.PolyML.cVal --> FFI.Bool.PolyML.cVal)
      val andSets_ = call (load_sym libatk "atk_state_set_and_sets") (GObjectObjectClass.PolyML.cPtr &&> GObjectObjectClass.PolyML.cPtr --> GObjectObjectClass.PolyML.cPtr)
      val clearStates_ = call (load_sym libatk "atk_state_set_clear_states") (GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val containsState_ = call (load_sym libatk "atk_state_set_contains_state") (GObjectObjectClass.PolyML.cPtr &&> AtkStateType.PolyML.cVal --> FFI.Bool.PolyML.cVal)
      val isEmpty_ = call (load_sym libatk "atk_state_set_is_empty") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val orSets_ = call (load_sym libatk "atk_state_set_or_sets") (GObjectObjectClass.PolyML.cPtr &&> GObjectObjectClass.PolyML.cPtr --> GObjectObjectClass.PolyML.cPtr)
      val removeState_ = call (load_sym libatk "atk_state_set_remove_state") (GObjectObjectClass.PolyML.cPtr &&> AtkStateType.PolyML.cVal --> FFI.Bool.PolyML.cVal)
      val xorSets_ = call (load_sym libatk "atk_state_set_xor_sets") (GObjectObjectClass.PolyML.cPtr &&> GObjectObjectClass.PolyML.cPtr --> GObjectObjectClass.PolyML.cPtr)
    end
    type 'a class = 'a AtkStateSetClass.class
    type state_type_t = AtkStateType.t
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> AtkStateSetClass.C.fromPtr true) new_ ()
    fun addState self type' = (GObjectObjectClass.C.withPtr &&&> AtkStateType.C.withVal ---> FFI.Bool.C.fromVal) addState_ (self & type')
    fun andSets self compareSet = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> AtkStateSetClass.C.fromPtr true) andSets_ (self & compareSet)
    fun clearStates self = (GObjectObjectClass.C.withPtr ---> I) clearStates_ self
    fun containsState self type' = (GObjectObjectClass.C.withPtr &&&> AtkStateType.C.withVal ---> FFI.Bool.C.fromVal) containsState_ (self & type')
    fun isEmpty self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) isEmpty_ self
    fun orSets self compareSet = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> AtkStateSetClass.C.fromPtr true) orSets_ (self & compareSet)
    fun removeState self type' = (GObjectObjectClass.C.withPtr &&&> AtkStateType.C.withVal ---> FFI.Bool.C.fromVal) removeState_ (self & type')
    fun xorSets self compareSet = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> AtkStateSetClass.C.fromPtr true) xorSets_ (self & compareSet)
  end
