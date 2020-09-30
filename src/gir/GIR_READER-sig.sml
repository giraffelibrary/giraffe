signature GIR_READER =
  sig
    type gir_abstract_syntax_tree

    (**
     * `readRepo path (namespace, version)` searches the directories in
     * `path` in oredr for the file <namespace>-<version>.gir and returns the
     * GIR abstract syntax tree for the first matching file.
     *)
    val readRepo :
      unit ListDict.t -> string * string -> gir_abstract_syntax_tree
  end
