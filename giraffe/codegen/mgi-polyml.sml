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



signature GI_BASE_INFO_CLASS =
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

structure GIBaseInfoClass :>
  sig
    include GI_BASE_INFO_CLASS

    structure PolyML :
      sig
        val PTR : C.notnull C.p CInterface.Conversion
        val OPTPTR : unit C.p CInterface.Conversion
      end
  end =
  struct
    type cptr = CPointer.notnull CPointer.t
    type coptptr = unit CPointer.t
    val CPTR = CPointer.PolyML.POINTER : cptr CInterface.Conversion
    val COPTPTR = CPointer.PolyML.POINTER : coptptr CInterface.Conversion

    local
      open PolyMLFFI
    in
      val ref_ =
        call
          (load_sym libgirepository "g_base_info_ref")
          (CPTR --> CPTR);

      val unref_sym = load_sym libgirepository "g_base_info_unref";
    end


    structure C =
      struct
        structure Pointer = CPointer
        type notnull = Pointer.notnull
        type 'a p = 'a Pointer.t

        fun withPtr f x = Finalizable.withValue (x, f)

        fun withOptPtr f =
          fn
            SOME ptr => withPtr (f o Pointer.toOptNull) ptr
          | NONE     => f Pointer.null

        fun fromPtr transfer ptr =
          let
            val object = Finalizable.new ptr
          in
            if transfer
            then ()  (* take the existing reference *)
            else ignore (ref_ ptr);
            Finalizable.addFinalizer (object, unref_sym);
            object
          end

        fun fromOptPtr transfer optptr =
          Option.map (fromPtr transfer) (CPointer.toOpt optptr)
      end

    structure PolyML =
      struct
        val PTR = CPTR
        val OPTPTR = COPTPTR
      end

    type 'a t = C.notnull C.p Finalizable.t
    fun toBase info = info
  end



signature GI_CALLABLE_INFO_CLASS =
  sig
    type 'a baseinfoclass_t
    type 'a callableinfo
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

structure GICallableInfoClass :>
  sig
    include GI_CALLABLE_INFO_CLASS
      where type 'a baseinfoclass_t = 'a GIBaseInfoClass.t
      where type C.notnull = GIBaseInfoClass.C.notnull
      where type 'a C.p = 'a GIBaseInfoClass.C.p
  end =
  struct
    type 'a baseinfoclass_t = 'a GIBaseInfoClass.t
    type 'a callableinfo = unit
    type 'a t = 'a callableinfo baseinfoclass_t

    fun toBase info = info

    structure C = GIBaseInfoClass.C
  end



signature GI_FUNCTION_INFO_CLASS =
  sig
    type 'a callableinfoclass_t
    type 'a functioninfo
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

structure GIFunctionInfoClass :>
  sig
    include GI_FUNCTION_INFO_CLASS
      where type 'a callableinfoclass_t = 'a GICallableInfoClass.t
      where type C.notnull = GICallableInfoClass.C.notnull
      where type 'a C.p = 'a GICallableInfoClass.C.p
  end =
  struct
    type 'a callableinfoclass_t = 'a GICallableInfoClass.t
    type 'a functioninfo = unit
    type 'a t = 'a functioninfo callableinfoclass_t

    fun toBase info = info

    structure C = GICallableInfoClass.C
  end



signature GI_SIGNAL_INFO_CLASS =
  sig
    type 'a callableinfoclass_t
    type 'a signalinfo
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

structure GISignalInfoClass :>
  sig
    include GI_SIGNAL_INFO_CLASS
      where type 'a callableinfoclass_t = 'a GICallableInfoClass.t
      where type C.notnull = GICallableInfoClass.C.notnull
      where type 'a C.p = 'a GICallableInfoClass.C.p
  end =
  struct
    type 'a callableinfoclass_t = 'a GICallableInfoClass.t
    type 'a signalinfo = unit
    type 'a t = 'a signalinfo callableinfoclass_t

    fun toBase info = info

    structure C = GICallableInfoClass.C
  end



signature GI_VFUNC_INFO_CLASS =
  sig
    type 'a callableinfoclass_t
    type 'a vfuncinfo
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

structure GIVFuncInfoClass :>
  sig
    include GI_VFUNC_INFO_CLASS
      where type 'a callableinfoclass_t = 'a GICallableInfoClass.t
      where type C.notnull = GICallableInfoClass.C.notnull
      where type 'a C.p = 'a GICallableInfoClass.C.p
  end =
  struct
    type 'a callableinfoclass_t = 'a GICallableInfoClass.t
    type 'a vfuncinfo = unit
    type 'a t = 'a vfuncinfo callableinfoclass_t

    fun toBase info = info

    structure C = GICallableInfoClass.C
  end



signature GI_REGISTERED_TYPE_INFO_CLASS =
  sig
    type 'a baseinfoclass_t
    type 'a registeredtypeinfo
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

structure GIRegisteredTypeInfoClass :>
  sig
    include GI_REGISTERED_TYPE_INFO_CLASS
      where type 'a baseinfoclass_t = 'a GIBaseInfoClass.t
      where type C.notnull = GIBaseInfoClass.C.notnull
      where type 'a C.p = 'a GIBaseInfoClass.C.p
  end =
  struct
    type 'a baseinfoclass_t = 'a GIBaseInfoClass.t
    type 'a registeredtypeinfo = unit
    type 'a t = 'a registeredtypeinfo baseinfoclass_t

    fun toBase info = info

    structure C = GIBaseInfoClass.C
  end



signature GI_ENUM_INFO_CLASS =
  sig
    type 'a registeredtypeinfoclass_t
    type 'a enuminfo
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

structure GIEnumInfoClass :>
  sig
    include GI_ENUM_INFO_CLASS
      where type 'a registeredtypeinfoclass_t = 'a GIRegisteredTypeInfoClass.t
      where type C.notnull = GIRegisteredTypeInfoClass.C.notnull
      where type 'a C.p = 'a GIRegisteredTypeInfoClass.C.p
  end =
  struct
    type 'a registeredtypeinfoclass_t = 'a GIRegisteredTypeInfoClass.t
    type 'a enuminfo = unit
    type 'a t = 'a enuminfo registeredtypeinfoclass_t

    fun toBase info = info

    structure C = GIRegisteredTypeInfoClass.C
  end



signature GI_INTERFACE_INFO_CLASS =
  sig
    type 'a registeredtypeinfoclass_t
    type 'a interfaceinfo
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

structure GIInterfaceInfoClass :>
  sig
    include GI_INTERFACE_INFO_CLASS
      where type 'a registeredtypeinfoclass_t = 'a GIRegisteredTypeInfoClass.t
      where type C.notnull = GIRegisteredTypeInfoClass.C.notnull
      where type 'a C.p = 'a GIRegisteredTypeInfoClass.C.p
  end =
  struct
    type 'a registeredtypeinfoclass_t = 'a GIRegisteredTypeInfoClass.t
    type 'a interfaceinfo = unit
    type 'a t = 'a interfaceinfo registeredtypeinfoclass_t

    fun toBase info = info

    structure C = GIRegisteredTypeInfoClass.C
  end



signature GI_OBJECT_INFO_CLASS =
  sig
    type 'a registeredtypeinfoclass_t
    type 'a objectinfo
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

structure GIObjectInfoClass :>
  sig
    include GI_OBJECT_INFO_CLASS
      where type 'a registeredtypeinfoclass_t = 'a GIRegisteredTypeInfoClass.t
      where type C.notnull = GIRegisteredTypeInfoClass.C.notnull
      where type 'a C.p = 'a GIRegisteredTypeInfoClass.C.p
  end =
  struct
    type 'a registeredtypeinfoclass_t = 'a GIRegisteredTypeInfoClass.t
    type 'a objectinfo = unit
    type 'a t = 'a objectinfo registeredtypeinfoclass_t

    fun toBase info = info

    structure C = GIRegisteredTypeInfoClass.C
  end



signature GI_STRUCT_INFO_CLASS =
  sig
    type 'a registeredtypeinfoclass_t
    type 'a structinfo
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

structure GIStructInfoClass :>
  sig
    include GI_STRUCT_INFO_CLASS
      where type 'a registeredtypeinfoclass_t = 'a GIRegisteredTypeInfoClass.t
      where type C.notnull = GIRegisteredTypeInfoClass.C.notnull
      where type 'a C.p = 'a GIRegisteredTypeInfoClass.C.p
  end =
  struct
    type 'a registeredtypeinfoclass_t = 'a GIRegisteredTypeInfoClass.t
    type 'a structinfo = unit
    type 'a t = 'a structinfo registeredtypeinfoclass_t

    fun toBase info = info

    structure C = GIRegisteredTypeInfoClass.C
  end



signature GI_UNION_INFO_CLASS =
  sig
    type 'a registeredtypeinfoclass_t
    type 'a unioninfo
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

structure GIUnionInfoClass :>
  sig
    include GI_UNION_INFO_CLASS
      where type 'a registeredtypeinfoclass_t = 'a GIRegisteredTypeInfoClass.t
      where type C.notnull = GIRegisteredTypeInfoClass.C.notnull
      where type 'a C.p = 'a GIRegisteredTypeInfoClass.C.p
  end =
  struct
    type 'a registeredtypeinfoclass_t = 'a GIRegisteredTypeInfoClass.t
    type 'a unioninfo = unit
    type 'a t = 'a unioninfo registeredtypeinfoclass_t

    fun toBase info = info

    structure C = GIRegisteredTypeInfoClass.C
  end



signature GI_ARG_INFO_CLASS =
  sig
    type 'a baseinfoclass_t
    type 'a arginfo
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

structure GIArgInfoClass :>
  sig
    include GI_ARG_INFO_CLASS
      where type 'a baseinfoclass_t = 'a GIBaseInfoClass.t
      where type C.notnull = GIBaseInfoClass.C.notnull
      where type 'a C.p = 'a GIBaseInfoClass.C.p
  end =
  struct
    type 'a baseinfoclass_t = 'a GIBaseInfoClass.t
    type 'a arginfo = unit
    type 'a t = 'a arginfo baseinfoclass_t

    fun toBase info = info

    structure C = GIBaseInfoClass.C
  end



signature GI_CONSTANT_INFO_CLASS =
  sig
    type 'a baseinfoclass_t
    type 'a constantinfo
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

structure GIConstantInfoClass :>
  sig
    include GI_CONSTANT_INFO_CLASS
      where type 'a baseinfoclass_t = 'a GIBaseInfoClass.t
      where type C.notnull = GIBaseInfoClass.C.notnull
      where type 'a C.p = 'a GIBaseInfoClass.C.p
  end =
  struct
    type 'a baseinfoclass_t = 'a GIBaseInfoClass.t
    type 'a constantinfo = unit
    type 'a t = 'a constantinfo baseinfoclass_t

    fun toBase info = info

    structure C = GIBaseInfoClass.C
  end



signature GI_FIELD_INFO_CLASS =
  sig
    type 'a baseinfoclass_t
    type 'a fieldinfo
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

structure GIFieldInfoClass :>
  sig
    include GI_FIELD_INFO_CLASS
      where type 'a baseinfoclass_t = 'a GIBaseInfoClass.t
      where type C.notnull = GIBaseInfoClass.C.notnull
      where type 'a C.p = 'a GIBaseInfoClass.C.p
  end =
  struct
    type 'a baseinfoclass_t = 'a GIBaseInfoClass.t
    type 'a fieldinfo = unit
    type 'a t = 'a fieldinfo baseinfoclass_t

    fun toBase info = info

    structure C = GIBaseInfoClass.C
  end



signature GI_PROPERTY_INFO_CLASS =
  sig
    type 'a baseinfoclass_t
    type 'a propertyinfo
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

structure GIPropertyInfoClass :>
  sig
    include GI_PROPERTY_INFO_CLASS
      where type 'a baseinfoclass_t = 'a GIBaseInfoClass.t
      where type C.notnull = GIBaseInfoClass.C.notnull
      where type 'a C.p = 'a GIBaseInfoClass.C.p
  end =
  struct
    type 'a baseinfoclass_t = 'a GIBaseInfoClass.t
    type 'a propertyinfo = unit
    type 'a t = 'a propertyinfo baseinfoclass_t

    fun toBase info = info

    structure C = GIBaseInfoClass.C
  end



signature GI_TYPE_INFO_CLASS =
  sig
    type 'a baseinfoclass_t
    type 'a typeinfo
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

structure GITypeInfoClass :>
  sig
    include GI_TYPE_INFO_CLASS
      where type 'a baseinfoclass_t = 'a GIBaseInfoClass.t
      where type C.notnull = GIBaseInfoClass.C.notnull
      where type 'a C.p = 'a GIBaseInfoClass.C.p
  end =
  struct
    type 'a baseinfoclass_t = 'a GIBaseInfoClass.t
    type 'a typeinfo = unit
    type 'a t = 'a typeinfo baseinfoclass_t

    fun toBase info = info

    structure C = GIBaseInfoClass.C
  end



signature GI_VALUE_INFO_CLASS =
  sig
    type 'a baseinfoclass_t
    type 'a valueinfo
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

structure GIValueInfoClass :>
  sig
    include GI_VALUE_INFO_CLASS
      where type 'a baseinfoclass_t = 'a GIBaseInfoClass.t
      where type C.notnull = GIBaseInfoClass.C.notnull
      where type 'a C.p = 'a GIBaseInfoClass.C.p
  end =
  struct
    type 'a baseinfoclass_t = 'a GIBaseInfoClass.t
    type 'a valueinfo = unit
    type 'a t = 'a valueinfo baseinfoclass_t

    fun toBase info = info

    structure C = GIBaseInfoClass.C
  end







