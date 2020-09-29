signature G_I_REPOSITORY_ARGUMENT =
  sig
    include G_I_REPOSITORY_ARGUMENT

    structure PolyML :
      sig
        val cPtr : FFI.non_opt FFI.p PolyMLFFI.conversion
        val cOptPtr : FFI.opt FFI.p PolyMLFFI.conversion
      end
  end
