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
    local
      open PolyMLFFI
    in
      val getType_ =
        call
          (load_sym libgirepository "g_base_info_get_type")
          (GIRepositoryBaseInfoClass.PolyML.PTR --> FFI.PolyML.Int32.VAL);
    end


    type 'a baseinfoclass_t           = 'a GIRepositoryBaseInfoClass.t
    type 'a registeredtypeinfoclass_t = 'a GIRepositoryRegisteredTypeInfoClass.t
    type 'a callableinfoclass_t       = 'a GIRepositoryCallableInfoClass.t
    type 'a functioninfoclass_t       = 'a GIRepositoryFunctionInfoClass.t
    type 'a structinfoclass_t         = 'a GIRepositoryStructInfoClass.t
    type 'a enuminfoclass_t           = 'a GIRepositoryEnumInfoClass.t
    type 'a objectinfoclass_t         = 'a GIRepositoryObjectInfoClass.t
    type 'a interfaceinfoclass_t      = 'a GIRepositoryInterfaceInfoClass.t
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

    local
      val table : (GIRepositoryBaseInfoClass.C.notnull GIRepositoryBaseInfoClass.C.p -> t) vector =
        Vector.fromList [
          K INVALID,
          FUNCTION    o GIRepositoryFunctionInfoClass.C.fromPtr false,
          CALLBACK    o GIRepositoryCallableInfoClass.C.fromPtr false,
          STRUCT      o GIRepositoryStructInfoClass.C.fromPtr false,
          BOXED       o GIRepositoryRegisteredTypeInfoClass.C.fromPtr false,
          ENUM        o GIRepositoryEnumInfoClass.C.fromPtr false,
          FLAGS       o GIRepositoryEnumInfoClass.C.fromPtr false,
          OBJECT      o GIRepositoryObjectInfoClass.C.fromPtr false,
          INTERFACE   o GIRepositoryInterfaceInfoClass.C.fromPtr false,
          CONSTANT    o GIRepositoryConstantInfoClass.C.fromPtr false,
          K INVALID_0,
          UNION       o GIRepositoryUnionInfoClass.C.fromPtr false,
          VALUE       o GIRepositoryValueInfoClass.C.fromPtr false,
          SIGNAL      o GIRepositorySignalInfoClass.C.fromPtr false,
          VFUNC       o GIRepositoryVFuncInfoClass.C.fromPtr false,
          PROPERTY    o GIRepositoryPropertyInfoClass.C.fromPtr false,
          FIELD       o GIRepositoryFieldInfoClass.C.fromPtr false,
          ARG         o GIRepositoryArgInfoClass.C.fromPtr false,
          TYPE        o GIRepositoryTypeInfoClass.C.fromPtr false,
          K UNRESOLVED
        ]
    in
      val getType : 'a baseinfoclass_t -> t =
        fn info =>
          GIRepositoryBaseInfoClass.C.withPtr
            (fn ptr => Vector.sub (table, getType_ ptr) ptr)
            info
            handle
              Subscript => INVALID
    end
  end
