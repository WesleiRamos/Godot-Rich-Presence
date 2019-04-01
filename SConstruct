#!python
import os

# platform= makes it in line with Godots scons file, keeping p for backwards compatibility
platform = ARGUMENTS.get("platform", ARGUMENTS.get("p", "windows"))
target_arch = ARGUMENTS.get("a", ARGUMENTS.get("arch", 32))

# This makes sure to keep the session environment variables on windows, 
# that way you can run scons in a vs 2017 prompt and it will find all the required tools
env = Environment()
if platform == "windows":
	env = Environment(ENV = os.environ)

target_path = "bin/"
target_name = "librichpresence"
godot_cpp_library = "godot-cpp"
godot_headers_path = "../godot-cpp/godot_headers"
godot_bindings_path = "../godot-cpp"
discord_rpc_path = "../discord-rpc"

# default to debug build, must be same setting as used for cpp_bindings
target = ARGUMENTS.get("target", "debug")


if ARGUMENTS.get("use_llvm", "no") == "yes":
	env["CXX"] = "clang++"

def add_sources(sources, dir):
	for f in os.listdir(dir):
		if f.endswith(".cpp"):
			sources.append(dir + "/" + f)


# put stuff that is the same for all first, saves duplication 
if platform == "osx":
	env.Append(CCFLAGS = ["-g","-O3", "-arch", "x86_64"])
	env.Append(LINKFLAGS = ["-arch", "x86_64", "-framework", "Cocoa", "-Wl,-undefined,dynamic_lookup"])
	
	target_path += "osx"


elif platform == "linux":
	env.Append(CCFLAGS = ["-g","-O3", "-std=c++14", "-Wno-writable-strings"])
	env.Append(LINKFLAGS = ["-Wl,-R,\"$$ORIGIN\""])
	
	target_path += "linux" + str(target_arch)


elif platform == "windows":
	if target == "debug":
		env.Append(CCFLAGS = ["-EHsc", "-D_DEBUG", "-MDd"])
	else:
		env.Append(CCFLAGS = ["-O2", "-EHsc", "-DNDEBUG", "-MD"])
	
	target_path += "win" + str(target_arch)


env.Append(CPPPATH=[
	godot_headers_path,
	discord_rpc_path + "/include",
	discord_rpc_path + "/src",
	godot_bindings_path + "/include",
	godot_bindings_path + "/include/gen",
	godot_bindings_path + "/include/core",
])


godot_cpp_library = "lib{}.{}.{}.{}".format(godot_cpp_library, platform, target, target_arch)
env.Append(LIBPATH=[ godot_bindings_path + "/bin", discord_rpc_path + "/lib" ])
env.Append(LIBS=[ godot_cpp_library, "discord-rpc", "Advapi32"])

sources = []
add_sources(sources, "src")

library = env.SharedLibrary(target=target_path + "/" + target_name, source=sources)
Default(library)