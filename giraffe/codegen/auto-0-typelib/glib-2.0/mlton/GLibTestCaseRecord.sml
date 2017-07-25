structure GLibTestCaseRecord :> G_LIB_TEST_CASE_RECORD =
  struct
    structure Record =
      PointerRecord(
        val name = "GLib.TestCase"
      )
    open Record
  end
