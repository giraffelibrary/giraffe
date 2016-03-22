signature CLASS =
  sig
    include CLASS

    structure PolyML :
      sig
        val cPtr : C.notnull C.p PolyMLFFI.conversion
        val cOptPtr : unit C.p PolyMLFFI.conversion
        val cOutRef : (unit, C.notnull) C.r PolyMLFFI.conversion
        val cOutOptRef : (unit, unit) C.r PolyMLFFI.conversion
        val cInOutRef : (C.notnull, C.notnull) C.r PolyMLFFI.conversion
        val cInOutOptRef : (unit, unit) C.r PolyMLFFI.conversion
      end
  end
