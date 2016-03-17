structure GtkSourceCompletionProposal :>
  GTK_SOURCE_COMPLETION_PROPOSAL
    where type 'a class = 'a GtkSourceCompletionProposalClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtksourceview "gtk_source_completion_proposal_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val changed_ = call (load_sym libgtksourceview "gtk_source_completion_proposal_changed") (GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val equal_ = call (load_sym libgtksourceview "gtk_source_completion_proposal_equal") (GObjectObjectClass.PolyML.cPtr &&> GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getIcon_ = call (load_sym libgtksourceview "gtk_source_completion_proposal_get_icon") (GObjectObjectClass.PolyML.cPtr --> GObjectObjectClass.PolyML.cPtr)
      val getInfo_ = call (load_sym libgtksourceview "gtk_source_completion_proposal_get_info") (GObjectObjectClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getLabel_ = call (load_sym libgtksourceview "gtk_source_completion_proposal_get_label") (GObjectObjectClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getMarkup_ = call (load_sym libgtksourceview "gtk_source_completion_proposal_get_markup") (GObjectObjectClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getText_ = call (load_sym libgtksourceview "gtk_source_completion_proposal_get_text") (GObjectObjectClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val hash_ = call (load_sym libgtksourceview "gtk_source_completion_proposal_hash") (GObjectObjectClass.PolyML.cPtr --> FFI.UInt32.PolyML.cVal)
    end
    type 'a class = 'a GtkSourceCompletionProposalClass.class
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun changed self = (GObjectObjectClass.C.withPtr ---> I) changed_ self
    fun equal self other = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) equal_ (self & other)
    fun getIcon self = (GObjectObjectClass.C.withPtr ---> GdkPixbufPixbufClass.C.fromPtr false) getIcon_ self
    fun getInfo self = (GObjectObjectClass.C.withPtr ---> Utf8.C.fromPtr true) getInfo_ self
    fun getLabel self = (GObjectObjectClass.C.withPtr ---> Utf8.C.fromPtr true) getLabel_ self
    fun getMarkup self = (GObjectObjectClass.C.withPtr ---> Utf8.C.fromPtr true) getMarkup_ self
    fun getText self = (GObjectObjectClass.C.withPtr ---> Utf8.C.fromPtr true) getText_ self
    fun hash self = (GObjectObjectClass.C.withPtr ---> FFI.UInt32.C.fromVal) hash_ self
    local
      open ClosureMarshal Signal
    in
      fun changedSig f = signal "changed" (void ---> ret_void) f
    end
  end
