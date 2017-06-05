structure GObjectTypeFlags :> G_OBJECT_TYPE_FLAGS =
  struct
    val ABSTRACT = 0w16
    val VALUE_ABSTRACT = 0w32
    val allFlags = [ABSTRACT, VALUE_ABSTRACT]
    structure Flags =
      Flags(
        val allFlags = allFlags
      )
    open Flags
  end
