signature GIO_APPLICATION_COMMAND_LINE_CLASS =
  sig
    type 'a application_command_line
    include
      CLASS
        where type 'a class = 'a application_command_line GObject.ObjectClass.class
    val t : (base class, 'a class) GObject.Value.accessor
    val tOpt : (base class option, 'a class option) GObject.Value.accessor
  end
