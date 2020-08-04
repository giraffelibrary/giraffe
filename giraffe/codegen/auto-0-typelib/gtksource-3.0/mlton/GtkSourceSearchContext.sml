structure GtkSourceSearchContext :>
  GTK_SOURCE_SEARCH_CONTEXT
    where type 'a class = 'a GtkSourceSearchContextClass.class
    where type 'a buffer_class = 'a GtkSourceBufferClass.class
    where type 'a style_class = 'a GtkSourceStyleClass.class
    where type 'a search_settings_class = 'a GtkSourceSearchSettingsClass.class =
  struct
    val getType_ = _import "gtk_source_search_context_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = fn x1 & x2 => (_import "gtk_source_search_context_new" : GtkSourceBufferClass.FFI.non_opt GtkSourceBufferClass.FFI.p * GtkSourceSearchSettingsClass.FFI.opt GtkSourceSearchSettingsClass.FFI.p -> GtkSourceSearchContextClass.FFI.non_opt GtkSourceSearchContextClass.FFI.p;) (x1, x2)
    val backward_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "gtk_source_search_context_backward" :
              GtkSourceSearchContextClass.FFI.non_opt GtkSourceSearchContextClass.FFI.p
               * GtkTextIterRecord.FFI.non_opt GtkTextIterRecord.FFI.p
               * GtkTextIterRecord.FFI.non_opt GtkTextIterRecord.FFI.p
               * GtkTextIterRecord.FFI.non_opt GtkTextIterRecord.FFI.p
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val backward2_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5 =>
          (
            _import "gtk_source_search_context_backward2" :
              GtkSourceSearchContextClass.FFI.non_opt GtkSourceSearchContextClass.FFI.p
               * GtkTextIterRecord.FFI.non_opt GtkTextIterRecord.FFI.p
               * GtkTextIterRecord.FFI.non_opt GtkTextIterRecord.FFI.p
               * GtkTextIterRecord.FFI.non_opt GtkTextIterRecord.FFI.p
               * GBool.FFI.ref_
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val backwardFinish_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5 =>
          (
            _import "gtk_source_search_context_backward_finish" :
              GtkSourceSearchContextClass.FFI.non_opt GtkSourceSearchContextClass.FFI.p
               * GioAsyncResultClass.FFI.non_opt GioAsyncResultClass.FFI.p
               * GtkTextIterRecord.FFI.non_opt GtkTextIterRecord.FFI.p
               * GtkTextIterRecord.FFI.non_opt GtkTextIterRecord.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val backwardFinish2_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5
         & x6 =>
          (
            _import "gtk_source_search_context_backward_finish2" :
              GtkSourceSearchContextClass.FFI.non_opt GtkSourceSearchContextClass.FFI.p
               * GioAsyncResultClass.FFI.non_opt GioAsyncResultClass.FFI.p
               * GtkTextIterRecord.FFI.non_opt GtkTextIterRecord.FFI.p
               * GtkTextIterRecord.FFI.non_opt GtkTextIterRecord.FFI.p
               * GBool.FFI.ref_
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6
            )
    val forward_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "gtk_source_search_context_forward" :
              GtkSourceSearchContextClass.FFI.non_opt GtkSourceSearchContextClass.FFI.p
               * GtkTextIterRecord.FFI.non_opt GtkTextIterRecord.FFI.p
               * GtkTextIterRecord.FFI.non_opt GtkTextIterRecord.FFI.p
               * GtkTextIterRecord.FFI.non_opt GtkTextIterRecord.FFI.p
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val forward2_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5 =>
          (
            _import "gtk_source_search_context_forward2" :
              GtkSourceSearchContextClass.FFI.non_opt GtkSourceSearchContextClass.FFI.p
               * GtkTextIterRecord.FFI.non_opt GtkTextIterRecord.FFI.p
               * GtkTextIterRecord.FFI.non_opt GtkTextIterRecord.FFI.p
               * GtkTextIterRecord.FFI.non_opt GtkTextIterRecord.FFI.p
               * GBool.FFI.ref_
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val forwardFinish_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5 =>
          (
            _import "gtk_source_search_context_forward_finish" :
              GtkSourceSearchContextClass.FFI.non_opt GtkSourceSearchContextClass.FFI.p
               * GioAsyncResultClass.FFI.non_opt GioAsyncResultClass.FFI.p
               * GtkTextIterRecord.FFI.non_opt GtkTextIterRecord.FFI.p
               * GtkTextIterRecord.FFI.non_opt GtkTextIterRecord.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val forwardFinish2_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5
         & x6 =>
          (
            _import "gtk_source_search_context_forward_finish2" :
              GtkSourceSearchContextClass.FFI.non_opt GtkSourceSearchContextClass.FFI.p
               * GioAsyncResultClass.FFI.non_opt GioAsyncResultClass.FFI.p
               * GtkTextIterRecord.FFI.non_opt GtkTextIterRecord.FFI.p
               * GtkTextIterRecord.FFI.non_opt GtkTextIterRecord.FFI.p
               * GBool.FFI.ref_
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6
            )
    val getBuffer_ = _import "gtk_source_search_context_get_buffer" : GtkSourceSearchContextClass.FFI.non_opt GtkSourceSearchContextClass.FFI.p -> GtkSourceBufferClass.FFI.non_opt GtkSourceBufferClass.FFI.p;
    val getHighlight_ = _import "gtk_source_search_context_get_highlight" : GtkSourceSearchContextClass.FFI.non_opt GtkSourceSearchContextClass.FFI.p -> GBool.FFI.val_;
    val getMatchStyle_ = _import "gtk_source_search_context_get_match_style" : GtkSourceSearchContextClass.FFI.non_opt GtkSourceSearchContextClass.FFI.p -> GtkSourceStyleClass.FFI.non_opt GtkSourceStyleClass.FFI.p;
    val getOccurrencePosition_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_source_search_context_get_occurrence_position" :
              GtkSourceSearchContextClass.FFI.non_opt GtkSourceSearchContextClass.FFI.p
               * GtkTextIterRecord.FFI.non_opt GtkTextIterRecord.FFI.p
               * GtkTextIterRecord.FFI.non_opt GtkTextIterRecord.FFI.p
               -> GInt32.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val getOccurrencesCount_ = _import "gtk_source_search_context_get_occurrences_count" : GtkSourceSearchContextClass.FFI.non_opt GtkSourceSearchContextClass.FFI.p -> GInt32.FFI.val_;
    val getSettings_ = _import "gtk_source_search_context_get_settings" : GtkSourceSearchContextClass.FFI.non_opt GtkSourceSearchContextClass.FFI.p -> GtkSourceSearchSettingsClass.FFI.non_opt GtkSourceSearchSettingsClass.FFI.p;
    val replace_ =
      fn
        x1
         & x2
         & x3
         & (x4, x5)
         & x6
         & x7 =>
          (
            _import "mlton_gtk_source_search_context_replace" :
              GtkSourceSearchContextClass.FFI.non_opt GtkSourceSearchContextClass.FFI.p
               * GtkTextIterRecord.FFI.non_opt GtkTextIterRecord.FFI.p
               * GtkTextIterRecord.FFI.non_opt GtkTextIterRecord.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GInt32.FFI.val_
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6,
              x7
            )
    val replace2_ =
      fn
        x1
         & x2
         & x3
         & (x4, x5)
         & x6
         & x7 =>
          (
            _import "mlton_gtk_source_search_context_replace2" :
              GtkSourceSearchContextClass.FFI.non_opt GtkSourceSearchContextClass.FFI.p
               * GtkTextIterRecord.FFI.non_opt GtkTextIterRecord.FFI.p
               * GtkTextIterRecord.FFI.non_opt GtkTextIterRecord.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GInt32.FFI.val_
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6,
              x7
            )
    val replaceAll_ =
      fn
        x1
         & (x2, x3)
         & x4
         & x5 =>
          (
            _import "mlton_gtk_source_search_context_replace_all" :
              GtkSourceSearchContextClass.FFI.non_opt GtkSourceSearchContextClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GInt32.FFI.val_
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GUInt32.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val setHighlight_ = fn x1 & x2 => (_import "gtk_source_search_context_set_highlight" : GtkSourceSearchContextClass.FFI.non_opt GtkSourceSearchContextClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setMatchStyle_ = fn x1 & x2 => (_import "gtk_source_search_context_set_match_style" : GtkSourceSearchContextClass.FFI.non_opt GtkSourceSearchContextClass.FFI.p * GtkSourceStyleClass.FFI.opt GtkSourceStyleClass.FFI.p -> unit;) (x1, x2)
    val setSettings_ = fn x1 & x2 => (_import "gtk_source_search_context_set_settings" : GtkSourceSearchContextClass.FFI.non_opt GtkSourceSearchContextClass.FFI.p * GtkSourceSearchSettingsClass.FFI.opt GtkSourceSearchSettingsClass.FFI.p -> unit;) (x1, x2)
    type 'a class = 'a GtkSourceSearchContextClass.class
    type 'a buffer_class = 'a GtkSourceBufferClass.class
    type 'a style_class = 'a GtkSourceStyleClass.class
    type 'a search_settings_class = 'a GtkSourceSearchSettingsClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new (buffer, settings) = (GtkSourceBufferClass.FFI.withPtr false &&&> GtkSourceSearchSettingsClass.FFI.withOptPtr false ---> GtkSourceSearchContextClass.FFI.fromPtr true) new_ (buffer & settings)
    fun backward self iter =
      let
        val matchStart
         & matchEnd
         & retVal =
          (
            GtkSourceSearchContextClass.FFI.withPtr false
             &&&> GtkTextIterRecord.FFI.withPtr false
             &&&> GtkTextIterRecord.FFI.withNewPtr
             &&&> GtkTextIterRecord.FFI.withNewPtr
             ---> GtkTextIterRecord.FFI.fromPtr true
                   && GtkTextIterRecord.FFI.fromPtr true
                   && GBool.FFI.fromVal
          )
            backward_
            (
              self
               & iter
               & ()
               & ()
            )
      in
        if retVal then SOME (matchStart, matchEnd) else NONE
      end
    fun backward2 self iter =
      let
        val matchStart
         & matchEnd
         & hasWrappedAround
         & retVal =
          (
            GtkSourceSearchContextClass.FFI.withPtr false
             &&&> GtkTextIterRecord.FFI.withPtr false
             &&&> GtkTextIterRecord.FFI.withNewPtr
             &&&> GtkTextIterRecord.FFI.withNewPtr
             &&&> GBool.FFI.withRefVal
             ---> GtkTextIterRecord.FFI.fromPtr true
                   && GtkTextIterRecord.FFI.fromPtr true
                   && GBool.FFI.fromVal
                   && GBool.FFI.fromVal
          )
            backward2_
            (
              self
               & iter
               & ()
               & ()
               & GBool.null
            )
      in
        if retVal
        then
          SOME
            (
              matchStart,
              matchEnd,
              hasWrappedAround
            )
        else NONE
      end
    fun backwardFinish self result =
      let
        val matchStart
         & matchEnd
         & () =
          (
            GtkSourceSearchContextClass.FFI.withPtr false
             &&&> GioAsyncResultClass.FFI.withPtr false
             &&&> GtkTextIterRecord.FFI.withNewPtr
             &&&> GtkTextIterRecord.FFI.withNewPtr
             &&&> GLibErrorRecord.handleError
             ---> GtkTextIterRecord.FFI.fromPtr true
                   && GtkTextIterRecord.FFI.fromPtr true
                   && ignore
          )
            backwardFinish_
            (
              self
               & result
               & ()
               & ()
               & []
            )
      in
        (matchStart, matchEnd)
      end
    fun backwardFinish2 self result =
      let
        val matchStart
         & matchEnd
         & hasWrappedAround
         & () =
          (
            GtkSourceSearchContextClass.FFI.withPtr false
             &&&> GioAsyncResultClass.FFI.withPtr false
             &&&> GtkTextIterRecord.FFI.withNewPtr
             &&&> GtkTextIterRecord.FFI.withNewPtr
             &&&> GBool.FFI.withRefVal
             &&&> GLibErrorRecord.handleError
             ---> GtkTextIterRecord.FFI.fromPtr true
                   && GtkTextIterRecord.FFI.fromPtr true
                   && GBool.FFI.fromVal
                   && ignore
          )
            backwardFinish2_
            (
              self
               & result
               & ()
               & ()
               & GBool.null
               & []
            )
      in
        (
          matchStart,
          matchEnd,
          hasWrappedAround
        )
      end
    fun forward self iter =
      let
        val matchStart
         & matchEnd
         & retVal =
          (
            GtkSourceSearchContextClass.FFI.withPtr false
             &&&> GtkTextIterRecord.FFI.withPtr false
             &&&> GtkTextIterRecord.FFI.withNewPtr
             &&&> GtkTextIterRecord.FFI.withNewPtr
             ---> GtkTextIterRecord.FFI.fromPtr true
                   && GtkTextIterRecord.FFI.fromPtr true
                   && GBool.FFI.fromVal
          )
            forward_
            (
              self
               & iter
               & ()
               & ()
            )
      in
        if retVal then SOME (matchStart, matchEnd) else NONE
      end
    fun forward2 self iter =
      let
        val matchStart
         & matchEnd
         & hasWrappedAround
         & retVal =
          (
            GtkSourceSearchContextClass.FFI.withPtr false
             &&&> GtkTextIterRecord.FFI.withPtr false
             &&&> GtkTextIterRecord.FFI.withNewPtr
             &&&> GtkTextIterRecord.FFI.withNewPtr
             &&&> GBool.FFI.withRefVal
             ---> GtkTextIterRecord.FFI.fromPtr true
                   && GtkTextIterRecord.FFI.fromPtr true
                   && GBool.FFI.fromVal
                   && GBool.FFI.fromVal
          )
            forward2_
            (
              self
               & iter
               & ()
               & ()
               & GBool.null
            )
      in
        if retVal
        then
          SOME
            (
              matchStart,
              matchEnd,
              hasWrappedAround
            )
        else NONE
      end
    fun forwardFinish self result =
      let
        val matchStart
         & matchEnd
         & () =
          (
            GtkSourceSearchContextClass.FFI.withPtr false
             &&&> GioAsyncResultClass.FFI.withPtr false
             &&&> GtkTextIterRecord.FFI.withNewPtr
             &&&> GtkTextIterRecord.FFI.withNewPtr
             &&&> GLibErrorRecord.handleError
             ---> GtkTextIterRecord.FFI.fromPtr true
                   && GtkTextIterRecord.FFI.fromPtr true
                   && ignore
          )
            forwardFinish_
            (
              self
               & result
               & ()
               & ()
               & []
            )
      in
        (matchStart, matchEnd)
      end
    fun forwardFinish2 self result =
      let
        val matchStart
         & matchEnd
         & hasWrappedAround
         & () =
          (
            GtkSourceSearchContextClass.FFI.withPtr false
             &&&> GioAsyncResultClass.FFI.withPtr false
             &&&> GtkTextIterRecord.FFI.withNewPtr
             &&&> GtkTextIterRecord.FFI.withNewPtr
             &&&> GBool.FFI.withRefVal
             &&&> GLibErrorRecord.handleError
             ---> GtkTextIterRecord.FFI.fromPtr true
                   && GtkTextIterRecord.FFI.fromPtr true
                   && GBool.FFI.fromVal
                   && ignore
          )
            forwardFinish2_
            (
              self
               & result
               & ()
               & ()
               & GBool.null
               & []
            )
      in
        (
          matchStart,
          matchEnd,
          hasWrappedAround
        )
      end
    fun getBuffer self = (GtkSourceSearchContextClass.FFI.withPtr false ---> GtkSourceBufferClass.FFI.fromPtr false) getBuffer_ self
    fun getHighlight self = (GtkSourceSearchContextClass.FFI.withPtr false ---> GBool.FFI.fromVal) getHighlight_ self
    fun getMatchStyle self = (GtkSourceSearchContextClass.FFI.withPtr false ---> GtkSourceStyleClass.FFI.fromPtr false) getMatchStyle_ self
    fun getOccurrencePosition self (matchStart, matchEnd) =
      (
        GtkSourceSearchContextClass.FFI.withPtr false
         &&&> GtkTextIterRecord.FFI.withPtr false
         &&&> GtkTextIterRecord.FFI.withPtr false
         ---> GInt32.FFI.fromVal
      )
        getOccurrencePosition_
        (
          self
           & matchStart
           & matchEnd
        )
    fun getOccurrencesCount self = (GtkSourceSearchContextClass.FFI.withPtr false ---> GInt32.FFI.fromVal) getOccurrencesCount_ self
    fun getSettings self = (GtkSourceSearchContextClass.FFI.withPtr false ---> GtkSourceSearchSettingsClass.FFI.fromPtr false) getSettings_ self
    fun replace
      self
      (
        matchStart,
        matchEnd,
        replace,
        replaceLength
      ) =
      (
        GtkSourceSearchContextClass.FFI.withPtr false
         &&&> GtkTextIterRecord.FFI.withPtr false
         &&&> GtkTextIterRecord.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         &&&> GInt32.FFI.withVal
         &&&> GLibErrorRecord.handleError
         ---> ignore
      )
        replace_
        (
          self
           & matchStart
           & matchEnd
           & replace
           & replaceLength
           & []
        )
    fun replace2
      self
      (
        matchStart,
        matchEnd,
        replace,
        replaceLength
      ) =
      (
        GtkSourceSearchContextClass.FFI.withPtr false
         &&&> GtkTextIterRecord.FFI.withPtr false
         &&&> GtkTextIterRecord.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         &&&> GInt32.FFI.withVal
         &&&> GLibErrorRecord.handleError
         ---> ignore
      )
        replace2_
        (
          self
           & matchStart
           & matchEnd
           & replace
           & replaceLength
           & []
        )
    fun replaceAll self (replace, replaceLength) =
      (
        GtkSourceSearchContextClass.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         &&&> GInt32.FFI.withVal
         &&&> GLibErrorRecord.handleError
         ---> GUInt32.FFI.fromVal
      )
        replaceAll_
        (
          self
           & replace
           & replaceLength
           & []
        )
    fun setHighlight self highlight = (GtkSourceSearchContextClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setHighlight_ (self & highlight)
    fun setMatchStyle self matchStyle = (GtkSourceSearchContextClass.FFI.withPtr false &&&> GtkSourceStyleClass.FFI.withOptPtr false ---> I) setMatchStyle_ (self & matchStyle)
    fun setSettings self settings = (GtkSourceSearchContextClass.FFI.withPtr false &&&> GtkSourceSearchSettingsClass.FFI.withOptPtr false ---> I) setSettings_ (self & settings)
    local
      open Property
    in
      val bufferProp =
        {
          get = fn x => get "buffer" GtkSourceBufferClass.tOpt x,
          new = fn x => new "buffer" GtkSourceBufferClass.tOpt x
        }
      val highlightProp =
        {
          get = fn x => get "highlight" boolean x,
          set = fn x => set "highlight" boolean x,
          new = fn x => new "highlight" boolean x
        }
      val matchStyleProp =
        {
          get = fn x => get "match-style" GtkSourceStyleClass.tOpt x,
          set = fn x => set "match-style" GtkSourceStyleClass.tOpt x,
          new = fn x => new "match-style" GtkSourceStyleClass.tOpt x
        }
      val occurrencesCountProp = {get = fn x => get "occurrences-count" int x}
      val settingsProp =
        {
          get = fn x => get "settings" GtkSourceSearchSettingsClass.tOpt x,
          set = fn x => set "settings" GtkSourceSearchSettingsClass.tOpt x,
          new = fn x => new "settings" GtkSourceSearchSettingsClass.tOpt x
        }
    end
  end
