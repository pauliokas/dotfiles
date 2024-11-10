return {
	{
		"mfussenegger/nvim-dap",
		config = function()
			local dap = require("dap")
			vim.keymap.set("n", "<Leader>dt", dap.toggle_breakpoint)
			vim.keymap.set("n", "<Leader>dc", dap.continue)

			dap.adapters["pwa-node"] = {
				type = "server",
				host = "localhost",
				port = "${port}",
				executable = {
					command = "node",

					-- download from https://github.com/microsoft/vscode-js-debug/releases
					args = { vim.fn.stdpath("data") .. "/debugging/js-debug/src/dapDebugServer.js", "${port}" },
				},
			}

			dap.configurations.javascript = {
				{
					type = "pwa-node",
					request = "launch",
					name = "Launch file",
					program = "${file}",
					cwd = "${workspaceFolder}",
				},
			}

			dap.configurations.typescript= {
				{
					type = "pwa-node",
					request = "launch",
					name = "Launch file",
					program = "${file}",
					cwd = "${workspaceFolder}",
				},
			}

			dap.adapters.node2 = {
				type = "executable",
				command = "node",

        -- git clone https://github.com/microsoft/vscode-node-debug2.git
				args = { vim.fn.stdpath("data") .. "/vscode-node-debug2/out/src/nodeDebug.js" },
			}
		end,
	},
	{
		"rcarriga/nvim-dap-ui",
		dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")

			dap.listeners.before.attach.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.launch.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated.dapui_config = function()
				dapui.close()
			end
			dap.listeners.before.event_exited.dapui_config = function()
				dapui.close()
			end
		end,
	},
}
