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
    local
      open PolyMLFFI
    in
      val getType_ =
        call
          (load_sym libgirepository "g_base_info_get_type")
          (GIRepositoryBaseInfoClass.PolyML.cPtr --> FFI.Int32.PolyML.cVal);
    end


    type 'a baseinfo_class           = 'a GIRepositoryBaseInfoClass.class
    type 'a registeredtypeinfo_class = 'a GIRepositoryRegisteredTypeInfoClass.class
    type 'a callableinfo_class       = 'a GIRepositoryCallableInfoClass.class
    type 'a functioninfo_class       = 'a GIRepositoryFunctionInfoClass.class
    type 'a structinfo_class         = 'a GIRepositoryStructInfoClass.class
    type 'a enuminfo_class           = 'a GIRepositoryEnumInfoClass.class
    type 'a objectinfo_class         = 'a GIRepositoryObjectInfoClass.class
    type 'a interfaceinfo_class      = 'a GIRepositoryInterfaceInfoClass.class
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
      val getType : 'a baseinfo_class -> t =
        fn info =>
          GIRepositoryBaseInfoClass.C.withPtr
            (fn ptr => Vector.sub (table, FFI.Int32.C.fromVal (getType_ ptr)) ptr)
            info
            handle
              Subscript => INVALID
    end
  end
