structure GtkSourceCompletionInfo :>
  GTK_SOURCE_COMPLETION_INFO
    where type 'a class = 'a GtkSourceCompletionInfoClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtksourceview "gtk_source_completion_info_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libgtksourceview "gtk_source_completion_info_new") (PolyMLFFI.cVoid --> GtkSourceCompletionInfoClass.PolyML.cPtr)
      val getWidget_ = call (load_sym libgtksourceview "gtk_source_completion_info_get_widget") (GtkSourceCompletionInfoClass.PolyML.cPtr --> GtkWidgetClass.PolyML.cPtr)
      val moveToIter_ =
        call (load_sym libgtksourceview "gtk_source_completion_info_move_to_iter")
          (
            GtkSourceCompletionInfoClass.PolyML.cPtr
             &&> GtkTextViewClass.PolyML.cPtr
             &&> GtkTextIterRecord.PolyML.cOptPtr
             --> PolyMLFFI.cVoid
          )
      val setWidget_ = call (load_sym libgtksourceview "gtk_source_completion_info_set_widget") (GtkSourceCompletionInfoClass.PolyML.cPtr &&> GtkWidgetClass.PolyML.cOptPtr --> PolyMLFFI.cVoid)
    end
    type 'a class = 'a GtkSourceCompletionInfoClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.C.withPtr ---> AtkImplementorIfaceClass.C.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkSourceCompletionInfoClass.C.fromPtr false) new_ ()
    fun getWidget self = (GtkSourceCompletionInfoClass.C.withPtr ---> GtkWidgetClass.C.fromPtr false) getWidget_ self
    fun moveToIter self view iter =
      (
        GtkSourceCompletionInfoClass.C.withPtr
         &&&> GtkTextViewClass.C.withPtr
         &&&> GtkTextIterRecord.C.withOptPtr
         ---> I
      )
        moveToIter_
        (
          self
           & view
           & iter
        )
    fun setWidget self widget = (GtkSourceCompletionInfoClass.C.withPtr &&&> GtkWidgetClass.C.withOptPtr ---> I) setWidget_ (self & widget)
    local
      open ClosureMarshal Signal
    in
      fun beforeShowSig f = signal "before-show" (void ---> ret_void) f
    end
  end
