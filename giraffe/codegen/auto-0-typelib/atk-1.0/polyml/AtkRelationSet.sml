structure AtkRelationSet :>
  ATK_RELATION_SET
    where type 'a class = 'a AtkRelationSetClass.class
    where type 'a object_class = 'a AtkObjectClass.class
    where type relation_type_t = AtkRelationType.t
    where type 'a relation_class = 'a AtkRelationClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "atk_relation_set_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "atk_relation_set_new") (cVoid --> AtkRelationSetClass.PolyML.cPtr)
      val add_ = call (getSymbol "atk_relation_set_add") (AtkRelationSetClass.PolyML.cPtr &&> AtkRelationClass.PolyML.cPtr --> cVoid)
      val addRelationByType_ =
        call (getSymbol "atk_relation_set_add_relation_by_type")
          (
            AtkRelationSetClass.PolyML.cPtr
             &&> AtkRelationType.PolyML.cVal
             &&> AtkObjectClass.PolyML.cPtr
             --> cVoid
          )
      val contains_ = call (getSymbol "atk_relation_set_contains") (AtkRelationSetClass.PolyML.cPtr &&> AtkRelationType.PolyML.cVal --> GBool.PolyML.cVal)
      val containsTarget_ =
        call (getSymbol "atk_relation_set_contains_target")
          (
            AtkRelationSetClass.PolyML.cPtr
             &&> AtkRelationType.PolyML.cVal
             &&> AtkObjectClass.PolyML.cPtr
             --> GBool.PolyML.cVal
          )
      val getNRelations_ = call (getSymbol "atk_relation_set_get_n_relations") (AtkRelationSetClass.PolyML.cPtr --> GInt32.PolyML.cVal)
      val getRelation_ = call (getSymbol "atk_relation_set_get_relation") (AtkRelationSetClass.PolyML.cPtr &&> GInt32.PolyML.cVal --> AtkRelationClass.PolyML.cPtr)
      val getRelationByType_ = call (getSymbol "atk_relation_set_get_relation_by_type") (AtkRelationSetClass.PolyML.cPtr &&> AtkRelationType.PolyML.cVal --> AtkRelationClass.PolyML.cPtr)
      val remove_ = call (getSymbol "atk_relation_set_remove") (AtkRelationSetClass.PolyML.cPtr &&> AtkRelationClass.PolyML.cPtr --> cVoid)
    end
    type 'a class = 'a AtkRelationSetClass.class
    type 'a object_class = 'a AtkObjectClass.class
    type relation_type_t = AtkRelationType.t
    type 'a relation_class = 'a AtkRelationClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> AtkRelationSetClass.FFI.fromPtr true) new_ ()
    fun add self relation = (AtkRelationSetClass.FFI.withPtr false &&&> AtkRelationClass.FFI.withPtr false ---> I) add_ (self & relation)
    fun addRelationByType self (relationship, target) =
      (
        AtkRelationSetClass.FFI.withPtr false
         &&&> AtkRelationType.FFI.withVal
         &&&> AtkObjectClass.FFI.withPtr false
         ---> I
      )
        addRelationByType_
        (
          self
           & relationship
           & target
        )
    fun contains self relationship = (AtkRelationSetClass.FFI.withPtr false &&&> AtkRelationType.FFI.withVal ---> GBool.FFI.fromVal) contains_ (self & relationship)
    fun containsTarget self (relationship, target) =
      (
        AtkRelationSetClass.FFI.withPtr false
         &&&> AtkRelationType.FFI.withVal
         &&&> AtkObjectClass.FFI.withPtr false
         ---> GBool.FFI.fromVal
      )
        containsTarget_
        (
          self
           & relationship
           & target
        )
    fun getNRelations self = (AtkRelationSetClass.FFI.withPtr false ---> GInt32.FFI.fromVal) getNRelations_ self
    fun getRelation self i = (AtkRelationSetClass.FFI.withPtr false &&&> GInt32.FFI.withVal ---> AtkRelationClass.FFI.fromPtr false) getRelation_ (self & i)
    fun getRelationByType self relationship = (AtkRelationSetClass.FFI.withPtr false &&&> AtkRelationType.FFI.withVal ---> AtkRelationClass.FFI.fromPtr false) getRelationByType_ (self & relationship)
    fun remove self relation = (AtkRelationSetClass.FFI.withPtr false &&&> AtkRelationClass.FFI.withPtr false ---> I) remove_ (self & relation)
  end
