(* Overview of formats
 *
 * Abbreviations
 *
 *   LC  - Lower Case
 *   UC  - Upper Case
 *   LCC - Lower Case Camel/Capital
 *   UCC - Upper Case Camel/Capital
 *   LCU - Lower Case Underscore
 *   UCU - Upper Case Underscore
 *
 *
 * Format descriptions
 *
 *   LC
 *     All alphabetic characters are lower case.
 *     Contains no underscore characters.
 *     E.g. "somename", "test1a".
 *
 *   UC
 *     All alphabetic characters are upper case.
 *     Contains no underscore characters.
 *     E.g. "SOMENAME", "TEST1A".
 *
 *   LCC
 *     First character is lower case if alphabetic.
 *     Field started by
 *       - first character in name,
 *       - uppercase (alphabetic) character or
 *       - non-alphabetic character following alphabetic character.
 *     Field ended by
 *       - start of next field
 *       - end of name
 *     Contains no underscore characters.
 *     E.g. "someName", "test1a", "test1A".
 *
 *   UCC
 *     First character is upper case if alphabetic.
 *     Field started by
 *       - first character in name,
 *       - uppercase (alphabetic) character or
 *       - non-alphabetic character following alphabetic character.
 *     Field ended by
 *       - start of next field
 *       - end of name
 *     Contains no underscore characters.
 *     E.g. "SomeName", "Test1a", "Test1A".
 *
 *   LCU
 *     All alphabetic characters are lower case.
 *     Fields are non-empty sequences of characters between underscores.
 *     Contains no non-alphabetic character following an alphabetic
 *     character.  (A non-alphabetic character must be preceded by
 *     another non-alphabetic character, an underscore or be the
 *     first character.)
 *     E.g. "some_name", "test_1a", "test_1_a".
 *
 *   UCU
 *     All alphabetic characters are upper case.
 *     Fields are non-empty sequences of characters between underscores.
 *     Contains no non-alphabetic character following an alphabetic
 *     character.  (A non-alphabetic character must be preceded by
 *     another non-alphabetic character, an underscore or be the
 *     first character.)
 *     E.g. "SOME_NAME", "TEST_1A", "TEST_1_A".
 *)

signature NAME_FORMAT =
  sig
    (* `toLCC s`
     * `toUCC s`
     * `toLC s`
     * `toUC s`
     * `toLCU s`
     * `toUCU s`
     *   `to<X> s` transforms name `s` to the format <X>.
     *
     *   Each breaks `s` into fields using a common algorithm described
     *   below.  Then fields are formatted and concatenated with a separator
     *   as follows:
     *
     *           first field     subsequent field    separator
     *
     *   toLCC   LL              UL                  ""
     *   toUCC   UL              UL                  ""
     *   toLC    LL              LL                  ""
     *   toUC    UU              UU                  ""
     *   toLCU   LL              LL                  "_"
     *   toUCU   UU              UU                  "_"
     *
     *     where
     *       LL converts all to lowercase
     *       UL converts first to uppercase and subsequent to lowercase
     *       UU converts all to uppercase
     *
     *   Characters that are not alphabetic or underscores pass through
     *   unchanged.
     *
     *
     * Fields
     *
     * The algorithm for breaking a name `s` into fields works for input
     * in LCC, UCC, LCU or UCU format.  It is as follows:
     *
     *   1.  Break `s` into the underscore-separated fields, ignoring
     *       leading, trailing and multiple underscores.  (The required
     *       behaviour is as provided by `tokens` rather than `fields`
     *       in the SML Basis Library.)
     *
     * For each field `t` returned by step 1, break `t` into fields as
     * described in step 2.  Step 2 is parameterized by the flag `isCC`
     * that indicates whether a field should be interpreted as camel-case,
     * i.e. whether an uppercase letter should start a new field.
     * `isCC` is true iff exactly one field is returned by step 1 that
     * does not contain only uppercase letters.
     *
     *   2.  Break `t` into fields where a field is terminated by any of
     *         - an uppercase character iff `isCC`
     *         - a non-alphabetic character following an alphabetic character
     *         - the end of the string
     *
     * In defining `isCC` the purpose of checking whether every character is
     * an uppercase letter is to resolve the ambuguity with a name containing
     * only uppercase letters, e.g. "ABC": is this
     *   A. a UCU name with one field "ABC" or
     *   B. a UCC name with three fields, "A", "B", "C"?
     * The check ensures case A is chosen so we assume that names never
     * consist of fields that are only single letters.
     *
     * Although a formatting function performs no validation on its argument,
     * the result is still guaranteed to be a valid value of the target
     * format.
     *
     * Transformation with `toLCC`, `toUCC`, `toLCU` or `toUCU` is guaranteed
     * to be reversible only if the argument is a valid LCC, UCC, LCU or UCU
     * value, i.e. a value returned by one of these formatting functions.
     * Transformation with LC or UC is not guaranteed to be reversible.
     *
     * Transformations are idempotent.
     *)
    val toLCC : string -> string
    val toUCC : string -> string
    val toLC  : string -> string
    val toUC  : string -> string
    val toLCU : string -> string
    val toUCU : string -> string
  end
