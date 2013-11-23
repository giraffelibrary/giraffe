structure GIRepositoryObjectInfo :>
  G_I_REPOSITORY_OBJECT_INFO
    where type 'a class_t = 'a GIRepositoryObjectInfoClass.t
    where type 'a baseinfoclass_t = 'a GIRepositoryBaseInfoClass.t
    where type 'a interfaceinfoclass_t = 'a GIRepositoryInterfaceInfoClass.t
    where type 'a fieldinfoclass_t = 'a GIRepositoryFieldInfoClass.t
    where type 'a propertyinfoclass_t = 'a GIRepositoryPropertyInfoClass.t
    where type 'a functioninfoclass_t = 'a GIRepositoryFunctionInfoClass.t
    where type 'a signalinfoclass_t = 'a GIRepositorySignalInfoClass.t
    where type 'a vfuncinfoclass_t = 'a GIRepositoryVFuncInfoClass.t
    where type 'a constantinfoclass_t = 'a GIRepositoryConstantInfoClass.t
    where type 'a structinfoclass_t = 'a GIRepositoryStructInfoClass.t =
  struct
    fun fromBase f = (I && f) o GIRepositoryBaseInfoClass.Obj.unpack
    fun fromRegisteredType f =
      (I && f) o GIRepositoryRegisteredTypeInfoClass.Obj.unpack
    fun fromObject f = (I && f) o GIRepositoryObjectInfoClass.Obj.unpack

    fun toBase f = GIRepositoryBaseInfoClass.Obj.pack o (I && f)
    fun toCallable f = GIRepositoryCallableInfoClass.Obj.pack o (I && f)
    fun toFunction f = GIRepositoryFunctionInfoClass.Obj.pack o (I && f)
    fun toVFunc f = GIRepositoryVFuncInfoClass.Obj.pack o (I && f)
    fun toRegisteredType f =
      GIRepositoryRegisteredTypeInfoClass.Obj.pack o (I && f)
    fun toObject f = GIRepositoryObjectInfoClass.Obj.pack o (I && f)
    fun toStruct f = GIRepositoryStructInfoClass.Obj.pack o (I && f)
    fun toInterface f = GIRepositoryInterfaceInfoClass.Obj.pack o (I && f)
    fun toConstant f = GIRepositoryConstantInfoClass.Obj.pack o (I && f)
    fun toField f = GIRepositoryFieldInfoClass.Obj.pack o (I && f)
    fun toProperty f = GIRepositoryPropertyInfoClass.Obj.pack o (I && f)
    fun toSignal f = GIRepositorySignalInfoClass.Obj.pack o (I && f)


    type 'a class_t = 'a GIRepositoryObjectInfoClass.t
    type 'a baseinfoclass_t = 'a GIRepositoryBaseInfoClass.t
    type 'a interfaceinfoclass_t = 'a GIRepositoryInterfaceInfoClass.t
    type 'a fieldinfoclass_t = 'a GIRepositoryFieldInfoClass.t
    type 'a propertyinfoclass_t = 'a GIRepositoryPropertyInfoClass.t
    type 'a functioninfoclass_t = 'a GIRepositoryFunctionInfoClass.t
    type 'a signalinfoclass_t = 'a GIRepositorySignalInfoClass.t
    type 'a vfuncinfoclass_t = 'a GIRepositoryVFuncInfoClass.t
    type 'a constantinfoclass_t = 'a GIRepositoryConstantInfoClass.t
    type 'a structinfoclass_t = 'a GIRepositoryStructInfoClass.t


    fun getTypeName info =
      let
        val _ & _ & {typeName, ...} & _ =
          (fromBase o fromRegisteredType o fromObject) I info
      in
        typeName
      end

    fun getTypeInit info =
      let
        val _ & _ & {getType, ...} & _ =
          (fromBase o fromRegisteredType o fromObject) I info
      in
        getType
      end

    fun getAbstract info =
      let
        val _ & _ & {abstract, ...} & _ =
          (fromBase o fromRegisteredType o fromObject) I info
      in
        abstract
      end

    fun getFundamental info =
      let
        val _ & _ & {fundamental, ...} & _ =
          (fromBase o fromRegisteredType o fromObject) I info
      in
        fundamental
      end

    fun getParent info =
      let
        val _ & _ & {parent, ...} & _ =
          (fromBase o fromRegisteredType o fromObject) I info
      in
        case parent of
          SOME base => SOME
            let
              val Info.BASE (ref {instance, ...}) = base
            in
              case instance of
                Info.OBJECT x => ((toBase o toRegisteredType o toObject) I (base & x))
              | _             => raise Fail "internal error: expected OBJECT info"
            end
        | NONE      => NONE
      end

    fun getNInterfaces info =
      let
        val _ & _ & {implements, ...} & _ =
          (fromBase o fromRegisteredType o fromObject) I info
      in
        List.length implements
      end

    fun getInterface info n =
      let
        val _ & _ & {implements, ...} & _ =
          (fromBase o fromRegisteredType o fromObject) I info
        val base = List.nth (implements, n)
        val Info.BASE (ref {instance, ...}) = base
      in
        case instance of
          Info.INTERFACE x => ((toBase o toRegisteredType o toInterface) I (base & x))
        | _                => raise Fail "internal error: expected INTERFACE info"
      end

    fun getNFields info =
      let
        val _ & _ & {field, ...} & _ =
          (fromBase o fromRegisteredType o fromObject) I info
      in
        List.length field
      end

    fun getField info n =
      let
        val _ & _ & {field, ...} & _ =
          (fromBase o fromRegisteredType o fromObject) I info
        val base = List.nth (field, n)
        val Info.BASE (ref {instance, ...}) = base
      in
        case instance of
          Info.FIELD x => ((toBase o toField) I (base & x))
        | _            => raise Fail "internal error: expected FIELD info"
      end

    fun getNProperties info =
      let
        val _ & _ & {property, ...} & _ =
          (fromBase o fromRegisteredType o fromObject) I info
      in
        List.length property
      end

    fun getProperty info n =
      let
        val _ & _ & {property, ...} & _ =
          (fromBase o fromRegisteredType o fromObject) I info
        val base = List.nth (property, n)
        val Info.BASE (ref {instance, ...}) = base
      in
        case instance of
          Info.PROPERTY x => ((toBase o toProperty) I (base & x))
        | _               => raise Fail "internal error: expected PROPERTY info"
      end

    fun getNMethods info =
      let
        val _ & _ & {method, ...} & _ =
          (fromBase o fromRegisteredType o fromObject) I info
      in
        List.length method
      end

    fun getMethod info n =
      let
        val _ & _ & {method, ...} & _ =
          (fromBase o fromRegisteredType o fromObject) I info
        val base = List.nth (method, n)
        val Info.BASE (ref {instance, ...}) = base
      in
        case instance of
          Info.FUNCTION x => ((toBase o toCallable o toFunction) I (base & x))
        | _               => raise Fail "internal error: expected FUNCTION info"
      end

    fun findMethod _ = raise Fail "findMethod not supported"

    fun getNSignals info =
      let
        val _ & _ & {signal, ...} & _ =
          (fromBase o fromRegisteredType o fromObject) I info
      in
        List.length signal
      end

    fun getSignal info n =
      let
        val _ & _ & {signal, ...} & _ =
          (fromBase o fromRegisteredType o fromObject) I info
        val base = List.nth (signal, n)
        val Info.BASE (ref {instance, ...}) = base
      in
        case instance of
          Info.SIGNAL x => ((toBase o toCallable o toSignal) I (base & x))
        | _             => raise Fail "internal error: expected SIGNAL info"
      end

    fun getNVfuncs info =
      let
        val _ & _ & {vfunc, ...} & _ =
          (fromBase o fromRegisteredType o fromObject) I info
      in
        List.length vfunc
      end

    fun getVfunc info n =
      let
        val _ & _ & {vfunc, ...} & _ =
          (fromBase o fromRegisteredType o fromObject) I info
        val base = List.nth (vfunc, n)
        val Info.BASE (ref {instance, ...}) = base
      in
        case instance of
          Info.VFUNC x => ((toBase o toCallable o toVFunc) I (base & x))
        | _            => raise Fail "internal error: expected VFUNC info"
      end

    fun getNConstants info =
      let
        val _ & _ & {constant, ...} & _ =
          (fromBase o fromRegisteredType o fromObject) I info
      in
        List.length constant
      end

    fun getConstant info n =
      let
        val _ & _ & {constant, ...} & _ =
          (fromBase o fromRegisteredType o fromObject) I info
        val base = List.nth (constant, n)
        val Info.BASE (ref {instance, ...}) = base
      in
        case instance of
          Info.CONSTANT x => ((toBase o toConstant) I (base & x))
        | _               => raise Fail "internal error: expected CONSTANT info"
      end

    fun getClassStruct info =
      let
        val _ & _ & {classStruct, ...} & _ =
          (fromBase o fromRegisteredType o fromObject) I info
      in
        case classStruct of
          SOME base => SOME
            let
              val Info.BASE (ref {instance, ...}) = base
            in
              case instance of
                Info.STRUCT x => ((toBase o toRegisteredType o toStruct) I (base & x))
              | _             => raise Fail "internal error: expected STRUCT info"
            end
        | NONE      => NONE
      end

    fun findVfunc _ = raise Fail "findVfunc not supported"
  end
