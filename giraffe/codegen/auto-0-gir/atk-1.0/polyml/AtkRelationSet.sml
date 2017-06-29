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
      val getType_ = call (getSymbol "atk_relation_set_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "atk_relation_set_new") (PolyMLFFI.cVoid --> AtkRelationSetClass.PolyML.cPtr)
      val add_ = call (getSymbol "atk_relation_set_add") (AtkRelationSetClass.PolyML.cPtr &&> AtkRelationClass.PolyML.cPtr --> PolyMLFFI.cVoid)
      val addRelationByType_ =
        call (getSymbol "atk_relation_set_add_relation_by_type")
          (
            AtkRelationSetClass.PolyML.cPtr
             &&> AtkRelationType.PolyML.cVal
             &&> AtkObjectClass.PolyML.cPtr
             --> PolyMLFFI.cVoid
          )
      val contains_ = call (getSymbol "atk_relation_set_contains") (AtkRelationSetClass.PolyML.cPtr &&> AtkRelationType.PolyML.cVal --> GBool.PolyML.cVal)
      val getNRelations_ = call (getSymbol "atk_relation_set_get_n_relations") (AtkRelationSetClass.PolyML.cPtr --> GInt.PolyML.cVal)
      val getRelation_ = call (getSymbol "atk_relation_set_get_relation") (AtkRelationSetClass.PolyML.cPtr &&> GInt.PolyML.cVal --> AtkRelationClass.PolyML.cPtr)
      val getRelationByType_ = call (getSymbol "atk_relation_set_get_relation_by_type") (AtkRelationSetClass.PolyML.cPtr &&> AtkRelationType.PolyML.cVal --> AtkRelationClass.PolyML.cPtr)
      val remove_ = call (getSymbol "atk_relation_set_remove") (AtkRelationSetClass.PolyML.cPtr &&> AtkRelationClass.PolyML.cPtr --> PolyMLFFI.cVoid)
    end
    type 'a class = 'a AtkRelationSetClass.class
    type 'a object_class = 'a AtkObjectClass.class
    type relation_type_t = AtkRelationType.t
    type 'a relation_class = 'a AtkRelationClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> AtkRelationSetClass.FFI.fromPtr true) new_ ()
    fun add self relation = (AtkRelationSetClass.FFI.withPtr &&&> AtkRelationClass.FFI.withPtr ---> I) add_ (self & relation)
    fun addRelationByType self relationship target =
      (
        AtkRelationSetClass.FFI.withPtr
         &&&> AtkRelationType.FFI.withVal
         &&&> AtkObjectClass.FFI.withPtr
         ---> I
      )
        addRelationByType_
        (
          self
           & relationship
           & target
        )
    fun contains self relationship = (AtkRelationSetClass.FFI.withPtr &&&> AtkRelationType.FFI.withVal ---> GBool.FFI.fromVal) contains_ (self & relationship)
    fun getNRelations self = (AtkRelationSetClass.FFI.withPtr ---> GInt.FFI.fromVal) getNRelations_ self
    fun getRelation self i = (AtkRelationSetClass.FFI.withPtr &&&> GInt.FFI.withVal ---> AtkRelationClass.FFI.fromPtr false) getRelation_ (self & i)
    fun getRelationByType self relationship = (AtkRelationSetClass.FFI.withPtr &&&> AtkRelationType.FFI.withVal ---> AtkRelationClass.FFI.fromPtr false) getRelationByType_ (self & relationship)
    fun remove self relation = (AtkRelationSetClass.FFI.withPtr &&&> AtkRelationClass.FFI.withPtr ---> I) remove_ (self & relation)
  end
