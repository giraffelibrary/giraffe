structure GIRepositoryInterfaceInfo :>
  G_I_REPOSITORY_INTERFACE_INFO
    where type 'a class_t = 'a GIRepositoryInterfaceInfoClass.t
    where type 'a baseinfoclass_t = 'a GIRepositoryBaseInfoClass.t
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
    fun fromInterface f = (I && f) o GIRepositoryInterfaceInfoClass.Obj.unpack

    fun toBase f = GIRepositoryBaseInfoClass.Obj.pack o (I && f)
    fun toCallable f = GIRepositoryCallableInfoClass.Obj.pack o (I && f)
    fun toFunction f = GIRepositoryFunctionInfoClass.Obj.pack o (I && f)
    fun toVFunc f = GIRepositoryVFuncInfoClass.Obj.pack o (I && f)
    fun toRegisteredType f =
      GIRepositoryRegisteredTypeInfoClass.Obj.pack o (I && f)
    fun toStruct f = GIRepositoryStructInfoClass.Obj.pack o (I && f)
    fun toProperty f = GIRepositoryPropertyInfoClass.Obj.pack o (I && f)
    fun toSignal f = GIRepositorySignalInfoClass.Obj.pack o (I && f)
    fun toConstant f = GIRepositoryConstantInfoClass.Obj.pack o (I && f)


    type 'a class_t = 'a GIRepositoryInterfaceInfoClass.t
    type 'a baseinfoclass_t = 'a GIRepositoryBaseInfoClass.t
    type 'a propertyinfoclass_t = 'a GIRepositoryPropertyInfoClass.t
    type 'a functioninfoclass_t = 'a GIRepositoryFunctionInfoClass.t
    type 'a signalinfoclass_t = 'a GIRepositorySignalInfoClass.t
    type 'a vfuncinfoclass_t = 'a GIRepositoryVFuncInfoClass.t
    type 'a constantinfoclass_t = 'a GIRepositoryConstantInfoClass.t
    type 'a structinfoclass_t = 'a GIRepositoryStructInfoClass.t


    fun getNPrerequisites info =
      let
        val _ & _ & {prerequisite, ...} & _ =
          (fromBase o fromRegisteredType o fromInterface) I info
      in
        List.length prerequisite
      end

    fun getPrerequisite info n =
      let
        val _ & _ & {prerequisite, ...} & _ =
          (fromBase o fromRegisteredType o fromInterface) I info
        val base = List.nth (prerequisite, n)
      in
        toBase I (base & ())
      end

    fun getNProperties info =
      let
        val _ & _ & {property, ...} & _ =
          (fromBase o fromRegisteredType o fromInterface) I info
      in
        List.length property
      end

    fun getProperty info n =
      let
        val _ & _ & {property, ...} & _ =
          (fromBase o fromRegisteredType o fromInterface) I info
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
          (fromBase o fromRegisteredType o fromInterface) I info
      in
        List.length method
      end

    fun getMethod info n =
      let
        val _ & _ & {method, ...} & _ =
          (fromBase o fromRegisteredType o fromInterface) I info
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
          (fromBase o fromRegisteredType o fromInterface) I info
      in
        List.length signal
      end

    fun getSignal info n =
      let
        val _ & _ & {signal, ...} & _ =
          (fromBase o fromRegisteredType o fromInterface) I info
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
          (fromBase o fromRegisteredType o fromInterface) I info
      in
        List.length vfunc
      end

    fun getVfunc info n =
      let
        val _ & _ & {vfunc, ...} & _ =
          (fromBase o fromRegisteredType o fromInterface) I info
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
          (fromBase o fromRegisteredType o fromInterface) I info
      in
        List.length constant
      end

    fun getConstant info n =
      let
        val _ & _ & {constant, ...} & _ =
          (fromBase o fromRegisteredType o fromInterface) I info
        val base = List.nth (constant, n)
        val Info.BASE (ref {instance, ...}) = base
      in
        case instance of
          Info.CONSTANT x => ((toBase o toConstant) I (base & x))
        | _               => raise Fail "internal error: expected CONSTANT info"
      end

    fun getIfaceStruct info =
      let
        val _ & _ & {ifaceStruct, ...} & _ =
          (fromBase o fromRegisteredType o fromInterface) I info
      in
        case ifaceStruct of
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
