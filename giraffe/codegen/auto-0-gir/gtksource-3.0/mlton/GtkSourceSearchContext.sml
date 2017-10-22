structure GtkSourceSearchContext :>
  GTK_SOURCE_SEARCH_CONTEXT
    where type 'a class = 'a GtkSourceSearchContextClass.class
    where type 'a buffer_class = 'a GtkSourceBufferClass.class
    where type 'a style_class = 'a GtkSourceStyleClass.class
    where type 'a search_settings_class = 'a GtkSourceSearchSettingsClass.class =
  struct
    val getType_ = _import "gtk_source_search_context_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = fn x1 & x2 => (_import "gtk_source_search_context_new" : GtkSourceBufferClass.FFI.notnull GtkSourceBufferClass.FFI.p * unit GtkSourceSearchSettingsClass.FFI.p -> GtkSourceSearchContextClass.FFI.notnull GtkSourceSearchContextClass.FFI.p;) (x1, x2)
    val backward_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "gtk_source_search_context_backward" :
              GtkSourceSearchContextClass.FFI.notnull GtkSourceSearchContextClass.FFI.p
               * GtkTextIterRecord.FFI.notnull GtkTextIterRecord.FFI.p
               * GtkTextIterRecord.FFI.notnull GtkTextIterRecord.FFI.p
               * GtkTextIterRecord.FFI.notnull GtkTextIterRecord.FFI.p
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
              GtkSourceSearchContextClass.FFI.notnull GtkSourceSearchContextClass.FFI.p
               * GtkTextIterRecord.FFI.notnull GtkTextIterRecord.FFI.p
               * GtkTextIterRecord.FFI.notnull GtkTextIterRecord.FFI.p
               * GtkTextIterRecord.FFI.notnull GtkTextIterRecord.FFI.p
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
              GtkSourceSearchContextClass.FFI.notnull GtkSourceSearchContextClass.FFI.p
               * GioAsyncResultClass.FFI.notnull GioAsyncResultClass.FFI.p
               * GtkTextIterRecord.FFI.notnull GtkTextIterRecord.FFI.p
               * GtkTextIterRecord.FFI.notnull GtkTextIterRecord.FFI.p
               * (unit, unit) GLibErrorRecord.FFI.r
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
              GtkSourceSearchContextClass.FFI.notnull GtkSourceSearchContextClass.FFI.p
               * GioAsyncResultClass.FFI.notnull GioAsyncResultClass.FFI.p
               * GtkTextIterRecord.FFI.notnull GtkTextIterRecord.FFI.p
               * GtkTextIterRecord.FFI.notnull GtkTextIterRecord.FFI.p
               * GBool.FFI.ref_
               * (unit, unit) GLibErrorRecord.FFI.r
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
              GtkSourceSearchContextClass.FFI.notnull GtkSourceSearchContextClass.FFI.p
               * GtkTextIterRecord.FFI.notnull GtkTextIterRecord.FFI.p
               * GtkTextIterRecord.FFI.notnull GtkTextIterRecord.FFI.p
               * GtkTextIterRecord.FFI.notnull GtkTextIterRecord.FFI.p
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
              GtkSourceSearchContextClass.FFI.notnull GtkSourceSearchContextClass.FFI.p
               * GtkTextIterRecord.FFI.notnull GtkTextIterRecord.FFI.p
               * GtkTextIterRecord.FFI.notnull GtkTextIterRecord.FFI.p
               * GtkTextIterRecord.FFI.notnull GtkTextIterRecord.FFI.p
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
              GtkSourceSearchContextClass.FFI.notnull GtkSourceSearchContextClass.FFI.p
               * GioAsyncResultClass.FFI.notnull GioAsyncResultClass.FFI.p
               * GtkTextIterRecord.FFI.notnull GtkTextIterRecord.FFI.p
               * GtkTextIterRecord.FFI.notnull GtkTextIterRecord.FFI.p
               * (unit, unit) GLibErrorRecord.FFI.r
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
              GtkSourceSearchContextClass.FFI.notnull GtkSourceSearchContextClass.FFI.p
               * GioAsyncResultClass.FFI.notnull GioAsyncResultClass.FFI.p
               * GtkTextIterRecord.FFI.notnull GtkTextIterRecord.FFI.p
               * GtkTextIterRecord.FFI.notnull GtkTextIterRecord.FFI.p
               * GBool.FFI.ref_
               * (unit, unit) GLibErrorRecord.FFI.r
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
    val getBuffer_ = _import "gtk_source_search_context_get_buffer" : GtkSourceSearchContextClass.FFI.notnull GtkSourceSearchContextClass.FFI.p -> GtkSourceBufferClass.FFI.notnull GtkSourceBufferClass.FFI.p;
    val getHighlight_ = _import "gtk_source_search_context_get_highlight" : GtkSourceSearchContextClass.FFI.notnull GtkSourceSearchContextClass.FFI.p -> GBool.FFI.val_;
    val getMatchStyle_ = _import "gtk_source_search_context_get_match_style" : GtkSourceSearchContextClass.FFI.notnull GtkSourceSearchContextClass.FFI.p -> GtkSourceStyleClass.FFI.notnull GtkSourceStyleClass.FFI.p;
    val getOccurrencePosition_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_source_search_context_get_occurrence_position" :
              GtkSourceSearchContextClass.FFI.notnull GtkSourceSearchContextClass.FFI.p
               * GtkTextIterRecord.FFI.notnull GtkTextIterRecord.FFI.p
               * GtkTextIterRecord.FFI.notnull GtkTextIterRecord.FFI.p
               -> GInt.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val getOccurrencesCount_ = _import "gtk_source_search_context_get_occurrences_count" : GtkSourceSearchContextClass.FFI.notnull GtkSourceSearchContextClass.FFI.p -> GInt.FFI.val_;
    val getSettings_ = _import "gtk_source_search_context_get_settings" : GtkSourceSearchContextClass.FFI.notnull GtkSourceSearchContextClass.FFI.p -> GtkSourceSearchSettingsClass.FFI.notnull GtkSourceSearchSettingsClass.FFI.p;
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
              GtkSourceSearchContextClass.FFI.notnull GtkSourceSearchContextClass.FFI.p
               * GtkTextIterRecord.FFI.notnull GtkTextIterRecord.FFI.p
               * GtkTextIterRecord.FFI.notnull GtkTextIterRecord.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * GInt.FFI.val_
               * (unit, unit) GLibErrorRecord.FFI.r
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
              GtkSourceSearchContextClass.FFI.notnull GtkSourceSearchContextClass.FFI.p
               * GtkTextIterRecord.FFI.notnull GtkTextIterRecord.FFI.p
               * GtkTextIterRecord.FFI.notnull GtkTextIterRecord.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * GInt.FFI.val_
               * (unit, unit) GLibErrorRecord.FFI.r
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
              GtkSourceSearchContextClass.FFI.notnull GtkSourceSearchContextClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * GInt.FFI.val_
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GUInt.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val setHighlight_ = fn x1 & x2 => (_import "gtk_source_search_context_set_highlight" : GtkSourceSearchContextClass.FFI.notnull GtkSourceSearchContextClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setMatchStyle_ = fn x1 & x2 => (_import "gtk_source_search_context_set_match_style" : GtkSourceSearchContextClass.FFI.notnull GtkSourceSearchContextClass.FFI.p * unit GtkSourceStyleClass.FFI.p -> unit;) (x1, x2)
    val setSettings_ = fn x1 & x2 => (_import "gtk_source_search_context_set_settings" : GtkSourceSearchContextClass.FFI.notnull GtkSourceSearchContextClass.FFI.p * unit GtkSourceSearchSettingsClass.FFI.p -> unit;) (x1, x2)
    type 'a class = 'a GtkSourceSearchContextClass.class
    type 'a buffer_class = 'a GtkSourceBufferClass.class
    type 'a style_class = 'a GtkSourceStyleClass.class
    type 'a search_settings_class = 'a GtkSourceSearchSettingsClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new (buffer, settings) = (GtkSourceBufferClass.FFI.withPtr &&&> GtkSourceSearchSettingsClass.FFI.withOptPtr ---> GtkSourceSearchContextClass.FFI.fromPtr true) new_ (buffer & settings)
    fun backward self iter =
      let
        val matchStart
         & matchEnd
         & retVal =
          (
            GtkSourceSearchContextClass.FFI.withPtr
             &&&> GtkTextIterRecord.FFI.withPtr
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
            GtkSourceSearchContextClass.FFI.withPtr
             &&&> GtkTextIterRecord.FFI.withPtr
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
            GtkSourceSearchContextClass.FFI.withPtr
             &&&> GioAsyncResultClass.FFI.withPtr
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
            GtkSourceSearchContextClass.FFI.withPtr
             &&&> GioAsyncResultClass.FFI.withPtr
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
            GtkSourceSearchContextClass.FFI.withPtr
             &&&> GtkTextIterRecord.FFI.withPtr
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
            GtkSourceSearchContextClass.FFI.withPtr
             &&&> GtkTextIterRecord.FFI.withPtr
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
            GtkSourceSearchContextClass.FFI.withPtr
             &&&> GioAsyncResultClass.FFI.withPtr
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
            GtkSourceSearchContextClass.FFI.withPtr
             &&&> GioAsyncResultClass.FFI.withPtr
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
    fun getBuffer self = (GtkSourceSearchContextClass.FFI.withPtr ---> GtkSourceBufferClass.FFI.fromPtr false) getBuffer_ self
    fun getHighlight self = (GtkSourceSearchContextClass.FFI.withPtr ---> GBool.FFI.fromVal) getHighlight_ self
    fun getMatchStyle self = (GtkSourceSearchContextClass.FFI.withPtr ---> GtkSourceStyleClass.FFI.fromPtr false) getMatchStyle_ self
    fun getOccurrencePosition self (matchStart, matchEnd) =
      (
        GtkSourceSearchContextClass.FFI.withPtr
         &&&> GtkTextIterRecord.FFI.withPtr
         &&&> GtkTextIterRecord.FFI.withPtr
         ---> GInt.FFI.fromVal
      )
        getOccurrencePosition_
        (
          self
           & matchStart
           & matchEnd
        )
    fun getOccurrencesCount self = (GtkSourceSearchContextClass.FFI.withPtr ---> GInt.FFI.fromVal) getOccurrencesCount_ self
    fun getSettings self = (GtkSourceSearchContextClass.FFI.withPtr ---> GtkSourceSearchSettingsClass.FFI.fromPtr false) getSettings_ self
    fun replace
      self
      (
        matchStart,
        matchEnd,
        replace,
        replaceLength
      ) =
      (
        GtkSourceSearchContextClass.FFI.withPtr
         &&&> GtkTextIterRecord.FFI.withPtr
         &&&> GtkTextIterRecord.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GInt.FFI.withVal
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
        GtkSourceSearchContextClass.FFI.withPtr
         &&&> GtkTextIterRecord.FFI.withPtr
         &&&> GtkTextIterRecord.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GInt.FFI.withVal
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
        GtkSourceSearchContextClass.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GInt.FFI.withVal
         &&&> GLibErrorRecord.handleError
         ---> GUInt.FFI.fromVal
      )
        replaceAll_
        (
          self
           & replace
           & replaceLength
           & []
        )
    fun setHighlight self highlight = (GtkSourceSearchContextClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setHighlight_ (self & highlight)
    fun setMatchStyle self matchStyle = (GtkSourceSearchContextClass.FFI.withPtr &&&> GtkSourceStyleClass.FFI.withOptPtr ---> I) setMatchStyle_ (self & matchStyle)
    fun setSettings self settings = (GtkSourceSearchContextClass.FFI.withPtr &&&> GtkSourceSearchSettingsClass.FFI.withOptPtr ---> I) setSettings_ (self & settings)
    local
      open Property
    in
      val bufferProp =
        {
          get = fn x => get "buffer" GtkSourceBufferClass.tOpt x,
          set = fn x => set "buffer" GtkSourceBufferClass.tOpt x
        }
      val highlightProp =
        {
          get = fn x => get "highlight" boolean x,
          set = fn x => set "highlight" boolean x
        }
      val matchStyleProp =
        {
          get = fn x => get "match-style" GtkSourceStyleClass.tOpt x,
          set = fn x => set "match-style" GtkSourceStyleClass.tOpt x
        }
      val occurrencesCountProp = {get = fn x => get "occurrences-count" int x}
      val settingsProp =
        {
          get = fn x => get "settings" GtkSourceSearchSettingsClass.tOpt x,
          set = fn x => set "settings" GtkSourceSearchSettingsClass.tOpt x
        }
    end
  end
