local minimal_todo = {}
--- minimal_todo simple way of tracking current goal per project.

minimal_todo.buf_id = 0

local function open_window()
	-- Define the content for the floating window
	local content = {
		"This is a floating window!",
		"You can put any content here.",
		"You can even use Neovim's syntax highlighting.",
		"Enjoy experimenting with Lua in Neovim!",
	}

	-- Define the options for the floating window
	local opts = {
		relative = "win",
		width = 40,
		height = 5,
		bufpos = { 5, 100 },
		style = "minimal",
	}

	minimal_todo.buf_id = vim.api.nvim_create_buf(true, false)
	-- Create the floating window using nvim_open_win function

	local win_id = vim.api.nvim_open_win(minimal_todo.buf_id, false, opts)

	-- Set the content of the floating window
	vim.api.nvim_buf_set_lines(minimal_todo.buf_id, 0, -1, false, content)

	-- Return the window ID of the created floating window
	return win_id
end

local function close_window()
	vim.api.nvim_buf_detach({ minimal_todo.buf_id })
end

minimal_todo.setup = function(_)
	vim.api.nvim_create_user_command("MiniTodoOpen", function()
		open_window()
	end, {})
	vim.api.nvim_create_user_command("MiniTodoClose", function()
		close_window()
	end, {})
end

return minimal_todo
