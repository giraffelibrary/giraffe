
open NameFormat;

toLCC "some" = "some";
toLCC "Some" = "some";
toLCC "SOME" = "some";
toLCC "sometest" = "sometest";
toLCC "someTest" = "someTest";
toLCC "SomeTest" = "someTest";
toLCC "SOMETEST" = "sometest";
toLCC "some_test" = "someTest";
toLCC "some_Test" = "someTest";
toLCC "Some_Test" = "someTest";
toLCC "SOME_TEST" = "someTest";
toLCC "_some_test_" = "someTest";
toLCC "_some_Test_" = "someTest";
toLCC "_Some_Test_" = "someTest";
toLCC "_SOME_TEST_" = "someTest";
toLCC "Some_Test_NAME" = "someTestName";

toUCC "some" = "Some";
toUCC "Some" = "Some";
toUCC "SOME" = "Some";
toUCC "sometest" = "Sometest";
toUCC "someTest" = "SomeTest";
toUCC "SomeTest" = "SomeTest";
toUCC "SOMETEST" = "Sometest";
toUCC "some_test" = "SomeTest";
toUCC "some_Test" = "SomeTest";
toUCC "Some_Test" = "SomeTest";
toUCC "SOME_TEST" = "SomeTest";
toUCC "_some_test_" = "SomeTest";
toUCC "_some_Test_" = "SomeTest";
toUCC "_Some_Test_" = "SomeTest";
toUCC "_SOME_TEST_" = "SomeTest";
toUCC "Some_Test_NAME" = "SomeTestName";

toLC "some" = "some";
toLC "Some" = "some";
toLC "SOME" = "some";
toLC "sometest" = "sometest";
toLC "someTest" = "sometest";
toLC "SomeTest" = "sometest";
toLC "SOMETEST" = "sometest";
toLC "some_test" = "sometest";
toLC "some_Test" = "sometest";
toLC "Some_Test" = "sometest";
toLC "SOME_TEST" = "sometest";
toLC "_some_test_" = "sometest";
toLC "_some_Test_" = "sometest";
toLC "_Some_Test_" = "sometest";
toLC "_SOME_TEST_" = "sometest";
toLC "Some_Test_NAME" = "sometestname";

toUC "some" = "SOME";
toUC "Some" = "SOME";
toUC "SOME" = "SOME";
toUC "sometest" = "SOMETEST";
toUC "someTest" = "SOMETEST";
toUC "SomeTest" = "SOMETEST";
toUC "SOMETEST" = "SOMETEST";
toUC "some_test" = "SOMETEST";
toUC "some_Test" = "SOMETEST";
toUC "Some_Test" = "SOMETEST";
toUC "SOME_TEST" = "SOMETEST";
toUC "_some_test_" = "SOMETEST";
toUC "_some_Test_" = "SOMETEST";
toUC "_Some_Test_" = "SOMETEST";
toUC "_SOME_TEST_" = "SOMETEST";
toUC "Some_Test_NAME" = "SOMETESTNAME";

toLCU "some" = "some";
toLCU "Some" = "some";
toLCU "SOME" = "some";
toLCU "sometest" = "sometest";
toLCU "someTest" = "some_test";
toLCU "SomeTest" = "some_test";
toLCU "SOMETEST" = "sometest";
toLCU "some_test" = "some_test";
toLCU "some_Test" = "some_test";
toLCU "Some_Test" = "some_test";
toLCU "SOME_TEST" = "some_test";
toLCU "_some_test_" = "some_test";
toLCU "_some_Test_" = "some_test";
toLCU "_Some_Test_" = "some_test";
toLCU "_SOME_TEST_" = "some_test";
toLCU "Some_Test_NAME" = "some_test_name";

toUCU "some" = "SOME";
toUCU "Some" = "SOME";
toUCU "SOME" = "SOME";
toUCU "sometest" = "SOMETEST";
toUCU "someTest" = "SOME_TEST";
toUCU "SomeTest" = "SOME_TEST";
toUCU "SOMETEST" = "SOMETEST";
toUCU "some_test" = "SOME_TEST";
toUCU "some_Test" = "SOME_TEST";
toUCU "Some_Test" = "SOME_TEST";
toUCU "SOME_TEST" = "SOME_TEST";
toUCU "_some_test_" = "SOME_TEST";
toUCU "_some_Test_" = "SOME_TEST";
toUCU "_Some_Test_" = "SOME_TEST";
toUCU "_SOME_TEST_" = "SOME_TEST";
toUCU "Some_Test_NAME" = "SOME_TEST_NAME";













