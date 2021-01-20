(* --------------------------------------------------------------------------
 * Configuration
 * -------------------------------------------------------------------------- *)

(* A configuration value whose data relates to particular namespace versions
 * is written as an instance of the type `'a nvs_map`, e.g.
 *
 *     [
 *       (
 *         [("GObject", "2.0")],
 *         ... : 'a
 *       ),
 *       (
 *         [("Vte", "2.90"), ("Vte", "2.91")],
 *         ... : 'a
 *       )
 *     ]
 *      : 'a nvs_map
 *)

type namespace_version = string * string
type 'a nvs_map = (namespace_version list * 'a) list


(* The common instances of `'a nvs_map` are
 *
 *   - (string * 'a) list nvs_map
 *   - string        list nvs_map
 *
 * for which functions are provided to look up a string `s` and check
 * existence of a property `p` as follows, in the namespace version given by
 * `nv`:
 *
 *   nvsLookup (nv, x : 'a)         : ('a * 'b) list nvs_map -> 'b option
 *   nvsExists (nv, p : 'a -> bool) : 'a        list nvs_map -> bool
 *
 * These functions search an instance of `'a nvs_map` in list order and,
 * for each entry, match an empty `namespace_version list` with any value.
 *)

fun findPair x (x', y) = if x = x' then SOME y else NONE

fun nvsLookup (nv, x) nvsMap =
  ListExtras.findMap (
    fn (nvs, xys) =>
      if nvs = [] orelse List.exists (fn nv' => nv = nv') nvs
      then ListExtras.findMap (findPair x) xys
      else NONE
  )
    nvsMap

fun nvsExists (nv, p) nvsMap =
  List.exists (
    fn (nvs, xs) =>
      if nvs = [] orelse List.exists (fn nv' => nv = nv') nvs
      then List.exists p xs
      else false
  )
    nvsMap


(* Interface types *)

(*   - Excluded names *)
val excludedInterfaceTypes : string list nvs_map ref = ref []
val excludedInterfaceTypePrefixes : string list nvs_map ref = ref []
val excludedInterfaceTypeSuffixes : string list nvs_map ref = ref []


(* Struct types *)

datatype value_record_funcs =
  Deep of {copy : string, clear : string}
| Flat

datatype record_funcs =
  Boxed
| NonBoxed of {dup : string, free : string}

val boxedCopySymbol = "g_boxed_copy"
val boxedFreeSymbol = "g_boxed_free"

datatype struct_type =
  ValueRecord of value_record_funcs
| Record of record_funcs
| DisguisedRecord
| UnionRecord of string * string * string

val structTypes : (string * struct_type) list nvs_map ref = ref []


(* Union types *)

val includedUnionNames : string list nvs_map ref = ref []


(* Function names *)

(*   - Excluded symbols *)
val excludedFunctionSymbols : string list nvs_map ref = ref []
val excludedFunctionSymbolPrefixes : string list nvs_map ref = ref []
val excludedFunctionSymbolSuffixes : string list nvs_map ref = ref []

(*   - Systematically formed names that do not belong in the user API *)
val nonUserFunctionNames : string list ref = ref []


(* Fields *)

(*   - Included names *)
val includedClassFieldNames   : string list nvs_map ref = ref []

(*   - Excluded names *)
val excludedFieldNames        : string list nvs_map ref = ref []
val excludedFieldNamePrefixes : string list nvs_map ref = ref []
val excludedFieldNameSuffixes : string list nvs_map ref = ref []

(*   - Non-optional pointer fields *)
val nonOptionalPointerFields  : (string * string) list nvs_map ref = ref []


(* Constant names *)

(*   - Excluded names *)
val excludedConstantNames : string list nvs_map ref = ref []
val excludedConstantNamePrefixes : string list nvs_map ref = ref []
val excludedConstantNameSuffixes : string list nvs_map ref = ref []


(* Flags/enum value names *)

(*   - Transformed names *)
val newFlagsEnumValueNames : (string * string) list ref = ref []
