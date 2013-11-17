structure GtkSourceCompletionProposalClass :>
  GTK_SOURCE_COMPLETION_PROPOSAL_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    type 'a completionproposal = unit
    type 'a t = 'a completionproposal GObjectObjectClass.t
    fun toBase obj = obj
    val t = GObjectObjectClass.t
    val tOpt = GObjectObjectClass.tOpt
    structure C = GObjectObjectClass.C
  end
