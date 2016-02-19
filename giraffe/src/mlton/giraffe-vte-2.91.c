/* Copyright (C) 2012, 2016 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 */

/*
 * Vte C interface support for MLton
 */

#include <vte/vte.h>

#include "mlton/cvector.h"
#include "mlton/cvectorvector.h"
#include "mlton/giraffe-glib-2.0.h"


/* VteTerminal */

void
giraffe_vte_terminal_set_colors (VteTerminal *terminal,
                                 const GdkRGBA *foreground,
                                 const GdkRGBA *background)
{
  vte_terminal_set_colors (terminal,
                           foreground,
                           background,
                           NULL,
                           0);
}

gboolean
giraffe_vte_terminal_spawn_sync (VteTerminal *terminal,
                                 VtePtyFlags pty_flags,
                                 SML_CVECTOR_VAL(gchar, working_directory),
                                 SML_CVECTORVECTOR_VAL(gchar, argv),
                                 SML_CVECTORVECTOR_VAL(gchar, envv),
                                 GSpawnFlags spawn_flags,
                                 guint callback_id,
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
                                  giraffe_spawn_child_setup_dispatch,
                                  GUINT_TO_POINTER(callback_id),
                                  child_pid,
                                  cancellable,
                                  error);
}
