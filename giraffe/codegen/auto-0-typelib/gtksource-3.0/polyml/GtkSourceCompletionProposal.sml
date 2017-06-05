structure GtkSourceCompletionProposal :>
  GTK_SOURCE_COMPLETION_PROPOSAL
    where type 'a class = 'a GtkSourceCompletionProposalClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtksourceview "gtk_source_completion_proposal_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val changed_ = call (load_sym libgtksourceview "gtk_source_completion_proposal_changed") (GtkSourceCompletionProposalClass.PolyML.cPtr --> PolyMLFFI.cVoid)
      val equal_ = call (load_sym libgtksourceview "gtk_source_completion_proposal_equal") (GtkSourceCompletionProposalClass.PolyML.cPtr &&> GtkSourceCompletionProposalClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getIcon_ = call (load_sym libgtksourceview "gtk_source_completion_proposal_get_icon") (GtkSourceCompletionProposalClass.PolyML.cPtr --> GdkPixbufPixbufClass.PolyML.cPtr)
      val getInfo_ = call (load_sym libgtksourceview "gtk_source_completion_proposal_get_info") (GtkSourceCompletionProposalClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getLabel_ = call (load_sym libgtksourceview "gtk_source_completion_proposal_get_label") (GtkSourceCompletionProposalClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getMarkup_ = call (load_sym libgtksourceview "gtk_source_completion_proposal_get_markup") (GtkSourceCompletionProposalClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getText_ = call (load_sym libgtksourceview "gtk_source_completion_proposal_get_text") (GtkSourceCompletionProposalClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val hash_ = call (load_sym libgtksourceview "gtk_source_completion_proposal_hash") (GtkSourceCompletionProposalClass.PolyML.cPtr --> GUInt32.PolyML.cVal)
    end
    type 'a class = 'a GtkSourceCompletionProposalClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun changed self = (GtkSourceCompletionProposalClass.FFI.withPtr ---> I) changed_ self
    fun equal self other = (GtkSourceCompletionProposalClass.FFI.withPtr &&&> GtkSourceCompletionProposalClass.FFI.withPtr ---> GBool.FFI.fromVal) equal_ (self & other)
    fun getIcon self = (GtkSourceCompletionProposalClass.FFI.withPtr ---> GdkPixbufPixbufClass.FFI.fromPtr false) getIcon_ self
    fun getInfo self = (GtkSourceCompletionProposalClass.FFI.withPtr ---> Utf8.FFI.fromPtr 1) getInfo_ self
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
