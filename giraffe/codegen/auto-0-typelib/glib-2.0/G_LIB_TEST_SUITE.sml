signature G_LIB_TEST_SUITE =
  sig
    type t
    type test_case_t
    val add :
      t
       -> test_case_t
       -> unit
    val addSuite :
      t
       -> t
       -> unit
  end
