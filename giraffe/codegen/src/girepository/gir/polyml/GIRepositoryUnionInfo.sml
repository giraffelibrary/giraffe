structure GIRepositoryUnionInfo :>
  G_I_REPOSITORY_UNION_INFO
    where type 'a class = 'a GIRepositoryUnionInfoClass.class
    where type 'a fieldinfo_class = 'a GIRepositoryFieldInfoClass.class
    where type 'a functioninfo_class = 'a GIRepositoryFunctionInfoClass.class =
  struct
    fun fromBase f = (I && f) o GIRepositoryBaseInfoClass.Obj.unpack
    fun fromRegisteredTypeInfo f =
      (I && f) o GIRepositoryRegisteredTypeInfoClass.Obj.unpack
    fun fromUnion f = (I && f) o GIRepositoryUnionInfoClass.Obj.unpack

    fun toBase f = GIRepositoryBaseInfoClass.Obj.pack o (I && f)
    fun toCallable f = GIRepositoryCallableInfoClass.Obj.pack o (I && f)
    fun toFunction f = GIRepositoryFunctionInfoClass.Obj.pack o (I && f)
    fun toField f = GIRepositoryFieldInfoClass.Obj.pack o (I && f)


    type 'a class = 'a GIRepositoryUnionInfoClass.class
    type 'a fieldinfo_class = 'a GIRepositoryFieldInfoClass.class
    type 'a functioninfo_class = 'a GIRepositoryFunctionInfoClass.class
    type 'a typeinfo_class = 'a GIRepositoryTypeInfoClass.class
    type 'a constantinfo_class = 'a GIRepositoryConstantInfoClass.class


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
