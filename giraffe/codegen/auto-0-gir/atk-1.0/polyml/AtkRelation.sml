structure AtkRelation :>
  ATK_RELATION
    where type 'a class = 'a AtkRelationClass.class
    where type object_class_c_ptr_array_n_t = AtkObjectClassCPtrArrayN.t
    where type 'a object_class = 'a AtkObjectClass.class
    where type relation_type_t = AtkRelationType.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "atk_relation_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ =
        call (getSymbol "atk_relation_new")
          (
            AtkObjectClassCPtrArrayN.PolyML.cInPtr
             &&> GInt.PolyML.cVal
             &&> AtkRelationType.PolyML.cVal
             --> AtkRelationClass.PolyML.cPtr
          )
      val addTarget_ = call (getSymbol "atk_relation_add_target") (AtkRelationClass.PolyML.cPtr &&> AtkObjectClass.PolyML.cPtr --> cVoid)
      val getRelationType_ = call (getSymbol "atk_relation_get_relation_type") (AtkRelationClass.PolyML.cPtr --> AtkRelationType.PolyML.cVal)
      val removeTarget_ = call (getSymbol "atk_relation_remove_target") (AtkRelationClass.PolyML.cPtr &&> AtkObjectClass.PolyML.cPtr --> GBool.PolyML.cVal)
    end
    type 'a class = 'a AtkRelationClass.class
    type object_class_c_ptr_array_n_t = AtkObjectClassCPtrArrayN.t
    type 'a object_class = 'a AtkObjectClass.class
    type relation_type_t = AtkRelationType.t
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new (targets, relationship) =
      let
        val nTargets = LargeInt.fromInt (AtkObjectClassCPtrArrayN.length targets)
        val retVal =
          (
            AtkObjectClassCPtrArrayN.FFI.withPtr 0
             &&&> GInt.FFI.withVal
             &&&> AtkRelationType.FFI.withVal
             ---> AtkRelationClass.FFI.fromPtr true
          )
            new_
            (
              targets
               & nTargets
               & relationship
            )
      in
        retVal
      end
    fun addTarget self target = (AtkRelationClass.FFI.withPtr false &&&> AtkObjectClass.FFI.withPtr false ---> I) addTarget_ (self & target)
    fun getRelationType self = (AtkRelationClass.FFI.withPtr false ---> AtkRelationType.FFI.fromVal) getRelationType_ self
    fun removeTarget self target = (AtkRelationClass.FFI.withPtr false &&&> AtkObjectClass.FFI.withPtr false ---> GBool.FFI.fromVal) removeTarget_ (self & target)
    local
      open ValueAccessor
    in
      val relationTypeProp =
        {
          name = "relation-type",
          gtype = fn () => C.gtype AtkRelationType.t (),
          get = fn x => fn () => C.get AtkRelationType.t x,
          set = fn x => C.set AtkRelationType.t x,
          init = fn x => C.set AtkRelationType.t x
        }
      val targetProp =
        {
          name = "target",
          gtype = fn () => C.gtype GObjectValueArrayRecord.tOpt (),
          get = fn x => fn () => C.get GObjectValueArrayRecord.tOpt x,
          set = fn x => C.set GObjectValueArrayRecord.tOpt x,
          init = fn x => C.set GObjectValueArrayRecord.tOpt x
        }
    end
  end
