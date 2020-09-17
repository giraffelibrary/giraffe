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
              GtkSourceCompletionClass.FFI.non_opt GtkSourceCompletionClass.FFI.p
               * GtkSourceCompletionProviderClass.FFI.non_opt GtkSourceCompletionProviderClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val blockInteractive_ = _import "gtk_source_completion_block_interactive" : GtkSourceCompletionClass.FFI.non_opt GtkSourceCompletionClass.FFI.p -> unit;
    val createContext_ = fn x1 & x2 => (_import "gtk_source_completion_create_context" : GtkSourceCompletionClass.FFI.non_opt GtkSourceCompletionClass.FFI.p * GtkTextIterRecord.FFI.opt GtkTextIterRecord.FFI.p -> GtkSourceCompletionContextClass.FFI.non_opt GtkSourceCompletionContextClass.FFI.p;) (x1, x2)
    val getInfoWindow_ = _import "gtk_source_completion_get_info_window" : GtkSourceCompletionClass.FFI.non_opt GtkSourceCompletionClass.FFI.p -> GtkSourceCompletionInfoClass.FFI.non_opt GtkSourceCompletionInfoClass.FFI.p;
    val getView_ = _import "gtk_source_completion_get_view" : GtkSourceCompletionClass.FFI.non_opt GtkSourceCompletionClass.FFI.p -> GtkSourceViewClass.FFI.opt GtkSourceViewClass.FFI.p;
    val hide_ = _import "gtk_source_completion_hide" : GtkSourceCompletionClass.FFI.non_opt GtkSourceCompletionClass.FFI.p -> unit;
    val moveWindow_ = fn x1 & x2 => (_import "gtk_source_completion_move_window" : GtkSourceCompletionClass.FFI.non_opt GtkSourceCompletionClass.FFI.p * GtkTextIterRecord.FFI.non_opt GtkTextIterRecord.FFI.p -> unit;) (x1, x2)
    val removeProvider_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_source_completion_remove_provider" :
              GtkSourceCompletionClass.FFI.non_opt GtkSourceCompletionClass.FFI.p
               * GtkSourceCompletionProviderClass.FFI.non_opt GtkSourceCompletionProviderClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val unblockInteractive_ = _import "gtk_source_completion_unblock_interactive" : GtkSourceCompletionClass.FFI.non_opt GtkSourceCompletionClass.FFI.p -> unit;
    type 'a class = 'a GtkSourceCompletionClass.class
    type 'a completion_info_class = 'a GtkSourceCompletionInfoClass.class
    type 'a completion_provider_class = 'a GtkSourceCompletionProviderClass.class
    type 'a completion_context_class = 'a GtkSourceCompletionContextClass.class
    type 'a view_class = 'a GtkSourceViewClass.class
    type t = base class
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr false ---> GtkBuildableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun addProvider self provider =
      (
        GtkSourceCompletionClass.FFI.withPtr false
         &&&> GtkSourceCompletionProviderClass.FFI.withPtr false
         &&&> GLibErrorRecord.handleError
         ---> ignore
      )
        addProvider_
        (
          self
           & provider
           & []
        )
    fun blockInteractive self = (GtkSourceCompletionClass.FFI.withPtr false ---> I) blockInteractive_ self
    fun createContext self position = (GtkSourceCompletionClass.FFI.withPtr false &&&> GtkTextIterRecord.FFI.withOptPtr false ---> GtkSourceCompletionContextClass.FFI.fromPtr false) createContext_ (self & position) before GtkSourceCompletionClass.FFI.touchPtr self before GtkTextIterRecord.FFI.touchOptPtr position
    fun getInfoWindow self = (GtkSourceCompletionClass.FFI.withPtr false ---> GtkSourceCompletionInfoClass.FFI.fromPtr false) getInfoWindow_ self before GtkSourceCompletionClass.FFI.touchPtr self
    fun getView self = (GtkSourceCompletionClass.FFI.withPtr false ---> GtkSourceViewClass.FFI.fromOptPtr false) getView_ self before GtkSourceCompletionClass.FFI.touchPtr self
    fun hide self = (GtkSourceCompletionClass.FFI.withPtr false ---> I) hide_ self
    fun moveWindow self iter = (GtkSourceCompletionClass.FFI.withPtr false &&&> GtkTextIterRecord.FFI.withPtr false ---> I) moveWindow_ (self & iter)
    fun removeProvider self provider =
      (
        GtkSourceCompletionClass.FFI.withPtr false
         &&&> GtkSourceCompletionProviderClass.FFI.withPtr false
         &&&> GLibErrorRecord.handleError
         ---> ignore
      )
        removeProvider_
        (
          self
           & provider
           & []
        )
    fun unblockInteractive self = (GtkSourceCompletionClass.FFI.withPtr false ---> I) unblockInteractive_ self
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
      open ValueAccessor
    in
      val acceleratorsProp =
        {
          name = "accelerators",
          gtype = fn () => C.gtype uint (),
          get = fn x => fn () => C.get uint x,
          set = fn x => C.set uint x,
          init = fn x => C.set uint x
        }
      val autoCompleteDelayProp =
        {
          name = "auto-complete-delay",
          gtype = fn () => C.gtype uint (),
          get = fn x => fn () => C.get uint x,
          set = fn x => C.set uint x,
          init = fn x => C.set uint x
        }
      val proposalPageSizeProp =
        {
          name = "proposal-page-size",
          gtype = fn () => C.gtype uint (),
          get = fn x => fn () => C.get uint x,
          set = fn x => C.set uint x,
          init = fn x => C.set uint x
        }
      val providerPageSizeProp =
        {
          name = "provider-page-size",
          gtype = fn () => C.gtype uint (),
          get = fn x => fn () => C.get uint x,
          set = fn x => C.set uint x,
          init = fn x => C.set uint x
        }
      val rememberInfoVisibilityProp =
        {
          name = "remember-info-visibility",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val selectOnShowProp =
        {
          name = "select-on-show",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val showHeadersProp =
        {
          name = "show-headers",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val showIconsProp =
        {
          name = "show-icons",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val viewProp =
        {
          name = "view",
          gtype = fn () => C.gtype GtkSourceViewClass.tOpt (),
          get = fn x => fn () => C.get GtkSourceViewClass.tOpt x,
          set = ignore,
          init = fn x => C.set GtkSourceViewClass.tOpt x
        }
    end
  end
