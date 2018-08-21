/* Copyright (C) 2012, 2016-2017 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 */

/*
 * Vte C interface support for MLton
 */

#include "cvector.h"
#include "cvectorvector.h"


/* VteTerminal */

void
mlton_vte_terminal_set_colors (VteTerminal *terminal,
                               const GdkColor *foreground,
                               const GdkColor *background,
                               SML_CVECTOR_VAL(GdkColor, palette),
                               glong palette_size)
{
  vte_terminal_set_colors (terminal,
                           foreground,
                           background,
                           GET_SML_CVECTOR_VAL(GdkColor, palette),
                           palette_size);
}

void
mlton_vte_terminal_set_rgba (VteTerminal *terminal,
                             const GdkRGBA *foreground,
                             const GdkRGBA *background,
                             SML_CVECTOR_VAL(GdkRGBA, palette),
                             gsize palette_size)
{
  vte_terminal_set_colors_rgba (terminal,
                                foreground,
                                background,
                                GET_SML_CVECTOR_VAL(GdkRGBA, palette),
                                palette_size);
}

void
mlton_vte_terminal_set_font_from_string (VteTerminal *terminal,
                                         SML_CVECTOR_VAL(gchar, name))
{
  vte_terminal_set_font_from_string (terminal,
                                     GET_SML_CVECTOR_VAL(gchar, name));
}

gboolean
mlton_vte_terminal_fork_command_full (VteTerminal *terminal,
                                      VtePtyFlags pty_flags,
                                      SML_CVECTOR_VAL(gchar, working_directory),
                                      SML_CVECTORVECTOR_VAL(gchar, argv),
                                      SML_CVECTORVECTOR_VAL(gchar, envp),
                                      GSpawnFlags spawn_flags,
                                      GSpawnChildSetupFunc child_setup,
                                      gpointer child_setup_data,
                                      GPid *child_pid,
                                      GError **error)
{
  return vte_terminal_fork_command_full (terminal,
                                         pty_flags,
                                         GET_SML_CVECTOR_VAL(gchar, working_directory),
                                         GET_SML_CVECTORVECTOR_VAL(gchar, argv),
                                         GET_SML_CVECTORVECTOR_VAL(gchar, envp),
                                         spawn_flags,
                                         child_setup,
                                         child_setup_data,
                                         child_pid,
                                         error);
}
