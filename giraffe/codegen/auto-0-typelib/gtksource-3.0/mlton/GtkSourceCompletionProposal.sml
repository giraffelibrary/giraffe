structure GtkSourceCompletionProposal :>
  GTK_SOURCE_COMPLETION_PROPOSAL
    where type 'a class = 'a GtkSourceCompletionProposalClass.class =
  struct
    val getType_ = _import "gtk_source_completion_proposal_get_type" : unit -> GObjectType.FFI.val_;
    val changed_ = _import "gtk_source_completion_proposal_changed" : GtkSourceCompletionProposalClass.FFI.notnull GtkSourceCompletionProposalClass.FFI.p -> unit;
    val equal_ = fn x1 & x2 => (_import "gtk_source_completion_proposal_equal" : GtkSourceCompletionProposalClass.FFI.notnull GtkSourceCompletionProposalClass.FFI.p * GtkSourceCompletionProposalClass.FFI.notnull GtkSourceCompletionProposalClass.FFI.p -> GBool.FFI.val_;) (x1, x2)
    val getGicon_ = _import "gtk_source_completion_proposal_get_gicon" : GtkSourceCompletionProposalClass.FFI.notnull GtkSourceCompletionProposalClass.FFI.p -> unit GioIconClass.FFI.p;
    val getIcon_ = _import "gtk_source_completion_proposal_get_icon" : GtkSourceCompletionProposalClass.FFI.notnull GtkSourceCompletionProposalClass.FFI.p -> unit GdkPixbufPixbufClass.FFI.p;
    val getIconName_ = _import "gtk_source_completion_proposal_get_icon_name" : GtkSourceCompletionProposalClass.FFI.notnull GtkSourceCompletionProposalClass.FFI.p -> unit Utf8.FFI.out_p;
    val getInfo_ = _import "gtk_source_completion_proposal_get_info" : GtkSourceCompletionProposalClass.FFI.notnull GtkSourceCompletionProposalClass.FFI.p -> unit Utf8.FFI.out_p;
    val getLabel_ = _import "gtk_source_completion_proposal_get_label" : GtkSourceCompletionProposalClass.FFI.notnull GtkSourceCompletionProposalClass.FFI.p -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val getMarkup_ = _import "gtk_source_completion_proposal_get_markup" : GtkSourceCompletionProposalClass.FFI.notnull GtkSourceCompletionProposalClass.FFI.p -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val getText_ = _import "gtk_source_completion_proposal_get_text" : GtkSourceCompletionProposalClass.FFI.notnull GtkSourceCompletionProposalClass.FFI.p -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val hash_ = _import "gtk_source_completion_proposal_hash" : GtkSourceCompletionProposalClass.FFI.notnull GtkSourceCompletionProposalClass.FFI.p -> GUInt32.FFI.val_;
    type 'a class = 'a GtkSourceCompletionProposalClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun changed self = (GtkSourceCompletionProposalClass.FFI.withPtr ---> I) changed_ self
    fun equal self other = (GtkSourceCompletionProposalClass.FFI.withPtr &&&> GtkSourceCompletionProposalClass.FFI.withPtr ---> GBool.FFI.fromVal) equal_ (self & other)
    fun getGicon self = (GtkSourceCompletionProposalClass.FFI.withPtr ---> GioIconClass.FFI.fromOptPtr false) getGicon_ self
    fun getIcon self = (GtkSourceCompletionProposalClass.FFI.withPtr ---> GdkPixbufPixbufClass.FFI.fromOptPtr false) getIcon_ self
    fun getIconName self = (GtkSourceCompletionProposalClass.FFI.withPtr ---> Utf8.FFI.fromOptPtr 0) getIconName_ self
    fun getInfo self = (GtkSourceCompletionProposalClass.FFI.withPtr ---> Utf8.FFI.fromOptPtr 1) getInfo_ self
    fun getLabel self = (GtkSourceCompletionProposalClass.FFI.withPtr ---> Utf8.FFI.fromPtr 1) getLabel_ self
    fun getMarkup self = (GtkSourceCompletionProposalClass.FFI.withPtr ---> Utf8.FFI.fromPtr 1) getMarkup_ self
    fun getText self = (GtkSourceCompletionProposalClass.FFI.withPtr ---> Utf8.FFI.fromPtr 1) getText_ self
    fun hash self = (GtkSourceCompletionProposalClass.FFI.withPtr ---> GUInt32.FFI.fromVal) hash_ self
    local
      open ClosureMarshal Signal
    in
      fun changedSig f = signal "changed" (void ---> ret_void) f
    end
  end
