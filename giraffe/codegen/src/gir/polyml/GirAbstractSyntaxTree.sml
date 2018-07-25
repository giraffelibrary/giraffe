structure GirAbstractSyntaxTree : GIR_ABSTRACT_SYNTAX_TREE =
  struct
    type config =
      {
        version           : string option,
        introspectable    : string option,
        deprecated        : string option,
        deprecatedVersion : string option
      }

    type named_type =
      {
        name  : string option,
        cType : string option
      }
    type array_type =
      {
        name           : string option,
        length         : string option,
        fixedSize      : string option,
        zeroTerminated : string option,
        cType          : string option
      }
    datatype type_ =
      TYPEARRAY of array_type * type_
    | TYPENAMED of named_type * type_ list
    | TYPECALLBACK of (* ** callback ** *)
        {
          name           : string,
          config         : config,
          cType          : string option,
          callable       : callable
        }
    | TYPEVARARGS

    withtype callback =
      {
        name           : string,
        config         : config,
        cType          : string option,
        callable       : (* ** callable ** *)
          {
            returnValue : (* ** return_value ** *)
              {
                transferOwnership : string option,
                nullable          : string option,
                type_             : type_
              },
            parameters  : (* ** parameters ** *)
              {
                instance : (* ** parameter option ** *)
                  {
                    name              : string option,
                    transferOwnership : string,
                    nullable          : string option,
                    optional          : string option,
                    direction         : string option,
                    callerAllocates   : string option,
                    scope             : string option,
                    closure           : string option,
                    destroy           : string option,
                    type_             : type_
                  }
                    option,
                others   : (* ** parameter list ** *)
                  {
                    name              : string option,
                    transferOwnership : string,
                    nullable          : string option,
                    optional          : string option,
                    direction         : string option,
                    callerAllocates   : string option,
                    scope             : string option,
                    closure           : string option,
                    destroy           : string option,
                    type_             : type_
                  }
                    list
              }
          }
      }

    and callable =
      {
        returnValue : (* ** return_value ** *)
          {
            transferOwnership : string option,
            nullable          : string option,
            type_             : type_
          },
        parameters  : (* ** parameters ** *)
          {
            instance : (* ** parameter option ** *)
              {
                name              : string option,
                transferOwnership : string,
                nullable          : string option,
                optional          : string option,
                direction         : string option,
                callerAllocates   : string option,
                scope             : string option,
                closure           : string option,
                destroy           : string option,
                type_             : type_
              }
                option,
            others   : (* ** parameter list ** *)
              {
                name              : string option,
                transferOwnership : string,
                nullable          : string option,
                optional          : string option,
                direction         : string option,
                callerAllocates   : string option,
                scope             : string option,
                closure           : string option,
                destroy           : string option,
                type_             : type_
              }
                list
          }
      }

    and return_value =
      {
        transferOwnership : string option,
        nullable          : string option,
        type_             : type_
      }

    and parameters =
      {
        instance : (* ** parameter option ** *)
          {
            name              : string option,
            transferOwnership : string,
            nullable          : string option,
            optional          : string option,
            direction         : string option,
            callerAllocates   : string option,
            scope             : string option,
            closure           : string option,
            destroy           : string option,
            type_             : type_
          }
            option,
        others   : (* ** parameter list ** *)
          {
            name              : string option,
            transferOwnership : string,
            nullable          : string option,
            optional          : string option,
            direction         : string option,
            callerAllocates   : string option,
            scope             : string option,
            closure           : string option,
            destroy           : string option,
            type_             : type_
          }
            list
      }

    and parameter =
      {
        name              : string option,
        transferOwnership : string,
        nullable          : string option,
        optional          : string option,
        direction         : string option,
        callerAllocates   : string option,
        scope             : string option,
        closure           : string option,
        destroy           : string option,
        type_             : type_
      }

    datatype function_elem =
      FECONSTRUCTOR
    | FEFUNCTION
    | FEMETHOD

    type function =
      {
        elem           : function_elem,
        name           : string,
        config         : config,
        shadows        : string option,
        shadowedBy     : string option,
        callable       : callable,
        cIdentifier    : string,
        movedTo        : string option,
        throws         : string option
      }

    type virtual_method =
      {
        name           : string,
        config         : config,
        callable       : callable,
        throws         : string option,
        invoker        : string option,
        mustChainUp    : string option,
        override       : string option
      }

    type signal =
      {
        name            : string,
        config          : config,
        callable        : callable,
        when            : string option,
        noRecurse       : string option,
        detailed        : string option,
        action          : string option,
        noHooks         : string option,
        hasClassClosure : string option
      }

    type property =
      {
        name              : string,
        config            : config,
        readable          : string option,
        writable          : string option,
        construct         : string option,
        constructOnly     : string option,
        transferOwnership : string option,
        type_             : type_
      }

    type field =
      {
        name     : string,
        config   : config,
        readable : string option,
        writable : string option,
        private  : string option,
        type_    : type_
      }

    type alias =
      {
        name           : string,
        config         : config,
        cType          : string option,
        type_          : type_
      }

    type constant =
      {
        name   : string,
        config : config,
        value  : string,
        cType  : string,
        type_  : type_
      }

    type implements = string

    type class =
      {
        name          : string,
        config        : config,
        cSymbolPrefix : string,
        cType         : string option,
        abstract      : string option,
        fundamental   : string option,
        typeName      : string,
        getType       : string,
        typeStruct    : string option,
        parent        : string option,
        implements    : implements list,
        constant      : constant list,
        virtualMethod : virtual_method list,
        method        : function list,
        field         : field list,
        signal        : signal list,
        property      : property list
      }

    type prerequisite = string

    type interface =
      {
        name          : string,
        config        : config,
        cSymbolPrefix : string,
        cType         : string,
        typeName      : string,
        getType       : string,
        typeStruct    : string option,
        prerequisite  : prerequisite list,
        constant      : constant list,
        virtualMethod : virtual_method list,
        method        : function list,
        signal        : signal list,
        property      : property list
      }

    type record =
      {
        name             : string,
        config           : config,
        cSymbolPrefix    : string option,
        cType            : string,
        disguised        : string option,
        typeName         : string option,
        getType          : string option,
        isGTypeStructFor : string option,
        foreign          : string option,
        method           : function list,
        field            : field list
      }

    type union =
      {
        name          : string,
        config        : config,
        cSymbolPrefix : string option,
        cType         : string option,
        typeName      : string option,
        getType       : string option,
        method        : function list,
        field         : field list
      }

    type member =
      {
        name        : string,
        config      : config,
        cIdentifier : string,
        value       : string,
        nick        : string option
      }

    datatype enum_elem =
      EEBITFIELD
    | EEENUMERATION

    type enum =
      {
        elem        : enum_elem,
        name        : string,
        config      : config,
        cType       : string,
        typeName    : string option,
        getType     : string option,
        errorDomain : string option,
        member      : member list,
        method      : function list
      }


    datatype namespace_elem =
      ALIAS of alias
    | CLASS of class
    | INTERFACE of interface
    | RECORD of record
    | UNION of union
    | BITFIELD of enum
    | ENUMERATION of enum
    | CALLBACK of callback
    | CONSTANT of constant
    | FUNCTION of function


    type 'a namespace =
      {
        name          : string,
        version       : string,
        sharedLibrary : string option,
        cPrefix       : string,
        elems         :
          {
            elem : namespace_elem,
            data : 'a
          }
            list
      }


    type ('a, 'b) repository =
      {
        version   : string,
        includes  : {name : string, version : string} list,
        packages  : string list,
        namespace : 'b namespace,
        data      : 'a
      }
  end
