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
              GtkSourceCompletionProviderClass.FFI.non_opt GtkSourceCompletionProviderClass.FFI.p
               * GtkSourceCompletionProposalClass.FFI.non_opt GtkSourceCompletionProposalClass.FFI.p
               * GtkTextIterRecord.FFI.non_opt GtkTextIterRecord.FFI.p
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val getActivation_ = _import "gtk_source_completion_provider_get_activation" : GtkSourceCompletionProviderClass.FFI.non_opt GtkSourceCompletionProviderClass.FFI.p -> GtkSourceCompletionActivation.FFI.val_;
    val getGicon_ = _import "gtk_source_completion_provider_get_gicon" : GtkSourceCompletionProviderClass.FFI.non_opt GtkSourceCompletionProviderClass.FFI.p -> GioIconClass.FFI.opt GioIconClass.FFI.p;
    val getIcon_ = _import "gtk_source_completion_provider_get_icon" : GtkSourceCompletionProviderClass.FFI.non_opt GtkSourceCompletionProviderClass.FFI.p -> GdkPixbufPixbufClass.FFI.opt GdkPixbufPixbufClass.FFI.p;
    val getIconName_ = _import "gtk_source_completion_provider_get_icon_name" : GtkSourceCompletionProviderClass.FFI.non_opt GtkSourceCompletionProviderClass.FFI.p -> Utf8.FFI.opt Utf8.FFI.out_p;
    val getInfoWidget_ = fn x1 & x2 => (_import "gtk_source_completion_provider_get_info_widget" : GtkSourceCompletionProviderClass.FFI.non_opt GtkSourceCompletionProviderClass.FFI.p * GtkSourceCompletionProposalClass.FFI.non_opt GtkSourceCompletionProposalClass.FFI.p -> GtkWidgetClass.FFI.opt GtkWidgetClass.FFI.p;) (x1, x2)
    val getInteractiveDelay_ = _import "gtk_source_completion_provider_get_interactive_delay" : GtkSourceCompletionProviderClass.FFI.non_opt GtkSourceCompletionProviderClass.FFI.p -> GInt32.FFI.val_;
    val getName_ = _import "gtk_source_completion_provider_get_name" : GtkSourceCompletionProviderClass.FFI.non_opt GtkSourceCompletionProviderClass.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val getPriority_ = _import "gtk_source_completion_provider_get_priority" : GtkSourceCompletionProviderClass.FFI.non_opt GtkSourceCompletionProviderClass.FFI.p -> GInt32.FFI.val_;
    val getStartIter_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "gtk_source_completion_provider_get_start_iter" :
              GtkSourceCompletionProviderClass.FFI.non_opt GtkSourceCompletionProviderClass.FFI.p
               * GtkSourceCompletionContextClass.FFI.non_opt GtkSourceCompletionContextClass.FFI.p
               * GtkSourceCompletionProposalClass.FFI.non_opt GtkSourceCompletionProposalClass.FFI.p
               * GtkTextIterRecord.FFI.non_opt GtkTextIterRecord.FFI.p
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val match_ = fn x1 & x2 => (_import "gtk_source_completion_provider_match" : GtkSourceCompletionProviderClass.FFI.non_opt GtkSourceCompletionProviderClass.FFI.p * GtkSourceCompletionContextClass.FFI.non_opt GtkSourceCompletionContextClass.FFI.p -> GBool.FFI.val_;) (x1, x2)
    val populate_ = fn x1 & x2 => (_import "gtk_source_completion_provider_populate" : GtkSourceCompletionProviderClass.FFI.non_opt GtkSourceCompletionProviderClass.FFI.p * GtkSourceCompletionContextClass.FFI.non_opt GtkSourceCompletionContextClass.FFI.p -> unit;) (x1, x2)
    val updateInfo_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_source_completion_provider_update_info" :
              GtkSourceCompletionProviderClass.FFI.non_opt GtkSourceCompletionProviderClass.FFI.p
               * GtkSourceCompletionProposalClass.FFI.non_opt GtkSourceCompletionProposalClass.FFI.p
               * GtkSourceCompletionInfoClass.FFI.non_opt GtkSourceCompletionInfoClass.FFI.p
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
        GtkSourceCompletionProviderClass.FFI.withPtr false
         &&&> GtkSourceCompletionProposalClass.FFI.withPtr false
         &&&> GtkTextIterRecord.FFI.withPtr false
         ---> GBool.FFI.fromVal
      )
        activateProposal_
        (
          self
           & proposal
           & iter
        )
    fun getActivation self = (GtkSourceCompletionProviderClass.FFI.withPtr false ---> GtkSourceCompletionActivation.FFI.fromVal) getActivation_ self
    fun getGicon self = (GtkSourceCompletionProviderClass.FFI.withPtr false ---> GioIconClass.FFI.fromOptPtr false) getGicon_ self
    fun getIcon self = (GtkSourceCompletionProviderClass.FFI.withPtr false ---> GdkPixbufPixbufClass.FFI.fromOptPtr false) getIcon_ self
    fun getIconName self = (GtkSourceCompletionProviderClass.FFI.withPtr false ---> Utf8.FFI.fromOptPtr 0) getIconName_ self
    fun getInfoWidget self proposal = (GtkSourceCompletionProviderClass.FFI.withPtr false &&&> GtkSourceCompletionProposalClass.FFI.withPtr false ---> GtkWidgetClass.FFI.fromOptPtr false) getInfoWidget_ (self & proposal)
    fun getInteractiveDelay self = (GtkSourceCompletionProviderClass.FFI.withPtr false ---> GInt32.FFI.fromVal) getInteractiveDelay_ self
    fun getName self = (GtkSourceCompletionProviderClass.FFI.withPtr false ---> Utf8.FFI.fromPtr ~1) getName_ self
    fun getPriority self = (GtkSourceCompletionProviderClass.FFI.withPtr false ---> GInt32.FFI.fromVal) getPriority_ self
    fun getStartIter self (context, proposal) =
      let
        val iter & retVal =
          (
            GtkSourceCompletionProviderClass.FFI.withPtr false
             &&&> GtkSourceCompletionContextClass.FFI.withPtr false
             &&&> GtkSourceCompletionProposalClass.FFI.withPtr false
             &&&> GtkTextIterRecord.FFI.withNewPtr
             ---> GtkTextIterRecord.FFI.fromPtr true && GBool.FFI.fromVal
          )
            getStartIter_
            (
              self
               & context
               & proposal
               & ()
            )
      in
        if retVal then SOME iter else NONE
      end
    fun match self context = (GtkSourceCompletionProviderClass.FFI.withPtr false &&&> GtkSourceCompletionContextClass.FFI.withPtr false ---> GBool.FFI.fromVal) match_ (self & context)
    fun populate self context = (GtkSourceCompletionProviderClass.FFI.withPtr false &&&> GtkSourceCompletionContextClass.FFI.withPtr false ---> I) populate_ (self & context)
    fun updateInfo self (proposal, info) =
      (
        GtkSourceCompletionProviderClass.FFI.withPtr false
         &&&> GtkSourceCompletionProposalClass.FFI.withPtr false
         &&&> GtkSourceCompletionInfoClass.FFI.withPtr false
         ---> I
      )
        updateInfo_
        (
          self
           & proposal
           & info
        )
  end
