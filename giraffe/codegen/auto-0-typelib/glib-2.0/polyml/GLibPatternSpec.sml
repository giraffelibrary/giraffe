structure GLibPatternSpec :>
  G_LIB_PATTERN_SPEC
    where type t = GLibPatternSpecRecord.t =
  struct
    local
      open PolyMLFFI
    in
      val equal_ = call (getSymbol "g_pattern_spec_equal") (GLibPatternSpecRecord.PolyML.cPtr &&> GLibPatternSpecRecord.PolyML.cPtr --> GBool.PolyML.cVal)
    end
    type t = GLibPatternSpecRecord.t
    fun equal self pspec2 = (GLibPatternSpecRecord.FFI.withPtr false &&&> GLibPatternSpecRecord.FFI.withPtr false ---> GBool.FFI.fromVal) equal_ (self & pspec2)
  end