signature GI_TYPE_TAG =
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
    val to_string : t -> string
    structure C :
      sig
        type val_
        val withVal : (val_ -> 'a) -> t -> 'a
        val fromVal : val_ -> t
        exception Value of Int32.int
      end
  end

structure GITypeTag :>
  sig
    include GI_TYPE_TAG

    structure PolyML :
      sig
        val VAL : C.val_ CInterface.Conversion
      end
  end =
  struct
    local
      open PolyMLFFI
    in
      val to_string_ =
        call
          (load_sym libgirepository "g_type_tag_to_string")
          (FFI.PolyML.Enum.VAL --> FFI.PolyML.String.RETPTR);
    end


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
        exception Value of FFI.Enum.val_
        fun withVal f =
          fn
            VOID      => f 0
          | BOOLEAN   => f 1
          | INT8      => f 2
          | UINT8     => f 3
          | INT16     => f 4
          | UINT16    => f 5
          | INT32     => f 6
          | UINT32    => f 7
          | INT64     => f 8
          | UINT64    => f 9
          | FLOAT     => f 10
          | DOUBLE    => f 11
          | GTYPE     => f 12
          | UTF8      => f 13
          | FILENAME  => f 14
          | ARRAY     => f 15
          | INTERFACE => f 16
          | GLIST     => f 17
          | GSLIST    => f 18
          | GHASH     => f 19
          | ERROR     => f 20
          | UNICHAR   => f 21
        val table = Vector.fromList [
          VOID,
          BOOLEAN,
          INT8,
          UINT8,
          INT16,
          UINT16,
          INT32,
          UINT32,
          INT64,
          UINT64,
          FLOAT,
          DOUBLE,
          GTYPE,
          UTF8,
          FILENAME,
          ARRAY,
          INTERFACE,
          GLIST,
          GSLIST,
          GHASH,
          ERROR,
          UNICHAR
        ]
        fun fromVal n =
          Vector.sub (table, Int32.toInt n) handle Subscript => raise Value n
      end

    structure PolyML =
      struct
        val VAL = FFI.PolyML.Enum.VAL
      end


    val to_string =
      fn typ =>
        (C.withVal ---> FFI.String.fromPtr false) to_string_ typ
  end



signature GI_ARRAY_TYPE =
  sig
    datatype t =
      C
    | ARRAY
    | PTR_ARRAY
    | BYTE_ARRAY
    structure C :
      sig
        type val_
        val withVal : (val_ -> 'a) -> t -> 'a
        val fromVal : val_ -> t
        exception Value of Int32.int
      end
  end

structure GIArrayType :>
  sig
    include GI_ARRAY_TYPE

    structure PolyML :
      sig
        val VAL : C.val_ CInterface.Conversion
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
        exception Value of FFI.Enum.val_
        fun withVal f =
          fn
            C          => f 0
          | ARRAY      => f 1
          | PTR_ARRAY  => f 2
          | BYTE_ARRAY => f 3
        val table = Vector.fromList [
          C,
          ARRAY,
          PTR_ARRAY,
          BYTE_ARRAY
        ]
        fun fromVal n =
          Vector.sub (table, Int32.toInt n) handle Subscript => raise Value n
      end

    structure PolyML =
      struct
        val VAL = FFI.PolyML.Enum.VAL
      end
  end







signature GI_BASE_INFO =
  sig
    type 'a t

    val get_name : 'a t -> string option
    val get_namespace : 'a t -> string
    val is_deprecated : 'a t -> bool
    val get_attribute : 'a t -> string -> string option
    val get_container : 'a t -> base t
    val equal : 'a t -> 'b t -> bool
  end

structure GIBaseInfo :>
  GI_BASE_INFO
    where type 'a t = 'a GIBaseInfoClass.t =
  struct
    local
      open PolyMLFFI
    in
      val get_name_ =
        call
          (load_sym libgirepository "g_base_info_get_name")
          (GIBaseInfoClass.PolyML.PTR --> FFI.PolyML.String.RETPTR);

      val get_namespace_ =
        call
          (load_sym libgirepository "g_base_info_get_namespace")
          (GIBaseInfoClass.PolyML.PTR --> FFI.PolyML.String.RETPTR);

      val is_deprecated_ =
        call
          (load_sym libgirepository "g_base_info_is_deprecated")
          (GIBaseInfoClass.PolyML.PTR --> FFI.PolyML.Bool.VAL);

      val get_attribute_ =
        call
          (load_sym libgirepository "g_base_info_get_attribute")
          (GIBaseInfoClass.PolyML.PTR
            &&> FFI.PolyML.String.INPTR
            --> FFI.PolyML.String.RETOPTPTR);

      val get_container_ =
        call
          (load_sym libgirepository "g_base_info_get_container")
          (GIBaseInfoClass.PolyML.PTR --> GIBaseInfoClass.PolyML.PTR);

      val equal_ =
        call
          (load_sym libgirepository "g_base_info_equal")
          (GIBaseInfoClass.PolyML.PTR
            &&> GIBaseInfoClass.PolyML.PTR
            --> FFI.PolyML.Bool.VAL);
    end


    type 'a t = 'a GIBaseInfoClass.t


    val get_name =
      fn info =>
        (GIBaseInfoClass.C.withPtr ---> FFI.String.fromOptPtr false)
          get_name_ info

    val get_namespace =
      fn info =>
        (GIBaseInfoClass.C.withPtr ---> FFI.String.fromPtr false)
          get_namespace_
          info

    val is_deprecated =
      fn info =>
        (GIBaseInfoClass.C.withPtr ---> I)
          is_deprecated_
          info

    val get_attribute =
      fn info => fn name =>
        (GIBaseInfoClass.C.withPtr
          &&&> FFI.String.withConstPtr
          ---> FFI.String.fromOptPtr false)
          get_attribute_
          (info & name)

    val get_container =
      fn info =>
        (GIBaseInfoClass.C.withPtr ---> GIBaseInfoClass.C.fromPtr false)
          get_container_
          info

    val equal =
      fn info1 => fn info2 =>
        (GIBaseInfoClass.C.withPtr &&&> GIBaseInfoClass.C.withPtr ---> I)
        equal_
        (info1 & info2)
  end



signature GI_TYPE_INFO =
  sig
    type 'a t
    type typetag_t
    type arraytype_t
    type 'a baseinfoclass_t
    val is_pointer : 'a t -> bool
    val get_tag : 'a t -> typetag_t
    val get_param_type : 'a t -> LargeInt.int -> base t option
    val get_interface : 'a t -> base baseinfoclass_t option
    val get_array_length : 'a t -> LargeInt.int
    val get_array_fixed_size : 'a t -> LargeInt.int
    val is_zero_terminated : 'a t -> bool
    val get_array_type : 'a t -> arraytype_t
  end

structure GITypeInfo :>
  sig
    include GI_TYPE_INFO
      where type 'a t = 'a GITypeInfoClass.t
      where type typetag_t = GITypeTag.t
      where type arraytype_t = GIArrayType.t
      where type 'a baseinfoclass_t = 'a GIBaseInfoClass.t
  end =
  struct
    local
      open PolyMLFFI
    in
      val is_pointer_ =
        call
          (load_sym libgirepository "g_type_info_is_pointer")
          (GIBaseInfoClass.PolyML.PTR --> FFI.PolyML.Bool.VAL);

      val get_tag_ =
        call
          (load_sym libgirepository "g_type_info_get_tag")
          (GIBaseInfoClass.PolyML.PTR --> GITypeTag.PolyML.VAL);

      val get_param_type_ =
        call
          (load_sym libgirepository "g_type_info_get_param_type")
          (GIBaseInfoClass.PolyML.PTR
            &&> FFI.PolyML.Int32.VAL
            --> GIBaseInfoClass.PolyML.OPTPTR);

      val get_interface_ =
        call
          (load_sym libgirepository "g_type_info_get_interface")
          (GIBaseInfoClass.PolyML.PTR --> GIBaseInfoClass.PolyML.OPTPTR);

      val get_array_length_ =
        call
          (load_sym libgirepository "g_type_info_get_array_length")
          (GIBaseInfoClass.PolyML.PTR --> FFI.PolyML.Int32.VAL);

      val get_array_fixed_size_ =
        call
          (load_sym libgirepository "g_type_info_get_array_fixed_size")
          (GIBaseInfoClass.PolyML.PTR --> FFI.PolyML.Int32.VAL);

      val is_zero_terminated_ =
        call
          (load_sym libgirepository "g_type_info_is_zero_terminated")
          (GIBaseInfoClass.PolyML.PTR --> FFI.PolyML.Bool.VAL);

      val get_array_type_ =
        call
          (load_sym libgirepository "g_type_info_get_array_type")
          (GIBaseInfoClass.PolyML.PTR --> GIArrayType.PolyML.VAL);
    end


    type 'a t = 'a GITypeInfoClass.t
    type typetag_t = GITypeTag.t
    type arraytype_t = GIArrayType.t
    type 'a baseinfoclass_t = 'a GIBaseInfoClass.t


    val is_pointer =
      fn info => (GIBaseInfoClass.C.withPtr ---> I) is_pointer_ info

    val get_tag =
      fn info =>
        (GIBaseInfoClass.C.withPtr ---> GITypeTag.C.fromVal) get_tag_ info

    val get_param_type =
      fn info => fn n =>
        (GIBaseInfoClass.C.withPtr
          &&&> I
          ---> GITypeInfoClass.C.fromOptPtr true)
          get_param_type_
          (info & n)

    val get_interface =
      fn info =>
        (GIBaseInfoClass.C.withPtr ---> GIBaseInfoClass.C.fromOptPtr true)
          get_interface_
          info

    val get_array_length =
      fn info => (GIBaseInfoClass.C.withPtr ---> I) get_array_length_ info

    val get_array_fixed_size =
      fn info => (GIBaseInfoClass.C.withPtr ---> I) get_array_fixed_size_ info

    val is_zero_terminated =
      fn info => (GIBaseInfoClass.C.withPtr ---> I) is_zero_terminated_ info

    val get_array_type =
      fn info =>
        (GIBaseInfoClass.C.withPtr ---> GIArrayType.C.fromVal)
          get_array_type_
          info
  end



signature GI_ARGUMENT =
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

structure GIArgument :>
  sig
    include GI_ARGUMENT
      where type typetag_t = GITypeTag.t

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

    type typetag_t = GITypeTag.t

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
              GITypeTag.BOOLEAN  => BOOLEAN (from_boolean_ ptr)
            | GITypeTag.INT8     => INT8    (from_int8_ ptr)
            | GITypeTag.UINT8    => UINT8   (from_uint8_ ptr)
            | GITypeTag.INT16    => INT16   (from_int16_ ptr)
            | GITypeTag.UINT16   => UINT16  (from_uint16_ ptr)
            | GITypeTag.INT32    => INT32   (from_int32_ ptr)
            | GITypeTag.UINT32   => UINT32  (from_uint32_ ptr)
            | GITypeTag.INT64    => INT64   (from_int64_ ptr)
            | GITypeTag.UINT64   => UINT64  (from_uint64_ ptr)
            | GITypeTag.FLOAT    => FLOAT   (from_float_ ptr)
            | GITypeTag.DOUBLE   => DOUBLE  (from_double_ ptr)
            | GITypeTag.UTF8     => STRING (
                FFI.String.fromPtr true (from_string_ ptr)
              )
            | GITypeTag.FILENAME => STRING (
                FFI.String.fromPtr true (from_string_ ptr)
              )
            | GITypeTag.VOID      => VOID
            | GITypeTag.GTYPE     => GTYPE
            | GITypeTag.ARRAY     => ARRAY
            | GITypeTag.INTERFACE => INTERFACE
            | GITypeTag.GLIST     => GLIST
            | GITypeTag.GSLIST    => GSLIST
            | GITypeTag.GHASH     => GHASH
            | GITypeTag.ERROR     => ERROR
            | GITypeTag.UNICHAR   => UNICHAR
          ) before free_ ptr
      end

    structure PolyML =
      struct
        val PTR = PTR
        val OPTPTR = OPTPTR
      end
  end



signature GI_CONSTANT_INFO =
  sig
    type 'a t

    type 'a typeinfoclass_t
    type argument_t

    val get_type : 'a t -> base typeinfoclass_t
    val get_value : 'a t -> argument_t
  end

structure GIConstantInfo :>
  sig
    include GI_CONSTANT_INFO
      where type 'a t = 'a GIConstantInfoClass.t
      where type 'a typeinfoclass_t = 'a GITypeInfoClass.t
      where type argument_t = GIArgument.t
  end =
  struct
    local
      open PolyMLFFI
    in
      val get_type_ =
        call
          (load_sym libgirepository "g_constant_info_get_type")
          (GIBaseInfoClass.PolyML.PTR --> GIBaseInfoClass.PolyML.PTR);

      val get_value_ =
        call
          (load_sym libgirepository "g_constant_info_get_value")
          (GIBaseInfoClass.PolyML.PTR
            &&> GIArgument.PolyML.PTR
            --> FFI.PolyML.Int32.VAL);
    end


    type 'a t = 'a GIConstantInfoClass.t
    type 'a typeinfoclass_t = 'a GITypeInfoClass.t
    type argument_t = GIArgument.t


    val get_type =
      fn info =>
        (GIBaseInfoClass.C.withPtr ---> GITypeInfoClass.C.fromPtr true)
          get_type_
          info

    val get_value =
      fn info =>
        let
          val tag = GITypeInfo.get_tag (get_type info)
          val value & _ =
            (GIBaseInfoClass.C.withPtr
              &&&> GIArgument.C.withNewPtr
              ---> GIArgument.C.fromPtr tag && I)
              get_value_
              (info & ())
        in
          value
        end
  end



signature GI_REGISTERED_TYPE_INFO =
  sig
    type 'a t
    type type_t

    val get_type_name : 'a t -> string option
    val get_type_init : 'a t -> string option
    val get_g_type : 'a t -> type_t
  end

structure GIRegisteredTypeInfo :>
  sig
    include GI_REGISTERED_TYPE_INFO
      where type 'a t = 'a GIRegisteredTypeInfoClass.t
      where type type_t = GObjectType.t
  end =
  struct
    local
      open PolyMLFFI
    in
      val get_type_name_ =
        call
          (load_sym libgirepository "g_registered_type_info_get_type_name")
          (GIBaseInfoClass.PolyML.PTR --> FFI.PolyML.String.RETOPTPTR);

      val get_type_init_ =
        call
          (load_sym libgirepository "g_registered_type_info_get_type_init")
          (GIBaseInfoClass.PolyML.PTR --> FFI.PolyML.String.RETOPTPTR);

      val get_g_type_ =
        call
          (load_sym libgirepository "g_registered_type_info_get_g_type")
          (GIBaseInfoClass.PolyML.PTR --> GObjectType.PolyML.VAL);
    end


    type 'a t = 'a GIRegisteredTypeInfoClass.t
    type type_t = GObjectType.t


    val get_type_name =
      fn info =>
        (GIBaseInfoClass.C.withPtr ---> FFI.String.fromOptPtr false)
          get_type_name_
          info

    val get_type_init =
      fn info =>
        (GIBaseInfoClass.C.withPtr ---> FFI.String.fromOptPtr false)
          get_type_init_
          info

    val get_g_type =
      fn info =>
        (GIBaseInfoClass.C.withPtr ---> GObjectType.C.fromVal) get_g_type_ info
  end




signature GI_VALUE_INFO =
  sig
    type 'a t

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
    val get_value_int : 'a t -> LargeInt.int
    val get_value_word : 'a t -> LargeInt.int
  end

structure GIValueInfo :>
  sig
    include GI_VALUE_INFO
      where type 'a t = 'a GIValueInfoClass.t
  end =
  struct
    local
      open PolyMLFFI
    in
      val get_value_int_ =
        call
          (load_sym libgirepository "g_value_info_get_value")
          (GIBaseInfoClass.PolyML.PTR --> FFI.PolyML.Int32.VAL);

      val get_value_word_ =
        call
          (load_sym libgirepository "g_value_info_get_value")
          (GIBaseInfoClass.PolyML.PTR --> FFI.PolyML.Word32.VAL);
    end


    type 'a t = 'a GIValueInfoClass.t


    fun get_value_int info =
      (GIBaseInfoClass.C.withPtr ---> FFI.Int32.fromVal) get_value_int_ info

    fun get_value_word info =
      (GIBaseInfoClass.C.withPtr ---> FFI.Word32.fromVal) get_value_word_ info
  end



signature GI_DIRECTION =
  sig
    datatype t =
      IN
    | OUT
    | INOUT
    structure C :
      sig
        type val_
        val fromVal : val_ -> t
        exception Value of Int32.int
      end
  end

structure GIDirection :>
  sig
    include GI_DIRECTION
    structure PolyML :
      sig
        val VAL : C.val_ CInterface.Conversion
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
        exception Value of FFI.Enum.val_
        val table = Vector.fromList [IN, OUT, INOUT]
        fun fromVal n =
          Vector.sub (table, Int32.toInt n) handle Subscript => raise Value n
      end

    structure PolyML =
      struct
        val VAL = FFI.PolyML.Enum.VAL
      end
  end



signature GI_SCOPE_TYPE =
  sig
    datatype t =
      INVALID
    | CALL
    | ASYNC
    | NOTIFIED
    structure C :
      sig
        type val_
        val fromVal : val_ -> t
        exception Value of Int32.int
      end
  end

structure GIScopeType :>
  sig
    include GI_SCOPE_TYPE
    structure PolyML :
      sig
        val VAL : C.val_ CInterface.Conversion
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
        exception Value of FFI.Enum.val_
        val table = Vector.fromList [INVALID, CALL, ASYNC, NOTIFIED]
        fun fromVal n =
          Vector.sub (table, Int32.toInt n) handle Subscript => raise Value n
      end

    structure PolyML =
      struct
        val VAL = FFI.PolyML.Enum.VAL
      end
  end



signature GI_TRANSFER =
  sig
    datatype t =
      NOTHING
    | CONTAINER
    | EVERYTHING
    structure C :
      sig
        type val_
        val fromVal : val_ -> t
        exception Value of Int32.int
      end
  end

structure GITransfer :>
  sig
    include GI_TRANSFER
    structure PolyML :
      sig
        val VAL : C.val_ CInterface.Conversion
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
        exception Value of FFI.Enum.val_
        val table = Vector.fromList [NOTHING, CONTAINER, EVERYTHING]
        fun fromVal n =
          Vector.sub (table, Int32.toInt n) handle Subscript => raise Value n
      end

    structure PolyML =
      struct
        val VAL = FFI.PolyML.Enum.VAL
      end
  end



signature GI_ARG_INFO =
  sig
    type 'a t

    type 'a typeinfoclass_t
    type direction_t
    type scopetype_t
    type transfer_t

    val get_direction : 'a t -> direction_t
    val is_caller_allocates : 'a t -> bool
    val is_return_value : 'a t -> bool
    val is_optional : 'a t -> bool
    val may_be_null : 'a t -> bool
    val get_ownership_transfer : 'a t -> transfer_t
    val get_scope : 'a t -> scopetype_t
    val get_closure : 'a t -> LargeInt.int option
    val get_destroy : 'a t -> LargeInt.int option
    val get_type : 'a t -> base typeinfoclass_t
  end

structure GIArgInfo :>
  sig
    include GI_ARG_INFO
      where type 'a t = 'a GIArgInfoClass.t
      where type 'a typeinfoclass_t = 'a GITypeInfoClass.t
      where type direction_t = GIDirection.t
      where type scopetype_t = GIScopeType.t
      where type transfer_t = GITransfer.t
  end =
  struct
    local
      open PolyMLFFI
    in
      val get_direction_ =
        call
          (load_sym libgirepository "g_arg_info_get_direction")
          (GIBaseInfoClass.PolyML.PTR --> GIDirection.PolyML.VAL);

      val is_caller_allocates_ =
        call
          (load_sym libgirepository "g_arg_info_is_caller_allocates")
          (GIBaseInfoClass.PolyML.PTR --> FFI.PolyML.Bool.VAL);

      val is_return_value_ =
        call
          (load_sym libgirepository "g_arg_info_is_return_value")
          (GIBaseInfoClass.PolyML.PTR --> FFI.PolyML.Bool.VAL);

      val is_optional_ =
        call
          (load_sym libgirepository "g_arg_info_is_optional")
          (GIBaseInfoClass.PolyML.PTR --> FFI.PolyML.Bool.VAL);

      val may_be_null_ =
        call
          (load_sym libgirepository "g_arg_info_may_be_null")
          (GIBaseInfoClass.PolyML.PTR --> FFI.PolyML.Bool.VAL);

      val get_ownership_transfer_ =
        call
          (load_sym libgirepository "g_arg_info_get_ownership_transfer")
          (GIBaseInfoClass.PolyML.PTR --> GITransfer.PolyML.VAL);

      val get_scope_ =
        call
          (load_sym libgirepository "g_arg_info_get_scope")
          (GIBaseInfoClass.PolyML.PTR --> GIScopeType.PolyML.VAL);

      val get_closure_ =
        call
          (load_sym libgirepository "g_arg_info_get_closure")
          (GIBaseInfoClass.PolyML.PTR --> FFI.PolyML.Int32.VAL);

      val get_destroy_ =
        call
          (load_sym libgirepository "g_arg_info_get_destroy")
          (GIBaseInfoClass.PolyML.PTR --> FFI.PolyML.Int32.VAL);

      val get_type_ =
        call
          (load_sym libgirepository "g_arg_info_get_type")
          (GIBaseInfoClass.PolyML.PTR --> GIBaseInfoClass.PolyML.PTR);
    end


    type 'a t = 'a GIArgInfoClass.t
    type 'a typeinfoclass_t = 'a GITypeInfoClass.t
    type direction_t = GIDirection.t
    type scopetype_t = GIScopeType.t
    type transfer_t = GITransfer.t


    val get_direction =
      fn info =>
        (GIBaseInfoClass.C.withPtr ---> GIDirection.C.fromVal) get_direction_ info

    val is_caller_allocates =
      fn info =>
        (GIBaseInfoClass.C.withPtr ---> I) is_caller_allocates_ info

    val is_return_value =
      fn info =>
        (GIBaseInfoClass.C.withPtr ---> I) is_return_value_ info

    val is_optional =
      fn info =>
        (GIBaseInfoClass.C.withPtr ---> I) is_optional_ info

    val may_be_null =
      fn info =>
        (GIBaseInfoClass.C.withPtr ---> I) may_be_null_ info

    val get_ownership_transfer =
      fn info =>
        (GIBaseInfoClass.C.withPtr ---> GITransfer.C.fromVal)
          get_ownership_transfer_
          info

    val get_scope =
      fn info =>
        (GIBaseInfoClass.C.withPtr ---> GIScopeType.C.fromVal) get_scope_ info

    val get_closure =
      fn info =>
        (GIBaseInfoClass.C.withPtr ---> (fn ~1 => NONE | n => SOME n))
          get_closure_
          info

    val get_destroy =
      fn info =>
        (GIBaseInfoClass.C.withPtr ---> (fn ~1 => NONE | n => SOME n))
          get_destroy_
          info

    val get_type =
      fn info =>
        (GIBaseInfoClass.C.withPtr ---> GITypeInfoClass.C.fromPtr true)
          get_type_
          info
  end



signature GI_CALLABLE_INFO =
  sig
    type 'a t

    type 'a arginfoclass_t
    type 'a typeinfoclass_t
    type transfer_t

    val get_return_type : 'a t -> base typeinfoclass_t
    val get_caller_owns : 'a t -> transfer_t
    val may_return_null : 'a t -> bool
    val get_return_attribute : 'a t -> string -> string option
    val get_n_args : 'a t -> LargeInt.int
    val get_arg : 'a t -> LargeInt.int -> base arginfoclass_t
  end

structure GICallableInfo :>
  sig
    include GI_CALLABLE_INFO
      where type 'a t = 'a GICallableInfoClass.t
      where type 'a typeinfoclass_t = 'a GITypeInfoClass.t
      where type transfer_t = GITransfer.t
      where type 'a arginfoclass_t = 'a GIArgInfoClass.t
  end =
  struct
    local
      open PolyMLFFI
    in
      val get_return_type_ =
        call
          (load_sym libgirepository "g_callable_info_get_return_type")
          (GIBaseInfoClass.PolyML.PTR --> GIBaseInfoClass.PolyML.PTR);

      val get_caller_owns_ =
        call
          (load_sym libgirepository "g_callable_info_get_caller_owns")
          (GIBaseInfoClass.PolyML.PTR --> GITransfer.PolyML.VAL);

      val may_return_null_ =
        call
          (load_sym libgirepository "g_callable_info_may_return_null")
          (GIBaseInfoClass.PolyML.PTR --> FFI.PolyML.Bool.VAL);

      val get_return_attribute_ =
        call
          (load_sym libgirepository "g_callable_info_get_return_attribute")
          (GIBaseInfoClass.PolyML.PTR
            &&> FFI.PolyML.String.INPTR
            --> FFI.PolyML.String.RETPTR);

      val get_n_args_ =
        call
          (load_sym libgirepository "g_callable_info_get_n_args")
          (GIBaseInfoClass.PolyML.PTR --> FFI.PolyML.Int32.VAL);

      val get_arg_ =
        call
          (load_sym libgirepository "g_callable_info_get_arg")
          (GIBaseInfoClass.PolyML.PTR
            &&> FFI.PolyML.Int32.VAL
            --> GIBaseInfoClass.PolyML.PTR);
    end


    type 'a t = 'a GICallableInfoClass.t
    type 'a arginfoclass_t = 'a GIArgInfoClass.t
    type 'a typeinfoclass_t = 'a GITypeInfoClass.t
    type transfer_t = GITransfer.t


    val get_return_type =
      fn info =>
        (GIBaseInfoClass.C.withPtr ---> GITypeInfoClass.C.fromPtr true)
          get_return_type_
          info

    val get_caller_owns =
      fn info =>
        (GIBaseInfoClass.C.withPtr ---> GITransfer.C.fromVal)
          get_caller_owns_
          info

    val may_return_null =
      fn info => (GIBaseInfoClass.C.withPtr ---> I) may_return_null_ info

    val get_return_attribute =
      fn info => fn name =>
        (GIBaseInfoClass.C.withPtr
          &&&> FFI.String.withConstPtr
          ---> FFI.String.fromOptPtr false)
          get_return_attribute_
          (info & name)

    val get_n_args =
      fn info => (GIBaseInfoClass.C.withPtr ---> I) get_n_args_ info

    val get_arg =
      fn info => fn n =>
        (GIBaseInfoClass.C.withPtr &&&> I ---> GIArgInfoClass.C.fromPtr true)
          get_arg_
          (info & n)
  end



signature GI_PROPERTY_INFO =
  sig
    type 'a t

    type 'a typeinfoclass_t
    type transfer_t
    type paramflags_t

    val get_flags : 'a t -> paramflags_t
    val get_type : 'a t -> base typeinfoclass_t
    val get_ownership_transfer : 'a t -> transfer_t
  end

structure GIPropertyInfo :>
  sig
    include GI_PROPERTY_INFO
      where type 'a t = 'a GIPropertyInfoClass.t
      where type 'a typeinfoclass_t = 'a GITypeInfoClass.t
      where type transfer_t = GITransfer.t
      where type paramflags_t = GObjectParamFlags.flags
  end =
  struct
    local
      open PolyMLFFI
    in
      val get_flags_ =
        call
          (load_sym libgirepository "g_property_info_get_flags")
          (GIBaseInfoClass.PolyML.PTR --> GObjectParamFlags.PolyML.VAL);

      val get_type_ =
        call
          (load_sym libgirepository "g_property_info_get_type")
          (GIBaseInfoClass.PolyML.PTR --> GIBaseInfoClass.PolyML.PTR);

      val get_ownership_transfer_ =
        call
          (load_sym
             libgirepository
             "g_property_info_get_ownership_transfer")
          (GIBaseInfoClass.PolyML.PTR --> GITransfer.PolyML.VAL);
    end


    type 'a t = 'a GIPropertyInfoClass.t
    type 'a typeinfoclass_t = 'a GITypeInfoClass.t
    type transfer_t = GITransfer.t
    type paramflags_t = GObjectParamFlags.flags


    val get_flags =
      fn info =>
        (GIBaseInfoClass.C.withPtr ---> GObjectParamFlags.C.fromVal)
          get_flags_
          info

    val get_type =
      fn info =>
        (GIBaseInfoClass.C.withPtr ---> GITypeInfoClass.C.fromPtr true)
          get_type_
          info

    val get_ownership_transfer =
      fn info =>
        (GIBaseInfoClass.C.withPtr ---> GITransfer.C.fromVal)
        get_ownership_transfer_
        info
  end



signature GI_FUNCTION_INFO =
  sig
    type 'a t

    type 'a propertyinfoclass_t
    type 'a vfuncinfoclass_t
    type functioninfoflags_t

    val get_symbol : 'a t -> string
    val get_flags : 'a t -> functioninfoflags_t
    val get_property : 'a t -> base propertyinfoclass_t
    val get_vfunc : 'a t -> base vfuncinfoclass_t
  end

structure GIFunctionInfo :>
  sig
    include GI_FUNCTION_INFO
      where type 'a t = 'a GIFunctionInfoClass.t
      where type 'a propertyinfoclass_t = 'a GIPropertyInfoClass.t
      where type 'a vfuncinfoclass_t = 'a GIVFuncInfoClass.t
      where type functioninfoflags_t = GIRepositoryFunctionInfoFlags.flags
  end =
  struct
    local
      open PolyMLFFI
    in
      val get_symbol_ =
        call
          (load_sym libgirepository "g_function_info_get_symbol")
          (GIBaseInfoClass.PolyML.PTR --> FFI.PolyML.String.RETPTR);

      val get_flags_ =
        call
          (load_sym libgirepository "g_function_info_get_flags")
          (GIBaseInfoClass.PolyML.PTR --> GIRepositoryFunctionInfoFlags.PolyML.VAL);

      val get_property_ =
        call
          (load_sym libgirepository "g_function_info_get_property")
          (GIBaseInfoClass.PolyML.PTR --> GIBaseInfoClass.PolyML.PTR);

      val get_vfunc_ =
        call
          (load_sym libgirepository "g_function_info_get_vfunc")
          (GIBaseInfoClass.PolyML.PTR --> GIBaseInfoClass.PolyML.PTR);
    end


    type 'a t = 'a GIFunctionInfoClass.t
    type 'a propertyinfoclass_t = 'a GIPropertyInfoClass.t
    type 'a vfuncinfoclass_t = 'a GIVFuncInfoClass.t
    type functioninfoflags_t = GIRepositoryFunctionInfoFlags.flags


    val get_symbol =
      fn info =>
        (GIBaseInfoClass.C.withPtr ---> FFI.String.fromPtr false)
          get_symbol_
          info

    val get_flags =
      fn info => (GIBaseInfoClass.C.withPtr ---> GIRepositoryFunctionInfoFlags.C.fromVal)
        get_flags_
        info

    val get_property =
      fn info =>
        (GIBaseInfoClass.C.withPtr ---> GIPropertyInfoClass.C.fromPtr true)
          get_property_
          info

    val get_vfunc =
      fn info =>
        (GIBaseInfoClass.C.withPtr ---> GIVFuncInfoClass.C.fromPtr true)
          get_vfunc_
          info
  end



signature GI_SIGNAL_INFO =
  sig
    type 'a t

    type 'a vfuncinfoclass_t
    type signalflags_t

    val get_flags : 'a t -> signalflags_t
    val get_class_closure : 'a t -> base vfuncinfoclass_t
    val true_stops_emit : 'a t -> bool
  end

structure GISignalInfo :>
  sig
    include GI_SIGNAL_INFO
      where type 'a t = 'a GISignalInfoClass.t
      where type 'a vfuncinfoclass_t = 'a GIVFuncInfoClass.t
      where type signalflags_t = GObjectSignalFlags.flags
  end =
  struct
    local
      open PolyMLFFI
    in
      val get_flags_ =
        call
          (load_sym libgirepository "g_signal_info_get_flags")
          (GIBaseInfoClass.PolyML.PTR --> GObjectSignalFlags.PolyML.VAL);

      val get_class_closure_ =
        call
          (load_sym libgirepository "g_signal_info_get_class_closure")
          (GIBaseInfoClass.PolyML.PTR --> GIBaseInfoClass.PolyML.PTR);

      val true_stops_emit_ =
        call
          (load_sym libgirepository "g_signal_info_true_stops_emit")
          (GIBaseInfoClass.PolyML.PTR --> FFI.PolyML.Bool.VAL);
    end


    type 'a t = 'a GISignalInfoClass.t
    type 'a vfuncinfoclass_t = 'a GIVFuncInfoClass.t
    type signalflags_t = GObjectSignalFlags.flags


    val get_flags =
      fn info =>
        (GIBaseInfoClass.C.withPtr ---> GObjectSignalFlags.C.fromVal)
          get_flags_
          info

    val get_class_closure =
      fn info =>
        (GIBaseInfoClass.C.withPtr ---> GIVFuncInfoClass.C.fromPtr true)
          get_class_closure_
          info

    val true_stops_emit =
      fn info => (GIBaseInfoClass.C.withPtr ---> I) true_stops_emit_ info
  end



signature GI_VFUNC_INFO =
  sig
    type 'a t

    type 'a functioninfoclass_t
    type 'a signalinfoclass_t
    type vfuncinfoflags_t

    val get_flags : 'a t -> vfuncinfoflags_t
    val get_offset : 'a t -> LargeInt.int
    val get_signal : 'a t -> base signalinfoclass_t
    val get_invoker : 'a t -> base functioninfoclass_t
  end

structure GIVFuncInfo :>
  sig
    include GI_VFUNC_INFO
      where type 'a t = 'a GIVFuncInfoClass.t
      where type 'a functioninfoclass_t = 'a GIFunctionInfoClass.t
      where type 'a signalinfoclass_t = 'a GISignalInfoClass.t
      where type vfuncinfoflags_t = GIRepositoryVFuncInfoFlags.flags
  end =
  struct
    local
      open PolyMLFFI
    in
      val get_flags_ =
        call
          (load_sym libgirepository "g_vfunc_info_get_flags")
          (GIBaseInfoClass.PolyML.PTR --> GIRepositoryVFuncInfoFlags.PolyML.VAL);

      val get_offset_ =
        call
          (load_sym libgirepository "g_vfunc_info_get_offset")
          (GIBaseInfoClass.PolyML.PTR --> FFI.PolyML.Int32.VAL);

      val get_signal_ =
        call
          (load_sym libgirepository "g_vfunc_info_get_signal")
          (GIBaseInfoClass.PolyML.PTR --> GIBaseInfoClass.PolyML.PTR);

      val get_invoker_ =
        call
          (load_sym libgirepository "g_vfunc_info_get_invoker")
          (GIBaseInfoClass.PolyML.PTR --> GIBaseInfoClass.PolyML.PTR);
    end


    type 'a t = 'a GIVFuncInfoClass.t
    type 'a functioninfoclass_t = 'a GIFunctionInfoClass.t
    type 'a signalinfoclass_t = 'a GISignalInfoClass.t
    type vfuncinfoflags_t = GIRepositoryVFuncInfoFlags.flags


    val get_flags =
      fn info => (GIBaseInfoClass.C.withPtr ---> GIRepositoryVFuncInfoFlags.C.fromVal)
        get_flags_
        info

    val get_offset =
      fn info => (GIBaseInfoClass.C.withPtr ---> I) get_offset_ info

    val get_signal =
      fn info =>
        (GIBaseInfoClass.C.withPtr ---> GISignalInfoClass.C.fromPtr true)
          get_signal_
          info

    val get_invoker =
      fn info =>
        (GIBaseInfoClass.C.withPtr ---> GIFunctionInfoClass.C.fromPtr true)
          get_invoker_
          info
  end



signature GI_FIELD_INFO =
  sig
    type 'a t

    type 'a typeinfoclass_t
    type fieldinfoflags_t

    val get_flags : 'a t -> fieldinfoflags_t
    val get_size : 'a t -> LargeInt.int
    val get_offset : 'a t -> LargeInt.int
    val get_type : 'a t -> base typeinfoclass_t
  end

structure GIFieldInfo :>
  sig
    include GI_FIELD_INFO
      where type 'a t = 'a GIFieldInfoClass.t
      where type 'a typeinfoclass_t = 'a GITypeInfoClass.t
      where type fieldinfoflags_t = GIRepositoryFieldInfoFlags.flags
  end =
  struct
    local
      open PolyMLFFI
    in
      val get_flags_ =
        call
          (load_sym libgirepository "g_field_info_get_flags")
          (GIBaseInfoClass.PolyML.PTR --> GIRepositoryFieldInfoFlags.PolyML.VAL);

      val get_size_ =
        call
          (load_sym libgirepository "g_field_info_get_size")
          (GIBaseInfoClass.PolyML.PTR --> FFI.PolyML.Int32.VAL);

      val get_offset_ =
        call
          (load_sym libgirepository "g_field_info_get_offset")
          (GIBaseInfoClass.PolyML.PTR --> FFI.PolyML.Int32.VAL);

      val get_type_ =
        call
          (load_sym libgirepository "g_field_info_get_type")
          (GIBaseInfoClass.PolyML.PTR --> GIBaseInfoClass.PolyML.PTR);
    end


    type 'a t = 'a GIFieldInfoClass.t
    type 'a typeinfoclass_t = 'a GITypeInfoClass.t
    type fieldinfoflags_t = GIRepositoryFieldInfoFlags.flags


    val get_flags =
      fn info =>
        (GIBaseInfoClass.C.withPtr ---> GIRepositoryFieldInfoFlags.C.fromVal) get_flags_ info

    val get_size = fn info => (GIBaseInfoClass.C.withPtr ---> I) get_size_ info

    val get_offset = fn info => (GIBaseInfoClass.C.withPtr ---> I) get_offset_ info

    val get_type =
      fn info =>
        (GIBaseInfoClass.C.withPtr ---> GITypeInfoClass.C.fromPtr true)
          get_type_
          info
  end



signature GI_STRUCT_INFO =
  sig
    type 'a t

    type 'a fieldinfoclass_t
    type 'a functioninfoclass_t

    val get_n_fields : 'a t -> LargeInt.int
    val get_field : 'a t -> LargeInt.int -> base fieldinfoclass_t
    val get_n_methods : 'a t -> LargeInt.int
    val get_method : 'a t -> LargeInt.int -> base functioninfoclass_t
    val find_method : 'a t -> string -> base functioninfoclass_t
    val get_size : 'a t -> LargeInt.int
    val get_alignment : 'a t -> LargeInt.int
    val is_gtype_struct : 'a t -> bool
    val is_foreign : 'a t -> bool
  end

structure GIStructInfo :>
  sig
    include GI_STRUCT_INFO
      where type 'a t = 'a GIStructInfoClass.t
      where type 'a fieldinfoclass_t = 'a GIFieldInfoClass.t
      where type 'a functioninfoclass_t = 'a GIFunctionInfoClass.t
  end =
  struct
    local
      open PolyMLFFI
    in
      val get_n_fields_ =
        call
          (load_sym libgirepository "g_struct_info_get_n_fields")
          (GIBaseInfoClass.PolyML.PTR --> FFI.PolyML.Int32.VAL);

      val get_field_ =
        call
          (load_sym libgirepository "g_struct_info_get_field")
          (GIBaseInfoClass.PolyML.PTR
            &&> FFI.PolyML.Int32.VAL
            --> GIBaseInfoClass.PolyML.PTR);

      val get_n_methods_ =
        call
          (load_sym libgirepository "g_struct_info_get_n_methods")
          (GIBaseInfoClass.PolyML.PTR --> FFI.PolyML.Int32.VAL);

      val get_method_ =
        call
          (load_sym libgirepository "g_struct_info_get_method")
          (GIBaseInfoClass.PolyML.PTR
            &&> FFI.PolyML.Int32.VAL
            --> GIBaseInfoClass.PolyML.PTR);

      val find_method_ =
        call
          (load_sym libgirepository "g_struct_info_find_method")
          (GIBaseInfoClass.PolyML.PTR
            &&> FFI.PolyML.String.INPTR
            --> GIBaseInfoClass.PolyML.PTR);

      val get_size_ =
        call
          (load_sym libgirepository "g_struct_info_get_size")
          (GIBaseInfoClass.PolyML.PTR --> FFI.PolyML.LongWord.VAL);

      val get_alignment_ =
        call
          (load_sym libgirepository "g_struct_info_get_alignment")
          (GIBaseInfoClass.PolyML.PTR --> FFI.PolyML.LongWord.VAL);

      val is_gtype_struct_ =
        call
          (load_sym libgirepository "g_struct_info_is_gtype_struct")
          (GIBaseInfoClass.PolyML.PTR --> FFI.PolyML.Bool.VAL);

      val is_foreign_ =
        call
          (load_sym libgirepository "g_struct_info_is_foreign")
          (GIBaseInfoClass.PolyML.PTR --> FFI.PolyML.Bool.VAL);
    end


    type 'a t = 'a GIStructInfoClass.t
    type 'a fieldinfoclass_t = 'a GIFieldInfoClass.t
    type 'a functioninfoclass_t = 'a GIFunctionInfoClass.t


    val get_n_fields =
      fn info => (GIBaseInfoClass.C.withPtr ---> I) get_n_fields_ info

    val get_field =
      fn info => fn n =>
        (GIBaseInfoClass.C.withPtr &&&> I ---> GIFieldInfoClass.C.fromPtr true)
        get_field_
        (info & n)

    val get_n_methods =
      fn info => (GIBaseInfoClass.C.withPtr ---> I) get_n_methods_ info

    val get_method =
      fn info => fn n =>
        (GIBaseInfoClass.C.withPtr &&&> I ---> GIFunctionInfoClass.C.fromPtr true)
        get_method_
        (info & n)

    val find_method =
      fn info => fn name =>
        (GIBaseInfoClass.C.withPtr
          &&&> FFI.String.withConstPtr
          ---> GIFunctionInfoClass.C.fromPtr true)
        find_method_
        (info & name)

    val get_size = fn info => (GIBaseInfoClass.C.withPtr ---> I) get_size_ info

    val get_alignment =
      fn info => (GIBaseInfoClass.C.withPtr ---> I) get_alignment_ info

    val is_gtype_struct =
      fn info => (GIBaseInfoClass.C.withPtr ---> I) is_gtype_struct_ info

    val is_foreign =
      fn info => (GIBaseInfoClass.C.withPtr ---> I) is_foreign_ info
  end



signature GI_UNION_INFO =
  sig
    type 'a t

    type 'a fieldinfoclass_t
    type 'a functioninfoclass_t
    type 'a typeinfoclass_t
    type 'a constantinfoclass_t

    val get_n_fields : 'a t -> LargeInt.int
    val get_field : 'a t -> LargeInt.int -> base fieldinfoclass_t
    val get_n_methods : 'a t -> LargeInt.int
    val get_method : 'a t -> LargeInt.int -> base functioninfoclass_t
    val is_discriminated : 'a t -> bool
    val get_discriminator_offset : 'a t -> LargeInt.int
    val get_discriminator_type : 'a t -> base typeinfoclass_t
    val get_discriminator : 'a t -> LargeInt.int -> base constantinfoclass_t
    val find_method : 'a t -> string -> base functioninfoclass_t
    val get_size : 'a t -> LargeInt.int
    val get_alignment : 'a t -> LargeInt.int
  end

structure GIUnionInfo :>
  sig
    include GI_UNION_INFO
      where type 'a t = 'a GIUnionInfoClass.t
      where type 'a fieldinfoclass_t = 'a GIFieldInfoClass.t
      where type 'a functioninfoclass_t = 'a GIFunctionInfoClass.t
  end =
  struct
    local
      open PolyMLFFI
    in
      val get_n_fields_ =
        call
          (load_sym libgirepository "g_union_info_get_n_fields")
          (GIBaseInfoClass.PolyML.PTR --> FFI.PolyML.Int32.VAL);

      val get_field_ =
        call
          (load_sym libgirepository "g_union_info_get_field")
          (GIBaseInfoClass.PolyML.PTR
            &&> FFI.PolyML.Int32.VAL
            --> GIBaseInfoClass.PolyML.PTR);

      val get_n_methods_ =
        call
          (load_sym libgirepository "g_union_info_get_n_methods")
          (GIBaseInfoClass.PolyML.PTR --> FFI.PolyML.Int32.VAL);

      val get_method_ =
        call
          (load_sym libgirepository "g_union_info_get_method")
          (GIBaseInfoClass.PolyML.PTR
            &&> FFI.PolyML.Int32.VAL
            --> GIBaseInfoClass.PolyML.PTR);

      val is_discriminated_ =
        call
          (load_sym libgirepository "g_union_info_is_discriminated")
          (GIBaseInfoClass.PolyML.PTR --> FFI.PolyML.Bool.VAL);

      val get_discriminator_offset_ =
        call
          (load_sym libgirepository "g_union_info_get_discriminator_offset")
          (GIBaseInfoClass.PolyML.PTR --> FFI.PolyML.Int32.VAL);

      val get_discriminator_type_ =
        call
          (load_sym libgirepository "g_union_info_get_discriminator_type")
          (GIBaseInfoClass.PolyML.PTR --> GIBaseInfoClass.PolyML.PTR);

      val get_discriminator_ =
        call
          (load_sym libgirepository "g_union_info_get_discriminator")
          (GIBaseInfoClass.PolyML.PTR
            &&> FFI.PolyML.Int32.VAL
            --> GIBaseInfoClass.PolyML.PTR);

      val find_method_ =
        call
          (load_sym libgirepository "g_union_info_find_method")
          (GIBaseInfoClass.PolyML.PTR
            &&> FFI.PolyML.String.INPTR
            --> GIBaseInfoClass.PolyML.PTR);

      val get_size_ =
        call
          (load_sym libgirepository "g_union_info_get_size")
          (GIBaseInfoClass.PolyML.PTR --> FFI.PolyML.LongWord.VAL);

      val get_alignment_ =
        call
          (load_sym libgirepository "g_union_info_get_alignment")
          (GIBaseInfoClass.PolyML.PTR --> FFI.PolyML.LongWord.VAL);
    end


    type 'a t = 'a GIUnionInfoClass.t
    type 'a fieldinfoclass_t = 'a GIFieldInfoClass.t
    type 'a functioninfoclass_t = 'a GIFunctionInfoClass.t
    type 'a typeinfoclass_t = 'a GITypeInfoClass.t
    type 'a constantinfoclass_t = 'a GIConstantInfoClass.t


    val get_n_fields =
      fn info => (GIBaseInfoClass.C.withPtr ---> I) get_n_fields_ info

    val get_field =
      fn info => fn n =>
        (GIBaseInfoClass.C.withPtr &&&> I ---> GIFieldInfoClass.C.fromPtr true)
        get_field_
        (info & n)

    val get_n_methods =
      fn info => (GIBaseInfoClass.C.withPtr ---> I) get_n_methods_ info

    val get_method =
      fn info => fn n =>
        (GIBaseInfoClass.C.withPtr &&&> I ---> GIFunctionInfoClass.C.fromPtr true)
        get_method_
        (info & n)

    val is_discriminated =
      fn info => (GIBaseInfoClass.C.withPtr ---> I) is_discriminated_ info

    val get_discriminator_offset =
      fn info => (GIBaseInfoClass.C.withPtr ---> I) get_discriminator_offset_ info

    val get_discriminator_type =
      fn info =>
        (GIBaseInfoClass.C.withPtr ---> GITypeInfoClass.C.fromPtr true)
        get_discriminator_type_
        info

    val get_discriminator =
      fn info => fn n =>
        (GIBaseInfoClass.C.withPtr &&&> I ---> GIConstantInfoClass.C.fromPtr true)
        get_discriminator_
        (info & n)

    val find_method =
      fn info => fn name =>
        (GIBaseInfoClass.C.withPtr
          &&&> FFI.String.withConstPtr
          ---> GIFunctionInfoClass.C.fromPtr true)
        find_method_
        (info & name)

    val get_size = fn info => (GIBaseInfoClass.C.withPtr ---> I) get_size_ info

    val get_alignment =
      fn info => (GIBaseInfoClass.C.withPtr ---> I) get_alignment_ info
  end



signature GI_ENUM_INFO =
  sig
    type 'a t

    type 'a valueinfoclass_t
    type 'a functioninfoclass_t
    type typetag_t

    val get_n_values : 'a t -> LargeInt.int
    val get_value : 'a t -> LargeInt.int -> base valueinfoclass_t
    val get_n_methods : 'a t -> LargeInt.int
    val get_method : 'a t -> LargeInt.int -> base functioninfoclass_t
    val get_storage_type : 'a t -> typetag_t
    val get_error_domain : 'a t -> string option
  end

structure GIEnumInfo :>
  sig
    include GI_ENUM_INFO
      where type 'a t = 'a GIEnumInfoClass.t
      where type 'a valueinfoclass_t = 'a GIValueInfoClass.t
      where type 'a functioninfoclass_t = 'a GIFunctionInfoClass.t
      where type typetag_t = GITypeTag.t
  end =
  struct
    local
      open PolyMLFFI
    in
      val get_n_values_ =
        call
          (load_sym libgirepository "g_enum_info_get_n_values")
          (GIBaseInfoClass.PolyML.PTR --> FFI.PolyML.Int32.VAL);

      val get_value_ =
        call
          (load_sym libgirepository "g_enum_info_get_value")
          (GIBaseInfoClass.PolyML.PTR
            &&> FFI.PolyML.Int32.VAL
            --> GIBaseInfoClass.PolyML.PTR);

      val get_n_methods_ =
        call
          (load_sym libgirepository "g_enum_info_get_n_methods")
          (GIBaseInfoClass.PolyML.PTR --> FFI.PolyML.Int32.VAL);

      val get_method_ =
        call
          (load_sym libgirepository "g_enum_info_get_method")
          (GIBaseInfoClass.PolyML.PTR
            &&> FFI.PolyML.Int32.VAL
            --> GIBaseInfoClass.PolyML.PTR);

      val get_storage_type_ =
        call
          (load_sym libgirepository "g_enum_info_get_storage_type")
          (GIBaseInfoClass.PolyML.PTR --> GITypeTag.PolyML.VAL);

      val get_error_domain_ =
        call
          (load_sym libgirepository "g_enum_info_get_error_domain")
          (GIBaseInfoClass.PolyML.PTR --> FFI.PolyML.String.RETOPTPTR);
    end


    type 'a t = 'a GIEnumInfoClass.t
    type 'a valueinfoclass_t = 'a GIValueInfoClass.t
    type 'a functioninfoclass_t = 'a GIFunctionInfoClass.t
    type typetag_t = GITypeTag.t


    val get_n_values =
      fn info => (GIBaseInfoClass.C.withPtr ---> I) get_n_values_ info

    val get_value =
      fn info => fn n =>
        (GIBaseInfoClass.C.withPtr &&&> I ---> GIValueInfoClass.C.fromPtr true)
        get_value_
        (info & n)

    val get_n_methods =
      fn info => (GIBaseInfoClass.C.withPtr ---> I) get_n_methods_ info

    val get_method =
      fn info => fn n =>
        (GIBaseInfoClass.C.withPtr &&&> I ---> GIFunctionInfoClass.C.fromPtr true)
        get_method_
        (info & n)

    val get_storage_type =
      fn info =>
        (GIBaseInfoClass.C.withPtr ---> GITypeTag.C.fromVal)
        get_storage_type_
        info

    val get_error_domain =
      fn info =>
        (GIBaseInfoClass.C.withPtr ---> FFI.String.fromOptPtr false)
        get_error_domain_
        info
  end



signature GI_INTERFACE_INFO =
  sig
    type 'a t

    type 'a baseinfoclass_t
    type 'a propertyinfoclass_t
    type 'a functioninfoclass_t
    type 'a signalinfoclass_t
    type 'a vfuncinfoclass_t
    type 'a constantinfoclass_t
    type 'a structinfoclass_t

    val get_n_prerequisites : 'a t -> LargeInt.int
    val get_prerequisite : 'a t -> LargeInt.int -> base baseinfoclass_t
    val get_n_properties : 'a t -> LargeInt.int
    val get_property : 'a t -> LargeInt.int -> base propertyinfoclass_t
    val get_n_methods : 'a t -> LargeInt.int
    val get_method : 'a t -> LargeInt.int -> base functioninfoclass_t
    val find_method : 'a t -> string -> base functioninfoclass_t
    val get_n_signals : 'a t -> LargeInt.int
    val get_signal : 'a t -> LargeInt.int -> base signalinfoclass_t
    val get_n_vfuncs : 'a t -> LargeInt.int
    val get_vfunc : 'a t -> LargeInt.int -> base vfuncinfoclass_t
    val get_n_constants : 'a t -> LargeInt.int
    val get_constant : 'a t -> LargeInt.int -> base constantinfoclass_t
    val get_iface_struct: 'a t -> base structinfoclass_t
    val find_vfunc : 'a t -> string -> base vfuncinfoclass_t
  end

structure GIInterfaceInfo :>
  sig
    include GI_INTERFACE_INFO
      where type 'a t = 'a GIInterfaceInfoClass.t
      where type 'a baseinfoclass_t = 'a GIBaseInfoClass.t
      where type 'a propertyinfoclass_t = 'a GIPropertyInfoClass.t
      where type 'a functioninfoclass_t = 'a GIFunctionInfoClass.t
      where type 'a signalinfoclass_t = 'a GISignalInfoClass.t
      where type 'a vfuncinfoclass_t = 'a GIVFuncInfoClass.t
      where type 'a constantinfoclass_t = 'a GIConstantInfoClass.t
      where type 'a structinfoclass_t = 'a GIStructInfoClass.t
  end =
  struct
    local
      open PolyMLFFI
    in
      val get_n_prerequisites_ =
        call
          (load_sym libgirepository
             "g_interface_info_get_n_prerequisites")
          (GIBaseInfoClass.PolyML.PTR --> FFI.PolyML.Int32.VAL);

      val get_prerequisite_ =
        call
          (load_sym libgirepository "g_interface_info_get_prerequisite")
          (GIBaseInfoClass.PolyML.PTR
            &&> FFI.PolyML.Int32.VAL
            --> GIBaseInfoClass.PolyML.PTR);

      val get_n_properties_ =
        call
          (load_sym libgirepository "g_interface_info_get_n_properties")
          (GIBaseInfoClass.PolyML.PTR --> FFI.PolyML.Int32.VAL);

      val get_property_ =
        call
          (load_sym libgirepository "g_interface_info_get_property")
          (GIBaseInfoClass.PolyML.PTR
            &&> FFI.PolyML.Int32.VAL
            --> GIBaseInfoClass.PolyML.PTR);

      val get_n_methods_ =
        call
          (load_sym libgirepository "g_interface_info_get_n_methods")
          (GIBaseInfoClass.PolyML.PTR --> FFI.PolyML.Int32.VAL);

      val get_method_ =
        call
          (load_sym libgirepository "g_interface_info_get_method")
          (GIBaseInfoClass.PolyML.PTR
            &&> FFI.PolyML.Int32.VAL
            --> GIBaseInfoClass.PolyML.PTR);

      val find_method_ =
        call
          (load_sym libgirepository "g_interface_info_find_method")
          (GIBaseInfoClass.PolyML.PTR
            &&> FFI.PolyML.String.INPTR
            --> GIBaseInfoClass.PolyML.PTR);

      val get_n_signals_ =
        call
          (load_sym libgirepository "g_interface_info_get_n_signals")
          (GIBaseInfoClass.PolyML.PTR --> FFI.PolyML.Int32.VAL);

      val get_signal_ =
        call
          (load_sym libgirepository "g_interface_info_get_signal")
          (GIBaseInfoClass.PolyML.PTR
            &&> FFI.PolyML.Int32.VAL
            --> GIBaseInfoClass.PolyML.PTR);

      val get_n_vfuncs_ =
        call
          (load_sym libgirepository "g_interface_info_get_n_vfuncs")
          (GIBaseInfoClass.PolyML.PTR --> FFI.PolyML.Int32.VAL);

      val get_vfunc_ =
        call
          (load_sym libgirepository "g_interface_info_get_vfunc")
          (GIBaseInfoClass.PolyML.PTR
            &&> FFI.PolyML.Int32.VAL
            --> GIBaseInfoClass.PolyML.PTR);

      val get_n_constants_ =
        call
          (load_sym libgirepository "g_interface_info_get_n_constants")
          (GIBaseInfoClass.PolyML.PTR --> FFI.PolyML.Int32.VAL);

      val get_constant_ =
        call
          (load_sym libgirepository "g_interface_info_get_constant")
          (GIBaseInfoClass.PolyML.PTR
            &&> FFI.PolyML.Int32.VAL
            --> GIBaseInfoClass.PolyML.PTR);

      val get_iface_struct_ =
        call
          (load_sym libgirepository "g_interface_info_get_iface_struct")
          (GIBaseInfoClass.PolyML.PTR --> GIBaseInfoClass.PolyML.PTR);

      val find_vfunc_ =
        call
          (load_sym libgirepository "g_interface_info_find_vfunc")
          (GIBaseInfoClass.PolyML.PTR
            &&> FFI.PolyML.String.INPTR
            --> GIBaseInfoClass.PolyML.PTR);
    end


    type 'a t = 'a GIInterfaceInfoClass.t
    type 'a baseinfoclass_t = 'a GIBaseInfoClass.t
    type 'a propertyinfoclass_t = 'a GIPropertyInfoClass.t
    type 'a functioninfoclass_t = 'a GIFunctionInfoClass.t
    type 'a signalinfoclass_t = 'a GISignalInfoClass.t
    type 'a vfuncinfoclass_t = 'a GIVFuncInfoClass.t
    type 'a constantinfoclass_t = 'a GIConstantInfoClass.t
    type 'a structinfoclass_t = 'a GIStructInfoClass.t


    val get_n_prerequisites =
      fn info => (GIBaseInfoClass.C.withPtr ---> I) get_n_prerequisites_ info

    val get_prerequisite =
      fn info => fn n =>
        (GIBaseInfoClass.C.withPtr &&&> I ---> GIBaseInfoClass.C.fromPtr true)
        get_prerequisite_
        (info & n)

    val get_n_properties =
      fn info => (GIBaseInfoClass.C.withPtr ---> I) get_n_properties_ info

    val get_property =
      fn info => fn n =>
        (GIBaseInfoClass.C.withPtr &&&> I ---> GIPropertyInfoClass.C.fromPtr true)
        get_property_
        (info & n)

    val get_n_methods =
      fn info => (GIBaseInfoClass.C.withPtr ---> I) get_n_methods_ info

    val get_method =
      fn info => fn n =>
        (GIBaseInfoClass.C.withPtr &&&> I ---> GIFunctionInfoClass.C.fromPtr true)
        get_method_
        (info & n)

    val find_method =
      fn info => fn name =>
        (GIBaseInfoClass.C.withPtr
          &&&> FFI.String.withConstPtr
          ---> GIFunctionInfoClass.C.fromPtr true)
        find_method_
        (info & name)

    val get_n_signals =
      fn info => (GIBaseInfoClass.C.withPtr ---> I) get_n_signals_ info

    val get_signal =
      fn info => fn n =>
        (GIBaseInfoClass.C.withPtr &&&> I ---> GISignalInfoClass.C.fromPtr true)
        get_signal_
        (info & n)

    val get_n_vfuncs =
      fn info => (GIBaseInfoClass.C.withPtr ---> I) get_n_vfuncs_ info

    val get_vfunc =
      fn info => fn n =>
        (GIBaseInfoClass.C.withPtr &&&> I ---> GIVFuncInfoClass.C.fromPtr true)
        get_vfunc_
        (info & n)

    val get_n_constants =
      fn info => (GIBaseInfoClass.C.withPtr ---> I) get_n_constants_ info

    val get_constant =
      fn info => fn n =>
        (GIBaseInfoClass.C.withPtr &&&> I ---> GIConstantInfoClass.C.fromPtr true)
        get_constant_
        (info & n)

    val get_iface_struct =
      fn info =>
        (GIBaseInfoClass.C.withPtr ---> GIStructInfoClass.C.fromPtr true)
        get_iface_struct_
        info

    val find_vfunc =
      fn info => fn name =>
        (GIBaseInfoClass.C.withPtr
          &&&> FFI.String.withConstPtr
          ---> GIVFuncInfoClass.C.fromPtr true)
        find_vfunc_
        (info & name)
  end



signature GI_OBJECT_INFO =
  sig
    type 'a t

    type 'a baseinfoclass_t
    type 'a interfaceinfoclass_t
    type 'a fieldinfoclass_t
    type 'a propertyinfoclass_t
    type 'a functioninfoclass_t
    type 'a signalinfoclass_t
    type 'a vfuncinfoclass_t
    type 'a constantinfoclass_t
    type 'a structinfoclass_t

    val get_type_name : 'a t -> string
    val get_type_init : 'a t -> string
    val get_abstract : 'a t -> bool
    val get_fundamental : 'a t -> bool
    val get_parent : 'a t -> base t option
    val get_n_interfaces : 'a t -> LargeInt.int
    val get_interface : 'a t -> LargeInt.int -> base interfaceinfoclass_t
    val get_n_fields : 'a t -> LargeInt.int
    val get_field : 'a t -> LargeInt.int -> base fieldinfoclass_t
    val get_n_properties : 'a t -> LargeInt.int
    val get_property : 'a t -> LargeInt.int -> base propertyinfoclass_t
    val get_n_methods : 'a t -> LargeInt.int
    val get_method : 'a t -> LargeInt.int -> base functioninfoclass_t
    val find_method : 'a t -> string -> base functioninfoclass_t
    val get_n_signals : 'a t -> LargeInt.int
    val get_signal : 'a t -> LargeInt.int -> base signalinfoclass_t
    val get_n_vfuncs : 'a t -> LargeInt.int
    val get_vfunc : 'a t -> LargeInt.int -> base vfuncinfoclass_t
    val get_n_constants : 'a t -> LargeInt.int
    val get_constant : 'a t -> LargeInt.int -> base constantinfoclass_t
    val get_class_struct : 'a t -> base structinfoclass_t
    val find_vfunc : 'a t -> string -> base vfuncinfoclass_t
    val get_unref_function : 'a t -> string
    val get_ref_function : 'a t -> string
    val get_set_value_function : 'a t -> string
    val get_get_value_function : 'a t -> string
  end

structure GIObjectInfo :>
  sig
    include GI_OBJECT_INFO
      where type 'a t = 'a GIObjectInfoClass.t
      where type 'a baseinfoclass_t = 'a GIBaseInfoClass.t
      where type 'a interfaceinfoclass_t = 'a GIInterfaceInfoClass.t
      where type 'a fieldinfoclass_t = 'a GIFieldInfoClass.t
      where type 'a propertyinfoclass_t = 'a GIPropertyInfoClass.t
      where type 'a functioninfoclass_t = 'a GIFunctionInfoClass.t
      where type 'a signalinfoclass_t = 'a GISignalInfoClass.t
      where type 'a vfuncinfoclass_t = 'a GIVFuncInfoClass.t
      where type 'a constantinfoclass_t = 'a GIConstantInfoClass.t
      where type 'a structinfoclass_t = 'a GIStructInfoClass.t
  end =
  struct
    local
      open PolyMLFFI
    in
      val get_type_name_ =
        call
          (load_sym libgirepository "g_object_info_get_type_name")
          (GIBaseInfoClass.PolyML.PTR --> FFI.PolyML.String.RETPTR);

      val get_type_init_ =
        call
          (load_sym libgirepository "g_object_info_get_type_init")
          (GIBaseInfoClass.PolyML.PTR --> FFI.PolyML.String.RETPTR);

      val get_abstract_ =
        call
          (load_sym libgirepository "g_object_info_get_abstract")
          (GIBaseInfoClass.PolyML.PTR --> FFI.PolyML.Bool.VAL);

      val get_fundamental_ =
        call
          (load_sym libgirepository "g_object_info_get_fundamental")
          (GIBaseInfoClass.PolyML.PTR --> FFI.PolyML.Bool.VAL);

      val get_parent_ =
        call
          (load_sym libgirepository "g_object_info_get_parent")
          (GIBaseInfoClass.PolyML.PTR --> GIBaseInfoClass.PolyML.OPTPTR);

      val get_n_interfaces_ =
        call
          (load_sym libgirepository "g_object_info_get_n_interfaces")
          (GIBaseInfoClass.PolyML.PTR --> FFI.PolyML.Int32.VAL);

      val get_interface_ =
        call
          (load_sym libgirepository "g_object_info_get_interface")
          (GIBaseInfoClass.PolyML.PTR
            &&> FFI.PolyML.Int32.VAL
            --> GIBaseInfoClass.PolyML.PTR);

      val get_n_fields_ =
        call
          (load_sym libgirepository "g_object_info_get_n_fields")
          (GIBaseInfoClass.PolyML.PTR --> FFI.PolyML.Int32.VAL);

      val get_field_ =
        call
          (load_sym libgirepository "g_object_info_get_field")
          (GIBaseInfoClass.PolyML.PTR
            &&> FFI.PolyML.Int32.VAL
            --> GIBaseInfoClass.PolyML.PTR);

      val get_n_properties_ =
        call
          (load_sym libgirepository "g_object_info_get_n_properties")
          (GIBaseInfoClass.PolyML.PTR --> FFI.PolyML.Int32.VAL);

      val get_property_ =
        call
          (load_sym libgirepository "g_object_info_get_property")
          (GIBaseInfoClass.PolyML.PTR
            &&> FFI.PolyML.Int32.VAL
            --> GIBaseInfoClass.PolyML.PTR);

      val get_n_methods_ =
        call
          (load_sym libgirepository "g_object_info_get_n_methods")
          (GIBaseInfoClass.PolyML.PTR --> FFI.PolyML.Int32.VAL);

      val get_method_ =
        call
          (load_sym libgirepository "g_object_info_get_method")
          (GIBaseInfoClass.PolyML.PTR
            &&> FFI.PolyML.Int32.VAL
            --> GIBaseInfoClass.PolyML.PTR);

      val find_method_ =
        call
          (load_sym libgirepository "g_object_info_find_method")
          (GIBaseInfoClass.PolyML.PTR
            &&> FFI.PolyML.String.INPTR
            --> GIBaseInfoClass.PolyML.PTR);

      val get_n_signals_ =
        call
          (load_sym libgirepository "g_object_info_get_n_signals")
          (GIBaseInfoClass.PolyML.PTR --> FFI.PolyML.Int32.VAL);

      val get_signal_ =
        call
          (load_sym libgirepository "g_object_info_get_signal")
          (GIBaseInfoClass.PolyML.PTR
            &&> FFI.PolyML.Int32.VAL
            --> GIBaseInfoClass.PolyML.PTR);

      val get_n_vfuncs_ =
        call
          (load_sym libgirepository "g_object_info_get_n_vfuncs")
          (GIBaseInfoClass.PolyML.PTR --> FFI.PolyML.Int32.VAL);

      val get_vfunc_ =
        call
          (load_sym libgirepository "g_object_info_get_vfunc")
          (GIBaseInfoClass.PolyML.PTR
            &&> FFI.PolyML.Int32.VAL
            --> GIBaseInfoClass.PolyML.PTR);

      val get_n_constants_ =
        call
          (load_sym libgirepository "g_object_info_get_n_constants")
          (GIBaseInfoClass.PolyML.PTR --> FFI.PolyML.Int32.VAL);

      val get_constant_ =
        call
          (load_sym libgirepository "g_object_info_get_constant")
          (GIBaseInfoClass.PolyML.PTR
            &&> FFI.PolyML.Int32.VAL
            --> GIBaseInfoClass.PolyML.PTR);

      val get_class_struct_ =
        call
          (load_sym libgirepository "g_object_info_get_class_struct")
          (GIBaseInfoClass.PolyML.PTR --> GIBaseInfoClass.PolyML.PTR);

      val find_vfunc_ =
        call
          (load_sym libgirepository "g_object_info_find_vfunc")
          (GIBaseInfoClass.PolyML.PTR
            &&> FFI.PolyML.String.INPTR
            --> GIBaseInfoClass.PolyML.PTR);

      val get_unref_function_ =
        call
          (load_sym libgirepository "g_object_info_get_unref_function")
          (GIBaseInfoClass.PolyML.PTR --> FFI.PolyML.String.RETPTR);

      val get_ref_function_ =
        call
          (load_sym libgirepository "g_object_info_get_ref_function")
          (GIBaseInfoClass.PolyML.PTR --> FFI.PolyML.String.RETPTR);

      val get_set_value_function_ =
        call
          (load_sym libgirepository "g_object_info_get_set_value_function")
          (GIBaseInfoClass.PolyML.PTR --> FFI.PolyML.String.RETPTR);

      val get_get_value_function_ =
        call
          (load_sym libgirepository
             "g_object_info_get_get_value_function")
          (GIBaseInfoClass.PolyML.PTR --> FFI.PolyML.String.RETPTR);
    end


    type 'a t = 'a GIObjectInfoClass.t
    type 'a baseinfoclass_t = 'a GIBaseInfoClass.t
    type 'a interfaceinfoclass_t = 'a GIInterfaceInfoClass.t
    type 'a fieldinfoclass_t = 'a GIFieldInfoClass.t
    type 'a propertyinfoclass_t = 'a GIPropertyInfoClass.t
    type 'a functioninfoclass_t = 'a GIFunctionInfoClass.t
    type 'a signalinfoclass_t = 'a GISignalInfoClass.t
    type 'a vfuncinfoclass_t = 'a GIVFuncInfoClass.t
    type 'a constantinfoclass_t = 'a GIConstantInfoClass.t
    type 'a structinfoclass_t = 'a GIStructInfoClass.t


    val get_type_name =
      fn info =>
        (GIBaseInfoClass.C.withPtr ---> FFI.String.fromPtr false)
          get_type_name_
          info

    val get_type_init =
      fn info =>
        (GIBaseInfoClass.C.withPtr ---> FFI.String.fromPtr false)
          get_type_init_
          info

    val get_abstract =
      fn info => (GIBaseInfoClass.C.withPtr ---> I) get_abstract_ info

    val get_fundamental =
      fn info => (GIBaseInfoClass.C.withPtr ---> I) get_fundamental_ info

    val get_parent =
      fn info =>
        (GIBaseInfoClass.C.withPtr ---> GIObjectInfoClass.C.fromOptPtr true)
          get_parent_
          info

    val get_n_interfaces =
      fn info => (GIBaseInfoClass.C.withPtr ---> I) get_n_interfaces_ info

    val get_interface =
      fn info => fn n =>
        (GIBaseInfoClass.C.withPtr &&&> I ---> GIInterfaceInfoClass.C.fromPtr true)
        get_interface_
        (info & n)

    val get_n_fields =
      fn info => (GIBaseInfoClass.C.withPtr ---> I) get_n_fields_ info

    val get_field =
      fn info => fn n =>
        (GIBaseInfoClass.C.withPtr &&&> I ---> GIFieldInfoClass.C.fromPtr true)
        get_field_
        (info & n)

    val get_n_properties =
      fn info => (GIBaseInfoClass.C.withPtr ---> I) get_n_properties_ info

    val get_property =
      fn info => fn n =>
        (GIBaseInfoClass.C.withPtr &&&> I ---> GIPropertyInfoClass.C.fromPtr true)
        get_property_
        (info & n)

    val get_n_methods =
      fn info => (GIBaseInfoClass.C.withPtr ---> I) get_n_methods_ info

    val get_method =
      fn info => fn n =>
        (GIBaseInfoClass.C.withPtr &&&> I ---> GIFunctionInfoClass.C.fromPtr true)
        get_method_
        (info & n)

    val find_method =
      fn info => fn name =>
        (GIBaseInfoClass.C.withPtr
          &&&> FFI.String.withConstPtr
          ---> GIFunctionInfoClass.C.fromPtr true)
        find_method_
        (info & name)

    val get_n_signals =
      fn info => (GIBaseInfoClass.C.withPtr ---> I) get_n_signals_ info

    val get_signal =
      fn info => fn n =>
        (GIBaseInfoClass.C.withPtr &&&> I ---> GISignalInfoClass.C.fromPtr true)
        get_signal_
        (info & n)

    val get_n_vfuncs =
      fn info => (GIBaseInfoClass.C.withPtr ---> I) get_n_vfuncs_ info

    val get_vfunc =
      fn info => fn n =>
        (GIBaseInfoClass.C.withPtr &&&> I ---> GIVFuncInfoClass.C.fromPtr true)
        get_vfunc_
        (info & n)

    val get_n_constants =
      fn info => (GIBaseInfoClass.C.withPtr ---> I) get_n_constants_ info

    val get_constant =
      fn info => fn n =>
        (GIBaseInfoClass.C.withPtr &&&> I ---> GIConstantInfoClass.C.fromPtr true)
        get_constant_
        (info & n)

    val get_class_struct =
      fn info =>
        (GIBaseInfoClass.C.withPtr ---> GIStructInfoClass.C.fromPtr true)
        get_class_struct_
        info

    val find_vfunc =
      fn info => fn name =>
        (GIBaseInfoClass.C.withPtr
          &&&> FFI.String.withConstPtr
          ---> GIVFuncInfoClass.C.fromPtr true)
        find_vfunc_
        (info & name)

    val get_unref_function =
      fn info =>
        (GIBaseInfoClass.C.withPtr ---> FFI.String.fromPtr false)
        get_unref_function_
        info

    val get_ref_function =
      fn info =>
        (GIBaseInfoClass.C.withPtr ---> FFI.String.fromPtr false)
        get_ref_function_
        info

    val get_set_value_function =
      fn info =>
        (GIBaseInfoClass.C.withPtr ---> FFI.String.fromPtr false)
        get_set_value_function_
        info

    val get_get_value_function =
      fn info =>
        (GIBaseInfoClass.C.withPtr ---> FFI.String.fromPtr false)
        get_get_value_function_
        info
  end




signature GI_INFO_TYPE =
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

    val get_type : 'a baseinfoclass_t -> t
  end

structure GIInfoType :>
  sig
    include GI_INFO_TYPE
      where type 'a baseinfoclass_t           = 'a GIBaseInfoClass.t
      where type 'a registeredtypeinfoclass_t = 'a GIRegisteredTypeInfoClass.t
      where type 'a functioninfoclass_t       = 'a GIFunctionInfoClass.t
      where type 'a structinfoclass_t         = 'a GIStructInfoClass.t
      where type 'a enuminfoclass_t           = 'a GIEnumInfoClass.t
      where type 'a objectinfoclass_t         = 'a GIObjectInfoClass.t
      where type 'a interfaceinfoclass_t      = 'a GIInterfaceInfoClass.t
      where type 'a constantinfoclass_t       = 'a GIConstantInfoClass.t
      where type 'a unioninfoclass_t          = 'a GIUnionInfoClass.t
      where type 'a valueinfoclass_t          = 'a GIValueInfoClass.t
      where type 'a signalinfoclass_t         = 'a GISignalInfoClass.t
      where type 'a vfuncinfoclass_t          = 'a GIVFuncInfoClass.t
      where type 'a propertyinfoclass_t       = 'a GIPropertyInfoClass.t
      where type 'a fieldinfoclass_t          = 'a GIFieldInfoClass.t
      where type 'a arginfoclass_t            = 'a GIArgInfoClass.t
      where type 'a typeinfoclass_t           = 'a GITypeInfoClass.t
  end =
  struct
    local
      open PolyMLFFI
    in
      val get_type_ =
        call
          (load_sym libgirepository "g_base_info_get_type")
          (GIBaseInfoClass.PolyML.PTR --> FFI.PolyML.Int32.VAL);
    end


    type 'a baseinfoclass_t           = 'a GIBaseInfoClass.t
    type 'a registeredtypeinfoclass_t = 'a GIRegisteredTypeInfoClass.t
    type 'a functioninfoclass_t       = 'a GIFunctionInfoClass.t
    type 'a structinfoclass_t         = 'a GIStructInfoClass.t
    type 'a enuminfoclass_t           = 'a GIEnumInfoClass.t
    type 'a objectinfoclass_t         = 'a GIObjectInfoClass.t
    type 'a interfaceinfoclass_t      = 'a GIInterfaceInfoClass.t
    type 'a constantinfoclass_t       = 'a GIConstantInfoClass.t
    type 'a unioninfoclass_t          = 'a GIUnionInfoClass.t
    type 'a valueinfoclass_t          = 'a GIValueInfoClass.t
    type 'a signalinfoclass_t         = 'a GISignalInfoClass.t
    type 'a vfuncinfoclass_t          = 'a GIVFuncInfoClass.t
    type 'a propertyinfoclass_t       = 'a GIPropertyInfoClass.t
    type 'a fieldinfoclass_t          = 'a GIFieldInfoClass.t
    type 'a arginfoclass_t            = 'a GIArgInfoClass.t
    type 'a typeinfoclass_t           = 'a GITypeInfoClass.t

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
      val table : (GIBaseInfoClass.C.notnull GIBaseInfoClass.C.p -> t) vector =
        Vector.fromList [
          K INVALID,
          FUNCTION    o GIFunctionInfoClass.C.fromPtr false,
          CALLBACK    o GIFunctionInfoClass.C.fromPtr false,
          STRUCT      o GIStructInfoClass.C.fromPtr false,
          BOXED       o GIRegisteredTypeInfoClass.C.fromPtr false,
          ENUM        o GIEnumInfoClass.C.fromPtr false,
          FLAGS       o GIEnumInfoClass.C.fromPtr false,
          OBJECT      o GIObjectInfoClass.C.fromPtr false,
          INTERFACE   o GIInterfaceInfoClass.C.fromPtr false,
          CONSTANT    o GIConstantInfoClass.C.fromPtr false,
          K INVALID_0,
          UNION       o GIUnionInfoClass.C.fromPtr false,
          VALUE       o GIValueInfoClass.C.fromPtr false,
          SIGNAL      o GISignalInfoClass.C.fromPtr false,
          VFUNC       o GIVFuncInfoClass.C.fromPtr false,
          PROPERTY    o GIPropertyInfoClass.C.fromPtr false,
          FIELD       o GIFieldInfoClass.C.fromPtr false,
          ARG         o GIArgInfoClass.C.fromPtr false,
          TYPE        o GITypeInfoClass.C.fromPtr false,
          K UNRESOLVED
        ]
    in
      val get_type : 'a baseinfoclass_t -> t =
        fn info =>
          GIBaseInfoClass.C.withPtr
            (fn ptr => Vector.sub (table, get_type_ ptr) ptr)
            info
            handle
              Subscript => INVALID
    end
  end







signature GI_REPOSITORY_CLASS =
  sig
    type 'a objectclass_t
    type 'a repository
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

structure GIRepositoryClass :>
  sig
    include GI_REPOSITORY_CLASS
      where type 'a objectclass_t = 'a GObjectObjectClass.t
      where type C.notnull = GObjectObjectClass.C.notnull
      where type 'a C.p = 'a GObjectObjectClass.C.p
  end =
  struct
    type 'a objectclass_t = 'a GObjectObjectClass.t
    type 'a repository = unit
    type 'a t = 'a repository objectclass_t
    fun toBase obj = obj
    structure C = GObjectObjectClass.C
  end



signature GI_TYPELIB_TYPE =
  sig
    type t
    structure C :
      sig
        type ptr
        val withPtr : (ptr -> 'a) -> t -> 'a
        val fromPtr : ptr -> t
      end
  end

structure GITypelibType :>
  sig
    include GI_TYPELIB_TYPE

    structure PolyML :
      sig
        val PTR : C.ptr CInterface.Conversion
      end
  end =
  struct
    type t = CPointer.notnull CPointer.t
    structure C =
      struct
        type ptr = CPointer.notnull CPointer.t
        val withPtr = I
        val fromPtr = I
      end
    structure PolyML =
      struct
        val PTR = CPointer.PolyML.POINTER
      end
  end



signature GI_TYPELIB =
  sig
    type t
    val get_namespace : t -> string
  end

structure GITypelib :> GI_TYPELIB where type t = GITypelibType.t =
  struct
    type t = GITypelibType.t

    local
      open PolyMLFFI
    in
      val get_namespace_ =
        call
          (load_sym libgirepository "g_typelib_get_namespace")
          (GITypelibType.PolyML.PTR --> FFI.PolyML.String.RETPTR)
    end

    val get_namespace =
      fn typelib =>
        (GITypelibType.C.withPtr ---> FFI.String.fromPtr false)
          get_namespace_
          typelib
  end



signature GI_REPOSITORY =
  sig
    type 'a t

    type 'a baseinfoclass_t
    type loadflags_t
    type typelibtype_t

    val get_default : unit -> base t
    val load_typelib : 'a t -> typelibtype_t -> loadflags_t -> string
    val require : 'a t -> string -> string -> loadflags_t -> typelibtype_t
    val get_dependencies : 'a t -> string -> string list option
    val get_n_infos : 'a t -> string -> LargeInt.int
    val get_info : 'a t -> string -> LargeInt.int -> base baseinfoclass_t
    val get_shared_library : 'a t -> string -> string option
    val get_c_prefix : 'a t -> string -> string option
  end

structure GIRepository :>
  GI_REPOSITORY
    where type 'a t = 'a GIRepositoryClass.t
    where type 'a baseinfoclass_t = 'a GIBaseInfoClass.t
    where type loadflags_t = GIRepositoryRepositoryLoadFlags.flags
    where type typelibtype_t = GITypelibType.t =
  struct
    local
      open PolyMLFFI
    in
      val get_default_ =
        call
          (load_sym libgirepository "g_irepository_get_default")
          (FFI.PolyML.VOID --> GObjectObjectClass.PolyML.PTR)

      val load_typelib_ =
        call
          (load_sym libgirepository "g_irepository_load_typelib")
          (GObjectObjectClass.PolyML.PTR
            &&> GITypelibType.PolyML.PTR
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
            --> GITypelibType.PolyML.PTR)

      val get_dependencies_ =
        call
          (load_sym libgirepository "g_irepository_get_dependencies")
          (GObjectObjectClass.PolyML.PTR
            &&> FFI.PolyML.String.INPTR
            --> FFI.PolyML.StringVector.RETOPTPTR)

      val get_n_infos_ =
        call
          (load_sym libgirepository "g_irepository_get_n_infos")
          (GObjectObjectClass.PolyML.PTR
            &&> FFI.PolyML.String.INPTR
            --> FFI.PolyML.Int32.VAL)

      val get_info_ =
        call
          (load_sym libgirepository "g_irepository_get_info")
          (GObjectObjectClass.PolyML.PTR
            &&> FFI.PolyML.String.INPTR
            &&> FFI.PolyML.Int32.VAL
            --> GIBaseInfoClass.PolyML.PTR)

      val get_shared_library_ =
        call
          (load_sym libgirepository "g_irepository_get_shared_library")
          (GObjectObjectClass.PolyML.PTR
            &&> FFI.PolyML.String.INPTR
            --> FFI.PolyML.String.RETOPTPTR)

      val get_c_prefix_ =
        call
          (load_sym libgirepository "g_irepository_get_c_prefix")
          (GObjectObjectClass.PolyML.PTR
            &&> FFI.PolyML.String.INPTR
            --> FFI.PolyML.String.RETPTR)
    end


    type 'a t = 'a GIRepositoryClass.t
    type 'a baseinfoclass_t = 'a GIBaseInfoClass.t
    type loadflags_t = GIRepositoryRepositoryLoadFlags.flags
    type typelibtype_t = GITypelibType.t


    val get_default =
      fn () => (I ---> GIRepositoryClass.C.fromPtr false) get_default_ ()

    val load_typelib =
      fn repository => fn typelib => fn flags =>
        (GObjectObjectClass.C.withPtr
          &&&> GITypelibType.C.withPtr
          &&&> GIRepositoryRepositoryLoadFlags.C.withVal
          &&&> GLibErrorRecord.C.handleError
          ---> FFI.String.fromPtr false)
        load_typelib_
        (repository & typelib & flags & [])

    val require =
      fn repository => fn namespace_ => fn version => fn flags =>
        (GObjectObjectClass.C.withPtr
          &&&> FFI.String.withConstPtr
          &&&> FFI.String.withConstPtr
          &&&> GIRepositoryRepositoryLoadFlags.C.withVal
          &&&> GLibErrorRecord.C.handleError
          ---> GITypelibType.C.fromPtr)
        require_
        (repository & namespace_ & version & flags & [])

    val get_dependencies =
      fn repository => fn namespace_ =>
        (GObjectObjectClass.C.withPtr
          &&&> FFI.String.withConstPtr
          ---> FFI.StringVector.fromOptPtr true)
        get_dependencies_
        (repository & namespace_)

    val get_n_infos =
      fn repository => fn namespace_ =>
        (GObjectObjectClass.C.withPtr
          &&&> FFI.String.withConstPtr
          ---> I)
        get_n_infos_
        (repository & namespace_)

    val get_info =
      fn repository => fn namespace_ => fn index =>
        (GObjectObjectClass.C.withPtr
          &&&> FFI.String.withConstPtr
          &&&> I
          ---> GIBaseInfoClass.C.fromPtr true)
        get_info_
        (repository & namespace_ & index)

    fun get_shared_library self namespace =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.String.withConstPtr
         ---> FFI.String.fromOptPtr false
      )
        get_shared_library_
        (self & namespace)

    val get_c_prefix =
      fn repository => fn namespace_ =>
        (GObjectObjectClass.C.withPtr
          &&&> FFI.String.withConstPtr
          ---> FFI.String.fromOptPtr false)
        get_c_prefix_
        (repository & namespace_)
  end

;



(* test *)
(*


infix 6 --
fun n -- m =
  if m < n
  then []
  else n :: (n + 1 : LargeInt.int) -- m

infix &&&;
fun (f &&& g) x = (f x, g x);


Gtk.init (CommandLine.name () :: CommandLine.arguments ());
val repo = GIRepository.get_default ();






val tylib_gir =
  GIRepository.require repo "GIRepository" "2.0" (GIRepositoryRepositoryLoadFlags.flags []);
GITypelib.get_namespace tylib_gir;
val SOME cprefix_gir = GIRepository.get_c_prefix repo "GIRepository";

val s = GIRepository.load_typelib repo tylib_gir (GIRepositoryRepositoryLoadFlags.flags []);
val n = GIRepository.get_n_infos repo s;

val info_0 = GIRepository.get_info repo s 0;
val info_1 = GIRepository.get_info repo s 1;
val info_28 = GIRepository.get_info repo s 28;

GIBaseInfo.get_name info_0;
GIBaseInfo.get_namespace info_0;
GIInfoType.get_type info_0;
val GIInfoType.ENUM enumInfo = GIInfoType.get_type info_0;
val valueInfo = GIEnumInfo.get_value enumInfo 0;
GIValueInfo.get_value valueInfo;
GIEnumInfo.get_storage_type enumInfo;

GIBaseInfo.get_name info_1;
GIBaseInfo.get_namespace info_1;
GIInfoType.get_type info_1;

GIBaseInfo.get_name info_28;
GIBaseInfo.get_namespace info_28;
GIInfoType.get_type info_28;


(*
PolyML.print_depth 200;

map (I &&& (GIInfoType.get_type &&& GIBaseInfo.get_name) o GIRepository.get_info repo s) (0 -- 146);


val info_4 = GIRepository.get_info repo s 4;
val info_10 = GIRepository.get_info repo s 10;
val info_17 = GIRepository.get_info repo s 17;

GIBaseInfo.get_name info_4;
GIInfoType.get_type info_4;

GIBaseInfo.get_name info_10;
GIInfoType.get_type info_10;

GIBaseInfo.get_name info_17;
GIInfoType.get_type info_17;
*)


val info_10 = GIRepository.get_info repo s 10;
val GIInfoType.FLAGS info = GIInfoType.get_type info_10;

GIBaseInfo.get_name info_10;
GIBaseInfo.get_name info;

GIInfoType.get_type info;

GIRegisteredTypeInfo.get_type_name info;
GIRegisteredTypeInfo.get_type_init info;
GObjectType.name (GIRegisteredTypeInfo.get_g_type info);

GIEnumInfo.get_storage_type info;
GIEnumInfo.get_n_methods info;
GIEnumInfo.get_n_values info;
val value = GIEnumInfo.get_value info 0;
GIValueInfo.get_value value;
GIBaseInfo.get_name value;
GIBaseInfo.get_namespace value;





val info_2 = GIRepository.get_info repo s 2;
val GIInfoType.STRUCT structInfo = GIInfoType.get_type info_2;

GIBaseInfo.get_name info_2;
GIBaseInfo.get_name structInfo;
GIBaseInfo.get_namespace structInfo;

GIRegisteredTypeInfo.get_type_name structInfo;
GIRegisteredTypeInfo.get_type_init structInfo;
GObjectType.name (GIRegisteredTypeInfo.get_g_type structInfo);













val tylib_gtk =
  GIRepository.require repo "Gtk" "3.0" (GIRepositoryRepositoryLoadFlags.flags []);
GITypelib.get_namespace tylib_gtk;
val SOME cprefix_gtk = GIRepository.get_c_prefix repo "Gtk";
val s = GIRepository.load_typelib repo tylib_gtk (GIRepositoryRepositoryLoadFlags.flags []);
val n = GIRepository.get_n_infos repo s;


PolyML.print_depth 2000;

map (I &&& (GIInfoType.get_type &&& GIBaseInfo.get_name) o GIRepository.get_info repo s) (0 -- 1107);


(* filter out UNIONs *)
List.mapPartial ((fn (i, SOME x) => SOME (i, GIBaseInfo.get_name x) | (_, NONE) => NONE) o (I &&& (fn info => case GIInfoType.get_type info of GIInfoType.UNION _ => SOME info | _ => NONE) o GIRepository.get_info repo s)) (0 -- 1107)



(* ** CONSTANT ** *)
val info = GIRepository.get_info repo s 63;
val info = GIRepository.get_info repo s 345;
val info = GIRepository.get_info repo s 348;
val info = GIRepository.get_info repo s 347;
val info = GIRepository.get_info repo s 412;
val info = GIRepository.get_info repo s 434;
val info = GIRepository.get_info repo s 553;
val info = GIRepository.get_info repo s 620;

val GIInfoType.CONSTANT constantInfo = GIInfoType.get_type info;
GITypeInfo.get_tag (GIConstantInfo.get_type constantInfo);
GIConstantInfo.get_value constantInfo;


(* ** STRUCT ** *)


val info = GIRepository.get_info repo s 782; (* TextAppearance (no methods) *)
val info = GIRepository.get_info repo s 783; (* TextAttributes (5 methods) *)
val info = GIRepository.get_info repo s 330; (* LabelPrivate *)
val info = GIRepository.get_info repo s 331; (* LabelSelectionInfo *)
val GIInfoType.STRUCT structInfo = GIInfoType.get_type info;
GIBaseInfo.get_name structInfo;
GIStructInfo.get_n_methods structInfo;
map (I &&& (GIInfoType.get_type &&& GIBaseInfo.get_name) o GIStructInfo.get_method structInfo) (0 -- 4);


GIBaseInfo.get_attribute structInfo "disguised";





(* ** OBJECT ** *)

val info = GIRepository.get_info repo s 23;
val info = GIRepository.get_info repo s 73;  (* Box *)
val info = GIRepository.get_info repo s 78;  (* Builder *)
val info = GIRepository.get_info repo s 921; (* Window *)
val info = GIRepository.get_info repo s 171;
val info = GIRepository.get_info repo s 177; (* Container *)
val info = GIRepository.get_info repo s 307; (* IconView *)
val info = GIRepository.get_info repo s 393; (* Overlay *)
val info = GIRepository.get_info repo s 151; (* Clipboard *)
val info = GIRepository.get_info repo s 181; (* CssProvider *)
val info = GIRepository.get_info repo s 698; (* Scale *)
val info = GIRepository.get_info repo s 739; (* SpinButton *)
val info = GIRepository.get_info repo s 749; (* StatusIcon *)
val info = GIRepository.get_info repo s 758; (* StyleContext *)
val info = GIRepository.get_info repo s 761; (* StyleProperties *)
val info = GIRepository.get_info repo s 811; (* ThemingEngine *)
val info = GIRepository.get_info repo s 875; (* TreeStore *)
val info = GIRepository.get_info repo s 892; (* UIManager *)
val info = GIRepository.get_info repo s 914; (* Widget *)
val info = GIRepository.get_info repo s 921; (* Window *)
val info = GIRepository.get_info repo s 878;
val GIInfoType.OBJECT objectInfo = GIInfoType.get_type info;
GIBaseInfo.get_name objectInfo;
GIObjectInfo.get_ref_function objectInfo;

(* ** methods ** *)
GIObjectInfo.get_n_methods objectInfo;
map (I &&& (GIInfoType.get_type &&& GIBaseInfo.get_name) o GIObjectInfo.get_method objectInfo) (0 -- 18);

val info = GIObjectInfo.get_method objectInfo 155; (* GtkWidget.path *)
val info = GIObjectInfo.get_method objectInfo 12; (* GtkIconView.get_item_at_pos *)
val info = GIObjectInfo.get_method objectInfo 38;
val info = GIObjectInfo.get_method objectInfo 0;  (* GtkWindow.new *)
val info = GIObjectInfo.get_method objectInfo 17;
val info = GIObjectInfo.get_method objectInfo 19;
val info = GIObjectInfo.get_method objectInfo 6;
val info = GIObjectInfo.get_method objectInfo 2;
val info = GIObjectInfo.get_method objectInfo 65;
val info = GIObjectInfo.get_method objectInfo 18;
val GIInfoType.FUNCTION functionInfo = GIInfoType.get_type info;
GIBaseInfo.get_name functionInfo;
GIFunctionInfo.get_symbol functionInfo;
GICallableInfo.get_caller_owns functionInfo;
GICallableInfo.may_return_null functionInfo;
val retTypeInfo = GICallableInfo.get_return_type functionInfo;
GITypeInfo.get_tag retTypeInfo;
GITypeInfo.is_pointer retTypeInfo;
GIBaseInfo.get_namespace retTypeInfo;

val SOME interfaceInfo = GITypeInfo.get_interface retTypeInfo;
val GIInfoType.OBJECT objectInfo = GIInfoType.get_type interfaceInfo;
GIBaseInfo.get_namespace objectInfo;

GICallableInfo.get_n_args functionInfo;
map (I &&& (GIInfoType.get_type &&& GIBaseInfo.get_name) o GICallableInfo.get_arg functionInfo) (0 -- 2);


val info = GICallableInfo.get_arg functionInfo 0;
val info = GICallableInfo.get_arg functionInfo 2;
val info = GICallableInfo.get_arg functionInfo 4;
val GIInfoType.ARG argInfo = GIInfoType.get_type info;
GIBaseInfo.get_name argInfo;
GIArgInfo.get_direction argInfo;
GIArgInfo.may_be_null argInfo;
GIArgInfo.is_return_value argInfo;
GIArgInfo.is_optional argInfo;
GIArgInfo.get_ownership_transfer argInfo;
GIArgInfo.is_caller_allocates argInfo;
GIArgInfo.get_scope argInfo;

val typeInfo = GIArgInfo.get_type argInfo;
GITypeInfo.get_tag typeInfo;
GITypeInfo.is_pointer typeInfo;

val SOME interfaceBaseInfo = GITypeInfo.get_interface typeInfo;
val GIInfoType.OBJECT objectInfo = GIInfoType.get_type interfaceBaseInfo;
GIBaseInfo.get_name objectInfo;


val GIInfoType.ENUM enumInfo = GIInfoType.get_type interfaceBaseInfo;
GIBaseInfo.get_name enumInfo;
GIEnumInfo.get_n_methods enumInfo;
GIEnumInfo.get_n_values enumInfo;
val valueInfo0 = GIEnumInfo.get_value enumInfo 0;
val valueInfo1 = GIEnumInfo.get_value enumInfo 1;

GIBaseInfo.get_name valueInfo0;
GIBaseInfo.get_namespace valueInfo0;
GIValueInfo.get_value valueInfo0;
GIBaseInfo.get_name valueInfo1;
GIBaseInfo.get_namespace valueInfo1;
GIValueInfo.get_value valueInfo1;




val info = GIRepository.get_info repo s 914;
val GIInfoType.OBJECT objectInfo = GIInfoType.get_type info;
GIBaseInfo.get_name objectInfo;
GIObjectInfo.get_n_methods objectInfo;
map (I &&& (GIInfoType.get_type &&& GIBaseInfo.get_name) o GIObjectInfo.get_method objectInfo) (0 -- 231);



val info = GIObjectInfo.get_method objectInfo 155;
val info = GIRepository.get_info repo s 989;  (* init *)
val GIInfoType.FUNCTION functionInfo = GIInfoType.get_type info;
GIBaseInfo.get_name functionInfo;
GIFunctionInfo.get_symbol functionInfo;

GICallableInfo.get_n_args functionInfo;
map (I &&& (GIInfoType.get_type &&& GIBaseInfo.get_name) o GICallableInfo.get_arg functionInfo) (0 -- 1);

val info = GICallableInfo.get_arg functionInfo 0;
val info = GICallableInfo.get_arg functionInfo 1;
val GIInfoType.ARG argInfo = GIInfoType.get_type info;
GIBaseInfo.get_name argInfo;
GIArgInfo.get_direction argInfo;
GIArgInfo.may_be_null argInfo;
GIArgInfo.is_return_value argInfo;
GIArgInfo.is_optional argInfo;
GIArgInfo.get_ownership_transfer argInfo;
GIArgInfo.is_caller_allocates argInfo;
GIArgInfo.get_scope argInfo;
val typeInfo = GIArgInfo.get_type argInfo;

GITypeInfo.get_tag typeInfo;
GITypeInfo.is_pointer typeInfo;
GITypeInfo.get_array_length typeInfo;
GITypeInfo.get_array_fixed_size typeInfo;
GITypeInfo.is_zero_terminated typeInfo;
GITypeInfo.get_array_type typeInfo;
val SOME paramTypeInfo = GITypeInfo.get_param_type typeInfo 0;

GITypeInfo.get_tag paramTypeInfo;


(* ** signals ** *)
GIObjectInfo.get_n_signals objectInfo;
map (I &&& (GIInfoType.get_type &&& GIBaseInfo.get_name) o GIObjectInfo.get_signal objectInfo) (0 -- 3);

val signalInfo = GIObjectInfo.get_signal objectInfo 3;

GIBaseInfo.get_name signalInfo;
GICallableInfo.get_n_args signalInfo;
map (I &&& (GIInfoType.get_type &&& GIBaseInfo.get_name) o GICallableInfo.get_arg signalInfo) (0 -- 0);


(* ** properties ** *)
GIObjectInfo.get_n_properties objectInfo;
map (I &&& (GIInfoType.get_type &&& GIBaseInfo.get_name) o GIObjectInfo.get_property objectInfo) (0 -- 30);

val propertyInfo = GIObjectInfo.get_property objectInfo 18;
val propertyInfo = GIObjectInfo.get_property objectInfo 33;
GIBaseInfo.get_name propertyInfo;
GIPropertyInfo.get_ownership_transfer propertyInfo;
val typeInfo = GIPropertyInfo.get_type propertyInfo;

GITypeInfo.get_tag typeInfo;


val flags = GIPropertyInfo.get_flags propertyInfo;

GObjectParamFlags.anySet (flags, GObjectParamFlags.READABLE);
GObjectParamFlags.anySet (flags, GObjectParamFlags.WRITABLE);

val  = GIPropertyInfo.get_ propertyInfo;




(* FLAGS and ENUM *)

val info = GIRepository.get_info repo s 192; (* FLAGS: DialogFlags *)
val GIInfoType.FLAGS flagsInfo = GIInfoType.get_type info;
GIBaseInfo.get_name flagsInfo;

val info = GIRepository.get_info repo s 194; (* ENUM: DirectionType *)
val GIInfoType.ENUM enumInfo = GIInfoType.get_type info;
GIBaseInfo.get_name enumInfo;






val tylib_gdk =
  GIRepository.require repo "Gdk" "3.0" (GIRepositoryRepositoryLoadFlags.flags []);
GITypelib.get_namespace tylib_gdk;
val SOME cprefix_gdk = GIRepository.get_c_prefix repo "Gdk";
val s = GIRepository.load_typelib repo tylib_gdk (GIRepositoryRepositoryLoadFlags.flags []);
val n = GIRepository.get_n_infos repo s;

PolyML.print_depth 2500;
map (I &&& (GIInfoType.get_type &&& GIBaseInfo.get_name) o GIRepository.get_info repo s) (0 -- 2436);

val info = GIRepository.get_info repo s 1;  (* Atom *)
val info = GIRepository.get_info repo s 27;  (* EventKey *)
val info = GIRepository.get_info repo s 2306;  (* KeymapKey *)
val info = GIRepository.get_info repo s 2331;  (* WindowClass *)
val GIInfoType.STRUCT structInfo = GIInfoType.get_type info;
GIBaseInfo.get_name structInfo;
GIBaseInfo.get_namespace structInfo;
GIStructInfo.get_n_methods structInfo;
GIStructInfo.get_n_fields structInfo;

map (I &&& (GIInfoType.get_type &&& GIBaseInfo.get_name) o GIStructInfo.get_field structInfo) (0 -- 10);

GIStructInfo.is_foreign structInfo;
GIStructInfo.get_size structInfo;
GIStructInfo.is_gtype_struct structInfo;

GIBaseInfo.get_container structInfo;




val info = GIRepository.get_info repo s 17;  (* Event *)
val GIInfoType.UNION unionInfo = GIInfoType.get_type info;
GIBaseInfo.get_name unionInfo;
GIBaseInfo.get_namespace unionInfo;
GIUnionInfo.is_discriminated unionInfo;
GIUnionInfo.get_n_methods unionInfo;
GIUnionInfo.get_n_fields unionInfo;

map (I &&& (GIInfoType.get_type &&& GIBaseInfo.get_name) o GIUnionInfo.get_field unionInfo) (0 -- 18);

val info = GIUnionInfo.get_field unionInfo 7;  (* key *)
val GIInfoType.FIELD fieldInfo = GIInfoType.get_type info;
GIBaseInfo.get_name fieldInfo;

GIFieldInfo.get_offset fieldInfo;

val typeInfo = GIFieldInfo.get_type fieldInfo;
GITypeInfo.get_tag typeInfo;

val SOME info = GITypeInfo.get_interface typeInfo;
val GIInfoType.STRUCT structInfo = GIInfoType.get_type info;
GIBaseInfo.get_name structInfo;
GIBaseInfo.get_namespace structInfo;



val info = GIRepository.get_info repo s 13;  (* DisplayManager *)
val info = GIRepository.get_info repo s 2327;  (* Window *)
val GIInfoType.OBJECT objectInfo = GIInfoType.get_type info;
GIBaseInfo.get_name objectInfo;

(* ** methods ** *)
GIObjectInfo.get_n_methods objectInfo;
map (I &&& (GIInfoType.get_type &&& GIBaseInfo.get_name) o GIObjectInfo.get_method objectInfo) (0 -- 136);

val info = GIObjectInfo.get_method objectInfo 4;
val info = GIObjectInfo.get_method objectInfo 126;
val GIInfoType.FUNCTION functionInfo = GIInfoType.get_type info;
GIBaseInfo.get_name functionInfo;
GIFunctionInfo.get_symbol functionInfo;

(* *** parameter values *** *)
GICallableInfo.get_n_args functionInfo;
map (I &&& (GIInfoType.get_type &&& GIBaseInfo.get_name) o GICallableInfo.get_arg functionInfo) (0 -- 0);

val info = GICallableInfo.get_arg functionInfo 0;
val info = GICallableInfo.get_arg functionInfo 1;
val GIInfoType.ARG argInfo = GIInfoType.get_type info;
GIBaseInfo.get_name argInfo;
GIArgInfo.get_direction argInfo;
GIArgInfo.may_be_null argInfo;
GIArgInfo.is_return_value argInfo;
GIArgInfo.is_optional argInfo;
GIArgInfo.get_ownership_transfer argInfo;
GIArgInfo.is_caller_allocates argInfo;
GIArgInfo.get_scope argInfo;
val typeInfo = GIArgInfo.get_type argInfo;

GITypeInfo.is_pointer typeInfo;
val SOME interfaceInfo = GITypeInfo.get_interface typeInfo;
GIBaseInfo.get_name interfaceInfo;
GIBaseInfo.get_namespace interfaceInfo;
GITypeInfo.get_tag typeInfo;
GIInfoType.get_type interfaceInfo;

(* ** signals ** *)
GIObjectInfo.get_n_signals objectInfo;
map (I &&& (GIInfoType.get_type &&& GIBaseInfo.get_name) o GIObjectInfo.get_signal objectInfo) (0 -- 0);

val signalInfo = GIObjectInfo.get_signal objectInfo 0;
val signalInfo = GIObjectInfo.get_signal objectInfo 2;

(* *** parameter values *** *)
GICallableInfo.get_n_args signalInfo;
map (I &&& (GIInfoType.get_type &&& GIBaseInfo.get_name) o GICallableInfo.get_arg signalInfo) (0 -- 0);
val argInfo = GICallableInfo.get_arg signalInfo 0;
val typeInfo = GIArgInfo.get_type argInfo;

GITypeInfo.is_pointer typeInfo;
val SOME interfaceInfo = GITypeInfo.get_interface typeInfo;
GIBaseInfo.get_name interfaceInfo;
GIBaseInfo.get_namespace interfaceInfo;
GITypeInfo.get_tag typeInfo;
GIInfoType.get_type interfaceInfo;

(* *** return value *** *)
val typeInfo = GICallableInfo.get_return_type signalInfo;

GITypeInfo.is_pointer typeInfo;
val SOME interfaceInfo = GITypeInfo.get_interface typeInfo;
GIBaseInfo.get_name interfaceInfo;
GIBaseInfo.get_namespace interfaceInfo;
GITypeInfo.get_tag typeInfo;
GIInfoType.get_type interfaceInfo;

(* ** properties ** *)
GIObjectInfo.get_n_properties objectInfo;
map (I &&& (GIInfoType.get_type &&& GIBaseInfo.get_name) o GIObjectInfo.get_property objectInfo) (0 -- 0);

val propertyInfo = GIObjectInfo.get_property objectInfo 0;
val typeInfo = GIPropertyInfo.get_type propertyInfo;

GITypeInfo.is_pointer typeInfo;
val SOME interfaceInfo = GITypeInfo.get_interface typeInfo;
GIBaseInfo.get_name interfaceInfo;
GIBaseInfo.get_namespace interfaceInfo;
GITypeInfo.get_tag typeInfo;
GIInfoType.get_type interfaceInfo;










val tylib_gdk_pixbuf =
  GIRepository.require repo "GdkPixbuf" "2.0" (GIRepositoryRepositoryLoadFlags.flags []);
GITypelib.get_namespace tylib_gdk_pixbuf;
val SOME cprefix_gdk_pixbuf = GIRepository.get_c_prefix repo "GdkPixbuf";
val s = GIRepository.load_typelib repo tylib_gdk_pixbuf (GIRepositoryRepositoryLoadFlags.flags []);
val n = GIRepository.get_n_infos repo s;

PolyML.print_depth 30;
map (I &&& (GIInfoType.get_type &&& GIBaseInfo.get_name) o GIRepository.get_info repo s) (0 -- 26);

val info = GIRepository.get_info repo s 16;  (* PixbufLoader *)
val GIInfoType.OBJECT objectInfo = GIInfoType.get_type info;
GIBaseInfo.get_name objectInfo;
GIBaseInfo.get_namespace objectInfo;
GIObjectInfo.get_n_methods objectInfo;

map (I &&& (GIInfoType.get_type &&& GIBaseInfo.get_name) o GIObjectInfo.get_method objectInfo) (0 -- 8);

val info = GIObjectInfo.get_method objectInfo 5; (* get_format *)
val GIInfoType.FUNCTION functionInfo = GIInfoType.get_type info;
GIBaseInfo.get_name functionInfo;
GIFunctionInfo.get_symbol functionInfo;

GICallableInfo.get_n_args functionInfo;
GICallableInfo.get_caller_owns functionInfo; (* EVERYTHING! eh? *)
GICallableInfo.may_return_null functionInfo;







val tylib_glib =
  GIRepository.require repo "GLib" "2.0" (GIRepositoryRepositoryLoadFlags.flags []);
GITypelib.get_namespace tylib_glib;
val SOME cprefix_glib = GIRepository.get_c_prefix repo "GLib";
val s = GIRepository.load_typelib repo tylib_glib (GIRepositoryRepositoryLoadFlags.flags []);
val n = GIRepository.get_n_infos repo s;

PolyML.print_depth 750;
map (I &&& (GIInfoType.get_type &&& GIBaseInfo.get_name) o GIRepository.get_info repo s) (0 -- 726);

(* filter out UNIONs *)
List.mapPartial ((fn (i, SOME x) => SOME (i, GIBaseInfo.get_name x) | (_, NONE) => NONE) o (I &&& (fn info => case GIInfoType.get_type info of GIInfoType.UNION _ => SOME info | _ => NONE) o GIRepository.get_info repo s)) (0 -- 726)


val info = GIRepository.get_info repo s 134;  (* KeyFile *)
val info = GIRepository.get_info repo s 151;  (* MainContext *)
val GIInfoType.STRUCT structInfo = GIInfoType.get_type info;
GIBaseInfo.get_name structInfo;
GIStructInfo.get_n_methods structInfo;

map (I &&& (GIInfoType.get_type &&& GIBaseInfo.get_name) o GIStructInfo.get_method structInfo) (0 -- 23);


val info = GIRepository.get_info repo s 224;  (* ShellError *)
val GIInfoType.ENUM enumInfo = GIInfoType.get_type info;
GIBaseInfo.get_name enumInfo;
GIBaseInfo.get_namespace enumInfo;

GIEnumInfo.get_error_domain enumInfo;



val tylib_gobject =
  GIRepository.require repo "GObject" "2.0" (GIRepositoryRepositoryLoadFlags.flags []);
val SOME cprefix_gobject = GIRepository.get_c_prefix repo "GObject";
val s = GIRepository.load_typelib repo tylib_gobject (GIRepositoryRepositoryLoadFlags.flags []);
val n = GIRepository.get_n_infos repo s;


PolyML.print_depth 250;

map (I &&& (GIInfoType.get_type &&& GIBaseInfo.get_name) o GIRepository.get_info repo s) (0 -- 222);

val info = GIRepository.get_info repo s 19;
val info = GIRepository.get_info repo s 25;  (* Object *)
val info = GIRepository.get_info repo s 37;
val GIInfoType.OBJECT objectInfo = GIInfoType.get_type info;
GIBaseInfo.get_name objectInfo;
GIObjectInfo.get_ref_function objectInfo;

val SOME objectInfo = GIObjectInfo.get_parent objectInfo;
GIBaseInfo.get_name objectInfo;

val NONE = GIObjectInfo.get_parent objectInfo;

(* ** properties ** *)
GIObjectInfo.get_n_properties objectInfo;
map (I &&& (GIInfoType.get_type &&& GIBaseInfo.get_name) o GIObjectInfo.get_property objectInfo) (0 -- 33);




val tylib_gio =
  GIRepository.require repo "Gio" "2.0" (GIRepositoryRepositoryLoadFlags.flags []);
val SOME cprefix_gobject = GIRepository.get_c_prefix repo "Gio";
val s = GIRepository.load_typelib repo tylib_gio (GIRepositoryRepositoryLoadFlags.flags []);
val n = GIRepository.get_n_infos repo s;

PolyML.print_depth 600;
map (I &&& (GIInfoType.get_type &&& GIBaseInfo.get_name) o GIRepository.get_info repo s) (0 -- 579);

val info = GIRepository.get_info repo s 62;  (* DBusConnection *)
val info = GIRepository.get_info repo s 89;  (* DBusObjectManagerClient *)
val GIInfoType.OBJECT objectInfo = GIInfoType.get_type info;
GIBaseInfo.get_name objectInfo;


(* ** properties ** *)
GIObjectInfo.get_n_properties objectInfo;
map (I &&& (GIInfoType.get_type &&& GIBaseInfo.get_name) o GIObjectInfo.get_property objectInfo) (0 -- 8);


(* ** signals ** *)
GIObjectInfo.get_n_signals objectInfo;
map (I &&& (GIInfoType.get_type &&& GIBaseInfo.get_name) o GIObjectInfo.get_signal objectInfo) (0 -- 0);

val signalInfo = GIObjectInfo.get_signal objectInfo 0;

(* *** parameter values *** *)
GICallableInfo.get_n_args signalInfo;
map (I &&& (GIInfoType.get_type &&& GIBaseInfo.get_name) o GICallableInfo.get_arg signalInfo) (0 -- 1);
val argInfo = GICallableInfo.get_arg signalInfo 1;
GIArgInfo.may_be_null argInfo;

val typeInfo = GIArgInfo.get_type argInfo;
GITypeInfo.is_pointer typeInfo;
GITypeInfo.get_tag typeInfo;






val tylib_atk =
  GIRepository.require repo "Atk" "1.0" (GIRepositoryRepositoryLoadFlags.flags []);
val SOME cprefix_atk = GIRepository.get_c_prefix repo "Atk";
val s = GIRepository.load_typelib repo tylib_atk (GIRepositoryRepositoryLoadFlags.flags []);
val n = GIRepository.get_n_infos repo s;

PolyML.print_depth 250;

map (I &&& (GIInfoType.get_type &&& GIBaseInfo.get_name) o GIRepository.get_info repo s) (0 -- 103);







val tylib_cairo =
  GIRepository.require repo "cairo" "1.0" (GIRepositoryRepositoryLoadFlags.flags []);
val SOME cprefix_cairo = GIRepository.get_c_prefix repo "cairo";
val SOME shared_library_cairo = GIRepository.get_shared_library repo "cairo";
val s = GIRepository.load_typelib repo tylib_cairo (GIRepositoryRepositoryLoadFlags.flags []);
val n = GIRepository.get_n_infos repo s;

PolyML.print_depth 250;

map (I &&& (GIInfoType.get_type &&& GIBaseInfo.get_name) o GIRepository.get_info repo s) (0 -- 12);


GIRepository.get_dependencies repo "cairo";





val tylib_gtksource =
  GIRepository.require repo "GtkSource" "3.0" (GIRepositoryRepositoryLoadFlags.flags []);
val SOME cprefix_gtksource = GIRepository.get_c_prefix repo "GtkSource";
val s = GIRepository.load_typelib repo tylib_gtksource (GIRepositoryRepositoryLoadFlags.flags []);
val n = GIRepository.get_n_infos repo s;

PolyML.print_depth 250;

map (I &&& (GIInfoType.get_type &&& GIBaseInfo.get_name) o GIRepository.get_info repo s) (0 -- 71);





val tylib_vte =
  GIRepository.require repo "Vte" "2.90" (GIRepositoryRepositoryLoadFlags.flags []);
val SOME cprefix_vte = GIRepository.get_c_prefix repo "Vte";
val s = GIRepository.load_typelib repo tylib_vte (GIRepositoryRepositoryLoadFlags.flags []);
val n = GIRepository.get_n_infos repo s;

PolyML.print_depth 250;

map (I &&& (GIInfoType.get_type &&& GIBaseInfo.get_name) o GIRepository.get_info repo s) (0 -- 16);

val info = GIRepository.get_info repo s 5;  (* Terminal *)
val GIInfoType.OBJECT objectInfo = GIInfoType.get_type info;
GIBaseInfo.get_name objectInfo;
GIObjectInfo.get_n_methods objectInfo;

map (I &&& (GIInfoType.get_type &&& GIBaseInfo.get_name) o GIObjectInfo.get_method objectInfo) (0 -- 90);





*)
