(*
 * This module implements a `horizontal-vertical' pretty printing algorithm.
 * The general idea is that text is formatted horizontally where possibly
 * but certain program language constructs force text to be formatted
 * vertically.
 *
 * Indentation is not dependent on a specified page width, it is dependent on
 * the structure of program, thus it is theoretically possible to have
 * arbitrarily long lines.
 *
 * Furthermore, the implementation chooses line breaks with the aim of having
 * the property that indentation is not dependent on the length of any
 * identifier.
 *
 *)
signature PRETTY_PRINT =
  sig
    structure CST : CONCRETE_SYNTAX_TREE

    type h
    type v
    type t

    val fmtConst : CST.const -> h

    val fmtTy : h -> CST.ty -> t
    val fmtPat : h -> CST.pat -> t
    val fmtExp : h -> CST.exp -> t

    val fmtDec : h -> CST.dec -> v
    val fmtSpec : h -> CST.spec -> v
    val fmtStructDec : h -> CST.structdec -> v
    val fmtStrDec : h -> CST.strdec -> v
    val fmtSigDec : h -> CST.sigdec -> v
    val fmtFunctDec : h -> CST.functdec -> v
    val fmtModule : h -> CST.module -> v
    val fmtTopLevelDec : CST.topleveldec -> v
    val fmtProgram : CST.program -> v
  end
