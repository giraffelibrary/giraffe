signature CALLBACK =
  sig
    include CALLBACK

    structure PolyML :
      sig
        val cPtr : FFI.notnull FFI.p PolyMLFFI.conversion
        val cOptPtr : unit FFI.p PolyMLFFI.conversion
        val cFunction : FFI.callback PolyMLFFI.conversion
      end
  end
