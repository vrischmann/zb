local function goBuild(args)
  local actualArgs = {
    name = args.name;
    ["in"] = args.input;
    builder = "/bin/sh";
    system = "x86_64-linux";
  }

  -- local script = "\z
  --     export GOCACHE=$(pwd)/cache\n\z
  --
  --     /usr/bin/go build -C $in -o $out "..args.name.."\n"

  local script = string.format([[
      export GOCACHE=$(pwd)/cache

      /usr/bin/go build -C $in -o $out %s
  ]], args.name)

  actualArgs.args = { toFile(actualArgs.name.."-builder.sh", script) }

  return derivation(actualArgs)
end

local function goBuild2(args)
  local actualArgs = {
    name = args.name;
    ["in"] = args.input;
    builder = "/home/vincent/tmp/build-for-zb/build-for-zb";
    system = "x86_64-linux";
  }

  return derivation(actualArgs)
end

return goBuild {
  name = "foo";
  input = path "foo";
}
