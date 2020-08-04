structure GLibTestSuite :>
  G_LIB_TEST_SUITE
    where type t = GLibTestSuiteRecord.t
    where type test_case_t = GLibTestCaseRecord.t =
  struct
    local
      open PolyMLFFI
    in
      val add_ = call (getSymbol "g_test_suite_add") (GLibTestSuiteRecord.PolyML.cPtr &&> GLibTestCaseRecord.PolyML.cPtr --> cVoid)
      val addSuite_ = call (getSymbol "g_test_suite_add_suite") (GLibTestSuiteRecord.PolyML.cPtr &&> GLibTestSuiteRecord.PolyML.cPtr --> cVoid)
    end
    type t = GLibTestSuiteRecord.t
    type test_case_t = GLibTestCaseRecord.t
    fun add self testCase = (GLibTestSuiteRecord.FFI.withPtr false &&&> GLibTestCaseRecord.FFI.withPtr false ---> I) add_ (self & testCase)
    fun addSuite self nestedsuite = (GLibTestSuiteRecord.FFI.withPtr false &&&> GLibTestSuiteRecord.FFI.withPtr false ---> I) addSuite_ (self & nestedsuite)
  end
