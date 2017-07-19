structure GtkSourceCompletionProvider :>
  GTK_SOURCE_COMPLETION_PROVIDER
    where type 'a class = 'a GtkSourceCompletionProviderClass.class
    where type completion_activation_t = GtkSourceCompletionActivation.t
    where type 'a completion_context_class = 'a GtkSourceCompletionContextClass.class
    where type 'a completion_info_class = 'a GtkSourceCompletionInfoClass.class
    where type 'a completion_proposal_class = 'a GtkSourceCompletionProposalClass.class =
  struct
    val getType_ = _import "gtk_source_completion_provider_get_type" : unit -> GObjectType.FFI.val_;
    val activateProposal_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_source_completion_provider_activate_proposal" :
              GtkSourceCompletionProviderClass.FFI.notnull GtkSourceCompletionProviderClass.FFI.p
               * GtkSourceCompletionProposalClass.FFI.notnull GtkSourceCompletionProposalClass.FFI.p
               * GtkTextIterRecord.FFI.notnull GtkTextIterRecord.FFI.p
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val getActivation_ = _import "gtk_source_completion_provider_get_activation" : GtkSourceCompletionProviderClass.FFI.notnull GtkSourceCompletionProviderClass.FFI.p -> GtkSourceCompletionActivation.FFI.val_;
    val getIcon_ = _import "gtk_source_completion_provider_get_icon" : GtkSourceCompletionProviderClass.FFI.notnull GtkSourceCompletionProviderClass.FFI.p -> GdkPixbufPixbufClass.FFI.notnull GdkPixbufPixbufClass.FFI.p;
    val getInfoWidget_ = fn x1 & x2 => (_import "gtk_source_completion_provider_get_info_widget" : GtkSourceCompletionProviderClass.FFI.notnull GtkSourceCompletionProviderClass.FFI.p * GtkSourceCompletionProposalClass.FFI.notnull GtkSourceCompletionProposalClass.FFI.p -> GtkWidgetClass.FFI.notnull GtkWidgetClass.FFI.p;) (x1, x2)
    val getInteractiveDelay_ = _import "gtk_source_completion_provider_get_interactive_delay" : GtkSourceCompletionProviderClass.FFI.notnull GtkSourceCompletionProviderClass.FFI.p -> GInt32.FFI.val_;
    val getName_ = _import "gtk_source_completion_provider_get_name" : GtkSourceCompletionProviderClass.FFI.notnull GtkSourceCompletionProviderClass.FFI.p -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val getPriority_ = _import "gtk_source_completion_provider_get_priority" : GtkSourceCompletionProviderClass.FFI.notnull GtkSourceCompletionProviderClass.FFI.p -> GInt32.FFI.val_;
    val getStartIter_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "gtk_source_completion_provider_get_start_iter" :
              GtkSourceCompletionProviderClass.FFI.notnull GtkSourceCompletionProviderClass.FFI.p
               * GtkSourceCompletionContextClass.FFI.notnull GtkSourceCompletionContextClass.FFI.p
               * GtkSourceCompletionProposalClass.FFI.notnull GtkSourceCompletionProposalClass.FFI.p
               * GtkTextIterRecord.FFI.notnull GtkTextIterRecord.FFI.p
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val match_ = fn x1 & x2 => (_import "gtk_source_completion_provider_match" : GtkSourceCompletionProviderClass.FFI.notnull GtkSourceCompletionProviderClass.FFI.p * GtkSourceCompletionContextClass.FFI.notnull GtkSourceCompletionContextClass.FFI.p -> GBool.FFI.val_;) (x1, x2)
    val populate_ = fn x1 & x2 => (_import "gtk_source_completion_provider_populate" : GtkSourceCompletionProviderClass.FFI.notnull GtkSourceCompletionProviderClass.FFI.p * GtkSourceCompletionContextClass.FFI.notnull GtkSourceCompletionContextClass.FFI.p -> unit;) (x1, x2)
    val updateInfo_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_source_completion_provider_update_info" :
              GtkSourceCompletionProviderClass.FFI.notnull GtkSourceCompletionProviderClass.FFI.p
               * GtkSourceCompletionProposalClass.FFI.notnull GtkSourceCompletionProposalClass.FFI.p
               * GtkSourceCompletionInfoClass.FFI.notnull GtkSourceCompletionInfoClass.FFI.p
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
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
