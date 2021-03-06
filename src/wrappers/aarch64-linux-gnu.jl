# Autogenerated wrapper script for SDL2_gfx_jll for aarch64-linux-gnu
export libsdl2_gfx

using SDL2_jll
## Global variables
PATH = ""
LIBPATH = ""
LIBPATH_env = "LD_LIBRARY_PATH"

# Relative path to `libsdl2_gfx`
const libsdl2_gfx_splitpath = ["lib", "libSDL2_gfx.so"]

# This will be filled out by __init__() for all products, as it must be done at runtime
libsdl2_gfx_path = ""

# libsdl2_gfx-specific global declaration
# This will be filled out by __init__()
libsdl2_gfx_handle = C_NULL

# This must be `const` so that we can use it with `ccall()`
const libsdl2_gfx = "libSDL2_gfx-1.0.so.0"


"""
Open all libraries
"""
function __init__()
    global artifact_dir = abspath(artifact"SDL2_gfx")

    # Initialize PATH and LIBPATH environment variable listings
    global PATH_list, LIBPATH_list
    # We first need to add to LIBPATH_list the libraries provided by Julia
    append!(LIBPATH_list, [joinpath(Sys.BINDIR, Base.LIBDIR, "julia"), joinpath(Sys.BINDIR, Base.LIBDIR)])
    # From the list of our dependencies, generate a tuple of all the PATH and LIBPATH lists,
    # then append them to our own.
    foreach(p -> append!(PATH_list, p), (SDL2_jll.PATH_list,))
    foreach(p -> append!(LIBPATH_list, p), (SDL2_jll.LIBPATH_list,))

    global libsdl2_gfx_path = normpath(joinpath(artifact_dir, libsdl2_gfx_splitpath...))

    # Manually `dlopen()` this right now so that future invocations
    # of `ccall` with its `SONAME` will find this path immediately.
    global libsdl2_gfx_handle = dlopen(libsdl2_gfx_path)
    push!(LIBPATH_list, dirname(libsdl2_gfx_path))

    # Filter out duplicate and empty entries in our PATH and LIBPATH entries
    filter!(!isempty, unique!(PATH_list))
    filter!(!isempty, unique!(LIBPATH_list))
    global PATH = join(PATH_list, ':')
    global LIBPATH = join(LIBPATH_list, ':')

    # Add each element of LIBPATH to our DL_LOAD_PATH (necessary on platforms
    # that don't honor our "already opened" trick)
    #for lp in LIBPATH_list
    #    push!(DL_LOAD_PATH, lp)
    #end
end  # __init__()

