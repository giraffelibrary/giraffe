structure GObjectType :>
  sig
    include G_OBJECT_TYPE

    structure PolyML :
      sig
        val VAL : C.val_ CInterface.Conversion
        val REF : C.ref_ CInterface.Conversion
      end
  end =
  struct
    local
      open PolyMLFFI
    in
      val isValueType_ =
        call
          (load_sym libgiraffegobject "giraffe_g_type_is_value_type")
          (FFI.Size.PolyML.VAL --> FFI.Bool.PolyML.VAL);

      val name_ =
        call
          (load_sym libgiraffegobject "giraffe_g_type_name")
          (FFI.Size.PolyML.VAL --> FFI.String.PolyML.RETPTR);

      val fromName_ =
        call
          (load_sym libgobject "g_type_from_name")
          (FFI.String.PolyML.INPTR --> FFI.Size.PolyML.VAL);

      val boolean_ =
        call
          (load_sym libgiraffegobject "giraffe_g_boolean_get_type")
          (FFI.PolyML.VOID --> FFI.Size.PolyML.VAL);

      val int_ =
        call
          (load_sym libgiraffegobject "giraffe_g_int_get_type")
          (FFI.PolyML.VOID --> FFI.Size.PolyML.VAL);

      val uint_ =
        call
          (load_sym libgiraffegobject "giraffe_g_uint_get_type")
          (FFI.PolyML.VOID --> FFI.Size.PolyML.VAL);

      val long_ =
        call
          (load_sym libgiraffegobject "giraffe_g_long_get_type")
          (FFI.PolyML.VOID --> FFI.Size.PolyML.VAL);

      val ulong_ =
        call
          (load_sym libgiraffegobject "giraffe_g_ulong_get_type")
          (FFI.PolyML.VOID --> FFI.Size.PolyML.VAL);

      val int64_ =
        call
          (load_sym libgiraffegobject "giraffe_g_int64_get_type")
          (FFI.PolyML.VOID --> FFI.Size.PolyML.VAL);

      val uint64_ =
        call
          (load_sym libgiraffegobject "giraffe_g_uint64_get_type")
          (FFI.PolyML.VOID --> FFI.Size.PolyML.VAL);

      val float_ =
        call
          (load_sym libgiraffegobject "giraffe_g_float_get_type")
          (FFI.PolyML.VOID --> FFI.Size.PolyML.VAL);

      val double_ =
        call
          (load_sym libgiraffegobject "giraffe_g_double_get_type")
          (FFI.PolyML.VOID --> FFI.Size.PolyML.VAL);

      val char_ =
        call
          (load_sym libgiraffegobject "giraffe_g_char_get_type")
          (FFI.PolyML.VOID --> FFI.Size.PolyML.VAL);

      val string_ =
        call
          (load_sym libgiraffegobject "giraffe_g_string_get_type")
          (FFI.PolyML.VOID --> FFI.Size.PolyML.VAL);
    end


    open FFI.Size


    val isValueType =
      fn gtype =>
        (C.withVal ---> FFI.Bool.C.fromVal) isValueType_ gtype

    val name =
      fn gtype =>
        (C.withVal ---> FFI.String.C.fromPtr false) name_ gtype

    val fromName =
      fn name =>
        (FFI.String.C.withConstPtr ---> (fn 0 => NONE | n => SOME n) o FFI.Size.C.fromVal)
          fromName_
          name

    val boolean = fn () => (I ---> C.fromVal) boolean_ ()

    val int = fn () => (I ---> C.fromVal) int_ ()

    val uint = fn () => (I ---> C.fromVal) uint_ ()

    val long = fn () => (I ---> C.fromVal) long_ ()

    val ulong = fn () => (I ---> C.fromVal) ulong_ ()

    val int64 = fn () => (I ---> C.fromVal) int64_ ()

    val uint64 = fn () => (I ---> C.fromVal) uint64_ ()

    val float = fn () => (I ---> C.fromVal) float_ ()

    val double = fn () => (I ---> C.fromVal) double_ ()

    val char = fn () => (I ---> C.fromVal) char_ ()

    val string = fn () => (I ---> C.fromVal) string_ ()
  end
