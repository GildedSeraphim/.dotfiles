{ pkgs, config, ... }:
{
  home.packages = with pkgs; [
    glava
  ];
  xdg.configFile."glava/circle.glsl".text = with config.lib.stylix.colors; ''
/* center radius (pixels) */
#define C_RADIUS 128
/* center line thickness (pixels) */
#define C_LINE 3
/* outline color */
#define OUTLINE #${base0C}
/* Amplify magnitude of the results each bar displays */
#define AMPLIFY 150
/* Angle (in radians) for how much to rotate the visualizer */
#define ROTATE (PI / 2)
/* Whether to switch left/right audio buffers */
#define INVERT 0
/* Whether to fill in the space between the line and inner circle */
#define C_FILL 1
/* Whether to apply a post-processing image smoothing effect
   1 to enable, 0 to disable. Only works with `xroot` transparency,
   and improves performance if disabled. */
#define C_SMOOTH 1

/* Gravity step, overrude frin `smooth_parameters.glsl` */
#request setgravitystep 6.0

/* Smoothing factor, override from `smooth_parameters.glsl` */
#request setsmoothfactor 0.01
  '';

  xdg.configFile."glava/bars.glsl".text = with config.lib.stylix.colors; ''
/* Center line thickness (pixels) */
#define C_LINE 1
/* Width (in pixels) of each bar */
#define BAR_WIDTH 4
/* Width (in pixels) of each bar gap */
#define BAR_GAP 2
/* Outline color */
#define BAR_OUTLINE #${base0B}
/* Outline width (in pixels, set to 0 to disable outline drawing) */
#define BAR_OUTLINE_WIDTH 1
/* Amplify magnitude of the results each bar displays */
#define AMPLIFY 200
/* Whether the current settings use the alpha channel;
   enabling this is required for alpha to function
   correctly on X11 with `"native"` transparency. */
#define USE_ALPHA 0
/* How strong the gradient changes */
#define GRADIENT_POWER 30
/* Bar color changes with height */
#define GRADIENT (d / GRADIENT_POWER + 1)
/* Bar color */
#define COLOR (#${base0C} * GRADIENT)
/* Direction that the bars are facing, 0 for inward, 1 for outward */
#define DIRECTION 0
/* Whether to switch left/right audio buffers */
#define INVERT 0
/* Whether to flip the output vertically */
#define FLIP 0
/* Whether to mirror output along `Y = X`, causing output to render on the left side of the window */
/* Use with `FLIP 1` to render on the right side */
#define MIRROR_YX 0
  '';
  xdg.configFile."glava/radial.glsl".text = with config.lib.stylix.colors; ''
/* center radius (pixels) */
#define C_RADIUS 128
/* center line thickness (pixels) */
#define C_LINE 0
/* outline color */
#define OUTLINE #${base0B}
/* number of bars (use even values for best results) */
#define NBARS 400
/* width (in pixels) of each bar*/
#define BAR_WIDTH 5
/* outline color */
#define BAR_OUTLINE OUTLINE
/* outline width (in pixels, set to 0 to disable outline drawing) */
#define BAR_OUTLINE_WIDTH 0
/* Amplify magnitude of the results each bar displays */
#define AMPLIFY 350
/* Bar color */
#define COLOR (#${base0C} * ((d / 40) + 1))
/* Angle (in radians) for how much to rotate the visualizer */
#define ROTATE (PI / 2)
/* Whether to switch left/right audio buffers */
#define INVERT 0
/* Aliasing factors. Higher values mean more defined and jagged lines.
   Note: aliasing does not have a notable impact on performance, but requires
   `xroot` transparency to be enabled since it relies on alpha blending with
   the background. */
#define BAR_ALIAS_FACTOR 1.2
#define C_ALIAS_FACTOR 1.8
/* Offset (Y) of the visualization */
#define CENTER_OFFSET_Y -16
/* Offset (X) of the visualization */
#define CENTER_OFFSET_X 0

/* Gravity step, override from `smooth_parameters.glsl` */
#request setgravitystep 5.0

/* Smoothing factor, override from `smooth_parameters.glsl` */
#request setsmoothfactor 0.02
  '';
  xdg.configFile."glava/rc.glsl".text = ''

/* The module to use. A module is a set of shaders used to produce
   the visualizer. The structure for a module is the following:
   
   module_name [directory]
       1.frag [file: fragment shader],
       2.frag [file: fragment shader],
       ...
       
   Shaders are loaded in numerical order, starting at '1.frag',
   continuing indefinitely. The results of each shader (except
   for the final pass) is given to the next shader in the list
   as a 2D sampler.
   
   See documentation for more details. */
#request mod radial

/* Window hints */
#request setfloating  false
#request setdecorated true
#request setfocused   false
#request setmaximized true

/* Set window background opacity mode. Possible values are:
   
   "native" - True transparency provided by the compositor. Can
              reduce performance on some systems, depending on
              the compositor used.
   
   "xroot"  - Maintain a copy of the root window's pixmap
              (usually the desktop background) to provide a
              pseudo-transparent effect. Useful when no compositor
              is available or native transparency isn't nessecary.
              Has very little performance impact.
    
   "none"   - Disable window opacity completely. */
#request setopacity "native"

/* Whether to mirror left and right audio input channels from PulseAudio.*/
#request setmirror false

/* OpenGL context and GLSL shader versions, do not change unless
   you *absolutely* know what you are doing. */
#request setversion 3 3
#request setshaderversion 330

/* Window title */
#request settitle "GLava"

/* Window geometry (x, y, width, height) */
#request setgeometry 0 0 800 600

/* Window background color (RGB format).
   Does not work with `setopacity "xroot"` */
#request setbg 00000000

/* (X11 only) EWMH Window type. Possible values are:
   
   "desktop", "dock",   "toolbar", "menu",
   "utility", "splash", "dialog",  "normal"
   
   This will set _NET_WM_WINDOW_TYPE to _NET_WM_WINDOW_TYPE_(TYPE),
   where (TYPE) is the one of the window types listed (after being
   converted to uppercase).
   
   Alternatively, you can set this value to "!", which will cause
   the window to be unmanaged. If this is set, then `addxwinstate`
   will do nothing, but you can use "!+" and "!-" to stack on top
   or below other windows.
*/
#request setxwintype "normal"

/* (X11 only) EWMH Window state atoms (multiple can be specified).
   Possible values are:
   
   "modal", "sticky", "maximized_vert", "maximized_horz",
   "shaded", "skip_taskbar", "skip_pager", "hidden", "fullscreen",
   "above", "below", "demands_attention", "focused", "pinned"
   
   This will add _NET_WM_STATE_(TYPE) atoms to _NET_WM_STATE,
   where (TYPE) is one of the window states listed (after being
   converted to uppercase).
   
   The lines below (commented out by default) are of relevance
   if you are trying to get GLava to behave as a desktop widget
   and your WM is not correctly responding to the "desktop" value
   for `setxwintype`.
*/
#request addxwinstate "sticky"
#request addxwinstate "skip_taskbar"
#request addxwinstate "skip_pager"
// #request addxwinstate "above"
#request addxwinstate "pinned"

/* (X11 only) Use the XShape extension to support clicking through
   the GLava window. Useful when you want to interact with other
   desktop windows (icons, menus, desktop shells). Enabled by
   default when GLava itself is a desktop window. */
#request setclickthrough true

/* Audio source

   When the "pulseaudio" backend is set, this can be a number or
   a name of an audio sink or device to record from. Set to "auto"
   to use the default output device.
   
   When the "fifo" backend is set, "auto" is interpreted as
   "/tmp/mpd.fifo". Otherwise, a valid path should be provided. */
#request setsource "auto"

/* Buffer swap interval (vsync), set to '0' to prevent
   waiting for refresh, '1' (or more) to wait for the specified
   amount of frames. */
#request setswap 1

/* Linear interpolation for audio data frames. Drastically
   improves smoothness with configurations that yield low UPS
   (`setsamplerate` and `setsamplesize`), or monitors that have
   high refresh rates.
   
   This feature itself, however, will effect performance as it
   will have to interpolate data every frame on the CPU. It will
   automatically (and temporarily) disable itself if the update
   rate is close to, or higher than the framerate:
   
   if (update_rate / frame_rate > 0.9) disable_interpolation;
   
   This will delay data output by one update frame, so it can
   desync audio with visual effects on low UPS configs. */
#request setinterpolate true

/* Frame limiter, set to the frames per second (FPS) desired or
   simply set to zero (or lower) to disable the frame limiter. */
#request setframerate 0

/* Suspends rendering if a fullscreen window is focused while
   GLava is still visible (ie. on another monitor). This prevents
   rendering from interfering with other graphically intensive
   tasks.

   If GLava is minimized or completely obscured, it will not
   render regardless of this option. */
#request setfullscreencheck false

/* Enable/disable printing framerate every second. 'FPS' stands
   for 'Frames Per Second', and 'UPS' stands for 'Updates Per
   Second'. Updates are performed when new data is submitted
   by pulseaudio, and require transformations to be re-applied
   (thus being a good measure of how much work your CPU has to
   perform over time) */
#request setprintframes true

/* PulseAudio sample buffer size. Lower values result in more
   frequent audio updates (also depends on sampling rate), but
   will also require all transformations to be applied much 
   more frequently (CPU intensive).
   
   High (>2048, with 22050 Hz) values will decrease accuracy
   (as some signals can be missed by transformations like FFT)
   
   The following settings (@22050 Hz) produce the listed rates: 
   
   Sample    UPS                  Description
   - 2048 -> 43.0  (low accuracy, cheap), use with < 60 FPS
   - 1024 -> 86.1  (high accuracy, expensive), use with >= 60 FPS
   -  512 -> 172.3 (extreme accuracy, very expensive), use only
                   for graphing accurate spectrum data with
                   custom modules.
   
   If the framerate drops below the update rate, the update rate
   will be locked to the framerate (to prevent wasting CPU time).
   This behaviour means you can use a 1024 sample size on a 60Hz
   monitor with vsync enabled to get 60FPS and 60UPS.
   
   For high refresh rate monitors (120+ Hz), it's recommended to
   also stick with the 1024 sample size and use interpolation to
   smooth the data, as accuracy beyond this setting is mostly
   meaningless for visual purposes.
*/
#request setsamplesize 1024

/* Audio buffer size to be used for processing and shaders. 
   Increasing this value can have the effect of adding 'gravity'
   to FFT output, as the audio signal will remain in the buffer
   longer.

   This value has a _massive_ effect on FFT performance and
   quality for some modules. */
#request setbufsize 4096

/* PulseAudio sample rate. Lower values can add 'gravity' to
   FFT output, but can also reduce accuracy. Most hardware
   samples at 44100Hz.
   
   Lower sample rates also can make output more choppy, when
   not using interpolation. It's generally OK to leave this
   value unless you have a strange PulseAudio configuration.

   This option does nothing when using the "fifo" audio
   backend. Instead, an ideal rate should be be configured
   in the application generating the output. */
#request setsamplerate 22050

/*                    ** DEPRECATED **
   Force window geometry (locking the window in place), useful
   for some pesky WMs that try to reposition the window when
   embedding in the desktop.
   
   This routinely sends X11 events and should be avoided. */
#request setforcegeometry false

/*                    ** DEPRECATED **
   Force window to be raised (focused in some WMs), useful for
   WMs that have their own stacking order for desktop windows.
   
   This routinely sends X11 events and should be avoided. */
#request setforceraised false

/*                    ** DEPRECATED **
   Scale down the audio buffer before any operations are 
   performed on the data. Higher values are faster.
   
   This value can affect the output of various transformations,
   since it applies (crude) averaging to the data when shrinking
   the buffer. It is reccommended to use `setsamplerate` and
   `setsamplesize` to improve performance or accuracy instead. */
#request setbufscale 1
  '';  
}