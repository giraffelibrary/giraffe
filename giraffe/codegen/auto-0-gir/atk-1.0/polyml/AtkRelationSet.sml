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
      val new_ = call (load_sym libatk "atk_relation_set_new") (FFI.PolyML.cVoid --> GObjectObjectClass.PolyML.cPtr)
      val add_ = call (load_sym libatk "atk_relation_set_add") (GObjectObjectClass.PolyML.cPtr &&> GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val addRelationByType_ =
        call (load_sym libatk "atk_relation_set_add_relation_by_type")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> AtkRelationType.PolyML.cVal
             &&> GObjectObjectClass.PolyML.cPtr
             --> FFI.PolyML.cVoid
          )
      val contains_ = call (load_sym libatk "atk_relation_set_contains") (GObjectObjectClass.PolyML.cPtr &&> AtkRelationType.PolyML.cVal --> FFI.Bool.PolyML.cVal)
      val getNRelations_ = call (load_sym libatk "atk_relation_set_get_n_relations") (GObjectObjectClass.PolyML.cPtr --> FFI.Int.PolyML.cVal)
      val getRelation_ = call (load_sym libatk "atk_relation_set_get_relation") (GObjectObjectClass.PolyML.cPtr &&> FFI.Int.PolyML.cVal --> GObjectObjectClass.PolyML.cPtr)
      val getRelationByType_ = call (load_sym libatk "atk_relation_set_get_relation_by_type") (GObjectObjectClass.PolyML.cPtr &&> AtkRelationType.PolyML.cVal --> GObjectObjectClass.PolyML.cPtr)
      val remove_ = call (load_sym libatk "atk_relation_set_remove") (GObjectObjectClass.PolyML.cPtr &&> GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
    end
    type 'a class = 'a AtkRelationSetClass.class
    type 'a object_class = 'a AtkObjectClass.class
    type relation_type_t = AtkRelationType.t
    type 'a relation_class = 'a AtkRelationClass.class
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> AtkRelationSetClass.C.fromPtr true) new_ ()
    fun add self relation = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> I) add_ (self & relation)
    fun addRelationByType self relationship target =
      (
        GObjectObjectClass.C.withPtr
         &&&> AtkRelationType.C.withVal
         &&&> GObjectObjectClass.C.withPtr
         ---> I
      )
        addRelationByType_
        (
          self
           & relationship
           & target
        )
    fun contains self relationship = (GObjectObjectClass.C.withPtr &&&> AtkRelationType.C.withVal ---> FFI.Bool.C.fromVal) contains_ (self & relationship)
    fun getNRelations self = (GObjectObjectClass.C.withPtr ---> FFI.Int.C.fromVal) getNRelations_ self
    fun getRelation self i = (GObjectObjectClass.C.withPtr &&&> FFI.Int.C.withVal ---> AtkRelationClass.C.fromPtr false) getRelation_ (self & i)
    fun getRelationByType self relationship = (GObjectObjectClass.C.withPtr &&&> AtkRelationType.C.withVal ---> AtkRelationClass.C.fromPtr false) getRelationByType_ (self & relationship)
    fun remove self relation = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> I) remove_ (self & relation)
  end
