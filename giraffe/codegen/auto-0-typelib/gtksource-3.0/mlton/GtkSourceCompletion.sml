structure GtkSourceCompletion :>
  GTK_SOURCE_COMPLETION
    where type 'a class = 'a GtkSourceCompletionClass.class
    where type 'a completion_info_class = 'a GtkSourceCompletionInfoClass.class
    where type 'a completion_provider_class = 'a GtkSourceCompletionProviderClass.class
    where type 'a completion_context_class = 'a GtkSourceCompletionContextClass.class
    where type 'a view_class = 'a GtkSourceViewClass.class =
  struct
    val getType_ = _import "gtk_source_completion_get_type" : unit -> GObjectType.C.val_;
    val addProvider_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_source_completion_add_provider" :
              GtkSourceCompletionClass.C.notnull GtkSourceCompletionClass.C.p
               * GtkSourceCompletionProviderClass.C.notnull GtkSourceCompletionProviderClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val blockInteractive_ = _import "gtk_source_completion_block_interactive" : GtkSourceCompletionClass.C.notnull GtkSourceCompletionClass.C.p -> unit;
    val createContext_ = fn x1 & x2 => (_import "gtk_source_completion_create_context" : GtkSourceCompletionClass.C.notnull GtkSourceCompletionClass.C.p * unit GtkTextIterRecord.C.p -> GtkSourceCompletionContextClass.C.notnull GtkSourceCompletionContextClass.C.p;) (x1, x2)
    val getInfoWindow_ = _import "gtk_source_completion_get_info_window" : GtkSourceCompletionClass.C.notnull GtkSourceCompletionClass.C.p -> GtkSourceCompletionInfoClass.C.notnull GtkSourceCompletionInfoClass.C.p;
    val getView_ = _import "gtk_source_completion_get_view" : GtkSourceCompletionClass.C.notnull GtkSourceCompletionClass.C.p -> GtkSourceViewClass.C.notnull GtkSourceViewClass.C.p;
    val hide_ = _import "gtk_source_completion_hide" : GtkSourceCompletionClass.C.notnull GtkSourceCompletionClass.C.p -> unit;
    val moveWindow_ = fn x1 & x2 => (_import "gtk_source_completion_move_window" : GtkSourceCompletionClass.C.notnull GtkSourceCompletionClass.C.p * GtkTextIterRecord.C.notnull GtkTextIterRecord.C.p -> unit;) (x1, x2)
    val removeProvider_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_source_completion_remove_provider" :
              GtkSourceCompletionClass.C.notnull GtkSourceCompletionClass.C.p
               * GtkSourceCompletionProviderClass.C.notnull GtkSourceCompletionProviderClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val unblockInteractive_ = _import "gtk_source_completion_unblock_interactive" : GtkSourceCompletionClass.C.notnull GtkSourceCompletionClass.C.p -> unit;
    type 'a class = 'a GtkSourceCompletionClass.class
    type 'a completion_info_class = 'a GtkSourceCompletionInfoClass.class
    type 'a completion_provider_class = 'a GtkSourceCompletionProviderClass.class
    type 'a completion_context_class = 'a GtkSourceCompletionContextClass.class
    type 'a view_class = 'a GtkSourceViewClass.class
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun addProvider self provider =
      (
        GtkSourceCompletionClass.C.withPtr
         &&&> GtkSourceCompletionProviderClass.C.withPtr
         &&&> GLibErrorRecord.handleError
         ---> FFI.Bool.C.fromVal
      )
        addProvider_
        (
          self
           & provider
           & []
        )
    fun blockInteractive self = (GtkSourceCompletionClass.C.withPtr ---> I) blockInteractive_ self
    fun createContext self position = (GtkSourceCompletionClass.C.withPtr &&&> GtkTextIterRecord.C.withOptPtr ---> GtkSourceCompletionContextClass.C.fromPtr true) createContext_ (self & position)
    fun getInfoWindow self = (GtkSourceCompletionClass.C.withPtr ---> GtkSourceCompletionInfoClass.C.fromPtr false) getInfoWindow_ self
    fun getView self = (GtkSourceCompletionClass.C.withPtr ---> GtkSourceViewClass.C.fromPtr false) getView_ self
    fun hide self = (GtkSourceCompletionClass.C.withPtr ---> I) hide_ self
    fun moveWindow self iter = (GtkSourceCompletionClass.C.withPtr &&&> GtkTextIterRecord.C.withPtr ---> I) moveWindow_ (self & iter)
    fun removeProvider self provider =
      (
        GtkSourceCompletionClass.C.withPtr
         &&&> GtkSourceCompletionProviderClass.C.withPtr
         &&&> GLibErrorRecord.handleError
         ---> FFI.Bool.C.fromVal
      )
        removeProvider_
        (
          self
           & provider
           & []
        )
    fun unblockInteractive self = (GtkSourceCompletionClass.C.withPtr ---> I) unblockInteractive_ self
    local
      open ClosureMarshal Signal
    in
      fun activateProposalSig f = signal "activate-proposal" (void ---> ret_void) f
      fun hideSig f = signal "hide" (void ---> ret_void) f
      fun moveCursorSig f = signal "move-cursor" (get 0w1 GtkScrollStep.t &&&> get 0w2 int ---> ret_void) (fn step & num => f step num)
      fun movePageSig f = signal "move-page" (get 0w1 GtkScrollStep.t &&&> get 0w2 int ---> ret_void) (fn step & num => f step num)
      fun populateContextSig f = signal "populate-context" (get 0w1 GtkSourceCompletionContextClass.t ---> ret_void) f
      fun showSig f = signal "show" (void ---> ret_void) f
    end
    local
      open Property
    in
      val acceleratorsProp =
        {
          get = fn x => get "accelerators" uint x,
          set = fn x => set "accelerators" uint x
        }
      val autoCompleteDelayProp =
        {
          get = fn x => get "auto-complete-delay" uint x,
          set = fn x => set "auto-complete-delay" uint x
        }
      val proposalPageSizeProp =
        {
          get = fn x => get "proposal-page-size" uint x,
          set = fn x => set "proposal-page-size" uint x
        }
      val providerPageSizeProp =
        {
          get = fn x => get "provider-page-size" uint x,
          set = fn x => set "provider-page-size" uint x
        }
      val rememberInfoVisibilityProp =
        {
          get = fn x => get "remember-info-visibility" boolean x,
          set = fn x => set "remember-info-visibility" boolean x
        }
      val selectOnShowProp =
        {
          get = fn x => get "select-on-show" boolean x,
          set = fn x => set "select-on-show" boolean x
        }
      val showHeadersProp =
        {
          get = fn x => get "show-headers" boolean x,
          set = fn x => set "show-headers" boolean x
        }
      val showIconsProp =
        {
          get = fn x => get "show-icons" boolean x,
          set = fn x => set "show-icons" boolean x
        }
      val viewProp =
        {
          get = fn x => get "view" GtkSourceViewClass.tOpt x,
          set = fn x => set "view" GtkSourceViewClass.tOpt x
        }
    end
  end
