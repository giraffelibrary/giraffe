(* This structure defines the `compiled' representation of a GIR file. *)

structure Info =
  struct
    type valuedata =
      {
        value : LargeInt.int
      }

    type registeredtypedata =
      {
        typeName : string option,
        getType  : string option
      }

    type functiondata =
      {
        symbol : string,
        flags  : GIRepositoryFunctionInfoFlags.t
      }

    type vfuncdata =
      {
        flags : GIRepositoryVFuncInfoFlags.t
      }

    type signaldata =
      {
        flags           : GObjectSignalFlags.t,
        hasClassClosure : bool
      }

    datatype data =
      INVALID
    | FUNCTION  of (callabledata, (functiondata, unit) pair) pair
    | CALLBACK  of (callabledata, unit) pair
    | STRUCT    of (registeredtypedata, (structdata, unit) pair) pair
    | BOXED     of (registeredtypedata, unit) pair
    | ENUM      of (registeredtypedata, (enumdata, unit) pair) pair
    | FLAGS     of (registeredtypedata, (enumdata, unit) pair) pair
    | OBJECT    of (registeredtypedata, (objectdata, unit) pair) pair
    | INTERFACE of (registeredtypedata, (interfacedata, unit) pair) pair
    | ALIAS     of (aliasdata, unit) pair
    | CONSTANT  of (constantdata, unit) pair
    | UNION     of (registeredtypedata, (uniondata, unit) pair) pair
    | VALUE     of (valuedata, unit) pair
    | SIGNAL    of (callabledata, (signaldata, unit) pair) pair
    | VFUNC     of (callabledata, (vfuncdata, unit) pair) pair
    | PROPERTY  of (propertydata, unit) pair
    | FIELD     of (fielddata, unit) pair
    | ARG       of (argdata, unit) pair
    | TYPE      of (typedata, unit) pair
    | TRANSLATING
    | UNTRANSLATED

    and 'data basedata =
      BASE of
        {
          name       : string option,
          container  : data basedata option,
          typelib    : repodata,
          deprecated : bool,
          attributes : string ListDict.t,
          instance   : 'data
        }
          ref

    and typedata =
      TYPEDATA of
        {
          tag                 : GIRepositoryTypeTag.t,
          interface           : data basedata option,
          params              : data basedata list,
          ptrDepth            : int option,  (* NONE only for ALIAS INTERFACE *)
          arrayLength         : LargeInt.int option,
          arrayFixedSize      : LargeInt.int option,
          arrayZeroTerminated : bool,
          arrayType           : GIRepositoryArrayType.t option
        }

    withtype repodata =
      {
        includes  : {name : string, version : string} list,
        namespace :
          {
            name      : string,
            version   : string,
            cPrefix   : string option,
            sharedLib : string option,
            infos     : data basedata Vector.vector
          },
        elemDict  : ((GIRepositoryTypeTag.t * data basedata option) * int option) Dict.t
      }
        ref

    and callabledata =
      {
        returnValue :
          {
            type_             : data basedata,
            transferOwnership : GIRepositoryTransfer.t
          },
        parameter   : data basedata list
      }

    and aliasdata =
      {
        type_ : data basedata
      }

    and argdata =
      {
        transferOwnership : GIRepositoryTransfer.t,
        allowNone         : bool,
        direction         : GIRepositoryDirection.t,
        callerAllocates   : bool,
        scope             : GIRepositoryScopeType.t,
        closure           : LargeInt.int option,
        destroy           : LargeInt.int option,
        type_             : data basedata
      }

    and propertydata =
      {
        flags             : GObjectParamFlags.t,
        transferOwnership : GIRepositoryTransfer.t,
        type_             : data basedata
      }

    and fielddata =
      {
        flags : GIRepositoryFieldInfoFlags.t,
        type_ : data basedata
      }

    and constantdata =
      {
        value : GIRepositoryArgument.t,
        type_ : data basedata
      }

    and enumdata =
      {
        member      : data basedata list,
        method      : data basedata list,
        errorDomain : string option
      }

    and objectdata =
      {
        typeName     : string,
        getType      : string,
        abstract     : bool,
        fundamental  : bool,
        classStruct  : data basedata option,
        parent       : data basedata option,
        implements   : data basedata list,
        constant     : data basedata list,
        vfunc        : data basedata list,
        method       : data basedata list,
        field        : data basedata list,
        signal       : data basedata list,
        property     : data basedata list
      }

    and interfacedata =
      {
        typeName     : string,
        getType      : string,
        ifaceStruct  : data basedata option,
        prerequisite : data basedata list,
        constant     : data basedata list,
        vfunc        : data basedata list,
        method       : data basedata list,
        signal       : data basedata list,
        property     : data basedata list
      }

    and structdata =
      {
        isGTypeStruct : bool,
        isForeign     : bool,
        method        : data basedata list,
        field         : data basedata list
      }

    and uniondata =
      {
        method : data basedata list,
        field  : data basedata list
      }

    type repository =
      {
        path   : unit ListDict.t,
        loaded : repodata ListDict.t
      }
        ref
  end
