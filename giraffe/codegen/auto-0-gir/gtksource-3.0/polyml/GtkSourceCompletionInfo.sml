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
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr ---> GtkBuildableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkSourceCompletionInfoClass.FFI.fromPtr false) new_ ()
    fun getWidget self = (GtkSourceCompletionInfoClass.FFI.withPtr ---> GtkWidgetClass.FFI.fromPtr false) getWidget_ self
    fun moveToIter self view iter =
      (
        GtkSourceCompletionInfoClass.FFI.withPtr
         &&&> GtkTextViewClass.FFI.withPtr
         &&&> GtkTextIterRecord.FFI.withOptPtr
         ---> I
      )
        moveToIter_
        (
          self
           & view
           & iter
        )
    fun setWidget self widget = (GtkSourceCompletionInfoClass.FFI.withPtr &&&> GtkWidgetClass.FFI.withOptPtr ---> I) setWidget_ (self & widget)
    local
      open ClosureMarshal Signal
    in
      fun beforeShowSig f = signal "before-show" (void ---> ret_void) f
    end
  end
