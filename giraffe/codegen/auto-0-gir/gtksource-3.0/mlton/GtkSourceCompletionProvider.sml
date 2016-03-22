structure GtkSourceCompletionProvider :>
  GTK_SOURCE_COMPLETION_PROVIDER
    where type 'a class = 'a GtkSourceCompletionProviderClass.class
    where type completion_activation_t = GtkSourceCompletionActivation.t
    where type 'a completion_context_class = 'a GtkSourceCompletionContextClass.class
    where type 'a completion_info_class = 'a GtkSourceCompletionInfoClass.class
    where type 'a completion_proposal_class = 'a GtkSourceCompletionProposalClass.class =
  struct
    val getType_ = _import "gtk_source_completion_provider_get_type" : unit -> GObjectType.C.val_;
    val activateProposal_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_source_completion_provider_activate_proposal" :
              GtkSourceCompletionProviderClass.C.notnull GtkSourceCompletionProviderClass.C.p
               * GtkSourceCompletionProposalClass.C.notnull GtkSourceCompletionProposalClass.C.p
               * GtkTextIterRecord.C.notnull GtkTextIterRecord.C.p
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val getActivation_ = _import "gtk_source_completion_provider_get_activation" : GtkSourceCompletionProviderClass.C.notnull GtkSourceCompletionProviderClass.C.p -> GtkSourceCompletionActivation.C.val_;
    val getIcon_ = _import "gtk_source_completion_provider_get_icon" : GtkSourceCompletionProviderClass.C.notnull GtkSourceCompletionProviderClass.C.p -> GdkPixbufPixbufClass.C.notnull GdkPixbufPixbufClass.C.p;
    val getInfoWidget_ = fn x1 & x2 => (_import "gtk_source_completion_provider_get_info_widget" : GtkSourceCompletionProviderClass.C.notnull GtkSourceCompletionProviderClass.C.p * GtkSourceCompletionProposalClass.C.notnull GtkSourceCompletionProposalClass.C.p -> GtkWidgetClass.C.notnull GtkWidgetClass.C.p;) (x1, x2)
    val getInteractiveDelay_ = _import "gtk_source_completion_provider_get_interactive_delay" : GtkSourceCompletionProviderClass.C.notnull GtkSourceCompletionProviderClass.C.p -> FFI.Int.C.val_;
    val getName_ = _import "gtk_source_completion_provider_get_name" : GtkSourceCompletionProviderClass.C.notnull GtkSourceCompletionProviderClass.C.p -> Utf8.C.notnull Utf8.C.out_p;
    val getPriority_ = _import "gtk_source_completion_provider_get_priority" : GtkSourceCompletionProviderClass.C.notnull GtkSourceCompletionProviderClass.C.p -> FFI.Int.C.val_;
    val getStartIter_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "gtk_source_completion_provider_get_start_iter" :
              GtkSourceCompletionProviderClass.C.notnull GtkSourceCompletionProviderClass.C.p
               * GtkSourceCompletionContextClass.C.notnull GtkSourceCompletionContextClass.C.p
               * GtkSourceCompletionProposalClass.C.notnull GtkSourceCompletionProposalClass.C.p
               * GtkTextIterRecord.C.notnull GtkTextIterRecord.C.p
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val match_ = fn x1 & x2 => (_import "gtk_source_completion_provider_match" : GtkSourceCompletionProviderClass.C.notnull GtkSourceCompletionProviderClass.C.p * GtkSourceCompletionContextClass.C.notnull GtkSourceCompletionContextClass.C.p -> FFI.Bool.C.val_;) (x1, x2)
    val populate_ = fn x1 & x2 => (_import "gtk_source_completion_provider_populate" : GtkSourceCompletionProviderClass.C.notnull GtkSourceCompletionProviderClass.C.p * GtkSourceCompletionContextClass.C.notnull GtkSourceCompletionContextClass.C.p -> unit;) (x1, x2)
    val updateInfo_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_source_completion_provider_update_info" :
              GtkSourceCompletionProviderClass.C.notnull GtkSourceCompletionProviderClass.C.p
               * GtkSourceCompletionProposalClass.C.notnull GtkSourceCompletionProposalClass.C.p
               * GtkSourceCompletionInfoClass.C.notnull GtkSourceCompletionInfoClass.C.p
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
    fun getInteractiveDelay self = (GtkSourceCompletionProviderClass.C.withPtr ---> FFI.Int.C.fromVal) getInteractiveDelay_ self
    fun getName self = (GtkSourceCompletionProviderClass.C.withPtr ---> Utf8.C.fromPtr true) getName_ self
    fun getPriority self = (GtkSourceCompletionProviderClass.C.withPtr ---> FFI.Int.C.fromVal) getPriority_ self
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
