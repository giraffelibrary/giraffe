structure GtkSourceCompletionProposal :>
  GTK_SOURCE_COMPLETION_PROPOSAL
    where type 'a class_t = 'a GtkSourceCompletionProposalClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtksourceview "gtk_source_completion_proposal_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val changed_ = call (load_sym libgtksourceview "gtk_source_completion_proposal_changed") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val equal_ = call (load_sym libgtksourceview "gtk_source_completion_proposal_equal") (GObjectObjectClass.PolyML.PTR &&> GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val getIcon_ = call (load_sym libgtksourceview "gtk_source_completion_proposal_get_icon") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val getInfo_ = call (load_sym libgtksourceview "gtk_source_completion_proposal_get_info") (GObjectObjectClass.PolyML.PTR --> Utf8.PolyML.RETPTR)
      val getLabel_ = call (load_sym libgtksourceview "gtk_source_completion_proposal_get_label") (GObjectObjectClass.PolyML.PTR --> Utf8.PolyML.RETPTR)
      val getMarkup_ = call (load_sym libgtksourceview "gtk_source_completion_proposal_get_markup") (GObjectObjectClass.PolyML.PTR --> Utf8.PolyML.RETPTR)
      val getText_ = call (load_sym libgtksourceview "gtk_source_completion_proposal_get_text") (GObjectObjectClass.PolyML.PTR --> Utf8.PolyML.RETPTR)
      val hash_ = call (load_sym libgtksourceview "gtk_source_completion_proposal_hash") (GObjectObjectClass.PolyML.PTR --> FFI.UInt.PolyML.VAL)
    end
    type 'a class_t = 'a GtkSourceCompletionProposalClass.t
    type t = base class_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun changed self = (GObjectObjectClass.C.withPtr ---> I) changed_ self
    fun equal self other = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) equal_ (self & other)
    fun getIcon self = (GObjectObjectClass.C.withPtr ---> GdkPixbufPixbufClass.C.fromPtr false) getIcon_ self
    fun getInfo self = (GObjectObjectClass.C.withPtr ---> Utf8.C.fromPtr true) getInfo_ self
    fun getLabel self = (GObjectObjectClass.C.withPtr ---> Utf8.C.fromPtr true) getLabel_ self
    fun getMarkup self = (GObjectObjectClass.C.withPtr ---> Utf8.C.fromPtr true) getMarkup_ self
    fun getText self = (GObjectObjectClass.C.withPtr ---> Utf8.C.fromPtr true) getText_ self
    fun hash self = (GObjectObjectClass.C.withPtr ---> FFI.UInt.C.fromVal) hash_ self
    local
      open ClosureMarshal Signal
    in
      fun changedSig f = signal "changed" (void ---> ret_void) f
    end
  end
