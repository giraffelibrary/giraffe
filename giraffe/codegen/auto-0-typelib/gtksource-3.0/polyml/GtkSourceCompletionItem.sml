structure GtkSourceCompletionItem :>
  GTK_SOURCE_COMPLETION_ITEM
    where type 'a class = 'a GtkSourceCompletionItemClass.class
    where type 'a completion_proposal_class = 'a GtkSourceCompletionProposalClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_source_completion_item_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ =
        call (getSymbol "gtk_source_completion_item_new")
          (
            Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> GdkPixbufPixbufClass.PolyML.cOptPtr
             &&> Utf8.PolyML.cInOptPtr
             --> GtkSourceCompletionItemClass.PolyML.cPtr
          )
      val newFromStock_ =
        call (getSymbol "gtk_source_completion_item_new_from_stock")
          (
            Utf8.PolyML.cInOptPtr
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInOptPtr
             --> GtkSourceCompletionItemClass.PolyML.cPtr
          )
      val newWithMarkup_ =
        call (getSymbol "gtk_source_completion_item_new_with_markup")
          (
            Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> GdkPixbufPixbufClass.PolyML.cOptPtr
             &&> Utf8.PolyML.cInOptPtr
             --> GtkSourceCompletionItemClass.PolyML.cPtr
          )
    end
    type 'a class = 'a GtkSourceCompletionItemClass.class
    type 'a completion_proposal_class = 'a GtkSourceCompletionProposalClass.class
    type t = base class
    fun asCompletionProposal self = (GObjectObjectClass.FFI.withPtr false ---> GtkSourceCompletionProposalClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new
      (
        label,
        text,
        icon,
        info
      ) =
      (
        Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withPtr 0
         &&&> GdkPixbufPixbufClass.FFI.withOptPtr false
         &&&> Utf8.FFI.withOptPtr 0
         ---> GtkSourceCompletionItemClass.FFI.fromPtr true
      )
        new_
        (
          label
           & text
           & icon
           & info
        )
    fun newFromStock
      (
        label,
        text,
        stock,
        info
      ) =
      (
        Utf8.FFI.withOptPtr 0
         &&&> Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withOptPtr 0
         ---> GtkSourceCompletionItemClass.FFI.fromPtr true
      )
        newFromStock_
        (
          label
           & text
           & stock
           & info
        )
    fun newWithMarkup
      (
        markup,
        text,
        icon,
        info
      ) =
      (
        Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withPtr 0
         &&&> GdkPixbufPixbufClass.FFI.withOptPtr false
         &&&> Utf8.FFI.withOptPtr 0
         ---> GtkSourceCompletionItemClass.FFI.fromPtr true
      )
        newWithMarkup_
        (
          markup
           & text
           & icon
           & info
        )
    local
      open ValueAccessor
    in
      val giconProp =
        {
          name = "gicon",
          gtype = fn () => C.gtype GioIconClass.tOpt (),
          get = fn x => fn () => C.get GioIconClass.tOpt x,
          set = fn x => C.set GioIconClass.tOpt x,
          init = fn x => C.set GioIconClass.tOpt x
        }
      val iconProp =
        {
          name = "icon",
          gtype = fn () => C.gtype GdkPixbufPixbufClass.tOpt (),
          get = fn x => fn () => C.get GdkPixbufPixbufClass.tOpt x,
          set = fn x => C.set GdkPixbufPixbufClass.tOpt x,
          init = fn x => C.set GdkPixbufPixbufClass.tOpt x
        }
      val iconNameProp =
        {
          name = "icon-name",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = fn x => C.set stringOpt x,
          init = fn x => C.set stringOpt x
        }
      val infoProp =
        {
          name = "info",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = fn x => C.set stringOpt x,
          init = fn x => C.set stringOpt x
        }
      val labelProp =
        {
          name = "label",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = fn x => C.set stringOpt x,
          init = fn x => C.set stringOpt x
        }
      val markupProp =
        {
          name = "markup",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = fn x => C.set stringOpt x,
          init = fn x => C.set stringOpt x
        }
      val textProp =
        {
          name = "text",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = fn x => C.set stringOpt x,
          init = fn x => C.set stringOpt x
        }
    end
  end
