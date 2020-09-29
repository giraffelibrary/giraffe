structure GIRepositoryInfoType :>
  G_I_REPOSITORY_INFO_TYPE
    where type 'a baseinfo_class           = 'a GIRepositoryBaseInfoClass.class
    where type 'a registeredtypeinfo_class = 'a GIRepositoryRegisteredTypeInfoClass.class
    where type 'a callableinfo_class       = 'a GIRepositoryCallableInfoClass.class
    where type 'a functioninfo_class       = 'a GIRepositoryFunctionInfoClass.class
    where type 'a structinfo_class         = 'a GIRepositoryStructInfoClass.class
    where type 'a enuminfo_class           = 'a GIRepositoryEnumInfoClass.class
    where type 'a objectinfo_class         = 'a GIRepositoryObjectInfoClass.class
    where type 'a interfaceinfo_class      = 'a GIRepositoryInterfaceInfoClass.class
    where type 'a aliasinfo_class          = 'a GIRepositoryAliasInfoClass.class
    where type 'a constantinfo_class       = 'a GIRepositoryConstantInfoClass.class
    where type 'a unioninfo_class          = 'a GIRepositoryUnionInfoClass.class
    where type 'a valueinfo_class          = 'a GIRepositoryValueInfoClass.class
    where type 'a signalinfo_class         = 'a GIRepositorySignalInfoClass.class
    where type 'a vfuncinfo_class          = 'a GIRepositoryVFuncInfoClass.class
    where type 'a propertyinfo_class       = 'a GIRepositoryPropertyInfoClass.class
    where type 'a fieldinfo_class          = 'a GIRepositoryFieldInfoClass.class
    where type 'a arginfo_class            = 'a GIRepositoryArgInfoClass.class
    where type 'a typeinfo_class           = 'a GIRepositoryTypeInfoClass.class =
  struct
    type 'a baseinfo_class           = 'a GIRepositoryBaseInfoClass.class
    type 'a registeredtypeinfo_class = 'a GIRepositoryRegisteredTypeInfoClass.class
    type 'a callableinfo_class       = 'a GIRepositoryCallableInfoClass.class
    type 'a functioninfo_class       = 'a GIRepositoryFunctionInfoClass.class
    type 'a structinfo_class         = 'a GIRepositoryStructInfoClass.class
    type 'a enuminfo_class           = 'a GIRepositoryEnumInfoClass.class
    type 'a objectinfo_class         = 'a GIRepositoryObjectInfoClass.class
    type 'a interfaceinfo_class      = 'a GIRepositoryInterfaceInfoClass.class
    type 'a aliasinfo_class          = 'a GIRepositoryAliasInfoClass.class
    type 'a constantinfo_class       = 'a GIRepositoryConstantInfoClass.class
    type 'a unioninfo_class          = 'a GIRepositoryUnionInfoClass.class
    type 'a valueinfo_class          = 'a GIRepositoryValueInfoClass.class
    type 'a signalinfo_class         = 'a GIRepositorySignalInfoClass.class
    type 'a vfuncinfo_class          = 'a GIRepositoryVFuncInfoClass.class
    type 'a propertyinfo_class       = 'a GIRepositoryPropertyInfoClass.class
    type 'a fieldinfo_class          = 'a GIRepositoryFieldInfoClass.class
    type 'a arginfo_class            = 'a GIRepositoryArgInfoClass.class
    type 'a typeinfo_class           = 'a GIRepositoryTypeInfoClass.class

    datatype t =
      INVALID 
    | FUNCTION  of base functioninfo_class
    | CALLBACK  of base callableinfo_class
    | STRUCT    of base structinfo_class
    | BOXED     of base registeredtypeinfo_class
    | ENUM      of base enuminfo_class
    | FLAGS     of base enuminfo_class
    | OBJECT    of base objectinfo_class
    | INTERFACE of base interfaceinfo_class
    | ALIAS     of base aliasinfo_class
    | CONSTANT  of base constantinfo_class
    | INVALID_0
    | UNION     of base unioninfo_class
    | VALUE     of base valueinfo_class
    | SIGNAL    of base signalinfo_class
    | VFUNC     of base vfuncinfo_class
    | PROPERTY  of base propertyinfo_class
    | FIELD     of base fieldinfo_class
    | ARG       of base arginfo_class
    | TYPE      of base typeinfo_class
    | UNRESOLVED

    val fromBase           = GIRepositoryBaseInfoClass.Obj.unpack

    fun toBase f           = GIRepositoryBaseInfoClass.Obj.pack o (I && f)
    fun toCallable f       = GIRepositoryCallableInfoClass.Obj.pack o (I && f)
    fun toRegisteredType f = GIRepositoryRegisteredTypeInfoClass.Obj.pack o (I && f)
    fun toFunction f       = GIRepositoryFunctionInfoClass.Obj.pack o (I && f)
    fun toStruct f         = GIRepositoryStructInfoClass.Obj.pack o (I && f)
    fun toEnum f           = GIRepositoryEnumInfoClass.Obj.pack o (I && f)
    fun toObject f         = GIRepositoryObjectInfoClass.Obj.pack o (I && f)
    fun toInterface f      = GIRepositoryInterfaceInfoClass.Obj.pack o (I && f)
    fun toAlias f          = GIRepositoryAliasInfoClass.Obj.pack o (I && f)
    fun toConstant f       = GIRepositoryConstantInfoClass.Obj.pack o (I && f)
    fun toUnion f          = GIRepositoryUnionInfoClass.Obj.pack o (I && f)
    fun toValue f          = GIRepositoryValueInfoClass.Obj.pack o (I && f)
    fun toSignal f         = GIRepositorySignalInfoClass.Obj.pack o (I && f)
    fun toVFunc f          = GIRepositoryVFuncInfoClass.Obj.pack o (I && f)
    fun toProperty f       = GIRepositoryPropertyInfoClass.Obj.pack o (I && f)
    fun toField f          = GIRepositoryFieldInfoClass.Obj.pack o (I && f)
    fun toArg f            = GIRepositoryArgInfoClass.Obj.pack o (I && f)
    fun toType f           = GIRepositoryTypeInfoClass.Obj.pack o (I && f)

    fun getType info =
      let
        val (baseInfo as Info.BASE (ref {instance, ...})) & _ = fromBase info
      in
        case instance of
          Info.INVALID     => INVALID
        | Info.FUNCTION x  => FUNCTION ((toBase o toCallable o toFunction) I (baseInfo & x))
        | Info.CALLBACK x  => CALLBACK ((toBase o toCallable) I (baseInfo & x))
        | Info.STRUCT x    => STRUCT ((toBase o toRegisteredType o toStruct) I (baseInfo & x))
        | Info.BOXED x     => BOXED ((toBase o toRegisteredType) I (baseInfo & x))
        | Info.ENUM x      => ENUM ((toBase o toRegisteredType o toEnum) I (baseInfo & x))
        | Info.FLAGS x     => FLAGS ((toBase o toRegisteredType o toEnum) I (baseInfo & x))
        | Info.OBJECT x    => OBJECT ((toBase o toRegisteredType o toObject) I (baseInfo & x))
        | Info.INTERFACE x => INTERFACE ((toBase o toRegisteredType o toInterface) I (baseInfo & x))
        | Info.ALIAS x     => ALIAS ((toBase o toAlias) I (baseInfo & x))
        | Info.CONSTANT x  => CONSTANT ((toBase o toConstant) I (baseInfo & x))
        | Info.UNION x     => UNION ((toBase o toRegisteredType o toUnion) I (baseInfo & x))
        | Info.VALUE x     => VALUE ((toBase o toValue) I (baseInfo & x))
        | Info.SIGNAL x    => SIGNAL ((toBase o toCallable o toSignal) I (baseInfo & x))
        | Info.VFUNC x     => VFUNC ((toBase o toCallable o toVFunc) I (baseInfo & x))
        | Info.PROPERTY x  => PROPERTY ((toBase o toProperty) I (baseInfo & x))
        | Info.FIELD x     => FIELD ((toBase o toField) I (baseInfo & x))
        | Info.ARG x       => ARG ((toBase o toArg) I (baseInfo & x))
        | Info.TYPE x      => TYPE ((toBase o toType) I (baseInfo & x))
        | _                => raise Fail "internal error: untranslated info"
      end
  end
