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
      val getType_ = call (getSymbol "gtk_source_completion_provider_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val activateProposal_ =
        call (getSymbol "gtk_source_completion_provider_activate_proposal")
          (
            GtkSourceCompletionProviderClass.PolyML.cPtr
             &&> GtkSourceCompletionProposalClass.PolyML.cPtr
             &&> GtkTextIterRecord.PolyML.cPtr
             --> GBool.PolyML.cVal
          )
      val getActivation_ = call (getSymbol "gtk_source_completion_provider_get_activation") (GtkSourceCompletionProviderClass.PolyML.cPtr --> GtkSourceCompletionActivation.PolyML.cVal)
      val getIcon_ = call (getSymbol "gtk_source_completion_provider_get_icon") (GtkSourceCompletionProviderClass.PolyML.cPtr --> GdkPixbufPixbufClass.PolyML.cPtr)
      val getInfoWidget_ = call (getSymbol "gtk_source_completion_provider_get_info_widget") (GtkSourceCompletionProviderClass.PolyML.cPtr &&> GtkSourceCompletionProposalClass.PolyML.cPtr --> GtkWidgetClass.PolyML.cPtr)
      val getInteractiveDelay_ = call (getSymbol "gtk_source_completion_provider_get_interactive_delay") (GtkSourceCompletionProviderClass.PolyML.cPtr --> GInt32.PolyML.cVal)
      val getName_ = call (getSymbol "gtk_source_completion_provider_get_name") (GtkSourceCompletionProviderClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getPriority_ = call (getSymbol "gtk_source_completion_provider_get_priority") (GtkSourceCompletionProviderClass.PolyML.cPtr --> GInt32.PolyML.cVal)
      val getStartIter_ =
        call (getSymbol "gtk_source_completion_provider_get_start_iter")
          (
            GtkSourceCompletionProviderClass.PolyML.cPtr
             &&> GtkSourceCompletionContextClass.PolyML.cPtr
             &&> GtkSourceCompletionProposalClass.PolyML.cPtr
             &&> GtkTextIterRecord.PolyML.cPtr
             --> GBool.PolyML.cVal
          )
      val match_ = call (getSymbol "gtk_source_completion_provider_match") (GtkSourceCompletionProviderClass.PolyML.cPtr &&> GtkSourceCompletionContextClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val populate_ = call (getSymbol "gtk_source_completion_provider_populate") (GtkSourceCompletionProviderClass.PolyML.cPtr &&> GtkSourceCompletionContextClass.PolyML.cPtr --> cVoid)
      val updateInfo_ =
        call (getSymbol "gtk_source_completion_provider_update_info")
          (
            GtkSourceCompletionProviderClass.PolyML.cPtr
             &&> GtkSourceCompletionProposalClass.PolyML.cPtr
             &&> GtkSourceCompletionInfoClass.PolyML.cPtr
             --> cVoid
          )
    end
    type 'a class = 'a GtkSourceCompletionProviderClass.class
    type completion_activation_t = GtkSourceCompletionActivation.t
    type 'a completion_context_class = 'a GtkSourceCompletionContextClass.class
    type 'a completion_info_class = 'a GtkSourceCompletionInfoClass.class
    type 'a completion_proposal_class = 'a GtkSourceCompletionProposalClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun activateProposal self (proposal, iter) =
      (
        GtkSourceCompletionProviderClass.FFI.withPtr
         &&&> GtkSourceCompletionProposalClass.FFI.withPtr
         &&&> GtkTextIterRecord.FFI.withPtr
         ---> GBool.FFI.fromVal
      )
        activateProposal_
        (
          self
           & proposal
           & iter
        )
    fun getActivation self = (GtkSourceCompletionProviderClass.FFI.withPtr ---> GtkSourceCompletionActivation.FFI.fromVal) getActivation_ self
    fun getIcon self = (GtkSourceCompletionProviderClass.FFI.withPtr ---> GdkPixbufPixbufClass.FFI.fromPtr false) getIcon_ self
    fun getInfoWidget self proposal = (GtkSourceCompletionProviderClass.FFI.withPtr &&&> GtkSourceCompletionProposalClass.FFI.withPtr ---> GtkWidgetClass.FFI.fromPtr false) getInfoWidget_ (self & proposal)
    fun getInteractiveDelay self = (GtkSourceCompletionProviderClass.FFI.withPtr ---> GInt32.FFI.fromVal) getInteractiveDelay_ self
    fun getName self = (GtkSourceCompletionProviderClass.FFI.withPtr ---> Utf8.FFI.fromPtr 1) getName_ self
    fun getPriority self = (GtkSourceCompletionProviderClass.FFI.withPtr ---> GInt32.FFI.fromVal) getPriority_ self
    fun getStartIter
      self
      (
        context,
        proposal,
        iter
      ) =
      (
        GtkSourceCompletionProviderClass.FFI.withPtr
         &&&> GtkSourceCompletionContextClass.FFI.withPtr
         &&&> GtkSourceCompletionProposalClass.FFI.withPtr
         &&&> GtkTextIterRecord.FFI.withPtr
         ---> GBool.FFI.fromVal
      )
        getStartIter_
        (
          self
           & context
           & proposal
           & iter
        )
    fun match self context = (GtkSourceCompletionProviderClass.FFI.withPtr &&&> GtkSourceCompletionContextClass.FFI.withPtr ---> GBool.FFI.fromVal) match_ (self & context)
    fun populate self context = (GtkSourceCompletionProviderClass.FFI.withPtr &&&> GtkSourceCompletionContextClass.FFI.withPtr ---> I) populate_ (self & context)
    fun updateInfo self (proposal, info) =
      (
        GtkSourceCompletionProviderClass.FFI.withPtr
         &&&> GtkSourceCompletionProposalClass.FFI.withPtr
         &&&> GtkSourceCompletionInfoClass.FFI.withPtr
         ---> I
      )
        updateInfo_
        (
          self
           & proposal
           & info
        )
  end
