structure GtkSourceCompletionProvider :>
  GTK_SOURCE_COMPLETION_PROVIDER
    where type 'a class_t = 'a GtkSourceCompletionProviderClass.t
    where type completionactivation_t = GtkSourceCompletionActivation.t
    where type 'a completioncontextclass_t = 'a GtkSourceCompletionContextClass.t
    where type 'a completioninfoclass_t = 'a GtkSourceCompletionInfoClass.t
    where type 'a completionproposalclass_t = 'a GtkSourceCompletionProposalClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtksourceview "gtk_source_completion_provider_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val activateProposal_ =
        call (load_sym libgtksourceview "gtk_source_completion_provider_activate_proposal")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> GtkTextIterRecord.PolyML.PTR
             --> FFI.Bool.PolyML.VAL
          )
      val getActivation_ = call (load_sym libgtksourceview "gtk_source_completion_provider_get_activation") (GObjectObjectClass.PolyML.PTR --> GtkSourceCompletionActivation.PolyML.VAL)
      val getIcon_ = call (load_sym libgtksourceview "gtk_source_completion_provider_get_icon") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val getInfoWidget_ = call (load_sym libgtksourceview "gtk_source_completion_provider_get_info_widget") (GObjectObjectClass.PolyML.PTR &&> GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val getInteractiveDelay_ = call (load_sym libgtksourceview "gtk_source_completion_provider_get_interactive_delay") (GObjectObjectClass.PolyML.PTR --> FFI.Int.PolyML.VAL)
      val getName_ = call (load_sym libgtksourceview "gtk_source_completion_provider_get_name") (GObjectObjectClass.PolyML.PTR --> FFI.String.PolyML.RETPTR)
      val getPriority_ = call (load_sym libgtksourceview "gtk_source_completion_provider_get_priority") (GObjectObjectClass.PolyML.PTR --> FFI.Int.PolyML.VAL)
      val getStartIter_ =
        call (load_sym libgtksourceview "gtk_source_completion_provider_get_start_iter")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> GtkTextIterRecord.PolyML.PTR
             --> FFI.Bool.PolyML.VAL
          )
      val match_ = call (load_sym libgtksourceview "gtk_source_completion_provider_match") (GObjectObjectClass.PolyML.PTR &&> GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val populate_ = call (load_sym libgtksourceview "gtk_source_completion_provider_populate") (GObjectObjectClass.PolyML.PTR &&> GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val updateInfo_ =
        call (load_sym libgtksourceview "gtk_source_completion_provider_update_info")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             --> FFI.PolyML.VOID
          )
    end
    type 'a class_t = 'a GtkSourceCompletionProviderClass.t
    type completionactivation_t = GtkSourceCompletionActivation.t
    type 'a completioncontextclass_t = 'a GtkSourceCompletionContextClass.t
    type 'a completioninfoclass_t = 'a GtkSourceCompletionInfoClass.t
    type 'a completionproposalclass_t = 'a GtkSourceCompletionProposalClass.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun activateProposal self proposal iter =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> GtkTextIterRecord.C.withPtr
         ---> FFI.Bool.C.fromVal
      )
        activateProposal_
        (
          self
           & proposal
           & iter
        )
    fun getActivation self = (GObjectObjectClass.C.withPtr ---> GtkSourceCompletionActivation.C.fromVal) getActivation_ self
    fun getIcon self = (GObjectObjectClass.C.withPtr ---> GdkPixbufPixbufClass.C.fromPtr false) getIcon_ self
    fun getInfoWidget self proposal = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> GtkWidgetClass.C.fromPtr false) getInfoWidget_ (self & proposal)
    fun getInteractiveDelay self = (GObjectObjectClass.C.withPtr ---> FFI.Int.C.fromVal) getInteractiveDelay_ self
    fun getName self = (GObjectObjectClass.C.withPtr ---> FFI.String.C.fromPtr true) getName_ self
    fun getPriority self = (GObjectObjectClass.C.withPtr ---> FFI.Int.C.fromVal) getPriority_ self
    fun getStartIter self context proposal iter =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
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
    fun match self context = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) match_ (self & context)
    fun populate self context = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> I) populate_ (self & context)
    fun updateInfo self proposal info =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         ---> I
      )
        updateInfo_
        (
          self
           & proposal
           & info
        )
  end
