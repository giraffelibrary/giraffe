structure GLibTestSuite :>
  G_LIB_TEST_SUITE
    where type t = GLibTestSuiteRecord.t
    where type test_case_t = GLibTestCaseRecord.t =
  struct
    val add_ = fn x1 & x2 => (_import "g_test_suite_add" : GLibTestSuiteRecord.FFI.non_opt GLibTestSuiteRecord.FFI.p * GLibTestCaseRecord.FFI.non_opt GLibTestCaseRecord.FFI.p -> unit;) (x1, x2)
    val addSuite_ = fn x1 & x2 => (_import "g_test_suite_add_suite" : GLibTestSuiteRecord.FFI.non_opt GLibTestSuiteRecord.FFI.p * GLibTestSuiteRecord.FFI.non_opt GLibTestSuiteRecord.FFI.p -> unit;) (x1, x2)
    type t = GLibTestSuiteRecord.t
    type test_case_t = GLibTestCaseRecord.t
    fun add self testCase = (GLibTestSuiteRecord.FFI.withPtr &&&> GLibTestCaseRecord.FFI.withPtr ---> I) add_ (self & testCase)
    fun addSuite self nestedsuite = (GLibTestSuiteRecord.FFI.withPtr &&&> GLibTestSuiteRecord.FFI.withPtr ---> I) addSuite_ (self & nestedsuite)
  end
