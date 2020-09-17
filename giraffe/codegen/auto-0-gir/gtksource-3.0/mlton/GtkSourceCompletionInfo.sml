structure GtkSourceCompletionInfo :>
  GTK_SOURCE_COMPLETION_INFO
    where type 'a class = 'a GtkSourceCompletionInfoClass.class =
  struct
    val getType_ = _import "gtk_source_completion_info_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "gtk_source_completion_info_new" : unit -> GtkSourceCompletionInfoClass.FFI.non_opt GtkSourceCompletionInfoClass.FFI.p;
    val getWidget_ = _import "gtk_source_completion_info_get_widget" : GtkSourceCompletionInfoClass.FFI.non_opt GtkSourceCompletionInfoClass.FFI.p -> GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p;
    val moveToIter_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_source_completion_info_move_to_iter" :
              GtkSourceCompletionInfoClass.FFI.non_opt GtkSourceCompletionInfoClass.FFI.p
               * GtkTextViewClass.FFI.non_opt GtkTextViewClass.FFI.p
               * GtkTextIterRecord.FFI.opt GtkTextIterRecord.FFI.p
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setWidget_ = fn x1 & x2 => (_import "gtk_source_completion_info_set_widget" : GtkSourceCompletionInfoClass.FFI.non_opt GtkSourceCompletionInfoClass.FFI.p * GtkWidgetClass.FFI.opt GtkWidgetClass.FFI.p -> unit;) (x1, x2)
    type 'a class = 'a GtkSourceCompletionInfoClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr false ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr false ---> GtkBuildableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkSourceCompletionInfoClass.FFI.fromPtr false) new_ ()
    fun getWidget self = (GtkSourceCompletionInfoClass.FFI.withPtr false ---> GtkWidgetClass.FFI.fromPtr false) getWidget_ self before GtkSourceCompletionInfoClass.FFI.touchPtr self
    fun moveToIter self (view, iter) =
      (
        GtkSourceCompletionInfoClass.FFI.withPtr false
         &&&> GtkTextViewClass.FFI.withPtr false
         &&&> GtkTextIterRecord.FFI.withOptPtr false
         ---> I
      )
        moveToIter_
        (
          self
           & view
           & iter
        )
    fun setWidget self widget = (GtkSourceCompletionInfoClass.FFI.withPtr false &&&> GtkWidgetClass.FFI.withOptPtr false ---> I) setWidget_ (self & widget)
    local
      open ClosureMarshal Signal
    in
      fun beforeShowSig f = signal "before-show" (void ---> ret_void) f
    end
  end
