structure GObjectTypeFundamentalFlags :> G_OBJECT_TYPE_FUNDAMENTAL_FLAGS =
  struct
    val CLASSED = 0w1
    val INSTANTIATABLE = 0w2
    val DERIVABLE = 0w4
    val DEEP_DERIVABLE = 0w8
    val allFlags =
      [
        CLASSED,
        INSTANTIATABLE,
        DERIVABLE,
        DEEP_DERIVABLE
      ]
    structure Flags =
      Flags(
        val allFlags = allFlags
      )
    open Flags
  end
