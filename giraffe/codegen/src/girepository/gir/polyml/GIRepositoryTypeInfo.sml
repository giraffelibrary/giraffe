structure GIRepositoryTypeInfo :>
  G_I_REPOSITORY_TYPE_INFO
    where type 'a class_t = 'a GIRepositoryTypeInfoClass.t
    where type typetag_t = GIRepositoryTypeTag.t
    where type arraytype_t = GIRepositoryArrayType.t
    where type 'a baseinfoclass_t = 'a GIRepositoryBaseInfoClass.t =
  struct
    fun fromBase f = (I && f) o GIRepositoryBaseInfoClass.Obj.unpack
    fun fromType f = (I && f) o GIRepositoryTypeInfoClass.Obj.unpack

    fun toBase f = GIRepositoryBaseInfoClass.Obj.pack o (I && f)
    fun toType f = GIRepositoryTypeInfoClass.Obj.pack o (I && f)


    type 'a class_t = 'a GIRepositoryTypeInfoClass.t
    type typetag_t = GIRepositoryTypeTag.t
    type arraytype_t = GIRepositoryArrayType.t
    type 'a baseinfoclass_t = 'a GIRepositoryBaseInfoClass.t


    fun isPointer info ctxPtrDepth isRef =
      let
        val _ & Info.TYPEDATA {ptrDepth, ...} & _ = (fromBase o fromType) I info
        val ptrDepth =
          case ptrDepth of
            SOME x => x
          | NONE   => raise Fail "isPointer cannot be used for an alias type"

        val totalPtrDepth =
          case ctxPtrDepth of
            SOME d => ptrDepth + d
          | NONE   => ptrDepth

        val adjustedPtrDepth =
          if isRef
          then
            if totalPtrDepth > 0
            then totalPtrDepth - 1
            else 
              raise Fail "non-pointer for OUT or INOUT parameter"
          else
            totalPtrDepth
      in
        adjustedPtrDepth > 0
      end

    fun addPtrDepth info ctxPtrDepth =
      let
        val _ & Info.TYPEDATA {ptrDepth, ...} & _ = (fromBase o fromType) I info
      in
        case (ctxPtrDepth, ptrDepth) of
          (SOME m, SOME n) => SOME (m + n)
        | (SOME m, NONE)   => SOME m
        | (NONE,   SOME n) => SOME n
        | (NONE,   NONE)   => NONE
      end

    fun getTag info =
      let
        val _ & Info.TYPEDATA {tag, ...} & _ = (fromBase o fromType) I info
      in
        tag
      end

    fun getParamType info n =
      let
        val _ & Info.TYPEDATA {params, ...} & _ = (fromBase o fromType) I info
        val base = List.nth (params, n)
        val Info.BASE (ref {instance, ...}) = base
      in
        case instance of
          Info.TYPE x => SOME ((toBase o toType) I (base & x))
        | _           => raise Fail "internal error: expected TYPE info"
      end
        handle Subscript => NONE

    fun getInterface info =
      let
        val _ & Info.TYPEDATA {interface, ...} & _ = (fromBase o fromType) I info
      in
        case interface of
          SOME base => SOME (toBase I (base & ()))
        | NONE      => NONE
      end

    fun getArrayLength info =
      let
        val _ & Info.TYPEDATA {arrayLength, ...} & _ = (fromBase o fromType) I info
      in
        case arrayLength of
          SOME n => n
        | NONE   => ~1
      end

    fun getArrayFixedSize info =
      let
        val _ & Info.TYPEDATA {arrayFixedSize, ...} & _ = (fromBase o fromType) I info
      in
        case arrayFixedSize of
          SOME n => n
        | NONE   => ~1
      end

    fun isZeroTerminated info =
      let
        val _ & Info.TYPEDATA {arrayZeroTerminated, ...} & _ = (fromBase o fromType) I info
      in
        arrayZeroTerminated
      end

    fun getArrayType info =
      let
        val _ & Info.TYPEDATA {arrayType, ...} & _ = (fromBase o fromType) I info
      in
        arrayType
      end
  end
