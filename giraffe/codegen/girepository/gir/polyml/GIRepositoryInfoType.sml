structure GIRepositoryInfoType :>
  G_I_REPOSITORY_INFO_TYPE
    where type 'a baseinfoclass_t           = 'a GIRepositoryBaseInfoClass.t
    where type 'a registeredtypeinfoclass_t = 'a GIRepositoryRegisteredTypeInfoClass.t
    where type 'a callableinfoclass_t       = 'a GIRepositoryCallableInfoClass.t
    where type 'a functioninfoclass_t       = 'a GIRepositoryFunctionInfoClass.t
    where type 'a structinfoclass_t         = 'a GIRepositoryStructInfoClass.t
    where type 'a enuminfoclass_t           = 'a GIRepositoryEnumInfoClass.t
    where type 'a objectinfoclass_t         = 'a GIRepositoryObjectInfoClass.t
    where type 'a interfaceinfoclass_t      = 'a GIRepositoryInterfaceInfoClass.t
    where type 'a aliasinfoclass_t          = 'a GIRepositoryAliasInfoClass.t
    where type 'a constantinfoclass_t       = 'a GIRepositoryConstantInfoClass.t
    where type 'a unioninfoclass_t          = 'a GIRepositoryUnionInfoClass.t
    where type 'a valueinfoclass_t          = 'a GIRepositoryValueInfoClass.t
    where type 'a signalinfoclass_t         = 'a GIRepositorySignalInfoClass.t
    where type 'a vfuncinfoclass_t          = 'a GIRepositoryVFuncInfoClass.t
    where type 'a propertyinfoclass_t       = 'a GIRepositoryPropertyInfoClass.t
    where type 'a fieldinfoclass_t          = 'a GIRepositoryFieldInfoClass.t
    where type 'a arginfoclass_t            = 'a GIRepositoryArgInfoClass.t
    where type 'a typeinfoclass_t           = 'a GIRepositoryTypeInfoClass.t =
  struct
    type 'a baseinfoclass_t           = 'a GIRepositoryBaseInfoClass.t
    type 'a registeredtypeinfoclass_t = 'a GIRepositoryRegisteredTypeInfoClass.t
    type 'a callableinfoclass_t       = 'a GIRepositoryCallableInfoClass.t
    type 'a functioninfoclass_t       = 'a GIRepositoryFunctionInfoClass.t
    type 'a structinfoclass_t         = 'a GIRepositoryStructInfoClass.t
    type 'a enuminfoclass_t           = 'a GIRepositoryEnumInfoClass.t
    type 'a objectinfoclass_t         = 'a GIRepositoryObjectInfoClass.t
    type 'a interfaceinfoclass_t      = 'a GIRepositoryInterfaceInfoClass.t
    type 'a aliasinfoclass_t          = 'a GIRepositoryAliasInfoClass.t
    type 'a constantinfoclass_t       = 'a GIRepositoryConstantInfoClass.t
    type 'a unioninfoclass_t          = 'a GIRepositoryUnionInfoClass.t
    type 'a valueinfoclass_t          = 'a GIRepositoryValueInfoClass.t
    type 'a signalinfoclass_t         = 'a GIRepositorySignalInfoClass.t
    type 'a vfuncinfoclass_t          = 'a GIRepositoryVFuncInfoClass.t
    type 'a propertyinfoclass_t       = 'a GIRepositoryPropertyInfoClass.t
    type 'a fieldinfoclass_t          = 'a GIRepositoryFieldInfoClass.t
    type 'a arginfoclass_t            = 'a GIRepositoryArgInfoClass.t
    type 'a typeinfoclass_t           = 'a GIRepositoryTypeInfoClass.t

    datatype t =
      INVALID 
    | FUNCTION  of base functioninfoclass_t
    | CALLBACK  of base callableinfoclass_t
    | STRUCT    of base structinfoclass_t
    | BOXED     of base registeredtypeinfoclass_t
    | ENUM      of base enuminfoclass_t
    | FLAGS     of base enuminfoclass_t
    | OBJECT    of base objectinfoclass_t
    | INTERFACE of base interfaceinfoclass_t
    | ALIAS     of base aliasinfoclass_t
    | CONSTANT  of base constantinfoclass_t
    | INVALID_0
    | UNION     of base unioninfoclass_t
    | VALUE     of base valueinfoclass_t
    | SIGNAL    of base signalinfoclass_t
    | VFUNC     of base vfuncinfoclass_t
    | PROPERTY  of base propertyinfoclass_t
    | FIELD     of base fieldinfoclass_t
    | ARG       of base arginfoclass_t
    | TYPE      of base typeinfoclass_t
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
