structure GObjectParamFlags :> G_OBJECT_PARAM_FLAGS =
  struct
    val READABLE = 0w1
    val WRITABLE = 0w2
    val READWRITE = 0w3
    val CONSTRUCT = 0w4
    val CONSTRUCT_ONLY = 0w8
    val LAX_VALIDATION = 0w16
    val STATIC_NAME = 0w32
    val PRIVATE = 0w32
    val STATIC_NICK = 0w64
    val STATIC_BLURB = 0w128
    val EXPLICIT_NOTIFY = 0w1073741824
    val DEPRECATED = 0w2147483648
    val allFlags =
      [
        READABLE,
        WRITABLE,
        READWRITE,
        CONSTRUCT,
        CONSTRUCT_ONLY,
        LAX_VALIDATION,
        STATIC_NAME,
        PRIVATE,
        STATIC_NICK,
        STATIC_BLURB,
        EXPLICIT_NOTIFY,
        DEPRECATED
      ]
    structure Flags =
      Flags(
        val allFlags = allFlags
      )
    open Flags
  end
