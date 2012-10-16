structure AtkRelationSet :>
  ATK_RELATION_SET
    where type 'a class_t = 'a AtkRelationSetClass.t
    where type 'a objectclass_t = 'a AtkObjectClass.t
    where type relationtype_t = AtkRelationType.t
    where type 'a relationclass_t = 'a AtkRelationClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libatk "atk_relation_set_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val new_ = call (load_sym libatk "atk_relation_set_new") (FFI.PolyML.VOID --> GObjectObjectClass.PolyML.PTR)
      val add_ = call (load_sym libatk "atk_relation_set_add") (GObjectObjectClass.PolyML.PTR &&> GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val addRelationByType_ =
        call (load_sym libatk "atk_relation_set_add_relation_by_type")
          (
            GObjectObjectClass.PolyML.PTR
             &&> AtkRelationType.PolyML.VAL
             &&> GObjectObjectClass.PolyML.PTR
             --> FFI.PolyML.VOID
          )
      val contains_ = call (load_sym libatk "atk_relation_set_contains") (GObjectObjectClass.PolyML.PTR &&> AtkRelationType.PolyML.VAL --> FFI.PolyML.Bool.VAL)
      val getNRelations_ = call (load_sym libatk "atk_relation_set_get_n_relations") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.Int32.VAL)
      val getRelation_ = call (load_sym libatk "atk_relation_set_get_relation") (GObjectObjectClass.PolyML.PTR &&> FFI.PolyML.Int32.VAL --> GObjectObjectClass.PolyML.PTR)
      val getRelationByType_ = call (load_sym libatk "atk_relation_set_get_relation_by_type") (GObjectObjectClass.PolyML.PTR &&> AtkRelationType.PolyML.VAL --> GObjectObjectClass.PolyML.PTR)
      val remove_ = call (load_sym libatk "atk_relation_set_remove") (GObjectObjectClass.PolyML.PTR &&> GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
    end
    type 'a class_t = 'a AtkRelationSetClass.t
    type 'a objectclass_t = 'a AtkObjectClass.t
    type relationtype_t = AtkRelationType.t
    type 'a relationclass_t = 'a AtkRelationClass.t
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
    fun contains self relationship = (GObjectObjectClass.C.withPtr &&&> AtkRelationType.C.withVal ---> FFI.Bool.fromVal) contains_ (self & relationship)
    fun getNRelations self = (GObjectObjectClass.C.withPtr ---> FFI.Int32.fromVal) getNRelations_ self
    fun getRelation self i = (GObjectObjectClass.C.withPtr &&&> FFI.Int32.withVal ---> AtkRelationClass.C.fromPtr false) getRelation_ (self & i)
    fun getRelationByType self relationship = (GObjectObjectClass.C.withPtr &&&> AtkRelationType.C.withVal ---> AtkRelationClass.C.fromPtr false) getRelationByType_ (self & relationship)
    fun remove self relation = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> I) remove_ (self & relation)
  end
