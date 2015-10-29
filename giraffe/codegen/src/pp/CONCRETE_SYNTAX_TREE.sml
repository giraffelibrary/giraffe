(*
 * Based on
 *
 *   http://www.cse.buffalo.edu/~regan/cse305/MLBNF.pdf
 *
 * downloaded on 2010-03-210.  The syntax described in this document is too
 * restrictive in several respects.
 *
 *
 * Limitations
 *
 * Multiple semicolons cannot be represented.
 * For example, it cannot represent
 *
 *   val x = e;;
 *
 * Type variable names starting with an underscore, e.g. '_a, cannot
 * be represented.
 *
 *
 * Extensions
 *
 * withtype is allowed on datatype specifications in signatures
 *
 *
 * Not yet implemented
 *
 * Declarations
 *   - infix function bindings
 * Expressions
 *   - records
 *   - while
 *)

signature CONCRETE_SYNTAX_TREE =
  sig

    type 'a list1 = 'a * 'a list



    (* ---- Identifiers and literals ---- *)

    type alphid = string                (* ALPHID *)
    type id = string                    (* ID *)
    type label = string                 (* LABEL *)

    type tyvar = bool *  alphid         (* TVAR *)


    type infixop = id                   (* INFIXFN *)

    datatype name =                     (* no equivalent *)
      NameId of id
    | NameOp of infixop

    type lid = id list1                 (* LID *)

    datatype lname =                    (* PREFIXFN *)
      LNameId of lid
    | LNameOp of infixop


    datatype const =                    (* CONST *)
      ConstInt of IntInf.int * IntInf.int option
    | ConstWord of IntInf.int * IntInf.int option
    | ConstReal of IntInf.int * IntInf.int * IntInf.int option
    | ConstChar of char
    | ConstString of string
    | ConstUnit           (* () *)
    | ConstLName of lname (* constructors and exceptions: *)
                          (* includes MONOCON and MONOEXN *)



    (* ---- Types ---- *)

    (* `ty` represents TYPE.
     *)

    datatype ty =
      TyVar of tyvar
    | TyRef of ty list * lid
    | TyProd of ty * ty list1
    | TyFun of ty * ty
    | TyRec of (label * ty) list
    | TyParen of ty



    (* ---- Patterns ---- *)

    (* `apat` represents APAT.
     *)

    datatype apat =
      APatU                       (* underscore *)
    | APatVar of name             (* variable *)
    | APatConst of const          (* literal value or constructor *)
    | APatParen of pat list1      (* parenthesized or tuple pattern *)
    | APatList of pat list        (* list pattern *)
    | APatRec of fpat list        (* record pattern *)


    (* `fpat` represents FPAT.
     *)

    and fpat =
      FPatEq of label * pat
    | FPatAs of id * pat option


    (* `pat` represents PAT.
     *)

    and pat =
      PatA of apat                (* atomic pattern *)
    | PatPrefix of lid * pat      (* prefix constructor *)
    | PatInfix of pat * id * pat  (* infix constructor *)
    | PatTy of pat * ty           (* typed pattern *)
    | PatVarAs of name * pat      (* variable as pattern *)



    (* ---- Declarations ---- *)

    (* `tyvars` represents [TVARS].
     *)

    type tyvars = tyvar list


    (* `tyname` represents [TVARS] ID.
     * `tylname` represents [TVARS] LID.
     *)

    type tyname = tyvars * id
    type tylname = tyvars * lid


    (* `datatypebinds` represents DTBIND {and DTBIND}.
     * `typebinds` represents TBINDS.
     *)

    type typebinds = (tyname * ty) list1
    type datatypebinds = (tyname * (name * ty option) list1) list1


    (* `funbind` represents FBIND extended
     *   - to allow an optional result type
     *   - for infix operators
     *)

    datatype funhead =
      FunHeadPrefix of name * apat list1
    | FunHeadInfixPar  (* infix functions not yet supported *)
    | FunHeadInfix     (* infix functions not yet supported *)

    type 'exp funbind = (funhead * ty option * 'exp) list1


    (* `dec` represents DEC.
     * `decs` represents {DEC[;]}.
     *)

    type typedec = typebinds

    type datatypedec = datatypebinds * typebinds option

    type eqdatatypedec = id * lid

    datatype exndectype =
      ExnDecTypeOf of ty option
    | ExnDecTypeEq of lname
    type exndec = (name * exndectype) list1

    datatype dec =
      DecVal of valdec
    | DecFun of fundec
    | DecType of typedec
    | DecDatatype of datatypedec
    | DecDatatypeEq of eqdatatypedec
    | DecAbstype  (* not yet supported *)
    | DecExn of exndec
    | DecLocal of decs * decs
    | DecOpen of lid list1
    | DecInfix  (* not yet supported *)
    | DecNonfix  (* not yet supported *)



    (* ---- Expressions ---- *)

    (* `exp` represents EXP.
     *)

    and exp =
      ExpLName of lname
    | ExpConst of const              (* (scalar) literal value or constructor *)
    | ExpTy of exp * ty              (* typed *)
    | ExpParen of exp list1          (* parenthesized expression or tuple literal *)
    | ExpList of exp list            (* list literal *)
    | ExpRec of (label * exp) list   (* record literal *)
    | ExpLabel of label              (* record field accessor *)
    | ExpSeq of exp * exp list1      (* sequence *)
    | ExpLet of decs * exp list1     (* let *)
    | ExpApp of exp * exp            (* function application *)
    | ExpInfixApp of exp * id * exp  (* infix function application *)
    | ExpLogOp of exp * logop * exp  (* short-circuit logical operator (AND/OR) *)
    | ExpHandle of exp * match       (* exception handler *)
    | ExpRaise of exp                (* raise exception *)
    | ExpCond of exp * exp * exp     (* conditional *)
    | ExpWhile  (* not yet supported *)
    | ExpCase of exp * match         (* case *)
    | ExpFn of match                 (* anonymous function *)
    | ExpMLtonImport of string * ty  (* MLton FFI import *)

    and logop =
      LogOpAndAlso
    | LogOpOrElse



    (* ---- Matches ---- *)

    (* `match` represents MATCH. *)

    withtype match = (pat * exp) list1



    (* ---- Declarations (continued) ---- *)

    and decs = (dec * bool) list

    and valdec = (tyvars * bool * pat * exp) list1

    and fundec = tyvars * exp funbind list1



    (* ---- Modules ---- *)

    (* Using withtype in signatures
     *
     * For strict SML97, we would define
     *
     *   type datatypespec = datatypebinds
     *
     * However, as many implementations accept a withtype clause on a
     * datatype specification (in a signature), we allow this in the
     * concrete syntax by defining instead
     *
     *   type datatypespec = datatypedec
     * 
     * See http://successor-ml.org/index.php?title=Withtype_in_signatures
     *)
    type valspec = (id * ty) list1
    type typespec = bool * (tyname * ty option) list1
    type datatypespec = datatypedec
    type eqdatatypespec = eqdatatypedec
    type exnspec = (id * ty option) list1


    (* `qual` represents QUAL .
     *)

    type qual = (tylname * ty) list1


    (* `sig1`  represents SIG .
     * `spec`  represents SPEC .
     * `specs` represents {SPEC[;]} .
     * `qsig`  represents SIG {QUAL} .
     *
     * Note that the syntax is modified to replace
     *
     *   SIG [QUAL] 
     * 
     * by
     * 
     *   SIG {QUAL}
     *
     * to allow the representation of
     *
     *   SIG
     *     where type t1 = ...
     *     where type t2 = ...
     *
     * Note that
     *
     *   include ID {ID}
     *
     * is an extension to SML that is supported by many compilers
     * and is supported here.  The definition of SML gives the
     * equivalent of
     *
     *   include SIG {QUAL}
     *)

    datatype sig1 =
      SigSpec of specs
    | SigName of id

    and spec =
      SpecVal of valspec
    | SpecType of typespec
    | SpecDatatype of datatypespec
    | SpecDatatypeEq of eqdatatypespec
    | SpecExn of exnspec
    | SpecStruct of structspec
    | SpecSharing of bool * lid * lid list1
    | SpecInclList of id list1
    | SpecIncl of qsig

    withtype structspec = (id * (sig1 * qual list)) list1
                     (* = (id * qsig) list1 *)

    and specs = (spec * bool) list

    and qsig = sig1 * qual list


    (* `strdec` represents STRDEC.
     * `strdecs` represents {STRDEC[;]}.
     * `struct1` represents STRUCT.
     *)

    datatype strdec =
      StrDecDec of dec
    | StrDecLocal of strdecs * strdecs
    | StrDecStruct of structdec

    and struct1 =
      StructBody of strdecs
    | StructInst of id * funarg
    | StructName of lid

    and funarg =
      FunArgStrDec of strdecs
    | FunArgStruct of struct1

    withtype structdec = (id * (bool * qsig) option * struct1) list1

    and strdecs = (strdec * bool) list


    (* `sigdec` represents SIGDEC.
     *)

    type sigdec = (id * qsig) list1


    (* `functdec` represents FUNCTDEC.
     *
     * `functparam` represents [ID : SIG | SPECS].
     *)

    datatype functparam =
      FunctParamSig of id * qsig
    | FunctParamSpec of specs

    type functdec = (id * functparam * (bool * qsig) option * struct1) list1


    (* `module` represents MODULE.
     *)

    datatype module =
      ModuleDecStr of strdec
    | ModuleDecSig of sigdec
    | ModuleDecFunct of functdec


    (* For the top level
     *
     *   PGM ::= EXP; | {DEC | MODULE | ;}
     *
     * is changed to
     *
     *   PGM ::= {EXP; | DEC[;] | MODULE[;]}
     *
     * `topleveldec` represents
     *
     *   EXP; | DEC[;] | MODULE[;]
     *
     *)

    datatype topleveldec =
      TopLevelDecExp    of exp
    | TopLevelDecDec    of dec * bool
    | TopLevelDecModule of module * bool

    type program = topleveldec list
  end
