structure GIRepositoryStructInfo :>
  G_I_REPOSITORY_STRUCT_INFO
    where type 'a class = 'a GIRepositoryStructInfoClass.class
    where type 'a fieldinfo_class = 'a GIRepositoryFieldInfoClass.class
    where type 'a functioninfo_class = 'a GIRepositoryFunctionInfoClass.class =
  struct
    fun fromBase f = (I && f) o GIRepositoryBaseInfoClass.Obj.unpack
    fun fromRegisteredTypeInfo f =
      (I && f) o GIRepositoryRegisteredTypeInfoClass.Obj.unpack
    fun fromStruct f = (I && f) o GIRepositoryStructInfoClass.Obj.unpack

    fun toBase f = GIRepositoryBaseInfoClass.Obj.pack o (I && f)
    fun toCallable f = GIRepositoryCallableInfoClass.Obj.pack o (I && f)
    fun toFunction f = GIRepositoryFunctionInfoClass.Obj.pack o (I && f)
    fun toField f = GIRepositoryFieldInfoClass.Obj.pack o (I && f)


    type 'a class = 'a GIRepositoryStructInfoClass.class
    type 'a fieldinfo_class = 'a GIRepositoryFieldInfoClass.class
    type 'a functioninfo_class = 'a GIRepositoryFunctionInfoClass.class


    fun getNFields info =
      let
        val _ & _ & {field, ...} & _ =
          (fromBase o fromRegisteredTypeInfo o fromStruct) I info
      in
        LargeInt.fromInt (List.length field)
      end

    fun getField info n =
      let
        val _ & _ & {field, ...} & _ =
          (fromBase o fromRegisteredTypeInfo o fromStruct) I info
        val base = List.nth (field, LargeInt.toInt n)
        val Info.BASE (ref {instance, ...}) = base
      in
        case instance of
          Info.FIELD x => ((toBase o toField) I (base & x))
        | _            => raise Fail "internal error: expected FIELD info"
      end

    fun getNMethods info =
      let
        val _ & _ & {method, ...} & _ =
          (fromBase o fromRegisteredTypeInfo o fromStruct) I info
      in
        LargeInt.fromInt (List.length method)
      end

    fun getMethod info n =
      let
        val _ & _ & {method, ...} & _ =
          (fromBase o fromRegisteredTypeInfo o fromStruct) I info
        val base = List.nth (method, LargeInt.toInt n)
        val Info.BASE (ref {instance, ...}) = base
      in
        case instance of
          Info.FUNCTION x => ((toBase o toCallable o toFunction) I (base & x))
        | _               => raise Fail "internal error: expected FUNCTION info"
      end

    fun findMethod _ = raise Fail "findMethod not supported"

    fun getCName info =
      let
        val _ & _ & {cType, ...} & _ =
          (fromBase o fromRegisteredTypeInfo o fromStruct) I info
      in
        cType
      end

    fun isGtypeStruct info =
      let
        val _ & _ & {isGTypeStruct, ...} & _ =
          (fromBase o fromRegisteredTypeInfo o fromStruct) I info
      in
        isGTypeStruct
      end

    fun isForeign info =
      let
        val _ & _ & {isForeign, ...} & _ =
          (fromBase o fromRegisteredTypeInfo o fromStruct) I info
      in
        isForeign
      end
  end
