structure GtkSourceCompletionProposalClass :>
  GTK_SOURCE_COMPLETION_PROPOSAL_CLASS
    where type C.opt = GObjectObjectClass.C.opt
    where type C.non_opt = GObjectObjectClass.C.non_opt
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a completion_proposal = unit
    type 'a class = 'a completion_proposal class
  end
