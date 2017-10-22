structure GtkSourceCompletion :>
  GTK_SOURCE_COMPLETION
    where type 'a class = 'a GtkSourceCompletionClass.class
    where type 'a completion_info_class = 'a GtkSourceCompletionInfoClass.class
    where type 'a completion_provider_class = 'a GtkSourceCompletionProviderClass.class
    where type 'a completion_context_class = 'a GtkSourceCompletionContextClass.class
    where type 'a view_class = 'a GtkSourceViewClass.class =
  struct
    val getType_ = _import "gtk_source_completion_get_type" : unit -> GObjectType.FFI.val_;
    val addProvider_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_source_completion_add_provider" :
              GtkSourceCompletionClass.FFI.notnull GtkSourceCompletionClass.FFI.p
               * GtkSourceCompletionProviderClass.FFI.notnull GtkSourceCompletionProviderClass.FFI.p
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val blockInteractive_ = _import "gtk_source_completion_block_interactive" : GtkSourceCompletionClass.FFI.notnull GtkSourceCompletionClass.FFI.p -> unit;
    val createContext_ = fn x1 & x2 => (_import "gtk_source_completion_create_context" : GtkSourceCompletionClass.FFI.notnull GtkSourceCompletionClass.FFI.p * unit GtkTextIterRecord.FFI.p -> GtkSourceCompletionContextClass.FFI.notnull GtkSourceCompletionContextClass.FFI.p;) (x1, x2)
    val getInfoWindow_ = _import "gtk_source_completion_get_info_window" : GtkSourceCompletionClass.FFI.notnull GtkSourceCompletionClass.FFI.p -> GtkSourceCompletionInfoClass.FFI.notnull GtkSourceCompletionInfoClass.FFI.p;
    val getView_ = _import "gtk_source_completion_get_view" : GtkSourceCompletionClass.FFI.notnull GtkSourceCompletionClass.FFI.p -> unit GtkSourceViewClass.FFI.p;
    val hide_ = _import "gtk_source_completion_hide" : GtkSourceCompletionClass.FFI.notnull GtkSourceCompletionClass.FFI.p -> unit;
    val moveWindow_ = fn x1 & x2 => (_import "gtk_source_completion_move_window" : GtkSourceCompletionClass.FFI.notnull GtkSourceCompletionClass.FFI.p * GtkTextIterRecord.FFI.notnull GtkTextIterRecord.FFI.p -> unit;) (x1, x2)
    val removeProvider_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_source_completion_remove_provider" :
              GtkSourceCompletionClass.FFI.notnull GtkSourceCompletionClass.FFI.p
               * GtkSourceCompletionProviderClass.FFI.notnull GtkSourceCompletionProviderClass.FFI.p
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val unblockInteractive_ = _import "gtk_source_completion_unblock_interactive" : GtkSourceCompletionClass.FFI.notnull GtkSourceCompletionClass.FFI.p -> unit;
    type 'a class = 'a GtkSourceCompletionClass.class
    type 'a completion_info_class = 'a GtkSourceCompletionInfoClass.class
    type 'a completion_provider_class = 'a GtkSourceCompletionProviderClass.class
    type 'a completion_context_class = 'a GtkSourceCompletionContextClass.class
    type 'a view_class = 'a GtkSourceViewClass.class
    type t = base class
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr ---> GtkBuildableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun addProvider self provider =
      (
        GtkSourceCompletionClass.FFI.withPtr
         &&&> GtkSourceCompletionProviderClass.FFI.withPtr
         &&&> GLibErrorRecord.handleError
         ---> ignore
      )
        addProvider_
        (
          self
           & provider
           & []
        )
    fun blockInteractive self = (GtkSourceCompletionClass.FFI.withPtr ---> I) blockInteractive_ self
    fun createContext self position = (GtkSourceCompletionClass.FFI.withPtr &&&> GtkTextIterRecord.FFI.withOptPtr ---> GtkSourceCompletionContextClass.FFI.fromPtr false) createContext_ (self & position)
    fun getInfoWindow self = (GtkSourceCompletionClass.FFI.withPtr ---> GtkSourceCompletionInfoClass.FFI.fromPtr false) getInfoWindow_ self
    fun getView self = (GtkSourceCompletionClass.FFI.withPtr ---> GtkSourceViewClass.FFI.fromOptPtr false) getView_ self
    fun hide self = (GtkSourceCompletionClass.FFI.withPtr ---> I) hide_ self
    fun moveWindow self iter = (GtkSourceCompletionClass.FFI.withPtr &&&> GtkTextIterRecord.FFI.withPtr ---> I) moveWindow_ (self & iter)
    fun removeProvider self provider =
      (
        GtkSourceCompletionClass.FFI.withPtr
         &&&> GtkSourceCompletionProviderClass.FFI.withPtr
         &&&> GLibErrorRecord.handleError
         ---> ignore
      )
        removeProvider_
        (
          self
           & provider
           & []
        )
    fun unblockInteractive self = (GtkSourceCompletionClass.FFI.withPtr ---> I) unblockInteractive_ self
    local
      open ClosureMarshal Signal
    in
      fun activateProposalSig f = signal "activate-proposal" (void ---> ret_void) f
      fun hideSig f = signal "hide" (void ---> ret_void) f
      fun moveCursorSig f = signal "move-cursor" (get 0w1 GtkScrollStep.t &&&> get 0w2 int ---> ret_void) (fn step & num => f (step, num))
      fun movePageSig f = signal "move-page" (get 0w1 GtkScrollStep.t &&&> get 0w2 int ---> ret_void) (fn step & num => f (step, num))
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
