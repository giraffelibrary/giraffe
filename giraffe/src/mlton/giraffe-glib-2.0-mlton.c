/* Copyright (C) 2012, 2016-2018 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 */

/*
 * GLib C interface support for MLton
 */

#include "cvector.h"
#include "cvectorvector.h"


/* GQuark */

GQuark
mlton_g_quark_from_string (SML_CVECTOR_VAL(gchar, string))
{
  return g_quark_from_string (GET_SML_CVECTOR_VAL(gchar, string));
}


/* GLib */

gboolean
mlton_g_shell_parse_argv (SML_CVECTOR_VAL(gchar, command_line),
                          gint *argcp,
                          SML_CVECTORVECTOR_REF(gchar, argvp),
                          GError **error)
{
  return g_shell_parse_argv (GET_SML_CVECTOR_VAL(gchar, command_line),
                             argcp,
                             GET_SML_CVECTORVECTOR_REF(gchar, argvp),
                             error);
}

gchar *
mlton_g_shell_quote (SML_CVECTOR_VAL(gchar, unquoted_string))
{
  return g_shell_quote (GET_SML_CVECTOR_VAL(gchar, unquoted_string));
}

gchar *
mlton_g_shell_unquote (SML_CVECTOR_VAL(gchar, quoted_string),
                       GError **error)
{
  return g_shell_unquote (GET_SML_CVECTOR_VAL(gchar, quoted_string),
                          error);
}

gboolean
mlton_g_spawn_async_with_pipes (SML_CVECTOR_VAL(gchar, working_directory),
                                SML_CVECTORVECTOR_VAL(gchar, argv),
                                SML_CVECTORVECTOR_VAL(gchar, envp),
                                GSpawnFlags flags,
                                GSpawnChildSetupFunc child_setup,
                                gpointer user_data,
                                GPid *child_pid,
                                gint *standard_input,
                                gint *standard_output,
                                gint *standard_error,
                                GError **error)
{
  return g_spawn_async_with_pipes (GET_SML_CVECTOR_VAL(gchar, working_directory),
                                   GET_SML_CVECTORVECTOR_VAL(gchar, argv),
                                   GET_SML_CVECTORVECTOR_VAL(gchar, envp),
                                   flags,
                                   child_setup,
                                   user_data,
                                   child_pid,
                                   standard_input,
                                   standard_output,
                                   standard_error,
                                   error);
}
