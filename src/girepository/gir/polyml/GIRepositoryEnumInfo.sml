structure GIRepositoryEnumInfo :>
  G_I_REPOSITORY_ENUM_INFO
    where type 'a class = 'a GIRepositoryEnumInfoClass.class
    where type 'a valueinfo_class = 'a GIRepositoryValueInfoClass.class
    where type 'a functioninfo_class = 'a GIRepositoryFunctionInfoClass.class
    where type typetag_t = GIRepositoryTypeTag.t =
  struct
    fun fromBase f = (I && f) o GIRepositoryBaseInfoClass.Obj.unpack
    fun fromRegisteredTypeInfo f =
      (I && f) o GIRepositoryRegisteredTypeInfoClass.Obj.unpack
    fun fromEnum f = (I && f) o GIRepositoryEnumInfoClass.Obj.unpack

    fun toBase f = GIRepositoryBaseInfoClass.Obj.pack o (I && f)
    fun toCallable f = GIRepositoryCallableInfoClass.Obj.pack o (I && f)
    fun toFunction f = GIRepositoryFunctionInfoClass.Obj.pack o (I && f)
    fun toValue f = GIRepositoryValueInfoClass.Obj.pack o (I && f)


    type 'a class = 'a GIRepositoryEnumInfoClass.class
    type 'a valueinfo_class = 'a GIRepositoryValueInfoClass.class
    type 'a functioninfo_class = 'a GIRepositoryFunctionInfoClass.class
    type typetag_t = GIRepositoryTypeTag.t


    fun getNValues info =
      let
        val _ & _ & {member, ...} & _ =
          (fromBase o fromRegisteredTypeInfo o fromEnum) I info
      in
        LargeInt.fromInt (List.length member)
      end

    fun getValue info n =
      let
        val _ & _ & {member, ...} & _ =
          (fromBase o fromRegisteredTypeInfo o fromEnum) I info
        val base = List.nth (member, LargeInt.toInt n)
        val Info.BASE (ref {instance, ...}) = base
      in
        case instance of
          Info.VALUE x => ((toBase o toValue) I (base & x))
        | _            => raise Fail "internal error: expected VALUE info"
      end

    fun getNMethods info =
      let
        val _ & _ & {method, ...} & _ =
          (fromBase o fromRegisteredTypeInfo o fromEnum) I info
      in
        LargeInt.fromInt (List.length method)
      end

    fun getMethod info n =
      let
        val _ & _ & {method, ...} & _ =
          (fromBase o fromRegisteredTypeInfo o fromEnum) I info
        val base = List.nth (method, LargeInt.toInt n)
        val Info.BASE (ref {instance, ...}) = base
      in
        case instance of
          Info.FUNCTION x => ((toBase o toCallable o toFunction) I (base & x))
        | _               => raise Fail "internal error: expected FUNCTION info"
      end

    fun getStorageType _ = raise Fail "getStorageType not supported"

    fun getErrorDomain info =
      let
        val _ & _ & {errorDomain, ...} & _ =
          (fromBase o fromRegisteredTypeInfo o fromEnum) I info
      in
        errorDomain
      end
  end
