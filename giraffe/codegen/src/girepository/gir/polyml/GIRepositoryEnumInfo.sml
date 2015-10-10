structure GIRepositoryEnumInfo :>
  G_I_REPOSITORY_ENUM_INFO
    where type 'a class_t = 'a GIRepositoryEnumInfoClass.t
    where type 'a valueinfoclass_t = 'a GIRepositoryValueInfoClass.t
    where type 'a functioninfoclass_t = 'a GIRepositoryFunctionInfoClass.t
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


    type 'a class_t = 'a GIRepositoryEnumInfoClass.t
    type 'a valueinfoclass_t = 'a GIRepositoryValueInfoClass.t
    type 'a functioninfoclass_t = 'a GIRepositoryFunctionInfoClass.t
    type typetag_t = GIRepositoryTypeTag.t


    fun getNValues info =
      let
        val _ & _ & {member, ...} & _ =
          (fromBase o fromRegisteredTypeInfo o fromEnum) I info
      in
        List.length member
      end

    fun getValue info n =
      let
        val _ & _ & {member, ...} & _ =
          (fromBase o fromRegisteredTypeInfo o fromEnum) I info
        val base = List.nth (member, n)
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
        List.length method
      end

    fun getMethod info n =
      let
        val _ & _ & {method, ...} & _ =
          (fromBase o fromRegisteredTypeInfo o fromEnum) I info
        val base = List.nth (method, n)
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
