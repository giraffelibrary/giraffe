structure GtkSourceCompletionProposal :>
  GTK_SOURCE_COMPLETION_PROPOSAL
    where type 'a class = 'a GtkSourceCompletionProposalClass.class =
  struct
    val getType_ = _import "gtk_source_completion_proposal_get_type" : unit -> GObjectType.C.val_;
    val changed_ = _import "gtk_source_completion_proposal_changed" : GtkSourceCompletionProposalClass.C.notnull GtkSourceCompletionProposalClass.C.p -> unit;
    val equal_ = fn x1 & x2 => (_import "gtk_source_completion_proposal_equal" : GtkSourceCompletionProposalClass.C.notnull GtkSourceCompletionProposalClass.C.p * GtkSourceCompletionProposalClass.C.notnull GtkSourceCompletionProposalClass.C.p -> FFI.Bool.C.val_;) (x1, x2)
    val getIcon_ = _import "gtk_source_completion_proposal_get_icon" : GtkSourceCompletionProposalClass.C.notnull GtkSourceCompletionProposalClass.C.p -> GdkPixbufPixbufClass.C.notnull GdkPixbufPixbufClass.C.p;
    val getInfo_ = _import "gtk_source_completion_proposal_get_info" : GtkSourceCompletionProposalClass.C.notnull GtkSourceCompletionProposalClass.C.p -> Utf8.C.notnull Utf8.C.out_p;
    val getLabel_ = _import "gtk_source_completion_proposal_get_label" : GtkSourceCompletionProposalClass.C.notnull GtkSourceCompletionProposalClass.C.p -> Utf8.C.notnull Utf8.C.out_p;
    val getMarkup_ = _import "gtk_source_completion_proposal_get_markup" : GtkSourceCompletionProposalClass.C.notnull GtkSourceCompletionProposalClass.C.p -> Utf8.C.notnull Utf8.C.out_p;
    val getText_ = _import "gtk_source_completion_proposal_get_text" : GtkSourceCompletionProposalClass.C.notnull GtkSourceCompletionProposalClass.C.p -> Utf8.C.notnull Utf8.C.out_p;
    val hash_ = _import "gtk_source_completion_proposal_hash" : GtkSourceCompletionProposalClass.C.notnull GtkSourceCompletionProposalClass.C.p -> FFI.UInt.C.val_;
    type 'a class = 'a GtkSourceCompletionProposalClass.class
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun changed self = (GtkSourceCompletionProposalClass.C.withPtr ---> I) changed_ self
    fun equal self other = (GtkSourceCompletionProposalClass.C.withPtr &&&> GtkSourceCompletionProposalClass.C.withPtr ---> FFI.Bool.C.fromVal) equal_ (self & other)
    fun getIcon self = (GtkSourceCompletionProposalClass.C.withPtr ---> GdkPixbufPixbufClass.C.fromPtr false) getIcon_ self
    fun getInfo self = (GtkSourceCompletionProposalClass.C.withPtr ---> Utf8.C.fromPtr true) getInfo_ self
    fun getLabel self = (GtkSourceCompletionProposalClass.C.withPtr ---> Utf8.C.fromPtr true) getLabel_ self
    fun getMarkup self = (GtkSourceCompletionProposalClass.C.withPtr ---> Utf8.C.fromPtr true) getMarkup_ self
    fun getText self = (GtkSourceCompletionProposalClass.C.withPtr ---> Utf8.C.fromPtr true) getText_ self
    fun hash self = (GtkSourceCompletionProposalClass.C.withPtr ---> FFI.UInt.C.fromVal) hash_ self
    local
      open ClosureMarshal Signal
    in
      fun changedSig f = signal "changed" (void ---> ret_void) f
    end
  end
