structure GLibTestSuiteRecord :> G_LIB_TEST_SUITE_RECORD =
  struct
    structure Record =
      PointerRecord(
        val name = "GLib.TestSuite"
      )
    open Record
  end
