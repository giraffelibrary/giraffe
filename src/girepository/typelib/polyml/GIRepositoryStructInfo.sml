structure GIRepositoryStructInfo :>
  G_I_REPOSITORY_STRUCT_INFO
    where type 'a class = 'a GIRepositoryStructInfoClass.class
    where type 'a fieldinfo_class = 'a GIRepositoryFieldInfoClass.class
    where type 'a functioninfo_class = 'a GIRepositoryFunctionInfoClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getNFields_ =
        call
          (getSymbol "g_struct_info_get_n_fields")
          (GIRepositoryBaseInfoClass.PolyML.cPtr --> GInt32.PolyML.cVal);

      val getField_ =
        call
          (getSymbol "g_struct_info_get_field")
          (GIRepositoryBaseInfoClass.PolyML.cPtr
            &&> GInt32.PolyML.cVal
            --> GIRepositoryBaseInfoClass.PolyML.cPtr);

      val getNMethods_ =
        call
          (getSymbol "g_struct_info_get_n_methods")
          (GIRepositoryBaseInfoClass.PolyML.cPtr --> GInt32.PolyML.cVal);

      val getMethod_ =
        call
          (getSymbol "g_struct_info_get_method")
          (GIRepositoryBaseInfoClass.PolyML.cPtr
            &&> GInt32.PolyML.cVal
            --> GIRepositoryBaseInfoClass.PolyML.cPtr);

      val findMethod_ =
        call
          (getSymbol "g_struct_info_find_method")
          (GIRepositoryBaseInfoClass.PolyML.cPtr
            &&> Utf8.PolyML.cInPtr
            --> GIRepositoryBaseInfoClass.PolyML.cPtr);

      val getSize_ =
        call
          (getSymbol "g_struct_info_get_size")
          (GIRepositoryBaseInfoClass.PolyML.cPtr --> GULong.PolyML.cVal);

      val getAlignment_ =
        call
          (getSymbol "g_struct_info_get_alignment")
          (GIRepositoryBaseInfoClass.PolyML.cPtr --> GULong.PolyML.cVal);

      val isGtypeStruct_ =
        call
          (getSymbol "g_struct_info_is_gtype_struct")
          (GIRepositoryBaseInfoClass.PolyML.cPtr --> GBool.PolyML.cVal);

      val isForeign_ =
        call
          (getSymbol "g_struct_info_is_foreign")
          (GIRepositoryBaseInfoClass.PolyML.cPtr --> GBool.PolyML.cVal);
    end


    type 'a class = 'a GIRepositoryStructInfoClass.class
    type 'a fieldinfo_class = 'a GIRepositoryFieldInfoClass.class
    type 'a functioninfo_class = 'a GIRepositoryFunctionInfoClass.class


    val getNFields =
      fn info => (GIRepositoryBaseInfoClass.FFI.withPtr false ---> GInt32.FFI.fromVal) getNFields_ info

    val getField =
      fn info => fn n =>
        (GIRepositoryBaseInfoClass.FFI.withPtr false &&&> GInt32.FFI.withVal ---> GIRepositoryFieldInfoClass.FFI.fromPtr true)
        getField_
        (info & n)

    val getNMethods =
      fn info => (GIRepositoryBaseInfoClass.FFI.withPtr false ---> GInt32.FFI.fromVal) getNMethods_ info

    val getMethod =
      fn info => fn n =>
        (GIRepositoryBaseInfoClass.FFI.withPtr false &&&> GInt32.FFI.withVal ---> GIRepositoryFunctionInfoClass.FFI.fromPtr true)
        getMethod_
        (info & n)

    val findMethod =
      fn info => fn name =>
        (GIRepositoryBaseInfoClass.FFI.withPtr false
          &&&> Utf8.FFI.withPtr 0
          ---> GIRepositoryFunctionInfoClass.FFI.fromPtr true)
        findMethod_
        (info & name)

    val getSize = fn info => (GIRepositoryBaseInfoClass.FFI.withPtr false ---> GULong.FFI.fromVal) getSize_ info

    val getAlignment =
      fn info => (GIRepositoryBaseInfoClass.FFI.withPtr false ---> GULong.FFI.fromVal) getAlignment_ info

    val isGtypeStruct =
      fn info => (GIRepositoryBaseInfoClass.FFI.withPtr false ---> GBool.FFI.fromVal) isGtypeStruct_ info

    val isForeign =
      fn info => (GIRepositoryBaseInfoClass.FFI.withPtr false ---> GBool.FFI.fromVal) isForeign_ info
  end
