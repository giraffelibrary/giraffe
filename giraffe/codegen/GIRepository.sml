(**
 * This module extends GIRepository to allow the result of some functions
 * to be overridden for specific cases.
 *)

structure GIRepository :
  sig
    include G_I_REPOSITORY

    structure Override :
      sig
        type callable_path = string * string option * string
        val callableInfoMayReturnNull : (callable_path * bool) list ref
        val callableInfoCallerOwns : (callable_path * Transfer.t) list ref

        type arg_path = string * string option * string * string
        val argInfoMayBeNull : (arg_path * bool) list ref
        val argInfoDirection : (arg_path * Direction.t) list ref
        val argInfoOwnershipTransfer : (arg_path * Transfer.t) list ref
        val argInfoCallerAllocates : (arg_path * bool) list ref
      end
  end =
  struct
    structure Override =
      struct
        type callable_path = string * string option * string
        val callableInfoMayReturnNull = ref []
        val callableInfoCallerOwns = ref []

        type arg_path = string * string option * string * string
        val argInfoMayBeNull = ref []
        val argInfoDirection = ref []
        val argInfoOwnershipTransfer = ref []
        val argInfoCallerAllocates = ref []
      end

    open GIRepository

    (* Provide override for:
     *   `CallableInfo.mayReturnNull`
     *   `CallableInfo.getCallerOwns`
     *)
    structure CallableInfo =
      struct
        open CallableInfo

        fun isCallable callableInfo =
          let
            val namespace = BaseInfo.getNamespace callableInfo
            val optContainerInfo = BaseInfo.getContainer callableInfo
            val optContainerName =
              Option.mapPartial BaseInfo.getName optContainerInfo
            val name = valOf (BaseInfo.getName callableInfo)
          in
            fn (x, _) => x = (namespace, optContainerName, name)
          end
            handle Option => fn _ => false

        fun mayReturnNull callableInfo =
          case
            List.find (isCallable callableInfo)
              (!Override.callableInfoMayReturnNull)
          of
            SOME (_, y) => y
          | NONE        => CallableInfo.mayReturnNull callableInfo

        fun getCallerOwns callableInfo =
          case
            List.find (isCallable callableInfo)
              (!Override.callableInfoCallerOwns)
          of
            SOME (_, y) => y
          | NONE        => CallableInfo.getCallerOwns callableInfo
      end

    (* Provide override for:
     *   `ArgInfo.mayBeNull`
     *   `ArgInfo.getDirection`
     *   `ArgInfo.getOwnershipTransfer`
     *   `ArgInfo.isCallerAllocates`
     *)
    structure ArgInfo =
      struct
        open ArgInfo

        fun isArg argInfo =
          let
            val namespace = BaseInfo.getNamespace argInfo
            val callableInfo = valOf (BaseInfo.getContainer argInfo)
            val callableName = valOf (BaseInfo.getName callableInfo)
            val optContainerInfo = BaseInfo.getContainer callableInfo
            val optContainerName =
              Option.mapPartial BaseInfo.getName optContainerInfo
            val name = valOf (BaseInfo.getName argInfo)
          in
            fn (x, _) => x = (namespace, optContainerName, callableName, name)
          end
            handle Option => fn _ => false

        (* Currently, `ArgInfo.mayBeNull` is valid only for 'in' parameters.
         * For 'out'/'inout' parameters, it indicates whether the C parameter
         * is optional, not whether the imported/exported value is optionally
         * null, i.e. what we would expect from `isOptional`.  Therefore we
         * return false for 'out'/'inout' parameters that have not been
         * overridden.
         *)
        fun mayBeNull1 argInfo =
          case ArgInfo.getDirection argInfo of
            Direction.IN => ArgInfo.mayBeNull argInfo
          | _            => false

        fun mayBeNull argInfo =
          case List.find (isArg argInfo) (!Override.argInfoMayBeNull) of
            SOME (_, y) => y
          | NONE        => mayBeNull1 argInfo

        fun getDirection argInfo =
          case List.find (isArg argInfo) (!Override.argInfoDirection) of
            SOME (_, y) => y
          | NONE        => ArgInfo.getDirection argInfo

        fun ownershipTransfer argInfo =
          case List.find (isArg argInfo) (!Override.argInfoOwnershipTransfer) of
            SOME (_, y) => y
          | NONE        => ArgInfo.getOwnershipTransfer argInfo

        fun isCallerAllocates argInfo =
          case List.find (isArg argInfo) (!Override.argInfoCallerAllocates) of
            SOME (_, y) => y
          | NONE        => ArgInfo.isCallerAllocates argInfo
      end
  end
;
