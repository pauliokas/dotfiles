static const char norm_fg[] = "#FFFFFF";
static const char norm_bg[] = "#292D3E";
static const char norm_border[] = "#676E95";

static const char sel_fg[] = "#FFFFFF";
static const char sel_bg[] = "#C3E88D";
static const char sel_border[] = "#FFFFFF";

static const char urg_fg[] = "#FFFFFF";
static const char urg_bg[] = "#F07178";
static const char urg_border[] = "#F07178";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
    [SchemeUrg] =  { urg_fg,      urg_bg,    urg_border },
};
