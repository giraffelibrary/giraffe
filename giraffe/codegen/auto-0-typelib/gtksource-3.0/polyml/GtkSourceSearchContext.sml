structure GtkSourceSearchContext :>
  GTK_SOURCE_SEARCH_CONTEXT
    where type 'a class = 'a GtkSourceSearchContextClass.class
    where type 'a buffer_class = 'a GtkSourceBufferClass.class
    where type 'a style_class = 'a GtkSourceStyleClass.class
    where type 'a search_settings_class = 'a GtkSourceSearchSettingsClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_source_search_context_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "gtk_source_search_context_new") (GtkSourceBufferClass.PolyML.cPtr &&> GtkSourceSearchSettingsClass.PolyML.cOptPtr --> GtkSourceSearchContextClass.PolyML.cPtr)
      val backward_ =
        call (getSymbol "gtk_source_search_context_backward")
          (
            GtkSourceSearchContextClass.PolyML.cPtr
             &&> GtkTextIterRecord.PolyML.cPtr
             &&> GtkTextIterRecord.PolyML.cPtr
             &&> GtkTextIterRecord.PolyML.cPtr
             --> GBool.PolyML.cVal
          )
      val backward2_ =
        call (getSymbol "gtk_source_search_context_backward2")
          (
            GtkSourceSearchContextClass.PolyML.cPtr
             &&> GtkTextIterRecord.PolyML.cPtr
             &&> GtkTextIterRecord.PolyML.cPtr
             &&> GtkTextIterRecord.PolyML.cPtr
             &&> GBool.PolyML.cRef
             --> GBool.PolyML.cVal
          )
      val backwardFinish_ =
        call (getSymbol "gtk_source_search_context_backward_finish")
          (
            GtkSourceSearchContextClass.PolyML.cPtr
             &&> GioAsyncResultClass.PolyML.cPtr
             &&> GtkTextIterRecord.PolyML.cPtr
             &&> GtkTextIterRecord.PolyML.cPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
      val backwardFinish2_ =
        call (getSymbol "gtk_source_search_context_backward_finish2")
          (
            GtkSourceSearchContextClass.PolyML.cPtr
             &&> GioAsyncResultClass.PolyML.cPtr
             &&> GtkTextIterRecord.PolyML.cPtr
             &&> GtkTextIterRecord.PolyML.cPtr
             &&> GBool.PolyML.cRef
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
      val forward_ =
        call (getSymbol "gtk_source_search_context_forward")
          (
            GtkSourceSearchContextClass.PolyML.cPtr
             &&> GtkTextIterRecord.PolyML.cPtr
             &&> GtkTextIterRecord.PolyML.cPtr
             &&> GtkTextIterRecord.PolyML.cPtr
             --> GBool.PolyML.cVal
          )
      val forward2_ =
        call (getSymbol "gtk_source_search_context_forward2")
          (
            GtkSourceSearchContextClass.PolyML.cPtr
             &&> GtkTextIterRecord.PolyML.cPtr
             &&> GtkTextIterRecord.PolyML.cPtr
             &&> GtkTextIterRecord.PolyML.cPtr
             &&> GBool.PolyML.cRef
             --> GBool.PolyML.cVal
          )
      val forwardFinish_ =
        call (getSymbol "gtk_source_search_context_forward_finish")
          (
            GtkSourceSearchContextClass.PolyML.cPtr
             &&> GioAsyncResultClass.PolyML.cPtr
             &&> GtkTextIterRecord.PolyML.cPtr
             &&> GtkTextIterRecord.PolyML.cPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
      val forwardFinish2_ =
        call (getSymbol "gtk_source_search_context_forward_finish2")
          (
            GtkSourceSearchContextClass.PolyML.cPtr
             &&> GioAsyncResultClass.PolyML.cPtr
             &&> GtkTextIterRecord.PolyML.cPtr
             &&> GtkTextIterRecord.PolyML.cPtr
             &&> GBool.PolyML.cRef
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
      val getBuffer_ = call (getSymbol "gtk_source_search_context_get_buffer") (GtkSourceSearchContextClass.PolyML.cPtr --> GtkSourceBufferClass.PolyML.cPtr)
      val getHighlight_ = call (getSymbol "gtk_source_search_context_get_highlight") (GtkSourceSearchContextClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getMatchStyle_ = call (getSymbol "gtk_source_search_context_get_match_style") (GtkSourceSearchContextClass.PolyML.cPtr --> GtkSourceStyleClass.PolyML.cPtr)
      val getOccurrencePosition_ =
        call (getSymbol "gtk_source_search_context_get_occurrence_position")
          (
            GtkSourceSearchContextClass.PolyML.cPtr
             &&> GtkTextIterRecord.PolyML.cPtr
             &&> GtkTextIterRecord.PolyML.cPtr
             --> GInt32.PolyML.cVal
          )
      val getOccurrencesCount_ = call (getSymbol "gtk_source_search_context_get_occurrences_count") (GtkSourceSearchContextClass.PolyML.cPtr --> GInt32.PolyML.cVal)
      val getSettings_ = call (getSymbol "gtk_source_search_context_get_settings") (GtkSourceSearchContextClass.PolyML.cPtr --> GtkSourceSearchSettingsClass.PolyML.cPtr)
      val replace_ =
        call (getSymbol "gtk_source_search_context_replace")
          (
            GtkSourceSearchContextClass.PolyML.cPtr
             &&> GtkTextIterRecord.PolyML.cPtr
             &&> GtkTextIterRecord.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GInt32.PolyML.cVal
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
      val replace2_ =
        call (getSymbol "gtk_source_search_context_replace2")
          (
            GtkSourceSearchContextClass.PolyML.cPtr
             &&> GtkTextIterRecord.PolyML.cPtr
             &&> GtkTextIterRecord.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GInt32.PolyML.cVal
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
      val replaceAll_ =
        call (getSymbol "gtk_source_search_context_replace_all")
          (
            GtkSourceSearchContextClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GInt32.PolyML.cVal
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GUInt32.PolyML.cVal
          )
      val setHighlight_ = call (getSymbol "gtk_source_search_context_set_highlight") (GtkSourceSearchContextClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setMatchStyle_ = call (getSymbol "gtk_source_search_context_set_match_style") (GtkSourceSearchContextClass.PolyML.cPtr &&> GtkSourceStyleClass.PolyML.cOptPtr --> cVoid)
      val setSettings_ = call (getSymbol "gtk_source_search_context_set_settings") (GtkSourceSearchContextClass.PolyML.cPtr &&> GtkSourceSearchSettingsClass.PolyML.cOptPtr --> cVoid)
    end
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
