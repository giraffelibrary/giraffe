(* This structure defines the `compiled' representation of a GIR file. *)

structure Info =
  struct
    type valuedata =
      {
        value : LargeInt.int
      }

    type registeredtypedata =
      {
        cType    : string option,
        typeName : string option,
        getType  : string option
      }

    type functiondata =
      {
        symbol  : string,
        movedTo : string option,
        flags   : GIRepositoryFunctionInfoFlags.t
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

    and basedata =
      BASE of
        {
          name       : string option,
          container  : basedata option,
          typelib    : typelibdata,
          deprecated : bool,
          version    : (string * string * string) option,
          attributes : string ListDict.t,
          instance   : data
        }
          ref

    and typedata =
      TYPEDATA of
        {
          tag                 : GIRepositoryTypeTag.t,
          interface           : basedata option,
          params              : basedata list,
          ptrDepth            : int option,  (* NONE only for ALIAS INTERFACE *)
          arrayLength         : LargeInt.int option,
          arrayFixedSize      : LargeInt.int option,
          arrayZeroTerminated : bool,
          arrayType           : GIRepositoryArrayType.t option,
          cType               : string option
        }

    withtype typelibdata =
      {
        includes     : {name : string, version : string} list,
        packages     : string list,
        dependencies : string ListDict.t,
        namespace    :
          {
            name      : string,
            version   : string,
            cPrefix   : string option,
            sharedLib : string option,
            infos     : basedata Vector.vector
          },
        elemDict     : ((GIRepositoryTypeTag.t * basedata option) * int option) Dict.t
      }
        ref

    and callabledata =
      {
        returnValue :
          {
            transferOwnership : GIRepositoryTransfer.t,
            nullable          : bool,
            type_             : basedata
          },
        parameters  : basedata list
      }

    and aliasdata =
      {
        cType : string,
        type_ : basedata
      }

    and argdata =
      {
        transferOwnership : GIRepositoryTransfer.t,
        nullable          : bool,
        optional          : bool,
        direction         : GIRepositoryDirection.t,
        callerAllocates   : bool,
        scope             : GIRepositoryScopeType.t,
        closure           : LargeInt.int option,
        destroy           : LargeInt.int option,
        type_             : basedata
      }

    and propertydata =
      {
        flags             : GObjectParamFlags.t,
        transferOwnership : GIRepositoryTransfer.t,
        type_             : basedata
      }

    and fielddata =
      {
        flags : GIRepositoryFieldInfoFlags.t,
        bits  : LargeInt.int option,
        type_ : basedata
      }

    and constantdata =
      {
        value : GIRepositoryArgument.t,
        cType : string option,
        type_ : basedata
      }

    and enumdata =
      {
        member      : basedata list,
        method      : basedata list,
        errorDomain : string option
      }

    and objectdata =
      {
        typeName     : string,
        getType      : string,
        abstract     : bool,
        fundamental  : bool,
        classStruct  : basedata option,
        parent       : basedata option,
        implements   : basedata list,
        constant     : basedata list,
        vfunc        : basedata list,
        method       : basedata list,
        field        : basedata list,
        signal       : basedata list,
        property     : basedata list
      }

    and interfacedata =
      {
        typeName     : string,
        getType      : string,
        ifaceStruct  : basedata option,
        prerequisite : basedata list,
        constant     : basedata list,
        vfunc        : basedata list,
        method       : basedata list,
        signal       : basedata list,
        property     : basedata list
      }

    and structdata =
      {
        isGTypeStruct : bool,
        isForeign     : bool,
        method        : basedata list,
        field         : basedata list
      }

    and uniondata =
      {
        method : basedata list,
        field  : basedata list
      }

    (* Unlike the GIRepository library, the GIR interface allows different
     * versions of the same namespace to be loaded simultaneously.  Therefore
     * the currently loaded namespaces in the field `loaded` is a map from
     * namespace names and namespace versions to `typelibdata`, the
     * representation of a TYPELIB file.  Functions that take a namespace
     * name argument still work provided that there is only one version of
     * the specified name loaded.
     *)
    type repodata =
      {
        path   : unit ListDict.t,
        loaded : typelibdata NamespaceVersionMap.t
      }
        ref
  end
