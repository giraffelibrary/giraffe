(* --------------------------------------------------------------------------
 * Configuration
 * -------------------------------------------------------------------------- *)

type namespace_version = string * string
type 'a nvs_list = (namespace_version list * 'a) list


(* Interface types *)

(*   - Excluded names *)
val excludedInterfaceTypes : (string * string) list ref = ref []

fun checkInterfaceType interfaceInfo =
  let
    val name = getName interfaceInfo
    val namespace = BaseInfo.getNamespace interfaceInfo
    val fullName = (namespace, name)
  in
    if
      List.exists (fn x => x = fullName) (!excludedInterfaceTypes)
    then infoExcl "interface type excluded by configuration \
                                                      \(excludedInterfaceTypes)"
    else ()
  end


(* Struct types *)
	
datatype struct_type =
  ValueRecord of {copy : string, clear : string} option
| Record of {dup : string, free : string}
| DisguisedRecord

val structTypes : ((string * string) * struct_type) list ref = ref []

fun getStructType structFullName =
  case List.find (fn (x, _) => x = structFullName) (!structTypes) of
    SOME (_, y) => y 
  | NONE        => infoExcl "struct not included by configuration (structTypes)"


(* Union types *)

val unionNames : (string * string) list ref = ref []


(* Function names *)

(*   - Excluded symbols *)
val excludedFunctionSymbols : string list nvs_list ref = ref []
val excludedFunctionSymbolPrefixes : string list nvs_list ref = ref []
val excludedFunctionSymbolSuffixes : string list nvs_list ref = ref []

fun checkFunctionSymbol repo vers functionInfo =
  let
    val symbol = FunctionInfo.getSymbol functionInfo
    val namespace = BaseInfo.getNamespace functionInfo
    val version = Repository.getVersion repo vers namespace
    val nv = (namespace, version)
    fun check p =
      List.exists (
        fn (nvs, xs) =>
          List.exists (fn x => x = nv) nvs andalso List.exists p xs
      )
    fun infoExclFunctionSymbol match =
      infoExcl (concat ["function excluded by configuration (", match, ")"])
  in
    if check (fn x => x = symbol) (!excludedFunctionSymbols)
    then infoExclFunctionSymbol "excludedFunctionSymbols"
    else if
      check (fn x => String.isPrefix x symbol)
        (!excludedFunctionSymbolPrefixes)
    then
      infoExclFunctionSymbol "excludedFunctionSymbolPrefixes"
    else if
      check (fn x => String.isSuffix x symbol)
        (!excludedFunctionSymbolSuffixes)
    then
      infoExclFunctionSymbol "excludedFunctionSymbolSuffixes"
    else ()
  end

(*   - Systematically formed names that do not belong in the user API *)
val nonUserFunctionNames : string list ref = ref []

fun checkFunctionName name =
  if List.exists (fn x => x = name) (!nonUserFunctionNames)
  then
    infoExcl "non-user function excluded by configuration \
                                                        \(nonUserFunctionNames)"
  else ()


(* Constant names *)

(*   - Excluded names *)
val excludedConstantNames : string list nvs_list ref = ref []
val excludedConstantNamePrefixes : string list nvs_list ref = ref []
val excludedConstantNameSuffixes : string list nvs_list ref = ref []

fun checkConstantName repo vers constantInfo =
  let
    val name = getName constantInfo
    val namespace = BaseInfo.getNamespace constantInfo
    val version = Repository.getVersion repo vers namespace
    val nv = (namespace, version)
    fun check p =
      List.exists (
        fn (nvs, xs) =>
          List.exists (fn x => x = nv) nvs andalso List.exists p xs
      )
    fun infoExclConstantName match =
      infoExcl (concat ["constant excluded by configuration (", match, ")"])
  in
    if check (fn x => x = name) (!excludedConstantNames)
    then infoExclConstantName "excludedConstantNames"
    else if
      check (fn x => String.isPrefix x name)
        (!excludedConstantNamePrefixes)
    then
      infoExclConstantName "excludedConstantNamePrefixes"
    else if
      check (fn x => String.isSuffix x name)
        (!excludedConstantNameSuffixes)
    then
      infoExclConstantName "excludedConstantNameSuffixes"
    else ()
  end


(* Flags/enum value names *)

(*   - Transformed names *)
val newFlagsEnumValueNames : (string * string) list ref = ref []

fun fixFlagsEnumValueName name =
  case List.find (fn (x, _) => x = name) (!newFlagsEnumValueNames) of
    SOME (_, name') => name'
  | NONE            => name
