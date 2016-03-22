structure GioApplicationCommandLineClass :>
  GIO_APPLICATION_COMMAND_LINE_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a application_command_line = unit
    type 'a class = 'a application_command_line class
  end
