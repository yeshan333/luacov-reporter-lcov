package.path = "./?.lua;./?/init.lua;" .. package.path
package.loaded["luacov.reporter.lcov"] = nil

describe("luacov.reporter.lcov", function()
	local lcov_reporter = require "luacov.reporter.lcov"

	it("fails when a source file cannot be processed", function()
		local ok, err = pcall(
			lcov_reporter.LcovReporter.on_file_error,
			lcov_reporter.LcovReporter,
			"example.lua",
			"load",
			"line 3: unexpected symbol near 'return'"
		)

		assert.is_false(ok)
		assert.equals(
			"Could not load example.lua: line 3: unexpected symbol near 'return'",
			err
		)
	end)
end)
