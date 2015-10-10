structure GIRepositoryUnionInfo :>
  G_I_REPOSITORY_UNION_INFO
    where type 'a class_t = 'a GIRepositoryUnionInfoClass.t
    where type 'a fieldinfoclass_t = 'a GIRepositoryFieldInfoClass.t
    where type 'a functioninfoclass_t = 'a GIRepositoryFunctionInfoClass.t =
  struct
    fun fromBase f = (I && f) o GIRepositoryBaseInfoClass.Obj.unpack
    fun fromRegisteredTypeInfo f =
      (I && f) o GIRepositoryRegisteredTypeInfoClass.Obj.unpack
    fun fromUnion f = (I && f) o GIRepositoryUnionInfoClass.Obj.unpack

    fun toBase f = GIRepositoryBaseInfoClass.Obj.pack o (I && f)
    fun toCallable f = GIRepositoryCallableInfoClass.Obj.pack o (I && f)
    fun toFunction f = GIRepositoryFunctionInfoClass.Obj.pack o (I && f)
    fun toField f = GIRepositoryFieldInfoClass.Obj.pack o (I && f)


    type 'a class_t = 'a GIRepositoryUnionInfoClass.t
    type 'a fieldinfoclass_t = 'a GIRepositoryFieldInfoClass.t
    type 'a functioninfoclass_t = 'a GIRepositoryFunctionInfoClass.t
    type 'a typeinfoclass_t = 'a GIRepositoryTypeInfoClass.t
    type 'a constantinfoclass_t = 'a GIRepositoryConstantInfoClass.t


    fun getNFields info =
      let
        val _ & _ & {field, ...} & _ =
          (fromBase o fromRegisteredTypeInfo o fromUnion) I info
      in
        List.length field
      end

    fun getField info n =
      let
        val _ & _ & {field, ...} & _ =
          (fromBase o fromRegisteredTypeInfo o fromUnion) I info
        val base = List.nth (field, n)
        val Info.BASE (ref {instance, ...}) = base
      in
        case instance of
          Info.FIELD x => ((toBase o toField) I (base & x))
        | _            => raise Fail "internal error: expected FIELD info"
      end

    fun getNMethods info =
      let
        val _ & _ & {method, ...} & _ =
          (fromBase o fromRegisteredTypeInfo o fromUnion) I info
      in
        List.length method
      end

    fun getMethod info n =
      let
        val _ & _ & {method, ...} & _ =
          (fromBase o fromRegisteredTypeInfo o fromUnion) I info
        val base = List.nth (method, n)
        val Info.BASE (ref {instance, ...}) = base
      in
        case instance of
          Info.FUNCTION x => ((toBase o toCallable o toFunction) I (base & x))
        | _               => raise Fail "internal error: expected FUNCTION info"
      end

    fun isDiscriminated _ = false

    fun getDiscriminatorOffset _ =
      raise Fail "getDiscriminatorOffset not supported"

    fun getDiscriminatorType _ = raise Fail "getDiscriminatorType not supported"

    fun getDiscriminator _ = raise Fail "getDiscriminator not supported"

    fun findMethod _ = raise Fail "findMethod not supported"
  end
