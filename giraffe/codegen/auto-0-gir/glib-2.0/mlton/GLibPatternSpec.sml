structure GLibPatternSpec :>
  G_LIB_PATTERN_SPEC
    where type t = GLibPatternSpecRecord.t =
  struct
    val equal_ = fn x1 & x2 => (_import "g_pattern_spec_equal" : GLibPatternSpecRecord.FFI.notnull GLibPatternSpecRecord.FFI.p * GLibPatternSpecRecord.FFI.notnull GLibPatternSpecRecord.FFI.p -> GBool.FFI.val_;) (x1, x2)
    type t = GLibPatternSpecRecord.t
    fun equal self pspec2 = (GLibPatternSpecRecord.FFI.withPtr &&&> GLibPatternSpecRecord.FFI.withPtr ---> GBool.FFI.fromVal) equal_ (self & pspec2)
  end
