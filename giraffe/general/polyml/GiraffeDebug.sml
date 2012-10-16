structure GiraffeDebug :> GIRAFFE_DEBUG =
  struct
    fun isDefinedSome var =
      case OS.Process.getEnv var of
        NONE    => false
      | SOME "" => false
      | SOME _  => true

    val isEnabled = isDefinedSome "GIRAFFE_DEBUG"

    fun getRefCount () = isEnabled andalso isDefinedSome "GIRAFFE_DEBUG_REF_COUNT"
    fun getClosure () = isEnabled andalso isDefinedSome "GIRAFFE_DEBUG_CLOSURE"
  end
