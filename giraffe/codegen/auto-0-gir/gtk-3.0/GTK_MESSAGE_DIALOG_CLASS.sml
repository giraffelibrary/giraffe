signature GTK_MESSAGE_DIALOG_CLASS =
  sig
    type 'a message_dialog
    type 'a dialog_class
    include
      CLASS
        where type 'a class = 'a message_dialog dialog_class
    val t : (base class, 'a class) GObject.Value.accessor
    val tOpt : (base class option, 'a class option) GObject.Value.accessor
  end
