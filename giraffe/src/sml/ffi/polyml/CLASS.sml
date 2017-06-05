signature CLASS =
  sig
    include CLASS

    structure PolyML :
      sig
        val cPtr : FFI.notnull FFI.p PolyMLFFI.conversion
        val cOptPtr : unit FFI.p PolyMLFFI.conversion
        val cOutRef : (unit, FFI.notnull) FFI.r PolyMLFFI.conversion
        val cOutOptRef : (unit, unit) FFI.r PolyMLFFI.conversion
        val cInOutRef : (FFI.notnull, FFI.notnull) FFI.r PolyMLFFI.conversion
        val cInOutOptRef : (unit, unit) FFI.r PolyMLFFI.conversion
      end
  end
