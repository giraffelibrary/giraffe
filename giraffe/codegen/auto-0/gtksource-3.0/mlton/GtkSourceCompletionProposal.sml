structure GtkSourceCompletionProposal :>
  GTK_SOURCE_COMPLETION_PROPOSAL
    where type 'a class_t = 'a GtkSourceCompletionProposalClass.t =
  struct
    val getType_ = _import "gtk_source_completion_proposal_get_type" : unit -> GObjectType.C.val_;
    val changed_ = _import "gtk_source_completion_proposal_changed" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;
    val equal_ = fn x1 & x2 => (_import "gtk_source_completion_proposal_equal" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.val_;) (x1, x2)
    val getIcon_ = _import "gtk_source_completion_proposal_get_icon" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val getInfo_ = _import "gtk_source_completion_proposal_get_info" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.String.notnull FFI.String.out_p;
    val getLabel_ = _import "gtk_source_completion_proposal_get_label" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.String.notnull FFI.String.out_p;
    val getMarkup_ = _import "gtk_source_completion_proposal_get_markup" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.String.notnull FFI.String.out_p;
    val getText_ = _import "gtk_source_completion_proposal_get_text" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.String.notnull FFI.String.out_p;
    val hash_ = _import "gtk_source_completion_proposal_hash" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.UInt32.val_;
    type 'a class_t = 'a GtkSourceCompletionProposalClass.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun changed self = (GObjectObjectClass.C.withPtr ---> I) changed_ self
    fun equal self other = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> FFI.Bool.fromVal) equal_ (self & other)
    fun getIcon self = (GObjectObjectClass.C.withPtr ---> GdkPixbufPixbufClass.C.fromPtr false) getIcon_ self
    fun getInfo self = (GObjectObjectClass.C.withPtr ---> FFI.String.fromPtr true) getInfo_ self
    fun getLabel self = (GObjectObjectClass.C.withPtr ---> FFI.String.fromPtr true) getLabel_ self
    fun getMarkup self = (GObjectObjectClass.C.withPtr ---> FFI.String.fromPtr true) getMarkup_ self
    fun getText self = (GObjectObjectClass.C.withPtr ---> FFI.String.fromPtr true) getText_ self
    fun hash self = (GObjectObjectClass.C.withPtr ---> FFI.UInt32.fromVal) hash_ self
    local
      open ClosureMarshal Signal
    in
      fun changedSig f = signal "changed" (void ---> ret_void) f
    end
  end
