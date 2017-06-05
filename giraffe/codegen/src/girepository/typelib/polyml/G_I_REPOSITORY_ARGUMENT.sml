signature G_I_REPOSITORY_ARGUMENT =
  sig
    include G_I_REPOSITORY_ARGUMENT

    structure PolyML :
      sig
        val cPtr : FFI.notnull FFI.p PolyMLFFI.conversion
        val cOptPtr : unit FFI.p PolyMLFFI.conversion
      end
  end
