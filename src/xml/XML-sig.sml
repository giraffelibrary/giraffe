(* Simplified interface for reading non-enormous XML documents into
   a datatype.
   Tom Murphy VII, 2009. 
   This file only: Use and distribute freely.

   Removed parts not used by Giraffe GIR file parser.
   Phil Clayton, 2020.
*)

signature XML =
sig

  exception XML of string

  (* name and value *)
  type attribute = string * string
  (* tag name, attributes *)
  type tag = string * attribute list

  datatype tree = 
      Text of string
    | Elem of tag * tree list

  (* Parses a file on disk, returning the (normalized) tree or raising
     the exception XML. *)
  val parsefile : string -> tree

  (* Get the first attribute matching the given name, or NONE
     if none match. *)
  val getattr : attribute list -> string -> string option

end
