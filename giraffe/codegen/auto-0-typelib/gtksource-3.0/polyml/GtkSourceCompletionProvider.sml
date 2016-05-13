structure GtkSourceCompletionProvider :>
  GTK_SOURCE_COMPLETION_PROVIDER
    where type 'a class = 'a GtkSourceCompletionProviderClass.class
    where type completion_activation_t = GtkSourceCompletionActivation.t
    where type 'a completion_context_class = 'a GtkSourceCompletionContextClass.class
    where type 'a completion_info_class = 'a GtkSourceCompletionInfoClass.class
    where type 'a completion_proposal_class = 'a GtkSourceCompletionProposalClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtksourceview "gtk_source_completion_provider_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val activateProposal_ =
        call (load_sym libgtksourceview "gtk_source_completion_provider_activate_proposal")
          (
            GtkSourceCompletionProviderClass.PolyML.cPtr
             &&> GtkSourceCompletionProposalClass.PolyML.cPtr
             &&> GtkTextIterRecord.PolyML.cPtr
             --> FFI.Bool.PolyML.cVal
          )
      val getActivation_ = call (load_sym libgtksourceview "gtk_source_completion_provider_get_activation") (GtkSourceCompletionProviderClass.PolyML.cPtr --> GtkSourceCompletionActivation.PolyML.cVal)
      val getIcon_ = call (load_sym libgtksourceview "gtk_source_completion_provider_get_icon") (GtkSourceCompletionProviderClass.PolyML.cPtr --> GdkPixbufPixbufClass.PolyML.cPtr)
      val getInfoWidget_ = call (load_sym libgtksourceview "gtk_source_completion_provider_get_info_widget") (GtkSourceCompletionProviderClass.PolyML.cPtr &&> GtkSourceCompletionProposalClass.PolyML.cPtr --> GtkWidgetClass.PolyML.cPtr)
      val getInteractiveDelay_ = call (load_sym libgtksourceview "gtk_source_completion_provider_get_interactive_delay") (GtkSourceCompletionProviderClass.PolyML.cPtr --> FFI.Int32.PolyML.cVal)
      val getName_ = call (load_sym libgtksourceview "gtk_source_completion_provider_get_name") (GtkSourceCompletionProviderClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getPriority_ = call (load_sym libgtksourceview "gtk_source_completion_provider_get_priority") (GtkSourceCompletionProviderClass.PolyML.cPtr --> FFI.Int32.PolyML.cVal)
      val getStartIter_ =
        call (load_sym libgtksourceview "gtk_source_completion_provider_get_start_iter")
          (
            GtkSourceCompletionProviderClass.PolyML.cPtr
             &&> GtkSourceCompletionContextClass.PolyML.cPtr
             &&> GtkSourceCompletionProposalClass.PolyML.cPtr
             &&> GtkTextIterRecord.PolyML.cPtr
             --> FFI.Bool.PolyML.cVal
          )
      val match_ = call (load_sym libgtksourceview "gtk_source_completion_provider_match") (GtkSourceCompletionProviderClass.PolyML.cPtr &&> GtkSourceCompletionContextClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val populate_ = call (load_sym libgtksourceview "gtk_source_completion_provider_populate") (GtkSourceCompletionProviderClass.PolyML.cPtr &&> GtkSourceCompletionContextClass.PolyML.cPtr --> PolyMLFFI.cVoid)
      val updateInfo_ =
        call (load_sym libgtksourceview "gtk_source_completion_provider_update_info")
          (
            GtkSourceCompletionProviderClass.PolyML.cPtr
             &&> GtkSourceCompletionProposalClass.PolyML.cPtr
             &&> GtkSourceCompletionInfoClass.PolyML.cPtr
             --> PolyMLFFI.cVoid
          )
    end
    type 'a class = 'a GtkSourceCompletionProviderClass.class
    type completion_activation_t = GtkSourceCompletionActivation.t
    type 'a completion_context_class = 'a GtkSourceCompletionContextClass.class
    type 'a completion_info_class = 'a GtkSourceCompletionInfoClass.class
    type 'a completion_proposal_class = 'a GtkSourceCompletionProposalClass.class
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun activateProposal self proposal iter =
      (
        GtkSourceCompletionProviderClass.C.withPtr
         &&&> GtkSourceCompletionProposalClass.C.withPtr
         &&&> GtkTextIterRecord.C.withPtr
         ---> FFI.Bool.C.fromVal
      )
        activateProposal_
        (
          self
           & proposal
           & iter
        )
    fun getActivation self = (GtkSourceCompletionProviderClass.C.withPtr ---> GtkSourceCompletionActivation.C.fromVal) getActivation_ self
    fun getIcon self = (GtkSourceCompletionProviderClass.C.withPtr ---> GdkPixbufPixbufClass.C.fromPtr false) getIcon_ self
    fun getInfoWidget self proposal = (GtkSourceCompletionProviderClass.C.withPtr &&&> GtkSourceCompletionProposalClass.C.withPtr ---> GtkWidgetClass.C.fromPtr false) getInfoWidget_ (self & proposal)
    fun getInteractiveDelay self = (GtkSourceCompletionProviderClass.C.withPtr ---> FFI.Int32.C.fromVal) getInteractiveDelay_ self
    fun getName self = (GtkSourceCompletionProviderClass.C.withPtr ---> Utf8.C.fromPtr true) getName_ self
    fun getPriority self = (GtkSourceCompletionProviderClass.C.withPtr ---> FFI.Int32.C.fromVal) getPriority_ self
    fun getStartIter self context proposal iter =
      (
        GtkSourceCompletionProviderClass.C.withPtr
         &&&> GtkSourceCompletionContextClass.C.withPtr
         &&&> GtkSourceCompletionProposalClass.C.withPtr
         &&&> GtkTextIterRecord.C.withPtr
         ---> FFI.Bool.C.fromVal
      )
        getStartIter_
        (
          self
           & context
           & proposal
           & iter
        )
    fun match self context = (GtkSourceCompletionProviderClass.C.withPtr &&&> GtkSourceCompletionContextClass.C.withPtr ---> FFI.Bool.C.fromVal) match_ (self & context)
    fun populate self context = (GtkSourceCompletionProviderClass.C.withPtr &&&> GtkSourceCompletionContextClass.C.withPtr ---> I) populate_ (self & context)
    fun updateInfo self proposal info =
      (
        GtkSourceCompletionProviderClass.C.withPtr
         &&&> GtkSourceCompletionProposalClass.C.withPtr
         &&&> GtkSourceCompletionInfoClass.C.withPtr
         ---> I
      )
        updateInfo_
        (
          self
           & proposal
           & info
        )
  end
