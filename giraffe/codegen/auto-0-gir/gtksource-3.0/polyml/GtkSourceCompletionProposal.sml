structure GtkSourceCompletionProposal :>
  GTK_SOURCE_COMPLETION_PROPOSAL
    where type 'a class = 'a GtkSourceCompletionProposalClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtksourceview "gtk_source_completion_proposal_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val changed_ = call (load_sym libgtksourceview "gtk_source_completion_proposal_changed") (GtkSourceCompletionProposalClass.PolyML.cPtr --> PolyMLFFI.cVoid)
      val equal_ = call (load_sym libgtksourceview "gtk_source_completion_proposal_equal") (GtkSourceCompletionProposalClass.PolyML.cPtr &&> GtkSourceCompletionProposalClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getIcon_ = call (load_sym libgtksourceview "gtk_source_completion_proposal_get_icon") (GtkSourceCompletionProposalClass.PolyML.cPtr --> GdkPixbufPixbufClass.PolyML.cPtr)
      val getInfo_ = call (load_sym libgtksourceview "gtk_source_completion_proposal_get_info") (GtkSourceCompletionProposalClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getLabel_ = call (load_sym libgtksourceview "gtk_source_completion_proposal_get_label") (GtkSourceCompletionProposalClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getMarkup_ = call (load_sym libgtksourceview "gtk_source_completion_proposal_get_markup") (GtkSourceCompletionProposalClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getText_ = call (load_sym libgtksourceview "gtk_source_completion_proposal_get_text") (GtkSourceCompletionProposalClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val hash_ = call (load_sym libgtksourceview "gtk_source_completion_proposal_hash") (GtkSourceCompletionProposalClass.PolyML.cPtr --> FFI.UInt.PolyML.cVal)
    end
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
