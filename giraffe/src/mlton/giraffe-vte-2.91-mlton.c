/* Copyright (C) 2012, 2016-2018 Phil Clayton <phil.clayton@veonix.com>
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
mlton_vte_terminal_feed_child (VteTerminal *terminal,
                               SML_CVECTOR_VAL(gchar, text),
                               gssize length)
{
  vte_terminal_feed_child (terminal,
                           GET_SML_CVECTOR_VAL(gchar, text),
                           length);
}

void
mlton_vte_terminal_set_colors (VteTerminal *terminal,
                               const GdkRGBA *foreground,
                               const GdkRGBA *background,
                               SML_CVECTOR_VAL(GdkRGBA, palette),
                               gsize palette_size)
{
  vte_terminal_set_colors (terminal,
                           foreground,
                           background,
                           GET_SML_CVECTOR_VAL(GdkRGBA, palette),
                           palette_size);
}

gboolean
mlton_vte_terminal_spawn_sync (VteTerminal *terminal,
                               VtePtyFlags pty_flags,
                               SML_CVECTOR_VAL(gchar, working_directory),
                               SML_CVECTORVECTOR_VAL(gchar, argv),
                               SML_CVECTORVECTOR_VAL(gchar, envv),
                               GSpawnFlags spawn_flags,
                               GSpawnChildSetupFunc child_setup,
                               gpointer child_setup_data,
                               GPid *child_pid,
                               GCancellable *cancellable,
                               GError **error)
{
  return vte_terminal_spawn_sync (terminal,
                                  pty_flags,
                                  GET_SML_CVECTOR_VAL(gchar, working_directory),
                                  GET_SML_CVECTORVECTOR_VAL(gchar, argv),
                                  GET_SML_CVECTORVECTOR_VAL(gchar, envv),
                                  spawn_flags,
                                  child_setup,
                                  child_setup_data,
                                  child_pid,
                                  cancellable,
                                  error);
}
