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
             &&> GInt32.PolyML.cVal
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
            AtkObjectClassCPtrArrayN.FFI.withPtr
             &&&> GInt32.FFI.withVal
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
    fun addTarget self target = (AtkRelationClass.FFI.withPtr &&&> AtkObjectClass.FFI.withPtr ---> I) addTarget_ (self & target)
    fun getRelationType self = (AtkRelationClass.FFI.withPtr ---> AtkRelationType.FFI.fromVal) getRelationType_ self
    fun removeTarget self target = (AtkRelationClass.FFI.withPtr &&&> AtkObjectClass.FFI.withPtr ---> GBool.FFI.fromVal) removeTarget_ (self & target)
    local
      open Property
    in
      val relationTypeProp =
        {
          get = fn x => get "relation-type" AtkRelationType.t x,
          set = fn x => set "relation-type" AtkRelationType.t x,
          new = fn x => new "relation-type" AtkRelationType.t x
        }
      val targetProp =
        {
          get = fn x => get "target" GObjectValueArrayRecord.tOpt x,
          set = fn x => set "target" GObjectValueArrayRecord.tOpt x,
          new = fn x => new "target" GObjectValueArrayRecord.tOpt x
        }
    end
  end
