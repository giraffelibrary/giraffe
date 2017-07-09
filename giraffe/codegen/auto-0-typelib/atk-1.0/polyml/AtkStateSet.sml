structure AtkStateSet :>
  ATK_STATE_SET
    where type 'a class = 'a AtkStateSetClass.class
    where type state_type_t = AtkStateType.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "atk_state_set_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "atk_state_set_new") (cVoid --> AtkStateSetClass.PolyML.cPtr)
      val addState_ = call (getSymbol "atk_state_set_add_state") (AtkStateSetClass.PolyML.cPtr &&> AtkStateType.PolyML.cVal --> GBool.PolyML.cVal)
      val andSets_ = call (getSymbol "atk_state_set_and_sets") (AtkStateSetClass.PolyML.cPtr &&> AtkStateSetClass.PolyML.cPtr --> AtkStateSetClass.PolyML.cPtr)
      val clearStates_ = call (getSymbol "atk_state_set_clear_states") (AtkStateSetClass.PolyML.cPtr --> cVoid)
      val containsState_ = call (getSymbol "atk_state_set_contains_state") (AtkStateSetClass.PolyML.cPtr &&> AtkStateType.PolyML.cVal --> GBool.PolyML.cVal)
      val isEmpty_ = call (getSymbol "atk_state_set_is_empty") (AtkStateSetClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val orSets_ = call (getSymbol "atk_state_set_or_sets") (AtkStateSetClass.PolyML.cPtr &&> AtkStateSetClass.PolyML.cPtr --> AtkStateSetClass.PolyML.cPtr)
      val removeState_ = call (getSymbol "atk_state_set_remove_state") (AtkStateSetClass.PolyML.cPtr &&> AtkStateType.PolyML.cVal --> GBool.PolyML.cVal)
      val xorSets_ = call (getSymbol "atk_state_set_xor_sets") (AtkStateSetClass.PolyML.cPtr &&> AtkStateSetClass.PolyML.cPtr --> AtkStateSetClass.PolyML.cPtr)
    end
    type 'a class = 'a AtkStateSetClass.class
    type state_type_t = AtkStateType.t
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> AtkStateSetClass.FFI.fromPtr true) new_ ()
    fun addState self type' = (AtkStateSetClass.FFI.withPtr &&&> AtkStateType.FFI.withVal ---> GBool.FFI.fromVal) addState_ (self & type')
    fun andSets self compareSet = (AtkStateSetClass.FFI.withPtr &&&> AtkStateSetClass.FFI.withPtr ---> AtkStateSetClass.FFI.fromPtr true) andSets_ (self & compareSet)
    fun clearStates self = (AtkStateSetClass.FFI.withPtr ---> I) clearStates_ self
    fun containsState self type' = (AtkStateSetClass.FFI.withPtr &&&> AtkStateType.FFI.withVal ---> GBool.FFI.fromVal) containsState_ (self & type')
    fun isEmpty self = (AtkStateSetClass.FFI.withPtr ---> GBool.FFI.fromVal) isEmpty_ self
    fun orSets self compareSet = (AtkStateSetClass.FFI.withPtr &&&> AtkStateSetClass.FFI.withPtr ---> AtkStateSetClass.FFI.fromPtr true) orSets_ (self & compareSet)
    fun removeState self type' = (AtkStateSetClass.FFI.withPtr &&&> AtkStateType.FFI.withVal ---> GBool.FFI.fromVal) removeState_ (self & type')
    fun xorSets self compareSet = (AtkStateSetClass.FFI.withPtr &&&> AtkStateSetClass.FFI.withPtr ---> AtkStateSetClass.FFI.fromPtr true) xorSets_ (self & compareSet)
  end
