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
      val getType_ = call (load_sym libatk "atk_relation_set_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libatk "atk_relation_set_new") (FFI.PolyML.cVoid --> AtkRelationSetClass.PolyML.cPtr)
      val add_ = call (load_sym libatk "atk_relation_set_add") (AtkRelationSetClass.PolyML.cPtr &&> AtkRelationClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val addRelationByType_ =
        call (load_sym libatk "atk_relation_set_add_relation_by_type")
          (
            AtkRelationSetClass.PolyML.cPtr
             &&> AtkRelationType.PolyML.cVal
             &&> AtkObjectClass.PolyML.cPtr
             --> FFI.PolyML.cVoid
          )
      val contains_ = call (load_sym libatk "atk_relation_set_contains") (AtkRelationSetClass.PolyML.cPtr &&> AtkRelationType.PolyML.cVal --> FFI.Bool.PolyML.cVal)
      val getNRelations_ = call (load_sym libatk "atk_relation_set_get_n_relations") (AtkRelationSetClass.PolyML.cPtr --> FFI.Int32.PolyML.cVal)
      val getRelation_ = call (load_sym libatk "atk_relation_set_get_relation") (AtkRelationSetClass.PolyML.cPtr &&> FFI.Int32.PolyML.cVal --> AtkRelationClass.PolyML.cPtr)
      val getRelationByType_ = call (load_sym libatk "atk_relation_set_get_relation_by_type") (AtkRelationSetClass.PolyML.cPtr &&> AtkRelationType.PolyML.cVal --> AtkRelationClass.PolyML.cPtr)
      val remove_ = call (load_sym libatk "atk_relation_set_remove") (AtkRelationSetClass.PolyML.cPtr &&> AtkRelationClass.PolyML.cPtr --> FFI.PolyML.cVoid)
    end
    type 'a class = 'a AtkRelationSetClass.class
    type 'a object_class = 'a AtkObjectClass.class
    type relation_type_t = AtkRelationType.t
    type 'a relation_class = 'a AtkRelationClass.class
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> AtkRelationSetClass.C.fromPtr true) new_ ()
    fun add self relation = (AtkRelationSetClass.C.withPtr &&&> AtkRelationClass.C.withPtr ---> I) add_ (self & relation)
    fun addRelationByType self relationship target =
      (
        AtkRelationSetClass.C.withPtr
         &&&> AtkRelationType.C.withVal
         &&&> AtkObjectClass.C.withPtr
         ---> I
      )
        addRelationByType_
        (
          self
           & relationship
           & target
        )
    fun contains self relationship = (AtkRelationSetClass.C.withPtr &&&> AtkRelationType.C.withVal ---> FFI.Bool.C.fromVal) contains_ (self & relationship)
    fun getNRelations self = (AtkRelationSetClass.C.withPtr ---> FFI.Int32.C.fromVal) getNRelations_ self
    fun getRelation self i = (AtkRelationSetClass.C.withPtr &&&> FFI.Int32.C.withVal ---> AtkRelationClass.C.fromPtr false) getRelation_ (self & i)
    fun getRelationByType self relationship = (AtkRelationSetClass.C.withPtr &&&> AtkRelationType.C.withVal ---> AtkRelationClass.C.fromPtr false) getRelationByType_ (self & relationship)
    fun remove self relation = (AtkRelationSetClass.C.withPtr &&&> AtkRelationClass.C.withPtr ---> I) remove_ (self & relation)
  end
