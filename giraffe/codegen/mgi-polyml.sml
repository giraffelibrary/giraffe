val libgirepository = CInterface.load_lib "libgirepository-1.0.so"
val libgiraffegirepository = CInterface.load_lib "libgiraffe-gobject-introspection-1.0.so"
;

app use [
  "girepository/common/G_I_REPOSITORY_FIELD_INFO_FLAGS.sml",
  "girepository/common/G_I_REPOSITORY_V_FUNC_INFO_FLAGS.sml",
  "girepository/common/G_I_REPOSITORY_FUNCTION_INFO_FLAGS.sml",
  "girepository/common/G_I_REPOSITORY_REPOSITORY_LOAD_FLAGS.sml",
  "girepository/common/polyml/GIRepositoryFieldInfoFlags.sml",
  "girepository/common/polyml/GIRepositoryFunctionInfoFlags.sml",
  "girepository/common/polyml/GIRepositoryVFuncInfoFlags.sml",
  "girepository/common/polyml/GIRepositoryRepositoryLoadFlags.sml"
]
;



signature G_I_REPOSITORY_BASE_INFO_CLASS =
  sig
    type 'a t
    val toBase : 'a t -> base t
    structure C :
      sig
        type notnull
        type 'a p

        val withPtr : (notnull p -> 'b) -> 'a t -> 'b
        val withOptPtr : (unit p -> 'b) -> 'a t option -> 'b

        val fromPtr : bool -> notnull p -> 'a t
        val fromOptPtr : bool -> unit p -> 'a t option
      end
  end

structure GIRepositoryBaseInfoClass :>
  sig
    include G_I_REPOSITORY_BASE_INFO_CLASS

    structure PolyML :
      sig
        val PTR : C.notnull C.p CInterface.Conversion
        val OPTPTR : unit C.p CInterface.Conversion
      end
  end =
  struct
    type notnull = CPointer.notnull
    type 'a p = 'a CPointer.t
    val PTR = CPointer.PolyML.POINTER : notnull p CInterface.Conversion
    val OPTPTR = CPointer.PolyML.POINTER : unit p CInterface.Conversion

    local
      open PolyMLFFI
    in
      val take_ = ignore

      val ref_ =
        call
          (load_sym libgirepository "g_base_info_ref")
          (PTR --> PTR);

      val unref_sym = load_sym libgirepository "g_base_info_unref";
    end

    type 'a t = notnull p Finalizable.t
    fun toBase obj = obj

    structure C =
      struct
        structure Pointer = CPointer
        type notnull = notnull
        type 'a p = 'a p

        fun withPtr f x = Finalizable.withValue (x, f)

        fun withOptPtr f =
          fn
            SOME ptr => withPtr (f o Pointer.toOptNull) ptr
          | NONE     => f Pointer.null

        fun fromPtr transfer ptr =
          let
            val object =
              Finalizable.new (
                if transfer
                then (take_ ptr; ptr)  (* take the existing reference *)
                else ref_ ptr
              )
          in
            Finalizable.addFinalizer (object, unref_sym);
            object
          end

        fun fromOptPtr transfer optptr =
          Option.map (fromPtr transfer) (Pointer.toOpt optptr)
      end

    structure PolyML =
      struct
        val PTR = PTR
        val OPTPTR = OPTPTR
      end
  end



signature G_I_REPOSITORY_CALLABLE_INFO_CLASS =
  sig
    type 'a callableinfo
    type 'a baseinfoclass_t
    type 'a t = 'a callableinfo baseinfoclass_t
    val toBase : 'a t -> base t
    structure C :
      sig
        type notnull
        type 'a p
        val fromPtr : bool -> notnull p -> 'a t
        val fromOptPtr : bool -> unit p -> 'a t option
      end
  end

structure GIRepositoryCallableInfoClass :>
  G_I_REPOSITORY_CALLABLE_INFO_CLASS
    where type 'a baseinfoclass_t = 'a GIRepositoryBaseInfoClass.t
    where type C.notnull = GIRepositoryBaseInfoClass.C.notnull
    where type 'a C.p = 'a GIRepositoryBaseInfoClass.C.p =
  struct
    type 'a callableinfo = unit
    type 'a baseinfoclass_t = 'a GIRepositoryBaseInfoClass.t
    type 'a t = 'a callableinfo baseinfoclass_t
    fun toBase obj = obj
    structure C = GIRepositoryBaseInfoClass.C
  end



signature G_I_REPOSITORY_FUNCTION_INFO_CLASS =
  sig
    type 'a functioninfo
    type 'a callableinfoclass_t
    type 'a t = 'a functioninfo callableinfoclass_t
    val toBase : 'a t -> base t
    structure C :
      sig
        type notnull
        type 'a p
        val fromPtr : bool -> notnull p -> 'a t
        val fromOptPtr : bool -> unit p -> 'a t option
      end
  end

structure GIRepositoryFunctionInfoClass :>
  G_I_REPOSITORY_FUNCTION_INFO_CLASS
    where type 'a callableinfoclass_t = 'a GIRepositoryCallableInfoClass.t
    where type C.notnull = GIRepositoryCallableInfoClass.C.notnull
    where type 'a C.p = 'a GIRepositoryCallableInfoClass.C.p =
  struct
    type 'a functioninfo = unit
    type 'a callableinfoclass_t = 'a GIRepositoryCallableInfoClass.t
    type 'a t = 'a functioninfo callableinfoclass_t
    fun toBase obj = obj
    structure C = GIRepositoryCallableInfoClass.C
  end



signature G_I_REPOSITORY_SIGNAL_INFO_CLASS =
  sig
    type 'a signalinfo
    type 'a callableinfoclass_t
    type 'a t = 'a signalinfo callableinfoclass_t
    val toBase : 'a t -> base t
    structure C :
      sig
        type notnull
        type 'a p
        val fromPtr : bool -> notnull p -> 'a t
        val fromOptPtr : bool -> unit p -> 'a t option
      end
  end

structure GIRepositorySignalInfoClass :>
  G_I_REPOSITORY_SIGNAL_INFO_CLASS
    where type 'a callableinfoclass_t = 'a GIRepositoryCallableInfoClass.t
    where type C.notnull = GIRepositoryCallableInfoClass.C.notnull
    where type 'a C.p = 'a GIRepositoryCallableInfoClass.C.p =
  struct
    type 'a signalinfo = unit
    type 'a callableinfoclass_t = 'a GIRepositoryCallableInfoClass.t
    type 'a t = 'a signalinfo callableinfoclass_t
    fun toBase obj = obj
    structure C = GIRepositoryCallableInfoClass.C
  end



signature G_I_REPOSITORY_VFUNC_INFO_CLASS =
  sig
    type 'a vfuncinfo
    type 'a callableinfoclass_t
    type 'a t = 'a vfuncinfo callableinfoclass_t
    val toBase : 'a t -> base t
    structure C :
      sig
        type notnull
        type 'a p
        val fromPtr : bool -> notnull p -> 'a t
        val fromOptPtr : bool -> unit p -> 'a t option
      end
  end

structure GIRepositoryVFuncInfoClass :>
  G_I_REPOSITORY_VFUNC_INFO_CLASS
    where type 'a callableinfoclass_t = 'a GIRepositoryCallableInfoClass.t
    where type C.notnull = GIRepositoryCallableInfoClass.C.notnull
    where type 'a C.p = 'a GIRepositoryCallableInfoClass.C.p =
  struct
    type 'a vfuncinfo = unit
    type 'a callableinfoclass_t = 'a GIRepositoryCallableInfoClass.t
    type 'a t = 'a vfuncinfo callableinfoclass_t
    fun toBase obj = obj
    structure C = GIRepositoryCallableInfoClass.C
  end



signature G_I_REPOSITORY_REGISTERED_TYPE_INFO_CLASS =
  sig
    type 'a registeredtypeinfo
    type 'a baseinfoclass_t
    type 'a t = 'a registeredtypeinfo baseinfoclass_t
    val toBase : 'a t -> base t
    structure C :
      sig
        type notnull
        type 'a p
        val fromPtr : bool -> notnull p -> 'a t
        val fromOptPtr : bool -> unit p -> 'a t option
      end
  end

structure GIRepositoryRegisteredTypeInfoClass :>
  G_I_REPOSITORY_REGISTERED_TYPE_INFO_CLASS
    where type 'a baseinfoclass_t = 'a GIRepositoryBaseInfoClass.t
    where type C.notnull = GIRepositoryBaseInfoClass.C.notnull
    where type 'a C.p = 'a GIRepositoryBaseInfoClass.C.p =
  struct
    type 'a registeredtypeinfo = unit
    type 'a baseinfoclass_t = 'a GIRepositoryBaseInfoClass.t
    type 'a t = 'a registeredtypeinfo baseinfoclass_t
    fun toBase obj = obj
    structure C = GIRepositoryBaseInfoClass.C
  end



signature G_I_REPOSITORY_ENUM_INFO_CLASS =
  sig
    type 'a enuminfo
    type 'a registeredtypeinfoclass_t
    type 'a t = 'a enuminfo registeredtypeinfoclass_t
    val toBase : 'a t -> base t
    structure C :
      sig
        type notnull
        type 'a p
        val fromPtr : bool -> notnull p -> 'a t
        val fromOptPtr : bool -> unit p -> 'a t option
      end
  end

structure GIRepositoryEnumInfoClass :>
  G_I_REPOSITORY_ENUM_INFO_CLASS
    where type 'a registeredtypeinfoclass_t = 'a GIRepositoryRegisteredTypeInfoClass.t
    where type C.notnull = GIRepositoryRegisteredTypeInfoClass.C.notnull
    where type 'a C.p = 'a GIRepositoryRegisteredTypeInfoClass.C.p =
  struct
    type 'a enuminfo = unit
    type 'a registeredtypeinfoclass_t = 'a GIRepositoryRegisteredTypeInfoClass.t
    type 'a t = 'a enuminfo registeredtypeinfoclass_t
    fun toBase obj = obj
    structure C = GIRepositoryRegisteredTypeInfoClass.C
  end



signature G_I_REPOSITORY_INTERFACE_INFO_CLASS =
  sig
    type 'a interfaceinfo
    type 'a registeredtypeinfoclass_t
    type 'a t = 'a interfaceinfo registeredtypeinfoclass_t
    val toBase : 'a t -> base t
    structure C :
      sig
        type notnull
        type 'a p
        val fromPtr : bool -> notnull p -> 'a t
        val fromOptPtr : bool -> unit p -> 'a t option
      end
  end

structure GIRepositoryInterfaceInfoClass :>
  G_I_REPOSITORY_INTERFACE_INFO_CLASS
    where type 'a registeredtypeinfoclass_t = 'a GIRepositoryRegisteredTypeInfoClass.t
    where type C.notnull = GIRepositoryRegisteredTypeInfoClass.C.notnull
    where type 'a C.p = 'a GIRepositoryRegisteredTypeInfoClass.C.p =
  struct
    type 'a interfaceinfo = unit
    type 'a registeredtypeinfoclass_t = 'a GIRepositoryRegisteredTypeInfoClass.t
    type 'a t = 'a interfaceinfo registeredtypeinfoclass_t
    fun toBase obj = obj
    structure C = GIRepositoryRegisteredTypeInfoClass.C
  end



signature G_I_REPOSITORY_OBJECT_INFO_CLASS =
  sig
    type 'a objectinfo
    type 'a registeredtypeinfoclass_t
    type 'a t = 'a objectinfo registeredtypeinfoclass_t
    val toBase : 'a t -> base t
    structure C :
      sig
        type notnull
        type 'a p
        val fromPtr : bool -> notnull p -> 'a t
        val fromOptPtr : bool -> unit p -> 'a t option
      end
  end

structure GIRepositoryObjectInfoClass :>
  G_I_REPOSITORY_OBJECT_INFO_CLASS
    where type 'a registeredtypeinfoclass_t = 'a GIRepositoryRegisteredTypeInfoClass.t
    where type C.notnull = GIRepositoryRegisteredTypeInfoClass.C.notnull
    where type 'a C.p = 'a GIRepositoryRegisteredTypeInfoClass.C.p =
  struct
    type 'a objectinfo = unit
    type 'a registeredtypeinfoclass_t = 'a GIRepositoryRegisteredTypeInfoClass.t
    type 'a t = 'a objectinfo registeredtypeinfoclass_t
    fun toBase obj = obj
    structure C = GIRepositoryRegisteredTypeInfoClass.C
  end



signature G_I_REPOSITORY_STRUCT_INFO_CLASS =
  sig
    type 'a structinfo
    type 'a registeredtypeinfoclass_t
    type 'a t = 'a structinfo registeredtypeinfoclass_t
    val toBase : 'a t -> base t
    structure C :
      sig
        type notnull
        type 'a p
        val fromPtr : bool -> notnull p -> 'a t
        val fromOptPtr : bool -> unit p -> 'a t option
      end
  end

structure GIRepositoryStructInfoClass :>
  G_I_REPOSITORY_STRUCT_INFO_CLASS
    where type 'a registeredtypeinfoclass_t = 'a GIRepositoryRegisteredTypeInfoClass.t
    where type C.notnull = GIRepositoryRegisteredTypeInfoClass.C.notnull
    where type 'a C.p = 'a GIRepositoryRegisteredTypeInfoClass.C.p =
  struct
    type 'a structinfo = unit
    type 'a registeredtypeinfoclass_t = 'a GIRepositoryRegisteredTypeInfoClass.t
    type 'a t = 'a structinfo registeredtypeinfoclass_t
    fun toBase obj = obj
    structure C = GIRepositoryRegisteredTypeInfoClass.C
  end



signature G_I_REPOSITORY_UNION_INFO_CLASS =
  sig
    type 'a unioninfo
    type 'a registeredtypeinfoclass_t
    type 'a t = 'a unioninfo registeredtypeinfoclass_t
    val toBase : 'a t -> base t
    structure C :
      sig
        type notnull
        type 'a p
        val fromPtr : bool -> notnull p -> 'a t
        val fromOptPtr : bool -> unit p -> 'a t option
      end
  end

structure GIRepositoryUnionInfoClass :>
  G_I_REPOSITORY_UNION_INFO_CLASS
    where type 'a registeredtypeinfoclass_t = 'a GIRepositoryRegisteredTypeInfoClass.t
    where type C.notnull = GIRepositoryRegisteredTypeInfoClass.C.notnull
    where type 'a C.p = 'a GIRepositoryRegisteredTypeInfoClass.C.p =
  struct
    type 'a unioninfo = unit
    type 'a registeredtypeinfoclass_t = 'a GIRepositoryRegisteredTypeInfoClass.t
    type 'a t = 'a unioninfo registeredtypeinfoclass_t
    fun toBase obj = obj
    structure C = GIRepositoryRegisteredTypeInfoClass.C
  end



signature G_I_REPOSITORY_ARG_INFO_CLASS =
  sig
    type 'a arginfo
    type 'a baseinfoclass_t
    type 'a t = 'a arginfo baseinfoclass_t
    val toBase : 'a t -> base t
    structure C :
      sig
        type notnull
        type 'a p
        val fromPtr : bool -> notnull p -> 'a t
        val fromOptPtr : bool -> unit p -> 'a t option
      end
  end

structure GIRepositoryArgInfoClass :>
  G_I_REPOSITORY_ARG_INFO_CLASS
    where type 'a baseinfoclass_t = 'a GIRepositoryBaseInfoClass.t
    where type C.notnull = GIRepositoryBaseInfoClass.C.notnull
    where type 'a C.p = 'a GIRepositoryBaseInfoClass.C.p =
  struct
    type 'a arginfo = unit
    type 'a baseinfoclass_t = 'a GIRepositoryBaseInfoClass.t
    type 'a t = 'a arginfo baseinfoclass_t
    fun toBase obj = obj
    structure C = GIRepositoryBaseInfoClass.C
  end



signature G_I_REPOSITORY_CONSTANT_INFO_CLASS =
  sig
    type 'a constantinfo
    type 'a baseinfoclass_t
    type 'a t = 'a constantinfo baseinfoclass_t
    val toBase : 'a t -> base t
    structure C :
      sig
        type notnull
        type 'a p
        val fromPtr : bool -> notnull p -> 'a t
        val fromOptPtr : bool -> unit p -> 'a t option
      end
  end

structure GIRepositoryConstantInfoClass :>
  G_I_REPOSITORY_CONSTANT_INFO_CLASS
    where type 'a baseinfoclass_t = 'a GIRepositoryBaseInfoClass.t
    where type C.notnull = GIRepositoryBaseInfoClass.C.notnull
    where type 'a C.p = 'a GIRepositoryBaseInfoClass.C.p =
  struct
    type 'a constantinfo = unit
    type 'a baseinfoclass_t = 'a GIRepositoryBaseInfoClass.t
    type 'a t = 'a constantinfo baseinfoclass_t
    fun toBase obj = obj
    structure C = GIRepositoryBaseInfoClass.C
  end



signature G_I_REPOSITORY_FIELD_INFO_CLASS =
  sig
    type 'a fieldinfo
    type 'a baseinfoclass_t
    type 'a t = 'a fieldinfo baseinfoclass_t
    val toBase : 'a t -> base t
    structure C :
      sig
        type notnull
        type 'a p
        val fromPtr : bool -> notnull p -> 'a t
        val fromOptPtr : bool -> unit p -> 'a t option
      end
  end

structure GIRepositoryFieldInfoClass :>
  G_I_REPOSITORY_FIELD_INFO_CLASS
    where type 'a baseinfoclass_t = 'a GIRepositoryBaseInfoClass.t
    where type C.notnull = GIRepositoryBaseInfoClass.C.notnull
    where type 'a C.p = 'a GIRepositoryBaseInfoClass.C.p =
  struct
    type 'a fieldinfo = unit
    type 'a baseinfoclass_t = 'a GIRepositoryBaseInfoClass.t
    type 'a t = 'a fieldinfo baseinfoclass_t
    fun toBase obj = obj
    structure C = GIRepositoryBaseInfoClass.C
  end



signature G_I_REPOSITORY_PROPERTY_INFO_CLASS =
  sig
    type 'a propertyinfo
    type 'a baseinfoclass_t
    type 'a t = 'a propertyinfo baseinfoclass_t
    val toBase : 'a t -> base t
    structure C :
      sig
        type notnull
        type 'a p
        val fromPtr : bool -> notnull p -> 'a t
        val fromOptPtr : bool -> unit p -> 'a t option
      end
  end

structure GIRepositoryPropertyInfoClass :>
  G_I_REPOSITORY_PROPERTY_INFO_CLASS
    where type 'a baseinfoclass_t = 'a GIRepositoryBaseInfoClass.t
    where type C.notnull = GIRepositoryBaseInfoClass.C.notnull
    where type 'a C.p = 'a GIRepositoryBaseInfoClass.C.p =
  struct
    type 'a propertyinfo = unit
    type 'a baseinfoclass_t = 'a GIRepositoryBaseInfoClass.t
    type 'a t = 'a propertyinfo baseinfoclass_t
    fun toBase obj = obj
    structure C = GIRepositoryBaseInfoClass.C
  end



signature G_I_REPOSITORY_TYPE_INFO_CLASS =
  sig
    type 'a typeinfo
    type 'a baseinfoclass_t
    type 'a t = 'a typeinfo baseinfoclass_t
    val toBase : 'a t -> base t
    structure C :
      sig
        type notnull
        type 'a p
        val fromPtr : bool -> notnull p -> 'a t
        val fromOptPtr : bool -> unit p -> 'a t option
      end
  end

structure GIRepositoryTypeInfoClass :>
  G_I_REPOSITORY_TYPE_INFO_CLASS
    where type 'a baseinfoclass_t = 'a GIRepositoryBaseInfoClass.t
    where type C.notnull = GIRepositoryBaseInfoClass.C.notnull
    where type 'a C.p = 'a GIRepositoryBaseInfoClass.C.p =
  struct
    type 'a typeinfo = unit
    type 'a baseinfoclass_t = 'a GIRepositoryBaseInfoClass.t
    type 'a t = 'a typeinfo baseinfoclass_t
    fun toBase obj = obj
    structure C = GIRepositoryBaseInfoClass.C
  end



signature G_I_REPOSITORY_VALUE_INFO_CLASS =
  sig
    type 'a valueinfo
    type 'a baseinfoclass_t
    type 'a t = 'a valueinfo baseinfoclass_t
    val toBase : 'a t -> base t
    structure C :
      sig
        type notnull
        type 'a p
        val fromPtr : bool -> notnull p -> 'a t
        val fromOptPtr : bool -> unit p -> 'a t option
      end
  end

structure GIRepositoryValueInfoClass :>
  G_I_REPOSITORY_VALUE_INFO_CLASS
    where type 'a baseinfoclass_t = 'a GIRepositoryBaseInfoClass.t
    where type C.notnull = GIRepositoryBaseInfoClass.C.notnull
    where type 'a C.p = 'a GIRepositoryBaseInfoClass.C.p =
  struct
    type 'a valueinfo = unit
    type 'a baseinfoclass_t = 'a GIRepositoryBaseInfoClass.t
    type 'a t = 'a valueinfo baseinfoclass_t
    fun toBase obj = obj
    structure C = GIRepositoryBaseInfoClass.C
  end







signature G_I_REPOSITORY_TYPE_TAG =
  sig
    datatype t =
      VOID
    | BOOLEAN
    | INT8
    | UINT8
    | INT16
    | UINT16
    | INT32
    | UINT32
    | INT64
    | UINT64
    | FLOAT
    | DOUBLE
    | GTYPE
    | UTF8
    | FILENAME
    | ARRAY
    | INTERFACE
    | GLIST
    | GSLIST
    | GHASH
    | ERROR
    | UNICHAR
    val toString : t -> string
    structure C :
      sig
        type val_
        type ref_
        val withVal :
          (val_ -> 'a)
           -> t
           -> 'a
        val withRefVal :
          (ref_ -> 'a)
           -> t
           -> (val_, 'a) pair
        val fromVal : val_ -> t
        exception Value of FFI.Enum.val_
      end
  end

structure GIRepositoryTypeTag :>
  sig
    include G_I_REPOSITORY_TYPE_TAG
    structure PolyML :
      sig
        val VAL : C.val_ CInterface.Conversion
        val REF : C.ref_ CInterface.Conversion
      end
  end =
  struct
    datatype t =
      VOID
    | BOOLEAN
    | INT8
    | UINT8
    | INT16
    | UINT16
    | INT32
    | UINT32
    | INT64
    | UINT64
    | FLOAT
    | DOUBLE
    | GTYPE
    | UTF8
    | FILENAME
    | ARRAY
    | INTERFACE
    | GLIST
    | GSLIST
    | GHASH
    | ERROR
    | UNICHAR
    structure C =
      struct
        type val_ = FFI.Enum.val_
        type ref_ = FFI.Enum.ref_
        exception Value of FFI.Enum.val_
        fun withVal f =
          fn
            VOID => f 0
          | BOOLEAN => f 1
          | INT8 => f 2
          | UINT8 => f 3
          | INT16 => f 4
          | UINT16 => f 5
          | INT32 => f 6
          | UINT32 => f 7
          | INT64 => f 8
          | UINT64 => f 9
          | FLOAT => f 10
          | DOUBLE => f 11
          | GTYPE => f 12
          | UTF8 => f 13
          | FILENAME => f 14
          | ARRAY => f 15
          | INTERFACE => f 16
          | GLIST => f 17
          | GSLIST => f 18
          | GHASH => f 19
          | ERROR => f 20
          | UNICHAR => f 21
        fun withRefVal f = withVal (FFI.Enum.withRef f)
        val fromVal =
          fn
            0 => VOID
          | 1 => BOOLEAN
          | 2 => INT8
          | 3 => UINT8
          | 4 => INT16
          | 5 => UINT16
          | 6 => INT32
          | 7 => UINT32
          | 8 => INT64
          | 9 => UINT64
          | 10 => FLOAT
          | 11 => DOUBLE
          | 12 => GTYPE
          | 13 => UTF8
          | 14 => FILENAME
          | 15 => ARRAY
          | 16 => INTERFACE
          | 17 => GLIST
          | 18 => GSLIST
          | 19 => GHASH
          | 20 => ERROR
          | 21 => UNICHAR
          | n => raise Value n
      end
    structure PolyML =
      struct
        val VAL = FFI.PolyML.Enum.VAL
        val REF = FFI.PolyML.Enum.REF
      end
    local
      open PolyMLFFI
    in
      val toString_ =
        call
          (load_sym libgirepository "g_type_tag_to_string")
          (FFI.PolyML.Enum.VAL --> FFI.PolyML.String.RETPTR);
    end
    val toString =
      fn typ =>
        (C.withVal ---> FFI.String.fromPtr false) toString_ typ
  end



signature G_I_REPOSITORY_ARRAY_TYPE =
  sig
    datatype t =
      C
    | ARRAY
    | PTR_ARRAY
    | BYTE_ARRAY
    structure C :
      sig
        type val_
        type ref_
        val withVal :
          (val_ -> 'a)
           -> t
           -> 'a
        val withRefVal :
          (ref_ -> 'a)
           -> t
           -> (val_, 'a) pair
        val fromVal : val_ -> t
        exception Value of FFI.Enum.val_
      end
  end

structure GIRepositoryArrayType :>
  sig
    include G_I_REPOSITORY_ARRAY_TYPE
    structure PolyML :
      sig
        val VAL : C.val_ CInterface.Conversion
        val REF : C.ref_ CInterface.Conversion
      end
  end =
  struct
    datatype t =
      C
    | ARRAY
    | PTR_ARRAY
    | BYTE_ARRAY
    structure C =
      struct
        type val_ = FFI.Enum.val_
        type ref_ = FFI.Enum.ref_
        exception Value of FFI.Enum.val_
        fun withVal f =
          fn
            C => f 0
          | ARRAY => f 1
          | PTR_ARRAY => f 2
          | BYTE_ARRAY => f 3
        fun withRefVal f = withVal (FFI.Enum.withRef f)
        val fromVal =
          fn
            0 => C
          | 1 => ARRAY
          | 2 => PTR_ARRAY
          | 3 => BYTE_ARRAY
          | n => raise Value n
      end
    structure PolyML =
      struct
        val VAL = FFI.PolyML.Enum.VAL
        val REF = FFI.PolyML.Enum.REF
      end
  end







signature G_I_REPOSITORY_BASE_INFO =
  sig
    type 'a class_t
    val getName : 'a class_t -> string option
    val getNamespace : 'a class_t -> string
    val isDeprecated : 'a class_t -> bool
    val getAttribute : 'a class_t -> string -> string option
    val getContainer : 'a class_t -> base class_t
    val equal : 'a class_t -> 'b class_t -> bool
  end

structure GIRepositoryBaseInfo :>
  G_I_REPOSITORY_BASE_INFO
    where type 'a class_t = 'a GIRepositoryBaseInfoClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getName_ =
        call
          (load_sym libgirepository "g_base_info_get_name")
          (GIRepositoryBaseInfoClass.PolyML.PTR --> FFI.PolyML.String.RETPTR);

      val getNamespace_ =
        call
          (load_sym libgirepository "g_base_info_get_namespace")
          (GIRepositoryBaseInfoClass.PolyML.PTR --> FFI.PolyML.String.RETPTR);

      val isDeprecated_ =
        call
          (load_sym libgirepository "g_base_info_is_deprecated")
          (GIRepositoryBaseInfoClass.PolyML.PTR --> FFI.PolyML.Bool.VAL);

      val getAttribute_ =
        call
          (load_sym libgirepository "g_base_info_get_attribute")
          (GIRepositoryBaseInfoClass.PolyML.PTR
            &&> FFI.PolyML.String.INPTR
            --> FFI.PolyML.String.RETOPTPTR);

      val getContainer_ =
        call
          (load_sym libgirepository "g_base_info_get_container")
          (GIRepositoryBaseInfoClass.PolyML.PTR --> GIRepositoryBaseInfoClass.PolyML.PTR);

      val equal_ =
        call
          (load_sym libgirepository "g_base_info_equal")
          (GIRepositoryBaseInfoClass.PolyML.PTR
            &&> GIRepositoryBaseInfoClass.PolyML.PTR
            --> FFI.PolyML.Bool.VAL);
    end


    type 'a class_t = 'a GIRepositoryBaseInfoClass.t


    val getName =
      fn info =>
        (GIRepositoryBaseInfoClass.C.withPtr ---> FFI.String.fromOptPtr false)
          getName_ info

    val getNamespace =
      fn info =>
        (GIRepositoryBaseInfoClass.C.withPtr ---> FFI.String.fromPtr false)
          getNamespace_
          info

    val isDeprecated =
      fn info =>
        (GIRepositoryBaseInfoClass.C.withPtr ---> I)
          isDeprecated_
          info

    val getAttribute =
      fn info => fn name =>
        (GIRepositoryBaseInfoClass.C.withPtr
          &&&> FFI.String.withConstPtr
          ---> FFI.String.fromOptPtr false)
          getAttribute_
          (info & name)

    val getContainer =
      fn info =>
        (GIRepositoryBaseInfoClass.C.withPtr ---> GIRepositoryBaseInfoClass.C.fromPtr false)
          getContainer_
          info

    val equal =
      fn info1 => fn info2 =>
        (GIRepositoryBaseInfoClass.C.withPtr &&&> GIRepositoryBaseInfoClass.C.withPtr ---> I)
        equal_
        (info1 & info2)
  end



signature G_I_REPOSITORY_TYPE_INFO =
  sig
    type 'a class_t
    type typetag_t
    type arraytype_t
    type 'a baseinfoclass_t
    val isPointer : 'a class_t -> bool
    val getTag : 'a class_t -> typetag_t
    val getParamType : 'a class_t -> LargeInt.int -> base class_t option
    val getInterface : 'a class_t -> base baseinfoclass_t option
    val getArrayLength : 'a class_t -> LargeInt.int
    val getArrayFixedSize : 'a class_t -> LargeInt.int
    val isZeroTerminated : 'a class_t -> bool
    val getArrayType : 'a class_t -> arraytype_t
  end

structure GIRepositoryTypeInfo :>
  G_I_REPOSITORY_TYPE_INFO
    where type 'a class_t = 'a GIRepositoryTypeInfoClass.t
    where type typetag_t = GIRepositoryTypeTag.t
    where type arraytype_t = GIRepositoryArrayType.t
    where type 'a baseinfoclass_t = 'a GIRepositoryBaseInfoClass.t =
  struct
    local
      open PolyMLFFI
    in
      val isPointer_ =
        call
          (load_sym libgirepository "g_type_info_is_pointer")
          (GIRepositoryBaseInfoClass.PolyML.PTR --> FFI.PolyML.Bool.VAL);

      val getTag_ =
        call
          (load_sym libgirepository "g_type_info_get_tag")
          (GIRepositoryBaseInfoClass.PolyML.PTR --> GIRepositoryTypeTag.PolyML.VAL);

      val getParamType_ =
        call
          (load_sym libgirepository "g_type_info_get_param_type")
          (GIRepositoryBaseInfoClass.PolyML.PTR
            &&> FFI.PolyML.Int32.VAL
            --> GIRepositoryBaseInfoClass.PolyML.OPTPTR);

      val getInterface_ =
        call
          (load_sym libgirepository "g_type_info_get_interface")
          (GIRepositoryBaseInfoClass.PolyML.PTR --> GIRepositoryBaseInfoClass.PolyML.OPTPTR);

      val getArrayLength_ =
        call
          (load_sym libgirepository "g_type_info_get_array_length")
          (GIRepositoryBaseInfoClass.PolyML.PTR --> FFI.PolyML.Int32.VAL);

      val getArrayFixedSize_ =
        call
          (load_sym libgirepository "g_type_info_get_array_fixed_size")
          (GIRepositoryBaseInfoClass.PolyML.PTR --> FFI.PolyML.Int32.VAL);

      val isZeroTerminated_ =
        call
          (load_sym libgirepository "g_type_info_is_zero_terminated")
          (GIRepositoryBaseInfoClass.PolyML.PTR --> FFI.PolyML.Bool.VAL);

      val getArrayType_ =
        call
          (load_sym libgirepository "g_type_info_get_array_type")
          (GIRepositoryBaseInfoClass.PolyML.PTR --> GIRepositoryArrayType.PolyML.VAL);
    end


    type 'a class_t = 'a GIRepositoryTypeInfoClass.t
    type typetag_t = GIRepositoryTypeTag.t
    type arraytype_t = GIRepositoryArrayType.t
    type 'a baseinfoclass_t = 'a GIRepositoryBaseInfoClass.t


    val isPointer =
      fn info => (GIRepositoryBaseInfoClass.C.withPtr ---> I) isPointer_ info

    val getTag =
      fn info =>
        (GIRepositoryBaseInfoClass.C.withPtr ---> GIRepositoryTypeTag.C.fromVal) getTag_ info

    val getParamType =
      fn info => fn n =>
        (GIRepositoryBaseInfoClass.C.withPtr
          &&&> I
          ---> GIRepositoryTypeInfoClass.C.fromOptPtr true)
          getParamType_
          (info & n)

    val getInterface =
      fn info =>
        (GIRepositoryBaseInfoClass.C.withPtr ---> GIRepositoryBaseInfoClass.C.fromOptPtr true)
          getInterface_
          info

    val getArrayLength =
      fn info => (GIRepositoryBaseInfoClass.C.withPtr ---> I) getArrayLength_ info

    val getArrayFixedSize =
      fn info => (GIRepositoryBaseInfoClass.C.withPtr ---> I) getArrayFixedSize_ info

    val isZeroTerminated =
      fn info => (GIRepositoryBaseInfoClass.C.withPtr ---> I) isZeroTerminated_ info

    val getArrayType =
      fn info =>
        (GIRepositoryBaseInfoClass.C.withPtr ---> GIRepositoryArrayType.C.fromVal)
          getArrayType_
          info
  end



signature G_I_REPOSITORY_ARGUMENT =
  sig
    datatype t =
      BOOLEAN  of bool
    | INT8     of LargeInt.int
    | UINT8    of LargeInt.int
    | INT16    of LargeInt.int
    | UINT16   of LargeInt.int
    | INT32    of LargeInt.int
    | UINT32   of LargeInt.int
    | INT64    of LargeInt.int
    | UINT64   of LargeInt.int
    | FLOAT    of real
    | DOUBLE   of real
    | STRING   of string
    | VOID
    | GTYPE
    | ARRAY
    | INTERFACE
    | GLIST
    | GSLIST
    | GHASH
    | ERROR
    | UNICHAR

    type typetag_t

    structure C :
      sig
        type notnull
        type 'a p
        val withNewPtr : (notnull p -> 'a) -> unit -> (notnull p, 'a) pair
        val fromPtr : typetag_t -> notnull p -> t
      end
  end

structure GIRepositoryArgument :>
  sig
    include G_I_REPOSITORY_ARGUMENT
      where type typetag_t = GIRepositoryTypeTag.t

    structure PolyML :
      sig
        val PTR : C.notnull C.p CInterface.Conversion
        val OPTPTR : unit C.p CInterface.Conversion
      end
  end =
  struct
    type notnull = CPointer.notnull
    type 'a p = 'a CPointer.t
    val PTR = CPointer.PolyML.POINTER : notnull p CInterface.Conversion
    val OPTPTR = CPointer.PolyML.POINTER : unit p CInterface.Conversion

    local
      open PolyMLFFI
    in
      val new_ =
        call
          (load_sym libgiraffegirepository "giraffe_gi_argument_new")
          (FFI.PolyML.VOID --> PTR);

      val free_ =
        call
          (load_sym libgiraffegirepository "giraffe_gi_argument_free")
          (PTR --> FFI.PolyML.VOID);

      val from_boolean_ =
        call
          (load_sym libgiraffegirepository "giraffe_gi_argument_from_boolean")
          (PTR --> FFI.PolyML.Bool.VAL);

      val from_int8_ =
        call
          (load_sym libgiraffegirepository "giraffe_gi_argument_from_int8")
          (PTR --> FFI.PolyML.Int8.VAL);

      val from_uint8_ =
        call
          (load_sym libgiraffegirepository "giraffe_gi_argument_from_uint8")
          (PTR --> FFI.PolyML.Word8.VAL);

      val from_int16_ =
        call
          (load_sym libgiraffegirepository "giraffe_gi_argument_from_int16")
          (PTR --> FFI.PolyML.Int16.VAL);

      val from_uint16_ =
        call
          (load_sym libgiraffegirepository "giraffe_gi_argument_from_uint16")
          (PTR --> FFI.PolyML.Word16.VAL);

      val from_int32_ =
        call
          (load_sym libgiraffegirepository "giraffe_gi_argument_from_int32")
          (PTR --> FFI.PolyML.Int32.VAL);

      val from_uint32_ =
        call
          (load_sym libgiraffegirepository "giraffe_gi_argument_from_uint32")
          (PTR --> FFI.PolyML.Word32.VAL);

      val from_int64_ =
        call
          (load_sym libgiraffegirepository "giraffe_gi_argument_from_int64")
          (PTR --> FFI.PolyML.Int64.VAL);

      val from_uint64_ =
        call
          (load_sym libgiraffegirepository "giraffe_gi_argument_from_uint64")
          (PTR --> FFI.PolyML.Word64.VAL);

      val from_float_ =
        call
          (load_sym libgiraffegirepository "giraffe_gi_argument_from_float")
          (PTR --> FFI.PolyML.Float.VAL);

      val from_double_ =
        call
          (load_sym libgiraffegirepository "giraffe_gi_argument_from_double")
          (PTR --> FFI.PolyML.Double.VAL);

      val from_string_ =
        call
          (load_sym libgiraffegirepository "giraffe_gi_argument_from_string")
          (PTR --> FFI.PolyML.String.RETPTR);
    end

    type typetag_t = GIRepositoryTypeTag.t

    datatype t =
      BOOLEAN  of bool
    | INT8     of LargeInt.int
    | UINT8    of LargeInt.int
    | INT16    of LargeInt.int
    | UINT16   of LargeInt.int
    | INT32    of LargeInt.int
    | UINT32   of LargeInt.int
    | INT64    of LargeInt.int
    | UINT64   of LargeInt.int
    | FLOAT    of real
    | DOUBLE   of real
    | STRING   of string
    | VOID
    | GTYPE
    | ARRAY
    | INTERFACE
    | GLIST
    | GSLIST
    | GHASH
    | ERROR
    | UNICHAR

    structure C =
      struct
        structure Pointer = CPointer
        type notnull = notnull
        type 'a p = 'a p

        fun withNewPtr f () =
          let
            val ptr = new_ ()
            val retVal = f ptr
          in
            ptr & retVal
          end

        fun fromPtr tag ptr =
          (
            case tag of
              GIRepositoryTypeTag.BOOLEAN  => BOOLEAN (from_boolean_ ptr)
            | GIRepositoryTypeTag.INT8     => INT8    (from_int8_ ptr)
            | GIRepositoryTypeTag.UINT8    => UINT8   (from_uint8_ ptr)
            | GIRepositoryTypeTag.INT16    => INT16   (from_int16_ ptr)
            | GIRepositoryTypeTag.UINT16   => UINT16  (from_uint16_ ptr)
            | GIRepositoryTypeTag.INT32    => INT32   (from_int32_ ptr)
            | GIRepositoryTypeTag.UINT32   => UINT32  (from_uint32_ ptr)
            | GIRepositoryTypeTag.INT64    => INT64   (from_int64_ ptr)
            | GIRepositoryTypeTag.UINT64   => UINT64  (from_uint64_ ptr)
            | GIRepositoryTypeTag.FLOAT    => FLOAT   (from_float_ ptr)
            | GIRepositoryTypeTag.DOUBLE   => DOUBLE  (from_double_ ptr)
            | GIRepositoryTypeTag.UTF8     => STRING (
                FFI.String.fromPtr true (from_string_ ptr)
              )
            | GIRepositoryTypeTag.FILENAME => STRING (
                FFI.String.fromPtr true (from_string_ ptr)
              )
            | GIRepositoryTypeTag.VOID      => VOID
            | GIRepositoryTypeTag.GTYPE     => GTYPE
            | GIRepositoryTypeTag.ARRAY     => ARRAY
            | GIRepositoryTypeTag.INTERFACE => INTERFACE
            | GIRepositoryTypeTag.GLIST     => GLIST
            | GIRepositoryTypeTag.GSLIST    => GSLIST
            | GIRepositoryTypeTag.GHASH     => GHASH
            | GIRepositoryTypeTag.ERROR     => ERROR
            | GIRepositoryTypeTag.UNICHAR   => UNICHAR
          ) before free_ ptr
      end

    structure PolyML =
      struct
        val PTR = PTR
        val OPTPTR = OPTPTR
      end
  end



signature G_I_REPOSITORY_CONSTANT_INFO =
  sig
    type 'a class_t
    type 'a typeinfoclass_t
    type argument_t
    val getType : 'a class_t -> base typeinfoclass_t
    val getValue : 'a class_t -> argument_t
  end

structure GIRepositoryConstantInfo :>
  G_I_REPOSITORY_CONSTANT_INFO
    where type 'a class_t = 'a GIRepositoryConstantInfoClass.t
    where type 'a typeinfoclass_t = 'a GIRepositoryTypeInfoClass.t
    where type argument_t = GIRepositoryArgument.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ =
        call
          (load_sym libgirepository "g_constant_info_get_type")
          (GIRepositoryBaseInfoClass.PolyML.PTR --> GIRepositoryBaseInfoClass.PolyML.PTR);

      val getValue_ =
        call
          (load_sym libgirepository "g_constant_info_get_value")
          (GIRepositoryBaseInfoClass.PolyML.PTR
            &&> GIRepositoryArgument.PolyML.PTR
            --> FFI.PolyML.Int32.VAL);
    end


    type 'a class_t = 'a GIRepositoryConstantInfoClass.t
    type 'a typeinfoclass_t = 'a GIRepositoryTypeInfoClass.t
    type argument_t = GIRepositoryArgument.t


    val getType =
      fn info =>
        (GIRepositoryBaseInfoClass.C.withPtr ---> GIRepositoryTypeInfoClass.C.fromPtr true)
          getType_
          info

    val getValue =
      fn info =>
        let
          val tag = GIRepositoryTypeInfo.getTag (getType info)
          val value & _ =
            (GIRepositoryBaseInfoClass.C.withPtr
              &&&> GIRepositoryArgument.C.withNewPtr
              ---> GIRepositoryArgument.C.fromPtr tag && I)
              getValue_
              (info & ())
        in
          value
        end
  end



signature G_I_REPOSITORY_REGISTERED_TYPE_INFO =
  sig
    type 'a class_t
    val getTypeName : 'a class_t -> string option
    val getTypeInit : 'a class_t -> string option
    val getGType : 'a class_t -> GObject.Type.t
  end

structure GIRepositoryRegisteredTypeInfo :>
  G_I_REPOSITORY_REGISTERED_TYPE_INFO
    where type 'a class_t = 'a GIRepositoryRegisteredTypeInfoClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getTypeName_ =
        call
          (load_sym libgirepository "g_registered_type_info_get_type_name")
          (GIRepositoryBaseInfoClass.PolyML.PTR --> FFI.PolyML.String.RETOPTPTR);

      val getTypeInit_ =
        call
          (load_sym libgirepository "g_registered_type_info_get_type_init")
          (GIRepositoryBaseInfoClass.PolyML.PTR --> FFI.PolyML.String.RETOPTPTR);

      val getGType_ =
        call
          (load_sym libgirepository "g_registered_type_info_get_g_type")
          (GIRepositoryBaseInfoClass.PolyML.PTR --> GObjectType.PolyML.VAL);
    end


    type 'a class_t = 'a GIRepositoryRegisteredTypeInfoClass.t


    val getTypeName =
      fn info =>
        (GIRepositoryBaseInfoClass.C.withPtr ---> FFI.String.fromOptPtr false)
          getTypeName_
          info

    val getTypeInit =
      fn info =>
        (GIRepositoryBaseInfoClass.C.withPtr ---> FFI.String.fromOptPtr false)
          getTypeInit_
          info

    val getGType =
      fn info =>
        (GIRepositoryBaseInfoClass.C.withPtr ---> GObjectType.C.fromVal) getGType_ info
  end




signature G_I_REPOSITORY_VALUE_INFO =
  sig
    type 'a class_t

    (*
     * The value returned by g_value_info_get_value is representable as
     * a 32-bit signed or unsigned value.  The C function returns a gint64
     * to allow a value from the range of either a 32-bit signed or
     * unsigned values.
     *
     * For values in the range of both 32-bit signed and unsigned values,
     * it is not possible to determine the range of the source value: the
     * caller must know.  If the source range is known, there is no need to
     * know the most significant 32 bits of the result.
     *
     * To avoid 64 bit issues, two interfaces to g_value_info_get_value are
     * provided returning 32 bit signed and unsigned values.
     *)
    val getValueInt : 'a class_t -> LargeInt.int
    val getValueWord : 'a class_t -> LargeInt.int
  end

structure GIRepositoryValueInfo :>
  G_I_REPOSITORY_VALUE_INFO
    where type 'a class_t = 'a GIRepositoryValueInfoClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getValueInt_ =
        call
          (load_sym libgirepository "g_value_info_get_value")
          (GIRepositoryBaseInfoClass.PolyML.PTR --> FFI.PolyML.Int32.VAL);

      val getValueWord_ =
        call
          (load_sym libgirepository "g_value_info_get_value")
          (GIRepositoryBaseInfoClass.PolyML.PTR --> FFI.PolyML.Word32.VAL);
    end


    type 'a class_t = 'a GIRepositoryValueInfoClass.t


    fun getValueInt info =
      (GIRepositoryBaseInfoClass.C.withPtr ---> FFI.Int32.fromVal) getValueInt_ info

    fun getValueWord info =
      (GIRepositoryBaseInfoClass.C.withPtr ---> FFI.Word32.fromVal) getValueWord_ info
  end



signature G_I_REPOSITORY_DIRECTION =
  sig
    datatype t =
      IN
    | OUT
    | INOUT
    structure C :
      sig
        type val_
        type ref_
        val withVal :
          (val_ -> 'a)
           -> t
           -> 'a
        val withRefVal :
          (ref_ -> 'a)
           -> t
           -> (val_, 'a) pair
        val fromVal : val_ -> t
        exception Value of FFI.Enum.val_
      end
  end

structure GIRepositoryDirection :>
  sig
    include G_I_REPOSITORY_DIRECTION
    structure PolyML :
      sig
        val VAL : C.val_ CInterface.Conversion
        val REF : C.ref_ CInterface.Conversion
      end
  end =
  struct 
    datatype t =
      IN
    | OUT
    | INOUT
    structure C =
      struct
        type val_ = FFI.Enum.val_
        type ref_ = FFI.Enum.ref_
        exception Value of FFI.Enum.val_
        fun withVal f =
          fn
            IN => f 0
          | OUT => f 1
          | INOUT => f 2
        fun withRefVal f = withVal (FFI.Enum.withRef f)
        val fromVal =
          fn
            0 => IN
          | 1 => OUT
          | 2 => INOUT
          | n => raise Value n
      end
    structure PolyML =
      struct
        val VAL = FFI.PolyML.Enum.VAL
        val REF = FFI.PolyML.Enum.REF
      end
  end



signature G_I_REPOSITORY_SCOPE_TYPE =
  sig
    datatype t =
      INVALID
    | CALL
    | ASYNC
    | NOTIFIED
    structure C :
      sig
        type val_
        type ref_
        val withVal :
          (val_ -> 'a)
           -> t
           -> 'a
        val withRefVal :
          (ref_ -> 'a)
           -> t
           -> (val_, 'a) pair
        val fromVal : val_ -> t
        exception Value of FFI.Enum.val_
      end
  end

structure GIRepositoryScopeType :>
  sig
    include G_I_REPOSITORY_SCOPE_TYPE
    structure PolyML :
      sig
        val VAL : C.val_ CInterface.Conversion
        val REF : C.ref_ CInterface.Conversion
      end
  end =
  struct 
    datatype t =
      INVALID
    | CALL
    | ASYNC
    | NOTIFIED
    structure C =
      struct
        type val_ = FFI.Enum.val_
        type ref_ = FFI.Enum.ref_
        exception Value of FFI.Enum.val_
        fun withVal f =
          fn
            INVALID => f 0
          | CALL => f 1
          | ASYNC => f 2
          | NOTIFIED => f 3
        fun withRefVal f = withVal (FFI.Enum.withRef f)
        val fromVal =
          fn
            0 => INVALID
          | 1 => CALL
          | 2 => ASYNC
          | 3 => NOTIFIED
          | n => raise Value n
      end
    structure PolyML =
      struct
        val VAL = FFI.PolyML.Enum.VAL
        val REF = FFI.PolyML.Enum.REF
      end
  end



signature G_I_REPOSITORY_TRANSFER =
  sig
    datatype t =
      NOTHING
    | CONTAINER
    | EVERYTHING
    structure C :
      sig
        type val_
        type ref_
        val withVal :
          (val_ -> 'a)
           -> t
           -> 'a
        val withRefVal :
          (ref_ -> 'a)
           -> t
           -> (val_, 'a) pair
        val fromVal : val_ -> t
        exception Value of FFI.Enum.val_
      end
  end

structure GIRepositoryTransfer :>
  sig
    include G_I_REPOSITORY_TRANSFER
    structure PolyML :
      sig
        val VAL : C.val_ CInterface.Conversion
        val REF : C.ref_ CInterface.Conversion
      end
  end =
  struct 
    datatype t =
      NOTHING
    | CONTAINER
    | EVERYTHING
    structure C =
      struct
        type val_ = FFI.Enum.val_
        type ref_ = FFI.Enum.ref_
        exception Value of FFI.Enum.val_
        fun withVal f =
          fn
            NOTHING => f 0
          | CONTAINER => f 1
          | EVERYTHING => f 2
        fun withRefVal f = withVal (FFI.Enum.withRef f)
        val fromVal =
          fn
            0 => NOTHING
          | 1 => CONTAINER
          | 2 => EVERYTHING
          | n => raise Value n
      end
    structure PolyML =
      struct
        val VAL = FFI.PolyML.Enum.VAL
        val REF = FFI.PolyML.Enum.REF
      end
  end



signature G_I_REPOSITORY_ARG_INFO =
  sig
    type 'a class_t
    type 'a typeinfoclass_t
    type direction_t
    type scopetype_t
    type transfer_t
    val getDirection : 'a class_t -> direction_t
    val isCallerAllocates : 'a class_t -> bool
    val isReturnValue : 'a class_t -> bool
    val isOptional : 'a class_t -> bool
    val mayBeNull : 'a class_t -> bool
    val getOwnershipTransfer : 'a class_t -> transfer_t
    val getScope : 'a class_t -> scopetype_t
    val getClosure : 'a class_t -> LargeInt.int option
    val getDestroy : 'a class_t -> LargeInt.int option
    val getType : 'a class_t -> base typeinfoclass_t
  end

structure GIRepositoryArgInfo :>
  G_I_REPOSITORY_ARG_INFO
    where type 'a class_t = 'a GIRepositoryArgInfoClass.t
    where type 'a typeinfoclass_t = 'a GIRepositoryTypeInfoClass.t
    where type direction_t = GIRepositoryDirection.t
    where type scopetype_t = GIRepositoryScopeType.t
    where type transfer_t = GIRepositoryTransfer.t =
  struct
    local
      open PolyMLFFI
    in
      val getDirection_ =
        call
          (load_sym libgirepository "g_arg_info_get_direction")
          (GIRepositoryBaseInfoClass.PolyML.PTR --> GIRepositoryDirection.PolyML.VAL);

      val isCallerAllocates_ =
        call
          (load_sym libgirepository "g_arg_info_is_caller_allocates")
          (GIRepositoryBaseInfoClass.PolyML.PTR --> FFI.PolyML.Bool.VAL);

      val isReturnValue_ =
        call
          (load_sym libgirepository "g_arg_info_is_return_value")
          (GIRepositoryBaseInfoClass.PolyML.PTR --> FFI.PolyML.Bool.VAL);

      val isOptional_ =
        call
          (load_sym libgirepository "g_arg_info_is_optional")
          (GIRepositoryBaseInfoClass.PolyML.PTR --> FFI.PolyML.Bool.VAL);

      val mayBeNull_ =
        call
          (load_sym libgirepository "g_arg_info_may_be_null")
          (GIRepositoryBaseInfoClass.PolyML.PTR --> FFI.PolyML.Bool.VAL);

      val getOwnershipTransfer_ =
        call
          (load_sym libgirepository "g_arg_info_get_ownership_transfer")
          (GIRepositoryBaseInfoClass.PolyML.PTR --> GIRepositoryTransfer.PolyML.VAL);

      val getScope_ =
        call
          (load_sym libgirepository "g_arg_info_get_scope")
          (GIRepositoryBaseInfoClass.PolyML.PTR --> GIRepositoryScopeType.PolyML.VAL);

      val getClosure_ =
        call
          (load_sym libgirepository "g_arg_info_get_closure")
          (GIRepositoryBaseInfoClass.PolyML.PTR --> FFI.PolyML.Int32.VAL);

      val getDestroy_ =
        call
          (load_sym libgirepository "g_arg_info_get_destroy")
          (GIRepositoryBaseInfoClass.PolyML.PTR --> FFI.PolyML.Int32.VAL);

      val getType_ =
        call
          (load_sym libgirepository "g_arg_info_get_type")
          (GIRepositoryBaseInfoClass.PolyML.PTR --> GIRepositoryBaseInfoClass.PolyML.PTR);
    end


    type 'a class_t = 'a GIRepositoryArgInfoClass.t
    type 'a typeinfoclass_t = 'a GIRepositoryTypeInfoClass.t
    type direction_t = GIRepositoryDirection.t
    type scopetype_t = GIRepositoryScopeType.t
    type transfer_t = GIRepositoryTransfer.t


    val getDirection =
      fn info =>
        (GIRepositoryBaseInfoClass.C.withPtr ---> GIRepositoryDirection.C.fromVal) getDirection_ info

    val isCallerAllocates =
      fn info =>
        (GIRepositoryBaseInfoClass.C.withPtr ---> I) isCallerAllocates_ info

    val isReturnValue =
      fn info =>
        (GIRepositoryBaseInfoClass.C.withPtr ---> I) isReturnValue_ info

    val isOptional =
      fn info =>
        (GIRepositoryBaseInfoClass.C.withPtr ---> I) isOptional_ info

    val mayBeNull =
      fn info =>
        (GIRepositoryBaseInfoClass.C.withPtr ---> I) mayBeNull_ info

    val getOwnershipTransfer =
      fn info =>
        (GIRepositoryBaseInfoClass.C.withPtr ---> GIRepositoryTransfer.C.fromVal)
          getOwnershipTransfer_
          info

    val getScope =
      fn info =>
        (GIRepositoryBaseInfoClass.C.withPtr ---> GIRepositoryScopeType.C.fromVal) getScope_ info

    val getClosure =
      fn info =>
        (GIRepositoryBaseInfoClass.C.withPtr ---> (fn ~1 => NONE | n => SOME n))
          getClosure_
          info

    val getDestroy =
      fn info =>
        (GIRepositoryBaseInfoClass.C.withPtr ---> (fn ~1 => NONE | n => SOME n))
          getDestroy_
          info

    val getType =
      fn info =>
        (GIRepositoryBaseInfoClass.C.withPtr ---> GIRepositoryTypeInfoClass.C.fromPtr true)
          getType_
          info
  end



signature G_I_REPOSITORY_CALLABLE_INFO =
  sig
    type 'a class_t
    type 'a arginfoclass_t
    type 'a typeinfoclass_t
    type transfer_t
    val getReturnType : 'a class_t -> base typeinfoclass_t
    val getCallerOwns : 'a class_t -> transfer_t
    val mayReturnNull : 'a class_t -> bool
    val getReturnAttribute : 'a class_t -> string -> string option
    val getNArgs : 'a class_t -> LargeInt.int
    val getArg : 'a class_t -> LargeInt.int -> base arginfoclass_t
  end

structure GIRepositoryCallableInfo :>
  G_I_REPOSITORY_CALLABLE_INFO
    where type 'a class_t = 'a GIRepositoryCallableInfoClass.t
    where type 'a typeinfoclass_t = 'a GIRepositoryTypeInfoClass.t
    where type transfer_t = GIRepositoryTransfer.t
    where type 'a arginfoclass_t = 'a GIRepositoryArgInfoClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getReturnType_ =
        call
          (load_sym libgirepository "g_callable_info_get_return_type")
          (GIRepositoryBaseInfoClass.PolyML.PTR --> GIRepositoryBaseInfoClass.PolyML.PTR);

      val getCallerOwns_ =
        call
          (load_sym libgirepository "g_callable_info_get_caller_owns")
          (GIRepositoryBaseInfoClass.PolyML.PTR --> GIRepositoryTransfer.PolyML.VAL);

      val mayReturnNull_ =
        call
          (load_sym libgirepository "g_callable_info_may_return_null")
          (GIRepositoryBaseInfoClass.PolyML.PTR --> FFI.PolyML.Bool.VAL);

      val getReturnAttribute_ =
        call
          (load_sym libgirepository "g_callable_info_get_return_attribute")
          (GIRepositoryBaseInfoClass.PolyML.PTR
            &&> FFI.PolyML.String.INPTR
            --> FFI.PolyML.String.RETPTR);

      val getNArgs_ =
        call
          (load_sym libgirepository "g_callable_info_get_n_args")
          (GIRepositoryBaseInfoClass.PolyML.PTR --> FFI.PolyML.Int32.VAL);

      val getArg_ =
        call
          (load_sym libgirepository "g_callable_info_get_arg")
          (GIRepositoryBaseInfoClass.PolyML.PTR
            &&> FFI.PolyML.Int32.VAL
            --> GIRepositoryBaseInfoClass.PolyML.PTR);
    end


    type 'a class_t = 'a GIRepositoryCallableInfoClass.t
    type 'a arginfoclass_t = 'a GIRepositoryArgInfoClass.t
    type 'a typeinfoclass_t = 'a GIRepositoryTypeInfoClass.t
    type transfer_t = GIRepositoryTransfer.t


    val getReturnType =
      fn info =>
        (GIRepositoryBaseInfoClass.C.withPtr ---> GIRepositoryTypeInfoClass.C.fromPtr true)
          getReturnType_
          info

    val getCallerOwns =
      fn info =>
        (GIRepositoryBaseInfoClass.C.withPtr ---> GIRepositoryTransfer.C.fromVal)
          getCallerOwns_
          info

    val mayReturnNull =
      fn info => (GIRepositoryBaseInfoClass.C.withPtr ---> I) mayReturnNull_ info

    val getReturnAttribute =
      fn info => fn name =>
        (GIRepositoryBaseInfoClass.C.withPtr
          &&&> FFI.String.withConstPtr
          ---> FFI.String.fromOptPtr false)
          getReturnAttribute_
          (info & name)

    val getNArgs =
      fn info => (GIRepositoryBaseInfoClass.C.withPtr ---> I) getNArgs_ info

    val getArg =
      fn info => fn n =>
        (GIRepositoryBaseInfoClass.C.withPtr &&&> I ---> GIRepositoryArgInfoClass.C.fromPtr true)
          getArg_
          (info & n)
  end



signature G_I_REPOSITORY_PROPERTY_INFO =
  sig
    type 'a class_t
    type 'a typeinfoclass_t
    type transfer_t
    val getFlags : 'a class_t -> GObject.ParamFlags.flags
    val getType : 'a class_t -> base typeinfoclass_t
    val getOwnershipTransfer : 'a class_t -> transfer_t
  end

structure GIRepositoryPropertyInfo :>
  G_I_REPOSITORY_PROPERTY_INFO
    where type 'a class_t = 'a GIRepositoryPropertyInfoClass.t
    where type 'a typeinfoclass_t = 'a GIRepositoryTypeInfoClass.t
    where type transfer_t = GIRepositoryTransfer.t =
  struct
    local
      open PolyMLFFI
    in
      val getFlags_ =
        call
          (load_sym libgirepository "g_property_info_get_flags")
          (GIRepositoryBaseInfoClass.PolyML.PTR --> GObjectParamFlags.PolyML.VAL);

      val getType_ =
        call
          (load_sym libgirepository "g_property_info_get_type")
          (GIRepositoryBaseInfoClass.PolyML.PTR --> GIRepositoryBaseInfoClass.PolyML.PTR);

      val getOwnershipTransfer_ =
        call
          (load_sym
             libgirepository
             "g_property_info_get_ownership_transfer")
          (GIRepositoryBaseInfoClass.PolyML.PTR --> GIRepositoryTransfer.PolyML.VAL);
    end


    type 'a class_t = 'a GIRepositoryPropertyInfoClass.t
    type 'a typeinfoclass_t = 'a GIRepositoryTypeInfoClass.t
    type transfer_t = GIRepositoryTransfer.t


    val getFlags =
      fn info =>
        (GIRepositoryBaseInfoClass.C.withPtr ---> GObjectParamFlags.C.fromVal)
          getFlags_
          info

    val getType =
      fn info =>
        (GIRepositoryBaseInfoClass.C.withPtr ---> GIRepositoryTypeInfoClass.C.fromPtr true)
          getType_
          info

    val getOwnershipTransfer =
      fn info =>
        (GIRepositoryBaseInfoClass.C.withPtr ---> GIRepositoryTransfer.C.fromVal)
        getOwnershipTransfer_
        info
  end



signature G_I_REPOSITORY_FUNCTION_INFO =
  sig
    type 'a class_t
    type 'a propertyinfoclass_t
    type 'a vfuncinfoclass_t
    type functioninfoflags_t
    val getSymbol : 'a class_t -> string
    val getFlags : 'a class_t -> functioninfoflags_t
    val getProperty : 'a class_t -> base propertyinfoclass_t
    val getVfunc : 'a class_t -> base vfuncinfoclass_t
  end

structure GIRepositoryFunctionInfo :>
  G_I_REPOSITORY_FUNCTION_INFO
    where type 'a class_t = 'a GIRepositoryFunctionInfoClass.t
    where type 'a propertyinfoclass_t = 'a GIRepositoryPropertyInfoClass.t
    where type 'a vfuncinfoclass_t = 'a GIRepositoryVFuncInfoClass.t
    where type functioninfoflags_t = GIRepositoryFunctionInfoFlags.flags =
  struct
    local
      open PolyMLFFI
    in
      val getSymbol_ =
        call
          (load_sym libgirepository "g_function_info_get_symbol")
          (GIRepositoryBaseInfoClass.PolyML.PTR --> FFI.PolyML.String.RETPTR);

      val getFlags_ =
        call
          (load_sym libgirepository "g_function_info_get_flags")
          (GIRepositoryBaseInfoClass.PolyML.PTR --> GIRepositoryFunctionInfoFlags.PolyML.VAL);

      val getProperty_ =
        call
          (load_sym libgirepository "g_function_info_get_property")
          (GIRepositoryBaseInfoClass.PolyML.PTR --> GIRepositoryBaseInfoClass.PolyML.PTR);

      val getVfunc_ =
        call
          (load_sym libgirepository "g_function_info_get_vfunc")
          (GIRepositoryBaseInfoClass.PolyML.PTR --> GIRepositoryBaseInfoClass.PolyML.PTR);
    end


    type 'a class_t = 'a GIRepositoryFunctionInfoClass.t
    type 'a propertyinfoclass_t = 'a GIRepositoryPropertyInfoClass.t
    type 'a vfuncinfoclass_t = 'a GIRepositoryVFuncInfoClass.t
    type functioninfoflags_t = GIRepositoryFunctionInfoFlags.flags


    val getSymbol =
      fn info =>
        (GIRepositoryBaseInfoClass.C.withPtr ---> FFI.String.fromPtr false)
          getSymbol_
          info

    val getFlags =
      fn info => (GIRepositoryBaseInfoClass.C.withPtr ---> GIRepositoryFunctionInfoFlags.C.fromVal)
        getFlags_
        info

    val getProperty =
      fn info =>
        (GIRepositoryBaseInfoClass.C.withPtr ---> GIRepositoryPropertyInfoClass.C.fromPtr true)
          getProperty_
          info

    val getVfunc =
      fn info =>
        (GIRepositoryBaseInfoClass.C.withPtr ---> GIRepositoryVFuncInfoClass.C.fromPtr true)
          getVfunc_
          info
  end



signature G_I_REPOSITORY_SIGNAL_INFO =
  sig
    type 'a class_t
    type 'a vfuncinfoclass_t
    val getFlags : 'a class_t -> GObject.SignalFlags.flags
    val getClassClosure : 'a class_t -> base vfuncinfoclass_t
    val trueStopsEmit : 'a class_t -> bool
  end

structure GIRepositorySignalInfo :>
  G_I_REPOSITORY_SIGNAL_INFO
    where type 'a class_t = 'a GIRepositorySignalInfoClass.t
    where type 'a vfuncinfoclass_t = 'a GIRepositoryVFuncInfoClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getFlags_ =
        call
          (load_sym libgirepository "g_signal_info_get_flags")
          (GIRepositoryBaseInfoClass.PolyML.PTR --> GObjectSignalFlags.PolyML.VAL);

      val getClassClosure_ =
        call
          (load_sym libgirepository "g_signal_info_get_class_closure")
          (GIRepositoryBaseInfoClass.PolyML.PTR --> GIRepositoryBaseInfoClass.PolyML.PTR);

      val trueStopsEmit_ =
        call
          (load_sym libgirepository "g_signal_info_true_stops_emit")
          (GIRepositoryBaseInfoClass.PolyML.PTR --> FFI.PolyML.Bool.VAL);
    end


    type 'a class_t = 'a GIRepositorySignalInfoClass.t
    type 'a vfuncinfoclass_t = 'a GIRepositoryVFuncInfoClass.t


    val getFlags =
      fn info =>
        (GIRepositoryBaseInfoClass.C.withPtr ---> GObjectSignalFlags.C.fromVal)
          getFlags_
          info

    val getClassClosure =
      fn info =>
        (GIRepositoryBaseInfoClass.C.withPtr ---> GIRepositoryVFuncInfoClass.C.fromPtr true)
          getClassClosure_
          info

    val trueStopsEmit =
      fn info => (GIRepositoryBaseInfoClass.C.withPtr ---> I) trueStopsEmit_ info
  end



signature G_I_REPOSITORY_VFUNC_INFO =
  sig
    type 'a class_t
    type 'a functioninfoclass_t
    type 'a signalinfoclass_t
    type vfuncinfoflags_t
    val getFlags : 'a class_t -> vfuncinfoflags_t
    val getOffset : 'a class_t -> LargeInt.int
    val getSignal : 'a class_t -> base signalinfoclass_t
    val getInvoker : 'a class_t -> base functioninfoclass_t
  end

structure GIRepositoryVFuncInfo :>
  G_I_REPOSITORY_VFUNC_INFO
    where type 'a class_t = 'a GIRepositoryVFuncInfoClass.t
    where type 'a functioninfoclass_t = 'a GIRepositoryFunctionInfoClass.t
    where type 'a signalinfoclass_t = 'a GIRepositorySignalInfoClass.t
    where type vfuncinfoflags_t = GIRepositoryVFuncInfoFlags.flags =
  struct
    local
      open PolyMLFFI
    in
      val getFlags_ =
        call
          (load_sym libgirepository "g_vfunc_info_get_flags")
          (GIRepositoryBaseInfoClass.PolyML.PTR --> GIRepositoryVFuncInfoFlags.PolyML.VAL);

      val getOffset_ =
        call
          (load_sym libgirepository "g_vfunc_info_get_offset")
          (GIRepositoryBaseInfoClass.PolyML.PTR --> FFI.PolyML.Int32.VAL);

      val getSignal_ =
        call
          (load_sym libgirepository "g_vfunc_info_get_signal")
          (GIRepositoryBaseInfoClass.PolyML.PTR --> GIRepositoryBaseInfoClass.PolyML.PTR);

      val getInvoker_ =
        call
          (load_sym libgirepository "g_vfunc_info_get_invoker")
          (GIRepositoryBaseInfoClass.PolyML.PTR --> GIRepositoryBaseInfoClass.PolyML.PTR);
    end


    type 'a class_t = 'a GIRepositoryVFuncInfoClass.t
    type 'a functioninfoclass_t = 'a GIRepositoryFunctionInfoClass.t
    type 'a signalinfoclass_t = 'a GIRepositorySignalInfoClass.t
    type vfuncinfoflags_t = GIRepositoryVFuncInfoFlags.flags


    val getFlags =
      fn info => (GIRepositoryBaseInfoClass.C.withPtr ---> GIRepositoryVFuncInfoFlags.C.fromVal)
        getFlags_
        info

    val getOffset =
      fn info => (GIRepositoryBaseInfoClass.C.withPtr ---> I) getOffset_ info

    val getSignal =
      fn info =>
        (GIRepositoryBaseInfoClass.C.withPtr ---> GIRepositorySignalInfoClass.C.fromPtr true)
          getSignal_
          info

    val getInvoker =
      fn info =>
        (GIRepositoryBaseInfoClass.C.withPtr ---> GIRepositoryFunctionInfoClass.C.fromPtr true)
          getInvoker_
          info
  end



signature G_I_REPOSITORY_FIELD_INFO =
  sig
    type 'a class_t
    type 'a typeinfoclass_t
    type fieldinfoflags_t
    val getFlags : 'a class_t -> fieldinfoflags_t
    val getSize : 'a class_t -> LargeInt.int
    val getOffset : 'a class_t -> LargeInt.int
    val getType : 'a class_t -> base typeinfoclass_t
  end

structure GIRepositoryFieldInfo :>
  G_I_REPOSITORY_FIELD_INFO
    where type 'a class_t = 'a GIRepositoryFieldInfoClass.t
    where type 'a typeinfoclass_t = 'a GIRepositoryTypeInfoClass.t
    where type fieldinfoflags_t = GIRepositoryFieldInfoFlags.flags =
  struct
    local
      open PolyMLFFI
    in
      val getFlags_ =
        call
          (load_sym libgirepository "g_field_info_get_flags")
          (GIRepositoryBaseInfoClass.PolyML.PTR --> GIRepositoryFieldInfoFlags.PolyML.VAL);

      val getSize_ =
        call
          (load_sym libgirepository "g_field_info_get_size")
          (GIRepositoryBaseInfoClass.PolyML.PTR --> FFI.PolyML.Int32.VAL);

      val getOffset_ =
        call
          (load_sym libgirepository "g_field_info_get_offset")
          (GIRepositoryBaseInfoClass.PolyML.PTR --> FFI.PolyML.Int32.VAL);

      val getType_ =
        call
          (load_sym libgirepository "g_field_info_get_type")
          (GIRepositoryBaseInfoClass.PolyML.PTR --> GIRepositoryBaseInfoClass.PolyML.PTR);
    end


    type 'a class_t = 'a GIRepositoryFieldInfoClass.t
    type 'a typeinfoclass_t = 'a GIRepositoryTypeInfoClass.t
    type fieldinfoflags_t = GIRepositoryFieldInfoFlags.flags


    val getFlags =
      fn info =>
        (GIRepositoryBaseInfoClass.C.withPtr ---> GIRepositoryFieldInfoFlags.C.fromVal) getFlags_ info

    val getSize = fn info => (GIRepositoryBaseInfoClass.C.withPtr ---> I) getSize_ info

    val getOffset = fn info => (GIRepositoryBaseInfoClass.C.withPtr ---> I) getOffset_ info

    val getType =
      fn info =>
        (GIRepositoryBaseInfoClass.C.withPtr ---> GIRepositoryTypeInfoClass.C.fromPtr true)
          getType_
          info
  end



signature G_I_REPOSITORY_STRUCT_INFO =
  sig
    type 'a class_t
    type 'a fieldinfoclass_t
    type 'a functioninfoclass_t
    val getNFields : 'a class_t -> LargeInt.int
    val getField : 'a class_t -> LargeInt.int -> base fieldinfoclass_t
    val getNMethods : 'a class_t -> LargeInt.int
    val getMethod : 'a class_t -> LargeInt.int -> base functioninfoclass_t
    val findMethod : 'a class_t -> string -> base functioninfoclass_t
    val getSize : 'a class_t -> LargeInt.int
    val getAlignment : 'a class_t -> LargeInt.int
    val isGtypeStruct : 'a class_t -> bool
    val isForeign : 'a class_t -> bool
  end

structure GIRepositoryStructInfo :>
  G_I_REPOSITORY_STRUCT_INFO
    where type 'a class_t = 'a GIRepositoryStructInfoClass.t
    where type 'a fieldinfoclass_t = 'a GIRepositoryFieldInfoClass.t
    where type 'a functioninfoclass_t = 'a GIRepositoryFunctionInfoClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getNFields_ =
        call
          (load_sym libgirepository "g_struct_info_get_n_fields")
          (GIRepositoryBaseInfoClass.PolyML.PTR --> FFI.PolyML.Int32.VAL);

      val getField_ =
        call
          (load_sym libgirepository "g_struct_info_get_field")
          (GIRepositoryBaseInfoClass.PolyML.PTR
            &&> FFI.PolyML.Int32.VAL
            --> GIRepositoryBaseInfoClass.PolyML.PTR);

      val getNMethods_ =
        call
          (load_sym libgirepository "g_struct_info_get_n_methods")
          (GIRepositoryBaseInfoClass.PolyML.PTR --> FFI.PolyML.Int32.VAL);

      val getMethod_ =
        call
          (load_sym libgirepository "g_struct_info_get_method")
          (GIRepositoryBaseInfoClass.PolyML.PTR
            &&> FFI.PolyML.Int32.VAL
            --> GIRepositoryBaseInfoClass.PolyML.PTR);

      val findMethod_ =
        call
          (load_sym libgirepository "g_struct_info_find_method")
          (GIRepositoryBaseInfoClass.PolyML.PTR
            &&> FFI.PolyML.String.INPTR
            --> GIRepositoryBaseInfoClass.PolyML.PTR);

      val getSize_ =
        call
          (load_sym libgirepository "g_struct_info_get_size")
          (GIRepositoryBaseInfoClass.PolyML.PTR --> FFI.PolyML.LongWord.VAL);

      val getAlignment_ =
        call
          (load_sym libgirepository "g_struct_info_get_alignment")
          (GIRepositoryBaseInfoClass.PolyML.PTR --> FFI.PolyML.LongWord.VAL);

      val isGtypeStruct_ =
        call
          (load_sym libgirepository "g_struct_info_is_gtype_struct")
          (GIRepositoryBaseInfoClass.PolyML.PTR --> FFI.PolyML.Bool.VAL);

      val isForeign_ =
        call
          (load_sym libgirepository "g_struct_info_is_foreign")
          (GIRepositoryBaseInfoClass.PolyML.PTR --> FFI.PolyML.Bool.VAL);
    end


    type 'a class_t = 'a GIRepositoryStructInfoClass.t
    type 'a fieldinfoclass_t = 'a GIRepositoryFieldInfoClass.t
    type 'a functioninfoclass_t = 'a GIRepositoryFunctionInfoClass.t


    val getNFields =
      fn info => (GIRepositoryBaseInfoClass.C.withPtr ---> I) getNFields_ info

    val getField =
      fn info => fn n =>
        (GIRepositoryBaseInfoClass.C.withPtr &&&> I ---> GIRepositoryFieldInfoClass.C.fromPtr true)
        getField_
        (info & n)

    val getNMethods =
      fn info => (GIRepositoryBaseInfoClass.C.withPtr ---> I) getNMethods_ info

    val getMethod =
      fn info => fn n =>
        (GIRepositoryBaseInfoClass.C.withPtr &&&> I ---> GIRepositoryFunctionInfoClass.C.fromPtr true)
        getMethod_
        (info & n)

    val findMethod =
      fn info => fn name =>
        (GIRepositoryBaseInfoClass.C.withPtr
          &&&> FFI.String.withConstPtr
          ---> GIRepositoryFunctionInfoClass.C.fromPtr true)
        findMethod_
        (info & name)

    val getSize = fn info => (GIRepositoryBaseInfoClass.C.withPtr ---> I) getSize_ info

    val getAlignment =
      fn info => (GIRepositoryBaseInfoClass.C.withPtr ---> I) getAlignment_ info

    val isGtypeStruct =
      fn info => (GIRepositoryBaseInfoClass.C.withPtr ---> I) isGtypeStruct_ info

    val isForeign =
      fn info => (GIRepositoryBaseInfoClass.C.withPtr ---> I) isForeign_ info
  end



signature G_I_REPOSITORY_UNION_INFO =
  sig
    type 'a class_t
    type 'a fieldinfoclass_t
    type 'a functioninfoclass_t
    type 'a typeinfoclass_t
    type 'a constantinfoclass_t
    val getNFields : 'a class_t -> LargeInt.int
    val getField : 'a class_t -> LargeInt.int -> base fieldinfoclass_t
    val getNMethods : 'a class_t -> LargeInt.int
    val getMethod : 'a class_t -> LargeInt.int -> base functioninfoclass_t
    val isDiscriminated : 'a class_t -> bool
    val getDiscriminatorOffset : 'a class_t -> LargeInt.int
    val getDiscriminatorType : 'a class_t -> base typeinfoclass_t
    val getDiscriminator : 'a class_t -> LargeInt.int -> base constantinfoclass_t
    val findMethod : 'a class_t -> string -> base functioninfoclass_t
    val getSize : 'a class_t -> LargeInt.int
    val getAlignment : 'a class_t -> LargeInt.int
  end

structure GIRepositoryUnionInfo :>
  G_I_REPOSITORY_UNION_INFO
    where type 'a class_t = 'a GIRepositoryUnionInfoClass.t
    where type 'a fieldinfoclass_t = 'a GIRepositoryFieldInfoClass.t
    where type 'a functioninfoclass_t = 'a GIRepositoryFunctionInfoClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getNFields_ =
        call
          (load_sym libgirepository "g_union_info_get_n_fields")
          (GIRepositoryBaseInfoClass.PolyML.PTR --> FFI.PolyML.Int32.VAL);

      val getField_ =
        call
          (load_sym libgirepository "g_union_info_get_field")
          (GIRepositoryBaseInfoClass.PolyML.PTR
            &&> FFI.PolyML.Int32.VAL
            --> GIRepositoryBaseInfoClass.PolyML.PTR);

      val getNMethods_ =
        call
          (load_sym libgirepository "g_union_info_get_n_methods")
          (GIRepositoryBaseInfoClass.PolyML.PTR --> FFI.PolyML.Int32.VAL);

      val getMethod_ =
        call
          (load_sym libgirepository "g_union_info_get_method")
          (GIRepositoryBaseInfoClass.PolyML.PTR
            &&> FFI.PolyML.Int32.VAL
            --> GIRepositoryBaseInfoClass.PolyML.PTR);

      val isDiscriminated_ =
        call
          (load_sym libgirepository "g_union_info_is_discriminated")
          (GIRepositoryBaseInfoClass.PolyML.PTR --> FFI.PolyML.Bool.VAL);

      val getDiscriminatorOffset_ =
        call
          (load_sym libgirepository "g_union_info_get_discriminator_offset")
          (GIRepositoryBaseInfoClass.PolyML.PTR --> FFI.PolyML.Int32.VAL);

      val getDiscriminatorType_ =
        call
          (load_sym libgirepository "g_union_info_get_discriminator_type")
          (GIRepositoryBaseInfoClass.PolyML.PTR --> GIRepositoryBaseInfoClass.PolyML.PTR);

      val getDiscriminator_ =
        call
          (load_sym libgirepository "g_union_info_get_discriminator")
          (GIRepositoryBaseInfoClass.PolyML.PTR
            &&> FFI.PolyML.Int32.VAL
            --> GIRepositoryBaseInfoClass.PolyML.PTR);

      val findMethod_ =
        call
          (load_sym libgirepository "g_union_info_find_method")
          (GIRepositoryBaseInfoClass.PolyML.PTR
            &&> FFI.PolyML.String.INPTR
            --> GIRepositoryBaseInfoClass.PolyML.PTR);

      val getSize_ =
        call
          (load_sym libgirepository "g_union_info_get_size")
          (GIRepositoryBaseInfoClass.PolyML.PTR --> FFI.PolyML.LongWord.VAL);

      val getAlignment_ =
        call
          (load_sym libgirepository "g_union_info_get_alignment")
          (GIRepositoryBaseInfoClass.PolyML.PTR --> FFI.PolyML.LongWord.VAL);
    end


    type 'a class_t = 'a GIRepositoryUnionInfoClass.t
    type 'a fieldinfoclass_t = 'a GIRepositoryFieldInfoClass.t
    type 'a functioninfoclass_t = 'a GIRepositoryFunctionInfoClass.t
    type 'a typeinfoclass_t = 'a GIRepositoryTypeInfoClass.t
    type 'a constantinfoclass_t = 'a GIRepositoryConstantInfoClass.t


    val getNFields =
      fn info => (GIRepositoryBaseInfoClass.C.withPtr ---> I) getNFields_ info

    val getField =
      fn info => fn n =>
        (GIRepositoryBaseInfoClass.C.withPtr &&&> I ---> GIRepositoryFieldInfoClass.C.fromPtr true)
        getField_
        (info & n)

    val getNMethods =
      fn info => (GIRepositoryBaseInfoClass.C.withPtr ---> I) getNMethods_ info

    val getMethod =
      fn info => fn n =>
        (GIRepositoryBaseInfoClass.C.withPtr &&&> I ---> GIRepositoryFunctionInfoClass.C.fromPtr true)
        getMethod_
        (info & n)

    val isDiscriminated =
      fn info => (GIRepositoryBaseInfoClass.C.withPtr ---> I) isDiscriminated_ info

    val getDiscriminatorOffset =
      fn info => (GIRepositoryBaseInfoClass.C.withPtr ---> I) getDiscriminatorOffset_ info

    val getDiscriminatorType =
      fn info =>
        (GIRepositoryBaseInfoClass.C.withPtr ---> GIRepositoryTypeInfoClass.C.fromPtr true)
        getDiscriminatorType_
        info

    val getDiscriminator =
      fn info => fn n =>
        (GIRepositoryBaseInfoClass.C.withPtr &&&> I ---> GIRepositoryConstantInfoClass.C.fromPtr true)
        getDiscriminator_
        (info & n)

    val findMethod =
      fn info => fn name =>
        (GIRepositoryBaseInfoClass.C.withPtr
          &&&> FFI.String.withConstPtr
          ---> GIRepositoryFunctionInfoClass.C.fromPtr true)
        findMethod_
        (info & name)

    val getSize = fn info => (GIRepositoryBaseInfoClass.C.withPtr ---> I) getSize_ info

    val getAlignment =
      fn info => (GIRepositoryBaseInfoClass.C.withPtr ---> I) getAlignment_ info
  end



signature G_I_REPOSITORY_ENUM_INFO =
  sig
    type 'a class_t
    type 'a valueinfoclass_t
    type 'a functioninfoclass_t
    type typetag_t
    val getNValues : 'a class_t -> LargeInt.int
    val getValue : 'a class_t -> LargeInt.int -> base valueinfoclass_t
    val getNMethods : 'a class_t -> LargeInt.int
    val getMethod : 'a class_t -> LargeInt.int -> base functioninfoclass_t
    val getStorageType : 'a class_t -> typetag_t
    val getErrorDomain : 'a class_t -> string option
  end

structure GIRepositoryEnumInfo :>
  G_I_REPOSITORY_ENUM_INFO
    where type 'a class_t = 'a GIRepositoryEnumInfoClass.t
    where type 'a valueinfoclass_t = 'a GIRepositoryValueInfoClass.t
    where type 'a functioninfoclass_t = 'a GIRepositoryFunctionInfoClass.t
    where type typetag_t = GIRepositoryTypeTag.t =
  struct
    local
      open PolyMLFFI
    in
      val getNValues_ =
        call
          (load_sym libgirepository "g_enum_info_get_n_values")
          (GIRepositoryBaseInfoClass.PolyML.PTR --> FFI.PolyML.Int32.VAL);

      val getValue_ =
        call
          (load_sym libgirepository "g_enum_info_get_value")
          (GIRepositoryBaseInfoClass.PolyML.PTR
            &&> FFI.PolyML.Int32.VAL
            --> GIRepositoryBaseInfoClass.PolyML.PTR);

      val getNMethods_ =
        call
          (load_sym libgirepository "g_enum_info_get_n_methods")
          (GIRepositoryBaseInfoClass.PolyML.PTR --> FFI.PolyML.Int32.VAL);

      val getMethod_ =
        call
          (load_sym libgirepository "g_enum_info_get_method")
          (GIRepositoryBaseInfoClass.PolyML.PTR
            &&> FFI.PolyML.Int32.VAL
            --> GIRepositoryBaseInfoClass.PolyML.PTR);

      val getStorageType_ =
        call
          (load_sym libgirepository "g_enum_info_get_storage_type")
          (GIRepositoryBaseInfoClass.PolyML.PTR --> GIRepositoryTypeTag.PolyML.VAL);

      val getErrorDomain_ =
        call
          (load_sym libgirepository "g_enum_info_get_error_domain")
          (GIRepositoryBaseInfoClass.PolyML.PTR --> FFI.PolyML.String.RETOPTPTR);
    end


    type 'a class_t = 'a GIRepositoryEnumInfoClass.t
    type 'a valueinfoclass_t = 'a GIRepositoryValueInfoClass.t
    type 'a functioninfoclass_t = 'a GIRepositoryFunctionInfoClass.t
    type typetag_t = GIRepositoryTypeTag.t


    val getNValues =
      fn info => (GIRepositoryBaseInfoClass.C.withPtr ---> I) getNValues_ info

    val getValue =
      fn info => fn n =>
        (GIRepositoryBaseInfoClass.C.withPtr &&&> I ---> GIRepositoryValueInfoClass.C.fromPtr true)
        getValue_
        (info & n)

    val getNMethods =
      fn info => (GIRepositoryBaseInfoClass.C.withPtr ---> I) getNMethods_ info

    val getMethod =
      fn info => fn n =>
        (GIRepositoryBaseInfoClass.C.withPtr &&&> I ---> GIRepositoryFunctionInfoClass.C.fromPtr true)
        getMethod_
        (info & n)

    val getStorageType =
      fn info =>
        (GIRepositoryBaseInfoClass.C.withPtr ---> GIRepositoryTypeTag.C.fromVal)
        getStorageType_
        info

    val getErrorDomain =
      fn info =>
        (GIRepositoryBaseInfoClass.C.withPtr ---> FFI.String.fromOptPtr false)
        getErrorDomain_
        info
  end



signature G_I_REPOSITORY_INTERFACE_INFO =
  sig
    type 'a class_t
    type 'a baseinfoclass_t
    type 'a propertyinfoclass_t
    type 'a functioninfoclass_t
    type 'a signalinfoclass_t
    type 'a vfuncinfoclass_t
    type 'a constantinfoclass_t
    type 'a structinfoclass_t
    val getNPrerequisites : 'a class_t -> LargeInt.int
    val getPrerequisite : 'a class_t -> LargeInt.int -> base baseinfoclass_t
    val getNProperties : 'a class_t -> LargeInt.int
    val getProperty : 'a class_t -> LargeInt.int -> base propertyinfoclass_t
    val getNMethods : 'a class_t -> LargeInt.int
    val getMethod : 'a class_t -> LargeInt.int -> base functioninfoclass_t
    val findMethod : 'a class_t -> string -> base functioninfoclass_t
    val getNSignals : 'a class_t -> LargeInt.int
    val getSignal : 'a class_t -> LargeInt.int -> base signalinfoclass_t
    val getNVfuncs : 'a class_t -> LargeInt.int
    val getVfunc : 'a class_t -> LargeInt.int -> base vfuncinfoclass_t
    val getNConstants : 'a class_t -> LargeInt.int
    val getConstant : 'a class_t -> LargeInt.int -> base constantinfoclass_t
    val getIfaceStruct : 'a class_t -> base structinfoclass_t
    val findVfunc : 'a class_t -> string -> base vfuncinfoclass_t
  end

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
    local
      open PolyMLFFI
    in
      val getNPrerequisites_ =
        call
          (load_sym libgirepository
             "g_interface_info_get_n_prerequisites")
          (GIRepositoryBaseInfoClass.PolyML.PTR --> FFI.PolyML.Int32.VAL);

      val getPrerequisite_ =
        call
          (load_sym libgirepository "g_interface_info_get_prerequisite")
          (GIRepositoryBaseInfoClass.PolyML.PTR
            &&> FFI.PolyML.Int32.VAL
            --> GIRepositoryBaseInfoClass.PolyML.PTR);

      val getNProperties_ =
        call
          (load_sym libgirepository "g_interface_info_get_n_properties")
          (GIRepositoryBaseInfoClass.PolyML.PTR --> FFI.PolyML.Int32.VAL);

      val getProperty_ =
        call
          (load_sym libgirepository "g_interface_info_get_property")
          (GIRepositoryBaseInfoClass.PolyML.PTR
            &&> FFI.PolyML.Int32.VAL
            --> GIRepositoryBaseInfoClass.PolyML.PTR);

      val getNMethods_ =
        call
          (load_sym libgirepository "g_interface_info_get_n_methods")
          (GIRepositoryBaseInfoClass.PolyML.PTR --> FFI.PolyML.Int32.VAL);

      val getMethod_ =
        call
          (load_sym libgirepository "g_interface_info_get_method")
          (GIRepositoryBaseInfoClass.PolyML.PTR
            &&> FFI.PolyML.Int32.VAL
            --> GIRepositoryBaseInfoClass.PolyML.PTR);

      val findMethod_ =
        call
          (load_sym libgirepository "g_interface_info_find_method")
          (GIRepositoryBaseInfoClass.PolyML.PTR
            &&> FFI.PolyML.String.INPTR
            --> GIRepositoryBaseInfoClass.PolyML.PTR);

      val getNSignals_ =
        call
          (load_sym libgirepository "g_interface_info_get_n_signals")
          (GIRepositoryBaseInfoClass.PolyML.PTR --> FFI.PolyML.Int32.VAL);

      val getSignal_ =
        call
          (load_sym libgirepository "g_interface_info_get_signal")
          (GIRepositoryBaseInfoClass.PolyML.PTR
            &&> FFI.PolyML.Int32.VAL
            --> GIRepositoryBaseInfoClass.PolyML.PTR);

      val getNVfuncs_ =
        call
          (load_sym libgirepository "g_interface_info_get_n_vfuncs")
          (GIRepositoryBaseInfoClass.PolyML.PTR --> FFI.PolyML.Int32.VAL);

      val getVfunc_ =
        call
          (load_sym libgirepository "g_interface_info_get_vfunc")
          (GIRepositoryBaseInfoClass.PolyML.PTR
            &&> FFI.PolyML.Int32.VAL
            --> GIRepositoryBaseInfoClass.PolyML.PTR);

      val getNConstants_ =
        call
          (load_sym libgirepository "g_interface_info_get_n_constants")
          (GIRepositoryBaseInfoClass.PolyML.PTR --> FFI.PolyML.Int32.VAL);

      val getConstant_ =
        call
          (load_sym libgirepository "g_interface_info_get_constant")
          (GIRepositoryBaseInfoClass.PolyML.PTR
            &&> FFI.PolyML.Int32.VAL
            --> GIRepositoryBaseInfoClass.PolyML.PTR);

      val getIfaceStruct_ =
        call
          (load_sym libgirepository "g_interface_info_get_iface_struct")
          (GIRepositoryBaseInfoClass.PolyML.PTR --> GIRepositoryBaseInfoClass.PolyML.PTR);

      val findVfunc_ =
        call
          (load_sym libgirepository "g_interface_info_find_vfunc")
          (GIRepositoryBaseInfoClass.PolyML.PTR
            &&> FFI.PolyML.String.INPTR
            --> GIRepositoryBaseInfoClass.PolyML.PTR);
    end


    type 'a class_t = 'a GIRepositoryInterfaceInfoClass.t
    type 'a baseinfoclass_t = 'a GIRepositoryBaseInfoClass.t
    type 'a propertyinfoclass_t = 'a GIRepositoryPropertyInfoClass.t
    type 'a functioninfoclass_t = 'a GIRepositoryFunctionInfoClass.t
    type 'a signalinfoclass_t = 'a GIRepositorySignalInfoClass.t
    type 'a vfuncinfoclass_t = 'a GIRepositoryVFuncInfoClass.t
    type 'a constantinfoclass_t = 'a GIRepositoryConstantInfoClass.t
    type 'a structinfoclass_t = 'a GIRepositoryStructInfoClass.t


    val getNPrerequisites =
      fn info => (GIRepositoryBaseInfoClass.C.withPtr ---> I) getNPrerequisites_ info

    val getPrerequisite =
      fn info => fn n =>
        (GIRepositoryBaseInfoClass.C.withPtr &&&> I ---> GIRepositoryBaseInfoClass.C.fromPtr true)
        getPrerequisite_
        (info & n)

    val getNProperties =
      fn info => (GIRepositoryBaseInfoClass.C.withPtr ---> I) getNProperties_ info

    val getProperty =
      fn info => fn n =>
        (GIRepositoryBaseInfoClass.C.withPtr &&&> I ---> GIRepositoryPropertyInfoClass.C.fromPtr true)
        getProperty_
        (info & n)

    val getNMethods =
      fn info => (GIRepositoryBaseInfoClass.C.withPtr ---> I) getNMethods_ info

    val getMethod =
      fn info => fn n =>
        (GIRepositoryBaseInfoClass.C.withPtr &&&> I ---> GIRepositoryFunctionInfoClass.C.fromPtr true)
        getMethod_
        (info & n)

    val findMethod =
      fn info => fn name =>
        (GIRepositoryBaseInfoClass.C.withPtr
          &&&> FFI.String.withConstPtr
          ---> GIRepositoryFunctionInfoClass.C.fromPtr true)
        findMethod_
        (info & name)

    val getNSignals =
      fn info => (GIRepositoryBaseInfoClass.C.withPtr ---> I) getNSignals_ info

    val getSignal =
      fn info => fn n =>
        (GIRepositoryBaseInfoClass.C.withPtr &&&> I ---> GIRepositorySignalInfoClass.C.fromPtr true)
        getSignal_
        (info & n)

    val getNVfuncs =
      fn info => (GIRepositoryBaseInfoClass.C.withPtr ---> I) getNVfuncs_ info

    val getVfunc =
      fn info => fn n =>
        (GIRepositoryBaseInfoClass.C.withPtr &&&> I ---> GIRepositoryVFuncInfoClass.C.fromPtr true)
        getVfunc_
        (info & n)

    val getNConstants =
      fn info => (GIRepositoryBaseInfoClass.C.withPtr ---> I) getNConstants_ info

    val getConstant =
      fn info => fn n =>
        (GIRepositoryBaseInfoClass.C.withPtr &&&> I ---> GIRepositoryConstantInfoClass.C.fromPtr true)
        getConstant_
        (info & n)

    val getIfaceStruct =
      fn info =>
        (GIRepositoryBaseInfoClass.C.withPtr ---> GIRepositoryStructInfoClass.C.fromPtr true)
        getIfaceStruct_
        info

    val findVfunc =
      fn info => fn name =>
        (GIRepositoryBaseInfoClass.C.withPtr
          &&&> FFI.String.withConstPtr
          ---> GIRepositoryVFuncInfoClass.C.fromPtr true)
        findVfunc_
        (info & name)
  end



signature G_I_REPOSITORY_OBJECT_INFO =
  sig
    type 'a class_t
    type 'a baseinfoclass_t
    type 'a interfaceinfoclass_t
    type 'a fieldinfoclass_t
    type 'a propertyinfoclass_t
    type 'a functioninfoclass_t
    type 'a signalinfoclass_t
    type 'a vfuncinfoclass_t
    type 'a constantinfoclass_t
    type 'a structinfoclass_t
    val getTypeName : 'a class_t -> string
    val getTypeInit : 'a class_t -> string
    val getAbstract : 'a class_t -> bool
    val getFundamental : 'a class_t -> bool
    val getParent : 'a class_t -> base class_t option
    val getNInterfaces : 'a class_t -> LargeInt.int
    val getInterface : 'a class_t -> LargeInt.int -> base interfaceinfoclass_t
    val getNFields : 'a class_t -> LargeInt.int
    val getField : 'a class_t -> LargeInt.int -> base fieldinfoclass_t
    val getNProperties : 'a class_t -> LargeInt.int
    val getProperty : 'a class_t -> LargeInt.int -> base propertyinfoclass_t
    val getNMethods : 'a class_t -> LargeInt.int
    val getMethod : 'a class_t -> LargeInt.int -> base functioninfoclass_t
    val findMethod : 'a class_t -> string -> base functioninfoclass_t
    val getNSignals : 'a class_t -> LargeInt.int
    val getSignal : 'a class_t -> LargeInt.int -> base signalinfoclass_t
    val getNVfuncs : 'a class_t -> LargeInt.int
    val getVfunc : 'a class_t -> LargeInt.int -> base vfuncinfoclass_t
    val getNConstants : 'a class_t -> LargeInt.int
    val getConstant : 'a class_t -> LargeInt.int -> base constantinfoclass_t
    val getClassStruct : 'a class_t -> base structinfoclass_t
    val findVfunc : 'a class_t -> string -> base vfuncinfoclass_t
    val getUnrefFunction : 'a class_t -> string
    val getRefFunction : 'a class_t -> string
    val getSetValueFunction : 'a class_t -> string
    val getGetValueFunction : 'a class_t -> string
  end

structure GIRepositoryObjectInfo :>
  G_I_REPOSITORY_OBJECT_INFO
    where type 'a class_t = 'a GIRepositoryObjectInfoClass.t
    where type 'a baseinfoclass_t = 'a GIRepositoryBaseInfoClass.t
    where type 'a interfaceinfoclass_t = 'a GIRepositoryInterfaceInfoClass.t
    where type 'a fieldinfoclass_t = 'a GIRepositoryFieldInfoClass.t
    where type 'a propertyinfoclass_t = 'a GIRepositoryPropertyInfoClass.t
    where type 'a functioninfoclass_t = 'a GIRepositoryFunctionInfoClass.t
    where type 'a signalinfoclass_t = 'a GIRepositorySignalInfoClass.t
    where type 'a vfuncinfoclass_t = 'a GIRepositoryVFuncInfoClass.t
    where type 'a constantinfoclass_t = 'a GIRepositoryConstantInfoClass.t
    where type 'a structinfoclass_t = 'a GIRepositoryStructInfoClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getTypeName_ =
        call
          (load_sym libgirepository "g_object_info_get_type_name")
          (GIRepositoryBaseInfoClass.PolyML.PTR --> FFI.PolyML.String.RETPTR);

      val getTypeInit_ =
        call
          (load_sym libgirepository "g_object_info_get_type_init")
          (GIRepositoryBaseInfoClass.PolyML.PTR --> FFI.PolyML.String.RETPTR);

      val getAbstract_ =
        call
          (load_sym libgirepository "g_object_info_get_abstract")
          (GIRepositoryBaseInfoClass.PolyML.PTR --> FFI.PolyML.Bool.VAL);

      val getFundamental_ =
        call
          (load_sym libgirepository "g_object_info_get_fundamental")
          (GIRepositoryBaseInfoClass.PolyML.PTR --> FFI.PolyML.Bool.VAL);

      val getParent_ =
        call
          (load_sym libgirepository "g_object_info_get_parent")
          (GIRepositoryBaseInfoClass.PolyML.PTR --> GIRepositoryBaseInfoClass.PolyML.OPTPTR);

      val getNInterfaces_ =
        call
          (load_sym libgirepository "g_object_info_get_n_interfaces")
          (GIRepositoryBaseInfoClass.PolyML.PTR --> FFI.PolyML.Int32.VAL);

      val getInterface_ =
        call
          (load_sym libgirepository "g_object_info_get_interface")
          (GIRepositoryBaseInfoClass.PolyML.PTR
            &&> FFI.PolyML.Int32.VAL
            --> GIRepositoryBaseInfoClass.PolyML.PTR);

      val getNFields_ =
        call
          (load_sym libgirepository "g_object_info_get_n_fields")
          (GIRepositoryBaseInfoClass.PolyML.PTR --> FFI.PolyML.Int32.VAL);

      val getField_ =
        call
          (load_sym libgirepository "g_object_info_get_field")
          (GIRepositoryBaseInfoClass.PolyML.PTR
            &&> FFI.PolyML.Int32.VAL
            --> GIRepositoryBaseInfoClass.PolyML.PTR);

      val getNProperties_ =
        call
          (load_sym libgirepository "g_object_info_get_n_properties")
          (GIRepositoryBaseInfoClass.PolyML.PTR --> FFI.PolyML.Int32.VAL);

      val getProperty_ =
        call
          (load_sym libgirepository "g_object_info_get_property")
          (GIRepositoryBaseInfoClass.PolyML.PTR
            &&> FFI.PolyML.Int32.VAL
            --> GIRepositoryBaseInfoClass.PolyML.PTR);

      val getNMethods_ =
        call
          (load_sym libgirepository "g_object_info_get_n_methods")
          (GIRepositoryBaseInfoClass.PolyML.PTR --> FFI.PolyML.Int32.VAL);

      val getMethod_ =
        call
          (load_sym libgirepository "g_object_info_get_method")
          (GIRepositoryBaseInfoClass.PolyML.PTR
            &&> FFI.PolyML.Int32.VAL
            --> GIRepositoryBaseInfoClass.PolyML.PTR);

      val findMethod_ =
        call
          (load_sym libgirepository "g_object_info_find_method")
          (GIRepositoryBaseInfoClass.PolyML.PTR
            &&> FFI.PolyML.String.INPTR
            --> GIRepositoryBaseInfoClass.PolyML.PTR);

      val getNSignals_ =
        call
          (load_sym libgirepository "g_object_info_get_n_signals")
          (GIRepositoryBaseInfoClass.PolyML.PTR --> FFI.PolyML.Int32.VAL);

      val getSignal_ =
        call
          (load_sym libgirepository "g_object_info_get_signal")
          (GIRepositoryBaseInfoClass.PolyML.PTR
            &&> FFI.PolyML.Int32.VAL
            --> GIRepositoryBaseInfoClass.PolyML.PTR);

      val getNVfuncs_ =
        call
          (load_sym libgirepository "g_object_info_get_n_vfuncs")
          (GIRepositoryBaseInfoClass.PolyML.PTR --> FFI.PolyML.Int32.VAL);

      val getVfunc_ =
        call
          (load_sym libgirepository "g_object_info_get_vfunc")
          (GIRepositoryBaseInfoClass.PolyML.PTR
            &&> FFI.PolyML.Int32.VAL
            --> GIRepositoryBaseInfoClass.PolyML.PTR);

      val getNConstants_ =
        call
          (load_sym libgirepository "g_object_info_get_n_constants")
          (GIRepositoryBaseInfoClass.PolyML.PTR --> FFI.PolyML.Int32.VAL);

      val getConstant_ =
        call
          (load_sym libgirepository "g_object_info_get_constant")
          (GIRepositoryBaseInfoClass.PolyML.PTR
            &&> FFI.PolyML.Int32.VAL
            --> GIRepositoryBaseInfoClass.PolyML.PTR);

      val getClassStruct_ =
        call
          (load_sym libgirepository "g_object_info_get_class_struct")
          (GIRepositoryBaseInfoClass.PolyML.PTR --> GIRepositoryBaseInfoClass.PolyML.PTR);

      val findVfunc_ =
        call
          (load_sym libgirepository "g_object_info_find_vfunc")
          (GIRepositoryBaseInfoClass.PolyML.PTR
            &&> FFI.PolyML.String.INPTR
            --> GIRepositoryBaseInfoClass.PolyML.PTR);

      val getUnrefFunction_ =
        call
          (load_sym libgirepository "g_object_info_get_unref_function")
          (GIRepositoryBaseInfoClass.PolyML.PTR --> FFI.PolyML.String.RETPTR);

      val getRefFunction_ =
        call
          (load_sym libgirepository "g_object_info_get_ref_function")
          (GIRepositoryBaseInfoClass.PolyML.PTR --> FFI.PolyML.String.RETPTR);

      val getSetValueFunction_ =
        call
          (load_sym libgirepository "g_object_info_get_set_value_function")
          (GIRepositoryBaseInfoClass.PolyML.PTR --> FFI.PolyML.String.RETPTR);

      val getGetValueFunction_ =
        call
          (load_sym libgirepository "g_object_info_get_get_value_function")
          (GIRepositoryBaseInfoClass.PolyML.PTR --> FFI.PolyML.String.RETPTR);
    end


    type 'a class_t = 'a GIRepositoryObjectInfoClass.t
    type 'a baseinfoclass_t = 'a GIRepositoryBaseInfoClass.t
    type 'a interfaceinfoclass_t = 'a GIRepositoryInterfaceInfoClass.t
    type 'a fieldinfoclass_t = 'a GIRepositoryFieldInfoClass.t
    type 'a propertyinfoclass_t = 'a GIRepositoryPropertyInfoClass.t
    type 'a functioninfoclass_t = 'a GIRepositoryFunctionInfoClass.t
    type 'a signalinfoclass_t = 'a GIRepositorySignalInfoClass.t
    type 'a vfuncinfoclass_t = 'a GIRepositoryVFuncInfoClass.t
    type 'a constantinfoclass_t = 'a GIRepositoryConstantInfoClass.t
    type 'a structinfoclass_t = 'a GIRepositoryStructInfoClass.t


    val getTypeName =
      fn info =>
        (GIRepositoryBaseInfoClass.C.withPtr ---> FFI.String.fromPtr false)
          getTypeName_
          info

    val getTypeInit =
      fn info =>
        (GIRepositoryBaseInfoClass.C.withPtr ---> FFI.String.fromPtr false)
          getTypeInit_
          info

    val getAbstract =
      fn info => (GIRepositoryBaseInfoClass.C.withPtr ---> I) getAbstract_ info

    val getFundamental =
      fn info => (GIRepositoryBaseInfoClass.C.withPtr ---> I) getFundamental_ info

    val getParent =
      fn info =>
        (GIRepositoryBaseInfoClass.C.withPtr ---> GIRepositoryObjectInfoClass.C.fromOptPtr true)
          getParent_
          info

    val getNInterfaces =
      fn info => (GIRepositoryBaseInfoClass.C.withPtr ---> I) getNInterfaces_ info

    val getInterface =
      fn info => fn n =>
        (GIRepositoryBaseInfoClass.C.withPtr &&&> I ---> GIRepositoryInterfaceInfoClass.C.fromPtr true)
        getInterface_
        (info & n)

    val getNFields =
      fn info => (GIRepositoryBaseInfoClass.C.withPtr ---> I) getNFields_ info

    val getField =
      fn info => fn n =>
        (GIRepositoryBaseInfoClass.C.withPtr &&&> I ---> GIRepositoryFieldInfoClass.C.fromPtr true)
        getField_
        (info & n)

    val getNProperties =
      fn info => (GIRepositoryBaseInfoClass.C.withPtr ---> I) getNProperties_ info

    val getProperty =
      fn info => fn n =>
        (GIRepositoryBaseInfoClass.C.withPtr &&&> I ---> GIRepositoryPropertyInfoClass.C.fromPtr true)
        getProperty_
        (info & n)

    val getNMethods =
      fn info => (GIRepositoryBaseInfoClass.C.withPtr ---> I) getNMethods_ info

    val getMethod =
      fn info => fn n =>
        (GIRepositoryBaseInfoClass.C.withPtr &&&> I ---> GIRepositoryFunctionInfoClass.C.fromPtr true)
        getMethod_
        (info & n)

    val findMethod =
      fn info => fn name =>
        (GIRepositoryBaseInfoClass.C.withPtr
          &&&> FFI.String.withConstPtr
          ---> GIRepositoryFunctionInfoClass.C.fromPtr true)
        findMethod_
        (info & name)

    val getNSignals =
      fn info => (GIRepositoryBaseInfoClass.C.withPtr ---> I) getNSignals_ info

    val getSignal =
      fn info => fn n =>
        (GIRepositoryBaseInfoClass.C.withPtr &&&> I ---> GIRepositorySignalInfoClass.C.fromPtr true)
        getSignal_
        (info & n)

    val getNVfuncs =
      fn info => (GIRepositoryBaseInfoClass.C.withPtr ---> I) getNVfuncs_ info

    val getVfunc =
      fn info => fn n =>
        (GIRepositoryBaseInfoClass.C.withPtr &&&> I ---> GIRepositoryVFuncInfoClass.C.fromPtr true)
        getVfunc_
        (info & n)

    val getNConstants =
      fn info => (GIRepositoryBaseInfoClass.C.withPtr ---> I) getNConstants_ info

    val getConstant =
      fn info => fn n =>
        (GIRepositoryBaseInfoClass.C.withPtr &&&> I ---> GIRepositoryConstantInfoClass.C.fromPtr true)
        getConstant_
        (info & n)

    val getClassStruct =
      fn info =>
        (GIRepositoryBaseInfoClass.C.withPtr ---> GIRepositoryStructInfoClass.C.fromPtr true)
        getClassStruct_
        info

    val findVfunc =
      fn info => fn name =>
        (GIRepositoryBaseInfoClass.C.withPtr
          &&&> FFI.String.withConstPtr
          ---> GIRepositoryVFuncInfoClass.C.fromPtr true)
        findVfunc_
        (info & name)

    val getUnrefFunction =
      fn info =>
        (GIRepositoryBaseInfoClass.C.withPtr ---> FFI.String.fromPtr false)
        getUnrefFunction_
        info

    val getRefFunction =
      fn info =>
        (GIRepositoryBaseInfoClass.C.withPtr ---> FFI.String.fromPtr false)
        getRefFunction_
        info

    val getSetValueFunction =
      fn info =>
        (GIRepositoryBaseInfoClass.C.withPtr ---> FFI.String.fromPtr false)
        getSetValueFunction_
        info

    val getGetValueFunction =
      fn info =>
        (GIRepositoryBaseInfoClass.C.withPtr ---> FFI.String.fromPtr false)
        getGetValueFunction_
        info
  end




signature G_I_REPOSITORY_INFO_TYPE =
  sig
    type 'a baseinfoclass_t
    type 'a registeredtypeinfoclass_t
    type 'a functioninfoclass_t
    type 'a structinfoclass_t
    type 'a enuminfoclass_t
    type 'a objectinfoclass_t
    type 'a interfaceinfoclass_t
    type 'a constantinfoclass_t
    type 'a unioninfoclass_t
    type 'a valueinfoclass_t
    type 'a signalinfoclass_t
    type 'a vfuncinfoclass_t
    type 'a propertyinfoclass_t
    type 'a fieldinfoclass_t
    type 'a arginfoclass_t
    type 'a typeinfoclass_t

    datatype t =
      INVALID 
    | FUNCTION  of base functioninfoclass_t
    | CALLBACK  of base functioninfoclass_t
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

    val getType : 'a baseinfoclass_t -> t
  end

structure GIRepositoryInfoType :>
  G_I_REPOSITORY_INFO_TYPE
    where type 'a baseinfoclass_t           = 'a GIRepositoryBaseInfoClass.t
    where type 'a registeredtypeinfoclass_t = 'a GIRepositoryRegisteredTypeInfoClass.t
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
    | CALLBACK  of base functioninfoclass_t
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
          CALLBACK    o GIRepositoryFunctionInfoClass.C.fromPtr false,
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







signature G_I_REPOSITORY_REPOSITORY_CLASS =
  sig
    type 'a repository
    type 'a objectclass_t
    type 'a t = 'a repository objectclass_t
    val toBase : 'a t -> base t
    structure C :
      sig
        type notnull
        type 'a p
        val fromPtr : bool -> notnull p -> 'a t
        val fromOptPtr : bool -> unit p -> 'a t option
      end
  end

structure GIRepositoryRepositoryClass :>
  G_I_REPOSITORY_REPOSITORY_CLASS
    where type 'a objectclass_t = 'a GObjectObjectClass.t
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    type 'a repository = unit
    type 'a objectclass_t = 'a GObjectObjectClass.t
    type 'a t = 'a repository objectclass_t
    fun toBase obj = obj
    structure C = GObjectObjectClass.C
  end



signature G_I_REPOSITORY_TYPELIB_TYPE =
  sig
    type t
    structure C :
      sig
        type notnull
        type 'a p
        val withPtr : (notnull p -> 'a) -> t -> 'a
        val withOptPtr : (unit p -> 'a) -> t option -> 'a
        val fromPtr : notnull p -> t
        val fromOptPtr : unit p -> t option
      end
  end

structure GIRepositoryTypelibType :>
  sig
    include G_I_REPOSITORY_TYPELIB_TYPE
    structure PolyML :
      sig
        val PTR : C.notnull C.p CInterface.Conversion
        val OPTPTR : unit C.p CInterface.Conversion
      end
  end =
  struct
    type notnull = CPointer.notnull
    type 'a p = 'a CPointer.t
    val PTR = CPointer.PolyML.POINTER : notnull p CInterface.Conversion
    val OPTPTR = CPointer.PolyML.POINTER : unit p CInterface.Conversion

    type t = notnull p

    structure C =
      struct
        type notnull = notnull
        type 'a p = 'a p
        val withPtr = I
        fun withOptPtr f = f o CPointer.fromOpt
        val fromPtr = I
        val fromOptPtr = CPointer.toOpt
      end

    structure PolyML =
      struct
        val PTR = PTR
        val OPTPTR = OPTPTR
      end
  end



signature G_I_REPOSITORY_TYPELIB =
  sig
    type typelibtype_t
    val getNamespace : typelibtype_t -> string
  end

structure GIRepositoryTypelib :>
  G_I_REPOSITORY_TYPELIB
    where type typelibtype_t = GIRepositoryTypelibType.t =
  struct
    local
      open PolyMLFFI
    in
      val getNamespace_ =
        call
          (load_sym libgirepository "g_typelib_get_namespace")
          (GIRepositoryTypelibType.PolyML.PTR --> FFI.PolyML.String.RETPTR)
    end

    type typelibtype_t = GIRepositoryTypelibType.t

    val getNamespace =
      fn typelib =>
        (GIRepositoryTypelibType.C.withPtr ---> FFI.String.fromPtr false)
          getNamespace_
          typelib
  end



signature G_I_REPOSITORY_REPOSITORY =
  sig
    type 'a class_t
    type 'a baseinfoclass_t
    type loadflags_t
    type typelibtype_t
    val getDefault : unit -> base class_t
    val loadTypelib : 'a class_t -> typelibtype_t -> loadflags_t -> string
    val require : 'a class_t -> string -> string -> loadflags_t -> typelibtype_t
    val getDependencies : 'a class_t -> string -> string list option
    val getNInfos : 'a class_t -> string -> LargeInt.int
    val getInfo : 'a class_t -> string -> LargeInt.int -> base baseinfoclass_t
    val getSharedLibrary : 'a class_t -> string -> string option
    val getCPrefix : 'a class_t -> string -> string option
  end

structure GIRepositoryRepository :>
  G_I_REPOSITORY_REPOSITORY
    where type 'a class_t = 'a GIRepositoryRepositoryClass.t
    where type 'a baseinfoclass_t = 'a GIRepositoryBaseInfoClass.t
    where type loadflags_t = GIRepositoryRepositoryLoadFlags.flags
    where type typelibtype_t = GIRepositoryTypelibType.t =
  struct
    local
      open PolyMLFFI
    in
      val getDefault_ =
        call
          (load_sym libgirepository "g_irepository_get_default")
          (FFI.PolyML.VOID --> GObjectObjectClass.PolyML.PTR)

      val loadTypelib_ =
        call
          (load_sym libgirepository "g_irepository_load_typelib")
          (GObjectObjectClass.PolyML.PTR
            &&> GIRepositoryTypelibType.PolyML.PTR
            &&> GIRepositoryRepositoryLoadFlags.PolyML.VAL
            &&> GLibErrorRecord.PolyML.OUTOPTREF
            --> FFI.PolyML.String.RETPTR)

      val require_ =
        call
          (load_sym libgirepository "g_irepository_require")
          (GObjectObjectClass.PolyML.PTR
            &&> FFI.PolyML.String.INPTR
            &&> FFI.PolyML.String.INPTR
            &&> GIRepositoryRepositoryLoadFlags.PolyML.VAL
            &&> GLibErrorRecord.PolyML.OUTOPTREF
            --> GIRepositoryTypelibType.PolyML.PTR)

      val getDependencies_ =
        call
          (load_sym libgirepository "g_irepository_get_dependencies")
          (GObjectObjectClass.PolyML.PTR
            &&> FFI.PolyML.String.INPTR
            --> FFI.PolyML.StringVector.RETOPTPTR)

      val getNInfos_ =
        call
          (load_sym libgirepository "g_irepository_get_n_infos")
          (GObjectObjectClass.PolyML.PTR
            &&> FFI.PolyML.String.INPTR
            --> FFI.PolyML.Int32.VAL)

      val getInfo_ =
        call
          (load_sym libgirepository "g_irepository_get_info")
          (GObjectObjectClass.PolyML.PTR
            &&> FFI.PolyML.String.INPTR
            &&> FFI.PolyML.Int32.VAL
            --> GIRepositoryBaseInfoClass.PolyML.PTR)

      val getSharedLibrary_ =
        call
          (load_sym libgirepository "g_irepository_get_shared_library")
          (GObjectObjectClass.PolyML.PTR
            &&> FFI.PolyML.String.INPTR
            --> FFI.PolyML.String.RETOPTPTR)

      val getCPrefix_ =
        call
          (load_sym libgirepository "g_irepository_get_c_prefix")
          (GObjectObjectClass.PolyML.PTR
            &&> FFI.PolyML.String.INPTR
            --> FFI.PolyML.String.RETPTR)
    end


    type 'a class_t = 'a GIRepositoryRepositoryClass.t
    type 'a baseinfoclass_t = 'a GIRepositoryBaseInfoClass.t
    type loadflags_t = GIRepositoryRepositoryLoadFlags.flags
    type typelibtype_t = GIRepositoryTypelibType.t


    val getDefault =
      fn () => (I ---> GIRepositoryRepositoryClass.C.fromPtr false) getDefault_ ()

    val loadTypelib =
      fn repository => fn typelib => fn flags =>
        (GObjectObjectClass.C.withPtr
          &&&> GIRepositoryTypelibType.C.withPtr
          &&&> GIRepositoryRepositoryLoadFlags.C.withVal
          &&&> GLibErrorRecord.C.handleError
          ---> FFI.String.fromPtr false)
        loadTypelib_
        (repository & typelib & flags & [])

    val require =
      fn repository => fn namespace_ => fn version => fn flags =>
        (GObjectObjectClass.C.withPtr
          &&&> FFI.String.withConstPtr
          &&&> FFI.String.withConstPtr
          &&&> GIRepositoryRepositoryLoadFlags.C.withVal
          &&&> GLibErrorRecord.C.handleError
          ---> GIRepositoryTypelibType.C.fromPtr)
        require_
        (repository & namespace_ & version & flags & [])

    val getDependencies =
      fn repository => fn namespace_ =>
        (GObjectObjectClass.C.withPtr
          &&&> FFI.String.withConstPtr
          ---> FFI.StringVector.fromOptPtr true)
        getDependencies_
        (repository & namespace_)

    val getNInfos =
      fn repository => fn namespace_ =>
        (GObjectObjectClass.C.withPtr
          &&&> FFI.String.withConstPtr
          ---> I)
        getNInfos_
        (repository & namespace_)

    val getInfo =
      fn repository => fn namespace_ => fn index =>
        (GObjectObjectClass.C.withPtr
          &&&> FFI.String.withConstPtr
          &&&> I
          ---> GIRepositoryBaseInfoClass.C.fromPtr true)
        getInfo_
        (repository & namespace_ & index)

    fun getSharedLibrary self namespace =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.String.withConstPtr
         ---> FFI.String.fromOptPtr false
      )
        getSharedLibrary_
        (self & namespace)

    val getCPrefix =
      fn repository => fn namespace_ =>
        (GObjectObjectClass.C.withPtr
          &&&> FFI.String.withConstPtr
          ---> FFI.String.fromOptPtr false)
        getCPrefix_
        (repository & namespace_)
  end



signature G_I_REPOSITORY =
  sig
    structure FieldInfoFlags : G_I_REPOSITORY_FIELD_INFO_FLAGS
    structure FunctionInfoFlags : G_I_REPOSITORY_FUNCTION_INFO_FLAGS
    structure VFuncInfoFlags : G_I_REPOSITORY_V_FUNC_INFO_FLAGS
    structure BaseInfoClass : G_I_REPOSITORY_BASE_INFO_CLASS
    structure CallableInfoClass : G_I_REPOSITORY_CALLABLE_INFO_CLASS
    structure FunctionInfoClass : G_I_REPOSITORY_FUNCTION_INFO_CLASS
    structure SignalInfoClass : G_I_REPOSITORY_SIGNAL_INFO_CLASS
    structure VFuncInfoClass : G_I_REPOSITORY_VFUNC_INFO_CLASS
    structure RegisteredTypeInfoClass : G_I_REPOSITORY_REGISTERED_TYPE_INFO_CLASS
    structure EnumInfoClass : G_I_REPOSITORY_ENUM_INFO_CLASS
    structure InterfaceInfoClass : G_I_REPOSITORY_INTERFACE_INFO_CLASS
    structure ObjectInfoClass : G_I_REPOSITORY_OBJECT_INFO_CLASS
    structure StructInfoClass : G_I_REPOSITORY_STRUCT_INFO_CLASS
    structure UnionInfoClass : G_I_REPOSITORY_UNION_INFO_CLASS
    structure ArgInfoClass : G_I_REPOSITORY_ARG_INFO_CLASS
    structure ConstantInfoClass : G_I_REPOSITORY_CONSTANT_INFO_CLASS
    structure FieldInfoClass : G_I_REPOSITORY_FIELD_INFO_CLASS
    structure PropertyInfoClass : G_I_REPOSITORY_PROPERTY_INFO_CLASS
    structure TypeInfoClass : G_I_REPOSITORY_TYPE_INFO_CLASS
    structure ValueInfoClass : G_I_REPOSITORY_VALUE_INFO_CLASS
    structure TypeTag : G_I_REPOSITORY_TYPE_TAG
    structure ArrayType : G_I_REPOSITORY_ARRAY_TYPE
    structure BaseInfo :
      G_I_REPOSITORY_BASE_INFO
        where type 'a class_t = 'a BaseInfoClass.t
    structure TypeInfo :
      G_I_REPOSITORY_TYPE_INFO
        where type 'a class_t = 'a TypeInfoClass.t
        where type typetag_t = TypeTag.t
        where type arraytype_t = ArrayType.t
        where type 'a baseinfoclass_t = 'a BaseInfoClass.t
    structure Argument :
      G_I_REPOSITORY_ARGUMENT
        where type typetag_t = TypeTag.t
    structure ConstantInfo :
      G_I_REPOSITORY_CONSTANT_INFO
        where type 'a class_t = 'a ConstantInfoClass.t
        where type 'a typeinfoclass_t = 'a TypeInfoClass.t
        where type argument_t = Argument.t
    structure RegisteredTypeInfo :
      G_I_REPOSITORY_REGISTERED_TYPE_INFO
        where type 'a class_t = 'a RegisteredTypeInfoClass.t
    structure ValueInfo :
      G_I_REPOSITORY_VALUE_INFO
        where type 'a class_t = 'a ValueInfoClass.t
    structure Direction : G_I_REPOSITORY_DIRECTION
    structure ScopeType : G_I_REPOSITORY_SCOPE_TYPE
    structure Transfer : G_I_REPOSITORY_TRANSFER
    structure ArgInfo :
      G_I_REPOSITORY_ARG_INFO
        where type 'a class_t = 'a ArgInfoClass.t
        where type 'a typeinfoclass_t = 'a TypeInfoClass.t
        where type direction_t = Direction.t
        where type scopetype_t = ScopeType.t
        where type transfer_t = Transfer.t
    structure CallableInfo :
      G_I_REPOSITORY_CALLABLE_INFO
        where type 'a class_t = 'a CallableInfoClass.t
        where type 'a typeinfoclass_t = 'a TypeInfoClass.t
        where type transfer_t = Transfer.t
        where type 'a arginfoclass_t = 'a ArgInfoClass.t
    structure PropertyInfo :
      G_I_REPOSITORY_PROPERTY_INFO
        where type 'a class_t = 'a PropertyInfoClass.t
        where type 'a typeinfoclass_t = 'a TypeInfoClass.t
        where type transfer_t = Transfer.t
    structure FunctionInfo :
      G_I_REPOSITORY_FUNCTION_INFO
        where type 'a class_t = 'a FunctionInfoClass.t
        where type 'a propertyinfoclass_t = 'a PropertyInfoClass.t
        where type 'a vfuncinfoclass_t = 'a VFuncInfoClass.t
        where type functioninfoflags_t = FunctionInfoFlags.flags
    structure SignalInfo :
      G_I_REPOSITORY_SIGNAL_INFO
        where type 'a class_t = 'a SignalInfoClass.t
        where type 'a vfuncinfoclass_t = 'a VFuncInfoClass.t
    structure VFuncInfo :
      G_I_REPOSITORY_VFUNC_INFO
        where type 'a class_t = 'a VFuncInfoClass.t
        where type 'a functioninfoclass_t = 'a FunctionInfoClass.t
        where type 'a signalinfoclass_t = 'a SignalInfoClass.t
        where type vfuncinfoflags_t = VFuncInfoFlags.flags
    structure FieldInfo :
      G_I_REPOSITORY_FIELD_INFO
        where type 'a class_t = 'a FieldInfoClass.t
        where type 'a typeinfoclass_t = 'a TypeInfoClass.t
        where type fieldinfoflags_t = FieldInfoFlags.flags
    structure StructInfo :
      G_I_REPOSITORY_STRUCT_INFO
        where type 'a class_t = 'a StructInfoClass.t
        where type 'a fieldinfoclass_t = 'a FieldInfoClass.t
        where type 'a functioninfoclass_t = 'a FunctionInfoClass.t
    structure UnionInfo :
      G_I_REPOSITORY_UNION_INFO
        where type 'a class_t = 'a UnionInfoClass.t
        where type 'a fieldinfoclass_t = 'a FieldInfoClass.t
        where type 'a functioninfoclass_t = 'a FunctionInfoClass.t
    structure EnumInfo :
      G_I_REPOSITORY_ENUM_INFO
        where type 'a class_t = 'a EnumInfoClass.t
        where type 'a valueinfoclass_t = 'a ValueInfoClass.t
        where type 'a functioninfoclass_t = 'a FunctionInfoClass.t
        where type typetag_t = TypeTag.t
    structure InterfaceInfo :
      G_I_REPOSITORY_INTERFACE_INFO
        where type 'a class_t = 'a InterfaceInfoClass.t
        where type 'a baseinfoclass_t = 'a BaseInfoClass.t
        where type 'a propertyinfoclass_t = 'a PropertyInfoClass.t
        where type 'a functioninfoclass_t = 'a FunctionInfoClass.t
        where type 'a signalinfoclass_t = 'a SignalInfoClass.t
        where type 'a vfuncinfoclass_t = 'a VFuncInfoClass.t
        where type 'a constantinfoclass_t = 'a ConstantInfoClass.t
        where type 'a structinfoclass_t = 'a StructInfoClass.t
    structure ObjectInfo :
      G_I_REPOSITORY_OBJECT_INFO
        where type 'a class_t = 'a ObjectInfoClass.t
        where type 'a baseinfoclass_t = 'a BaseInfoClass.t
        where type 'a interfaceinfoclass_t = 'a InterfaceInfoClass.t
        where type 'a fieldinfoclass_t = 'a FieldInfoClass.t
        where type 'a propertyinfoclass_t = 'a PropertyInfoClass.t
        where type 'a functioninfoclass_t = 'a FunctionInfoClass.t
        where type 'a signalinfoclass_t = 'a SignalInfoClass.t
        where type 'a vfuncinfoclass_t = 'a VFuncInfoClass.t
        where type 'a constantinfoclass_t = 'a ConstantInfoClass.t
        where type 'a structinfoclass_t = 'a StructInfoClass.t
    structure InfoType :
      G_I_REPOSITORY_INFO_TYPE
        where type 'a baseinfoclass_t = 'a BaseInfoClass.t
        where type 'a registeredtypeinfoclass_t = 'a RegisteredTypeInfoClass.t
        where type 'a functioninfoclass_t = 'a FunctionInfoClass.t
        where type 'a structinfoclass_t = 'a StructInfoClass.t
        where type 'a enuminfoclass_t = 'a EnumInfoClass.t
        where type 'a objectinfoclass_t = 'a ObjectInfoClass.t
        where type 'a interfaceinfoclass_t = 'a InterfaceInfoClass.t
        where type 'a constantinfoclass_t = 'a ConstantInfoClass.t
        where type 'a unioninfoclass_t = 'a UnionInfoClass.t
        where type 'a valueinfoclass_t = 'a ValueInfoClass.t
        where type 'a signalinfoclass_t = 'a SignalInfoClass.t
        where type 'a vfuncinfoclass_t = 'a VFuncInfoClass.t
        where type 'a propertyinfoclass_t = 'a PropertyInfoClass.t
        where type 'a fieldinfoclass_t = 'a FieldInfoClass.t
        where type 'a arginfoclass_t = 'a ArgInfoClass.t
        where type 'a typeinfoclass_t = 'a TypeInfoClass.t
    structure RepositoryLoadFlags : G_I_REPOSITORY_REPOSITORY_LOAD_FLAGS
    structure RepositoryClass : G_I_REPOSITORY_REPOSITORY_CLASS
    structure TypelibType : G_I_REPOSITORY_TYPELIB_TYPE
    structure Typelib :
      G_I_REPOSITORY_TYPELIB
        where type typelibtype_t = TypelibType.t
    structure Repository :
      G_I_REPOSITORY_REPOSITORY
        where type 'a class_t = 'a RepositoryClass.t
        where type 'a baseinfoclass_t = 'a BaseInfoClass.t
        where type loadflags_t = RepositoryLoadFlags.flags
        where type typelibtype_t = TypelibType.t
  end

structure GIRepository : G_I_REPOSITORY =
  struct
    structure FieldInfoFlags = GIRepositoryFieldInfoFlags
    structure FunctionInfoFlags = GIRepositoryFunctionInfoFlags
    structure VFuncInfoFlags = GIRepositoryVFuncInfoFlags
    structure BaseInfoClass = GIRepositoryBaseInfoClass
    structure CallableInfoClass = GIRepositoryCallableInfoClass
    structure FunctionInfoClass = GIRepositoryFunctionInfoClass
    structure SignalInfoClass = GIRepositorySignalInfoClass
    structure VFuncInfoClass = GIRepositoryVFuncInfoClass
    structure RegisteredTypeInfoClass = GIRepositoryRegisteredTypeInfoClass
    structure EnumInfoClass = GIRepositoryEnumInfoClass
    structure InterfaceInfoClass = GIRepositoryInterfaceInfoClass
    structure ObjectInfoClass = GIRepositoryObjectInfoClass
    structure StructInfoClass = GIRepositoryStructInfoClass
    structure UnionInfoClass = GIRepositoryUnionInfoClass
    structure ArgInfoClass = GIRepositoryArgInfoClass
    structure ConstantInfoClass = GIRepositoryConstantInfoClass
    structure FieldInfoClass = GIRepositoryFieldInfoClass
    structure PropertyInfoClass = GIRepositoryPropertyInfoClass
    structure TypeInfoClass = GIRepositoryTypeInfoClass
    structure ValueInfoClass = GIRepositoryValueInfoClass
    structure TypeTag = GIRepositoryTypeTag
    structure ArrayType = GIRepositoryArrayType
    structure BaseInfo = GIRepositoryBaseInfo
    structure TypeInfo = GIRepositoryTypeInfo
    structure Argument = GIRepositoryArgument
    structure ConstantInfo = GIRepositoryConstantInfo
    structure RegisteredTypeInfo = GIRepositoryRegisteredTypeInfo
    structure ValueInfo = GIRepositoryValueInfo
    structure Direction = GIRepositoryDirection
    structure ScopeType = GIRepositoryScopeType
    structure Transfer = GIRepositoryTransfer
    structure ArgInfo = GIRepositoryArgInfo
    structure CallableInfo = GIRepositoryCallableInfo
    structure PropertyInfo = GIRepositoryPropertyInfo
    structure FunctionInfo = GIRepositoryFunctionInfo
    structure SignalInfo = GIRepositorySignalInfo
    structure VFuncInfo = GIRepositoryVFuncInfo
    structure FieldInfo = GIRepositoryFieldInfo
    structure StructInfo = GIRepositoryStructInfo
    structure UnionInfo = GIRepositoryUnionInfo
    structure EnumInfo = GIRepositoryEnumInfo
    structure InterfaceInfo = GIRepositoryInterfaceInfo
    structure ObjectInfo = GIRepositoryObjectInfo
    structure InfoType = GIRepositoryInfoType
    structure RepositoryLoadFlags = GIRepositoryRepositoryLoadFlags
    structure RepositoryClass = GIRepositoryRepositoryClass
    structure TypelibType = GIRepositoryTypelibType
    structure Typelib = GIRepositoryTypelib
    structure Repository = GIRepositoryRepository
  end

;



(* test *)
(*


open GIRepository;

infix 6 --
fun n -- m =
  if m < n
  then []
  else n :: (n + 1 : LargeInt.int) -- m

infix &&&;
fun (f &&& g) x = (f x, g x);


Gtk.init (CommandLine.name () :: CommandLine.arguments ());
val repo = Repository.getDefault ();






val tylib_gir =
  Repository.require repo "GIRepository" "2.0" (RepositoryLoadFlags.flags []);
Typelib.getNamespace tylib_gir;
val SOME cprefix_gir = Repository.getCPrefix repo "GIRepository";

val s = Repository.loadTypelib repo tylib_gir (RepositoryLoadFlags.flags []);
val n = Repository.getNInfos repo s;

val info_0 = Repository.getInfo repo s 0;
val info_1 = Repository.getInfo repo s 1;
val info_28 = Repository.getInfo repo s 28;

BaseInfo.getName info_0;
BaseInfo.getNamespace info_0;
InfoType.getType info_0;
val InfoType.ENUM enumInfo = InfoType.getType info_0;
val valueInfo = EnumInfo.getValue enumInfo 0;
ValueInfo.getValueInt valueInfo;
EnumInfo.getStorageType enumInfo;

BaseInfo.getName info_1;
BaseInfo.getNamespace info_1;
InfoType.getType info_1;

BaseInfo.getName info_28;
BaseInfo.getNamespace info_28;
InfoType.getType info_28;


(*
PolyML.print_depth 200;

map (I &&& (InfoType.getType &&& BaseInfo.getName) o Repository.getInfo repo s) (0 -- 146);


val info_4 = Repository.getInfo repo s 4;
val info_10 = Repository.getInfo repo s 10;
val info_17 = Repository.getInfo repo s 17;

BaseInfo.getName info_4;
InfoType.getType info_4;

BaseInfo.getName info_10;
InfoType.getType info_10;

BaseInfo.getName info_17;
InfoType.getType info_17;
*)


val info_10 = Repository.getInfo repo s 10;
val InfoType.FLAGS info = InfoType.getType info_10;

BaseInfo.getName info_10;
BaseInfo.getName info;

InfoType.getType info;

RegisteredTypeInfo.getTypeName info;
RegisteredTypeInfo.getTypeInit info;
GObject.Type.name (RegisteredTypeInfo.getGType info);

EnumInfo.getStorageType info;
EnumInfo.getNMethods info;
EnumInfo.getNValues info;
val value = EnumInfo.getValue info 0;
ValueInfo.getValue value;
BaseInfo.getName value;
BaseInfo.getNamespace value;





val info_2 = Repository.getInfo repo s 2;
val InfoType.STRUCT structInfo = InfoType.getType info_2;

BaseInfo.getName info_2;
BaseInfo.getName structInfo;
BaseInfo.getNamespace structInfo;

RegisteredTypeInfo.getTypeName structInfo;
RegisteredTypeInfo.getTypeInit structInfo;
GObject.Type.name (RegisteredTypeInfo.getGType structInfo);













val tylib_gtk =
  Repository.require repo "Gtk" "3.0" (RepositoryLoadFlags.flags []);
Typelib.getNamespace tylib_gtk;
val SOME cprefix_gtk = Repository.getCPrefix repo "Gtk";
val s = Repository.loadTypelib repo tylib_gtk (RepositoryLoadFlags.flags []);
val n = Repository.getNInfos repo s;


PolyML.print_depth 2000;

map (I &&& (InfoType.getType &&& BaseInfo.getName) o Repository.getInfo repo s) (0 -- 1107);


(* filter out UNIONs *)
List.mapPartial ((fn (i, SOME x) => SOME (i, BaseInfo.getName x) | (_, NONE) => NONE) o (I &&& (fn info => case InfoType.getType info of InfoType.UNION _ => SOME info | _ => NONE) o Repository.getInfo repo s)) (0 -- 1107)



(* ** CONSTANT ** *)
val info = Repository.getInfo repo s 63;
val info = Repository.getInfo repo s 345;
val info = Repository.getInfo repo s 348;
val info = Repository.getInfo repo s 347;
val info = Repository.getInfo repo s 412;
val info = Repository.getInfo repo s 434;
val info = Repository.getInfo repo s 553;
val info = Repository.getInfo repo s 620;

val InfoType.CONSTANT constantInfo = InfoType.getType info;
TypeInfo.getTag (ConstantInfo.getType constantInfo);
ConstantInfo.getValue constantInfo;


(* ** STRUCT ** *)


val info = Repository.getInfo repo s 782; (* TextAppearance (no methods) *)
val info = Repository.getInfo repo s 783; (* TextAttributes (5 methods) *)
val info = Repository.getInfo repo s 330; (* LabelPrivate *)
val info = Repository.getInfo repo s 331; (* LabelSelectionInfo *)
val InfoType.STRUCT structInfo = InfoType.getType info;
BaseInfo.getName structInfo;
StructInfo.getNMethods structInfo;
map (I &&& (InfoType.getType &&& BaseInfo.getName) o StructInfo.getMethod structInfo) (0 -- 4);


BaseInfo.getAttribute structInfo "disguised";





(* ** OBJECT ** *)

val info = Repository.getInfo repo s 23;
val info = Repository.getInfo repo s 73;  (* Box *)
val info = Repository.getInfo repo s 78;  (* Builder *)
val info = Repository.getInfo repo s 921; (* Window *)
val info = Repository.getInfo repo s 171;
val info = Repository.getInfo repo s 177; (* Container *)
val info = Repository.getInfo repo s 307; (* IconView *)
val info = Repository.getInfo repo s 393; (* Overlay *)
val info = Repository.getInfo repo s 151; (* Clipboard *)
val info = Repository.getInfo repo s 181; (* CssProvider *)
val info = Repository.getInfo repo s 698; (* Scale *)
val info = Repository.getInfo repo s 739; (* SpinButton *)
val info = Repository.getInfo repo s 749; (* StatusIcon *)
val info = Repository.getInfo repo s 758; (* StyleContext *)
val info = Repository.getInfo repo s 761; (* StyleProperties *)
val info = Repository.getInfo repo s 811; (* ThemingEngine *)
val info = Repository.getInfo repo s 875; (* TreeStore *)
val info = Repository.getInfo repo s 892; (* UIManager *)
val info = Repository.getInfo repo s 914; (* Widget *)
val info = Repository.getInfo repo s 921; (* Window *)
val info = Repository.getInfo repo s 878;
val InfoType.OBJECT objectInfo = InfoType.getType info;
BaseInfo.getName objectInfo;
ObjectInfo.getRefFunction objectInfo;

(* ** methods ** *)
ObjectInfo.getNMethods objectInfo;
map (I &&& (InfoType.getType &&& BaseInfo.getName) o ObjectInfo.getMethod objectInfo) (0 -- 18);

val info = ObjectInfo.getMethod objectInfo 155; (* GtkWidget.path *)
val info = ObjectInfo.getMethod objectInfo 12; (* GtkIconView.get_item_at_pos *)
val info = ObjectInfo.getMethod objectInfo 38;
val info = ObjectInfo.getMethod objectInfo 0;  (* GtkWindow.new *)
val info = ObjectInfo.getMethod objectInfo 17;
val info = ObjectInfo.getMethod objectInfo 19;
val info = ObjectInfo.getMethod objectInfo 6;
val info = ObjectInfo.getMethod objectInfo 2;
val info = ObjectInfo.getMethod objectInfo 65;
val info = ObjectInfo.getMethod objectInfo 18;
val InfoType.FUNCTION functionInfo = InfoType.getType info;
BaseInfo.getName functionInfo;
FunctionInfo.getSymbol functionInfo;
CallableInfo.getCallerOwns functionInfo;
CallableInfo.mayReturnNull functionInfo;
val retTypeInfo = CallableInfo.getReturnType functionInfo;
TypeInfo.getTag retTypeInfo;
TypeInfo.isPointer retTypeInfo;
BaseInfo.getNamespace retTypeInfo;

val SOME interfaceInfo = TypeInfo.getInterface retTypeInfo;
val InfoType.OBJECT objectInfo = InfoType.getType interfaceInfo;
BaseInfo.getNamespace objectInfo;

CallableInfo.getNArgs functionInfo;
map (I &&& (InfoType.getType &&& BaseInfo.getName) o CallableInfo.getArg functionInfo) (0 -- 2);


val info = CallableInfo.getArg functionInfo 0;
val info = CallableInfo.getArg functionInfo 2;
val info = CallableInfo.getArg functionInfo 4;
val InfoType.ARG argInfo = InfoType.getType info;
BaseInfo.getName argInfo;
ArgInfo.getDirection argInfo;
ArgInfo.mayBeNull argInfo;
ArgInfo.isReturnValue argInfo;
ArgInfo.isOptional argInfo;
ArgInfo.getOwnershipTransfer argInfo;
ArgInfo.isCallerAllocates argInfo;
ArgInfo.getScope argInfo;

val typeInfo = ArgInfo.getType argInfo;
TypeInfo.getTag typeInfo;
TypeInfo.isPointer typeInfo;

val SOME interfaceBaseInfo = TypeInfo.getInterface typeInfo;
val InfoType.OBJECT objectInfo = InfoType.getType interfaceBaseInfo;
BaseInfo.getName objectInfo;


val InfoType.ENUM enumInfo = InfoType.getType interfaceBaseInfo;
BaseInfo.getName enumInfo;
EnumInfo.getNMethods enumInfo;
EnumInfo.getNValues enumInfo;
val valueInfo0 = EnumInfo.getValue enumInfo 0;
val valueInfo1 = EnumInfo.getValue enumInfo 1;

BaseInfo.getName valueInfo0;
BaseInfo.getNamespace valueInfo0;
ValueInfo.getValue valueInfo0;
BaseInfo.getName valueInfo1;
BaseInfo.getNamespace valueInfo1;
ValueInfo.getValue valueInfo1;




val info = Repository.getInfo repo s 914;
val InfoType.OBJECT objectInfo = InfoType.getType info;
BaseInfo.getName objectInfo;
ObjectInfo.getNMethods objectInfo;
map (I &&& (InfoType.getType &&& BaseInfo.getName) o ObjectInfo.getMethod objectInfo) (0 -- 231);



val info = ObjectInfo.getMethod objectInfo 155;
val info = Repository.getInfo repo s 989;  (* init *)
val InfoType.FUNCTION functionInfo = InfoType.getType info;
BaseInfo.getName functionInfo;
FunctionInfo.getSymbol functionInfo;

CallableInfo.getNArgs functionInfo;
map (I &&& (InfoType.getType &&& BaseInfo.getName) o CallableInfo.getArg functionInfo) (0 -- 1);

val info = CallableInfo.getArg functionInfo 0;
val info = CallableInfo.getArg functionInfo 1;
val InfoType.ARG argInfo = InfoType.getType info;
BaseInfo.getName argInfo;
ArgInfo.getDirection argInfo;
ArgInfo.mayBeNull argInfo;
ArgInfo.isReturnValue argInfo;
ArgInfo.isOptional argInfo;
ArgInfo.getOwnershipTransfer argInfo;
ArgInfo.isCallerAllocates argInfo;
ArgInfo.getScope argInfo;
val typeInfo = ArgInfo.getType argInfo;

TypeInfo.getTag typeInfo;
TypeInfo.isPointer typeInfo;
TypeInfo.getArrayLength typeInfo;
TypeInfo.getArrayFixedSize typeInfo;
TypeInfo.isZeroTerminated typeInfo;
TypeInfo.getArrayType typeInfo;
val SOME paramTypeInfo = TypeInfo.getParamType typeInfo 0;

TypeInfo.getTag paramTypeInfo;


(* ** signals ** *)
ObjectInfo.getNSignals objectInfo;
map (I &&& (InfoType.getType &&& BaseInfo.getName) o ObjectInfo.getSignal objectInfo) (0 -- 3);

val signalInfo = ObjectInfo.getSignal objectInfo 3;

BaseInfo.getName signalInfo;
CallableInfo.getNArgs signalInfo;
map (I &&& (InfoType.getType &&& BaseInfo.getName) o CallableInfo.getArg signalInfo) (0 -- 0);


(* ** properties ** *)
ObjectInfo.getNProperties objectInfo;
map (I &&& (InfoType.getType &&& BaseInfo.getName) o ObjectInfo.getProperty objectInfo) (0 -- 30);

val propertyInfo = ObjectInfo.getProperty objectInfo 18;
val propertyInfo = ObjectInfo.getProperty objectInfo 33;
BaseInfo.getName propertyInfo;
PropertyInfo.getOwnershipTransfer propertyInfo;
val typeInfo = PropertyInfo.getType propertyInfo;

TypeInfo.getTag typeInfo;


val flags = PropertyInfo.getFlags propertyInfo;

GObject.ParamFlags.anySet (flags, GObject.ParamFlags.READABLE);
GObject.ParamFlags.anySet (flags, GObject.ParamFlags.WRITABLE);




(* FLAGS and ENUM *)

val info = Repository.getInfo repo s 192; (* FLAGS: DialogFlags *)
val InfoType.FLAGS flagsInfo = InfoType.getType info;
BaseInfo.getName flagsInfo;

val info = Repository.getInfo repo s 194; (* ENUM: DirectionType *)
val InfoType.ENUM enumInfo = InfoType.getType info;
BaseInfo.getName enumInfo;






val tylib_gdk =
  Repository.require repo "Gdk" "3.0" (RepositoryLoadFlags.flags []);
Typelib.getNamespace tylib_gdk;
val SOME cprefix_gdk = Repository.getCPrefix repo "Gdk";
val s = Repository.loadTypelib repo tylib_gdk (RepositoryLoadFlags.flags []);
val n = Repository.getNInfos repo s;

PolyML.print_depth 2500;
map (I &&& (InfoType.getType &&& BaseInfo.getName) o Repository.getInfo repo s) (0 -- 2436);

val info = Repository.getInfo repo s 1;  (* Atom *)
val info = Repository.getInfo repo s 27;  (* EventKey *)
val info = Repository.getInfo repo s 2306;  (* KeymapKey *)
val info = Repository.getInfo repo s 2331;  (* WindowClass *)
val InfoType.STRUCT structInfo = InfoType.getType info;
BaseInfo.getName structInfo;
BaseInfo.getNamespace structInfo;
StructInfo.getNMethods structInfo;
StructInfo.getNFields structInfo;

map (I &&& (InfoType.getType &&& BaseInfo.getName) o StructInfo.getField structInfo) (0 -- 10);

StructInfo.isForeign structInfo;
StructInfo.getSize structInfo;
StructInfo.isGtypeStruct structInfo;

BaseInfo.getContainer structInfo;




val info = Repository.getInfo repo s 17;  (* Event *)
val InfoType.UNION unionInfo = InfoType.getType info;
BaseInfo.getName unionInfo;
BaseInfo.getNamespace unionInfo;
UnionInfo.isDiscriminated unionInfo;
UnionInfo.getNMethods unionInfo;
UnionInfo.getNFields unionInfo;

map (I &&& (InfoType.getType &&& BaseInfo.getName) o UnionInfo.getField unionInfo) (0 -- 18);

val info = UnionInfo.getField unionInfo 7;  (* key *)
val InfoType.FIELD fieldInfo = InfoType.getType info;
BaseInfo.getName fieldInfo;

FieldInfo.getOffset fieldInfo;

val typeInfo = FieldInfo.getType fieldInfo;
TypeInfo.getTag typeInfo;

val SOME info = TypeInfo.getInterface typeInfo;
val InfoType.STRUCT structInfo = InfoType.getType info;
BaseInfo.getName structInfo;
BaseInfo.getNamespace structInfo;



val info = Repository.getInfo repo s 13;  (* DisplayManager *)
val info = Repository.getInfo repo s 2327;  (* Window *)
val InfoType.OBJECT objectInfo = InfoType.getType info;
BaseInfo.getName objectInfo;

(* ** methods ** *)
ObjectInfo.getNMethods objectInfo;
map (I &&& (InfoType.getType &&& BaseInfo.getName) o ObjectInfo.getMethod objectInfo) (0 -- 136);

val info = ObjectInfo.getMethod objectInfo 4;
val info = ObjectInfo.getMethod objectInfo 126;
val InfoType.FUNCTION functionInfo = InfoType.getType info;
BaseInfo.getName functionInfo;
FunctionInfo.getSymbol functionInfo;

(* *** parameter values *** *)
CallableInfo.getNArgs functionInfo;
map (I &&& (InfoType.getType &&& BaseInfo.getName) o CallableInfo.getArg functionInfo) (0 -- 0);

val info = CallableInfo.getArg functionInfo 0;
val info = CallableInfo.getArg functionInfo 1;
val InfoType.ARG argInfo = InfoType.getType info;
BaseInfo.getName argInfo;
ArgInfo.getDirection argInfo;
ArgInfo.mayBeNull argInfo;
ArgInfo.isReturnValue argInfo;
ArgInfo.isOptional argInfo;
ArgInfo.getOwnershipTransfer argInfo;
ArgInfo.isCallerAllocates argInfo;
ArgInfo.getScope argInfo;
val typeInfo = ArgInfo.getType argInfo;

TypeInfo.isPointer typeInfo;
val SOME interfaceInfo = TypeInfo.getInterface typeInfo;
BaseInfo.getName interfaceInfo;
BaseInfo.getNamespace interfaceInfo;
TypeInfo.getTag typeInfo;
InfoType.getType interfaceInfo;

(* ** signals ** *)
ObjectInfo.getNSignals objectInfo;
map (I &&& (InfoType.getType &&& BaseInfo.getName) o ObjectInfo.getSignal objectInfo) (0 -- 0);

val signalInfo = ObjectInfo.getSignal objectInfo 0;
val signalInfo = ObjectInfo.getSignal objectInfo 2;

(* *** parameter values *** *)
CallableInfo.getNArgs signalInfo;
map (I &&& (InfoType.getType &&& BaseInfo.getName) o CallableInfo.getArg signalInfo) (0 -- 0);
val argInfo = CallableInfo.getArg signalInfo 0;
val typeInfo = ArgInfo.getType argInfo;

TypeInfo.isPointer typeInfo;
val SOME interfaceInfo = TypeInfo.getInterface typeInfo;
BaseInfo.getName interfaceInfo;
BaseInfo.getNamespace interfaceInfo;
TypeInfo.getTag typeInfo;
InfoType.getType interfaceInfo;

(* *** return value *** *)
val typeInfo = CallableInfo.getReturnType signalInfo;

TypeInfo.isPointer typeInfo;
val SOME interfaceInfo = TypeInfo.getInterface typeInfo;
BaseInfo.getName interfaceInfo;
BaseInfo.getNamespace interfaceInfo;
TypeInfo.getTag typeInfo;
InfoType.getType interfaceInfo;

(* ** properties ** *)
ObjectInfo.getNProperties objectInfo;
map (I &&& (InfoType.getType &&& BaseInfo.getName) o ObjectInfo.getProperty objectInfo) (0 -- 0);

val propertyInfo = ObjectInfo.getProperty objectInfo 0;
val typeInfo = PropertyInfo.getType propertyInfo;

TypeInfo.isPointer typeInfo;
val SOME interfaceInfo = TypeInfo.getInterface typeInfo;
BaseInfo.getName interfaceInfo;
BaseInfo.getNamespace interfaceInfo;
TypeInfo.getTag typeInfo;
InfoType.getType interfaceInfo;










val tylib_gdk_pixbuf =
  Repository.require repo "GdkPixbuf" "2.0" (RepositoryLoadFlags.flags []);
Typelib.getNamespace tylib_gdk_pixbuf;
val SOME cprefix_gdk_pixbuf = Repository.getCPrefix repo "GdkPixbuf";
val s = Repository.loadTypelib repo tylib_gdk_pixbuf (RepositoryLoadFlags.flags []);
val n = Repository.getNInfos repo s;

PolyML.print_depth 30;
map (I &&& (InfoType.getType &&& BaseInfo.getName) o Repository.getInfo repo s) (0 -- 26);

val info = Repository.getInfo repo s 16;  (* PixbufLoader *)
val InfoType.OBJECT objectInfo = InfoType.getType info;
BaseInfo.getName objectInfo;
BaseInfo.getNamespace objectInfo;
ObjectInfo.getNMethods objectInfo;

map (I &&& (InfoType.getType &&& BaseInfo.getName) o ObjectInfo.getMethod objectInfo) (0 -- 8);

val info = ObjectInfo.getMethod objectInfo 5; (* get_format *)
val InfoType.FUNCTION functionInfo = InfoType.getType info;
BaseInfo.getName functionInfo;
FunctionInfo.getSymbol functionInfo;

CallableInfo.getNArgs functionInfo;
CallableInfo.getCallerOwns functionInfo; (* EVERYTHING! eh? *)
CallableInfo.mayReturnNull functionInfo;







val tylib_glib =
  Repository.require repo "GLib" "2.0" (RepositoryLoadFlags.flags []);
Typelib.getNamespace tylib_glib;
val SOME cprefix_glib = Repository.getCPrefix repo "GLib";
val s = Repository.loadTypelib repo tylib_glib (RepositoryLoadFlags.flags []);
val n = Repository.getNInfos repo s;

PolyML.print_depth 750;
map (I &&& (InfoType.getType &&& BaseInfo.getName) o Repository.getInfo repo s) (0 -- 726);

(* filter out UNIONs *)
List.mapPartial ((fn (i, SOME x) => SOME (i, BaseInfo.getName x) | (_, NONE) => NONE) o (I &&& (fn info => case InfoType.getType info of InfoType.UNION _ => SOME info | _ => NONE) o Repository.getInfo repo s)) (0 -- 726)


val info = Repository.getInfo repo s 134;  (* KeyFile *)
val info = Repository.getInfo repo s 151;  (* MainContext *)
val InfoType.STRUCT structInfo = InfoType.getType info;
BaseInfo.getName structInfo;
StructInfo.getNMethods structInfo;

map (I &&& (InfoType.getType &&& BaseInfo.getName) o StructInfo.getMethod structInfo) (0 -- 23);


val info = Repository.getInfo repo s 224;  (* ShellError *)
val InfoType.ENUM enumInfo = InfoType.getType info;
BaseInfo.getName enumInfo;
BaseInfo.getNamespace enumInfo;

EnumInfo.getErrorDomain enumInfo;



val tylib_gobject =
  Repository.require repo "GObject" "2.0" (RepositoryLoadFlags.flags []);
val SOME cprefix_gobject = Repository.getCPrefix repo "GObject";
val s = Repository.loadTypelib repo tylib_gobject (RepositoryLoadFlags.flags []);
val n = Repository.getNInfos repo s;


PolyML.print_depth 250;

map (I &&& (InfoType.getType &&& BaseInfo.getName) o Repository.getInfo repo s) (0 -- 222);

val info = Repository.getInfo repo s 19;
val info = Repository.getInfo repo s 25;  (* Object *)
val info = Repository.getInfo repo s 37;
val InfoType.OBJECT objectInfo = InfoType.getType info;
BaseInfo.getName objectInfo;
ObjectInfo.getRefFunction objectInfo;

val SOME objectInfo = ObjectInfo.getParent objectInfo;
BaseInfo.getName objectInfo;

val NONE = ObjectInfo.getParent objectInfo;

(* ** properties ** *)
ObjectInfo.getNProperties objectInfo;
map (I &&& (InfoType.getType &&& BaseInfo.getName) o ObjectInfo.getProperty objectInfo) (0 -- 33);




val tylib_gio =
  Repository.require repo "Gio" "2.0" (RepositoryLoadFlags.flags []);
val SOME cprefix_gobject = Repository.getCPrefix repo "Gio";
val s = Repository.loadTypelib repo tylib_gio (RepositoryLoadFlags.flags []);
val n = Repository.getNInfos repo s;

PolyML.print_depth 600;
map (I &&& (InfoType.getType &&& BaseInfo.getName) o Repository.getInfo repo s) (0 -- 579);

val info = Repository.getInfo repo s 62;  (* DBusConnection *)
val info = Repository.getInfo repo s 89;  (* DBusObjectManagerClient *)
val InfoType.OBJECT objectInfo = InfoType.getType info;
BaseInfo.getName objectInfo;


(* ** properties ** *)
ObjectInfo.getNProperties objectInfo;
map (I &&& (InfoType.getType &&& BaseInfo.getName) o ObjectInfo.getProperty objectInfo) (0 -- 8);


(* ** signals ** *)
ObjectInfo.getNSignals objectInfo;
map (I &&& (InfoType.getType &&& BaseInfo.getName) o ObjectInfo.getSignal objectInfo) (0 -- 0);

val signalInfo = ObjectInfo.getSignal objectInfo 0;

(* *** parameter values *** *)
CallableInfo.getNArgs signalInfo;
map (I &&& (InfoType.getType &&& BaseInfo.getName) o CallableInfo.getArg signalInfo) (0 -- 1);
val argInfo = CallableInfo.getArg signalInfo 1;
ArgInfo.mayBeNull argInfo;

val typeInfo = ArgInfo.getType argInfo;
TypeInfo.isPointer typeInfo;
TypeInfo.getTag typeInfo;






val tylib_atk =
  Repository.require repo "Atk" "1.0" (RepositoryLoadFlags.flags []);
val SOME cprefix_atk = Repository.getCPrefix repo "Atk";
val s = Repository.loadTypelib repo tylib_atk (RepositoryLoadFlags.flags []);
val n = Repository.getNInfos repo s;

PolyML.print_depth 250;

map (I &&& (InfoType.getType &&& BaseInfo.getName) o Repository.getInfo repo s) (0 -- 103);







val tylib_cairo =
  Repository.require repo "cairo" "1.0" (RepositoryLoadFlags.flags []);
val SOME cprefix_cairo = Repository.getCPrefix repo "cairo";
val SOME shared_library_cairo = Repository.getSharedLibrary repo "cairo";
val s = Repository.loadTypelib repo tylib_cairo (RepositoryLoadFlags.flags []);
val n = Repository.getNInfos repo s;

PolyML.print_depth 250;

map (I &&& (InfoType.getType &&& BaseInfo.getName) o Repository.getInfo repo s) (0 -- 12);


Repository.getDependencies repo "cairo";





val tylib_gtksource =
  Repository.require repo "GtkSource" "3.0" (RepositoryLoadFlags.flags []);
val SOME cprefix_gtksource = Repository.getCPrefix repo "GtkSource";
val s = Repository.loadTypelib repo tylib_gtksource (RepositoryLoadFlags.flags []);
val n = Repository.getNInfos repo s;

PolyML.print_depth 250;

map (I &&& (InfoType.getType &&& BaseInfo.getName) o Repository.getInfo repo s) (0 -- 71);





val tylib_vte =
  Repository.require repo "Vte" "2.90" (RepositoryLoadFlags.flags []);
val SOME cprefix_vte = Repository.getCPrefix repo "Vte";
val s = Repository.loadTypelib repo tylib_vte (RepositoryLoadFlags.flags []);
val n = Repository.getNInfos repo s;

PolyML.print_depth 250;

map (I &&& (InfoType.getType &&& BaseInfo.getName) o Repository.getInfo repo s) (0 -- 16);

val info = Repository.getInfo repo s 5;  (* Terminal *)
val InfoType.OBJECT objectInfo = InfoType.getType info;
BaseInfo.getName objectInfo;
ObjectInfo.getNMethods objectInfo;

map (I &&& (InfoType.getType &&& BaseInfo.getName) o ObjectInfo.getMethod objectInfo) (0 -- 90);





*)
