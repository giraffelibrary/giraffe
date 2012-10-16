structure GObjectType :>
  sig
    include G_OBJECT_TYPE

    structure PolyML :
      sig
        val VAL : C.val_ CInterface.Conversion
      end
  end =
  struct
    type val_ = SysWord.word
    val VAL =
      CInterface.mapConversion
        (SysWord.fromInt, SysWord.toInt)
        CInterface.LONG


    local
      open PolyMLFFI
    in
      val isValueType_ =
        call
          (load_sym libgiraffegobject "giraffe_g_type_is_value_type")
          (VAL --> FFI.PolyML.Bool.VAL);

      val name_ =
        call
          (load_sym libgiraffegobject "giraffe_g_type_name")
          (VAL --> FFI.PolyML.String.RETPTR);

      val fromName_ =
        call
          (load_sym libgobject "g_type_from_name")
          (FFI.PolyML.String.INPTR --> VAL);

      val boolean_ =
        call
          (load_sym libgiraffegobject "giraffe_g_boolean_get_type")
          (FFI.PolyML.VOID --> VAL);

      val int_ =
        call
          (load_sym libgiraffegobject "giraffe_g_int_get_type")
          (FFI.PolyML.VOID --> VAL);

      val uint_ =
        call
          (load_sym libgiraffegobject "giraffe_g_uint_get_type")
          (FFI.PolyML.VOID --> VAL);

      val long_ =
        call
          (load_sym libgiraffegobject "giraffe_g_long_get_type")
          (FFI.PolyML.VOID --> VAL);

      val ulong_ =
        call
          (load_sym libgiraffegobject "giraffe_g_ulong_get_type")
          (FFI.PolyML.VOID --> VAL);

      val int64_ =
        call
          (load_sym libgiraffegobject "giraffe_g_int64_get_type")
          (FFI.PolyML.VOID --> VAL);

      val uint64_ =
        call
          (load_sym libgiraffegobject "giraffe_g_uint64_get_type")
          (FFI.PolyML.VOID --> VAL);

      val float_ =
        call
          (load_sym libgiraffegobject "giraffe_g_float_get_type")
          (FFI.PolyML.VOID --> VAL);

      val double_ =
        call
          (load_sym libgiraffegobject "giraffe_g_double_get_type")
          (FFI.PolyML.VOID --> VAL);

      val char_ =
        call
          (load_sym libgiraffegobject "giraffe_g_char_get_type")
          (FFI.PolyML.VOID --> VAL);

      val string_ =
        call
          (load_sym libgiraffegobject "giraffe_g_string_get_type")
          (FFI.PolyML.VOID --> VAL);
    end


    type t = SysWord.word

    structure C =
      struct
        type val_ = val_
        val withVal = FFI.withVal
        fun fromVal w = w
      end

    structure PolyML =
      struct
        val VAL = VAL
      end


    val isValueType = isValueType_

    val name =
      fn gtype =>
        (C.withVal ---> FFI.String.fromPtr false) name_ gtype

    val fromName =
      fn name =>
        (FFI.String.withConstPtr ---> (fn 0w0 => NONE | n => SOME n))
          fromName_
          name


    val boolean = boolean_

    val int = int_

    val uint = uint_

    val long = long_

    val ulong = ulong_

    val int64 = int64_

    val uint64 = uint64_

    val float = float_

    val double = double_

    val char = char_

    val string = string_
  end
