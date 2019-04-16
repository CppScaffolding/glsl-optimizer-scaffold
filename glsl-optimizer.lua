-- scaffold geniefile for glsl-optimizer

glsl-optimizer_script = path.getabsolute(path.getdirectory(_SCRIPT))
glsl-optimizer_root = path.join(glsl-optimizer_script, "glsl-optimizer")

glsl-optimizer_includedirs = {
	path.join(glsl-optimizer_script, "config"),
	glsl-optimizer_root,
}

glsl-optimizer_libdirs = {}
glsl-optimizer_links = {}
glsl-optimizer_defines = {}

----
return {
	_add_includedirs = function()
		includedirs { glsl-optimizer_includedirs }
	end,

	_add_defines = function()
		defines { glsl-optimizer_defines }
	end,

	_add_libdirs = function()
		libdirs { glsl-optimizer_libdirs }
	end,

	_add_external_links = function()
		links { glsl-optimizer_links }
	end,

	_add_self_links = function()
		links { "glsl-optimizer" }
	end,

	_create_projects = function()

project "glsl-optimizer"
	kind "StaticLib"
	language "C++"
	flags {}

	includedirs {
		glsl-optimizer_includedirs,
	}

	defines {}

	files {
		path.join(glsl-optimizer_script, "config", "**.h"),
		path.join(glsl-optimizer_root, "**.h"),
		path.join(glsl-optimizer_root, "**.cpp"),
	}

end, -- _create_projects()
}

---
