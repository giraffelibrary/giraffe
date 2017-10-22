structure GLibPatternSpecRecord :> G_LIB_PATTERN_SPEC_RECORD =
  struct
    structure Record =
      PointerRecord(
        val name = "GLib.PatternSpec"
      )
    open Record
  end