local
  fun aux1 xys (x, ys) = foldl (fn (y, xys) => (x, y) :: xys) xys ys
  fun aux2 xys (xs, ys) =
    case (xs, ys) of
      (_,        []) => xys
    | ([],       _)  => xys
    | (x :: xs', ys) => aux2 (aux1 xys (x, ys)) (xs', ys)
in
  fun cross x = rev (aux2 [] x)
end

fun crossFuns x = map (fn ((a, f), (b, g)) => ((a, b), (f, g))) (cross x);



fun idemTest toX s =
  let
    val x = toX s
  in
    toX x = x
  end

fun inverseTest (toX, toY) s =
  let
    val x = toX s
  in
    toX (toY x) = x
  end
;



val fmtFuns = [
  ("toLCC", toLCC),
  ("toUCC", toUCC),
  ("toLC",  toLC),
  ("toUC",  toUC),
  ("toLCU", toLCU),
  ("toUCU", toUCU)
];

val invFmtFuns = [
  ("toLCC", toLCC),
  ("toUCC", toUCC),
  ("toLCU", toLCU),
  ("toUCU", toUCU)
];

val testVals = [
  "some",
  "Some",
  "SOME",
  "sometest",
  "someTest",
  "SomeTest",
  "SOMETEST",
  "some_test",
  "some_Test",
  "Some_Test",
  "SOME_TEST",
  "_some_test_",
  "_some_Test_",
  "_Some_Test_",
  "_SOME_TEST_",
  "Some_Test_NAME",
  "some1",
  "Some1",
  "SOME1",
  "sometest1",
  "someTest1",
  "SomeTest1",
  "SOMETEST1",
  "some_test1",
  "some_Test1",
  "Some_Test1",
  "SOME_TEST1",
  "_some_test1_",
  "_some_Test1_",
  "_Some_Test1_",
  "_SOME_TEST1_",
  "Some_Test1_NAME",
  "some1x",
  "Some1x",
  "SOME1x",
  "sometest1x",
  "someTest1x",
  "SomeTest1x",
  "SOMETEST1x",
  "some_test1x",
  "some_Test1x",
  "Some_Test1x",
  "SOME_TEST1x",
  "_some_test1x_",
  "_some_Test1x_",
  "_Some_Test1x_",
  "_SOME_TEST1x_",
  "Some_Test1x_NAME",
  "some1X",
  "Some1X",
  "SOME1X",
  "sometest1X",
  "someTest1X",
  "SomeTest1X",
  "SOMETEST1X",
  "some_test1X",
  "some_Test1X",
  "Some_Test1X",
  "SOME_TEST1X",
  "_some_test1X_",
  "_some_Test1X_",
  "_Some_Test1X_",
  "_SOME_TEST1X_",
  "Some_Test1X_NAME",
  "some@1",
  "Some@1",
  "SOME@1",
  "sometest@1",
  "someTest@1",
  "SomeTest@1",
  "SOMETEST@1",
  "some_test@1",
  "some_Test@1",
  "Some_Test@1",
  "SOME_TEST@1",
  "_some_test@1_",
  "_some_Test@1_",
  "_Some_Test@1_",
  "_SOME_TEST@1_",
  "Some_Test@1_NAME",
  "1some@1",
  "1Some@1",
  "1SOME@1",
  "1sometest@1",
  "1someTest@1",
  "1SomeTest@1",
  "1SOMETEST@1",
  "1some_test@1",
  "1some_Test@1",
  "1Some_Test@1",
  "1SOME_TEST@1",
  "_1some_test@1_",
  "_1some_Test@1_",
  "_1Some_Test@1_",
  "_1SOME_TEST@1_",
  "1Some_Test@1_NAME",
  "1",
  ""
];



fun test (testName, testFun) (fmtName, fmtFun) s =
  if testFun fmtFun s
  then NONE
  else SOME (testName, fmtName, s);

val idemTestFuns = map (test ("idemTest", idemTest)) fmtFuns
val inverseTestFuns =
  map (test ("inverseTest", inverseTest)) (crossFuns (invFmtFuns, invFmtFuns));


fun run testFuns testVals =
  List.concat (map (fn f => List.mapPartial f testVals) testFuns);


run idemTestFuns testVals;
run inverseTestFuns testVals;
