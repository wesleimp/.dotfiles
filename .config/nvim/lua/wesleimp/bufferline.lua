local fn = vim.fn

local function diagnostics_indicator(_, _, diagnostics)
    local symbols = { error = ' ', warning = ' ', info = ' ' }
    local result = {}
    for name, count in pairs(diagnostics) do
        if symbols[name] and count > 0 then
            table.insert(result, symbols[name] .. count)
        end
    end
    result = table.concat(result, ' ')
    return #result > 0 and result or ''
end

local function custom_filter(buf, buf_nums)
    local logs = vim.tbl_filter(function(b)
        return vim.bo[b].filetype == 'log'
    end, buf_nums)
    if vim.tbl_isempty(logs) then
        return true
    end
    local tab_num = fn.tabpagenr()
    local last_tab = fn.tabpagenr '$'
    local is_log = vim.bo[buf].filetype == 'log'
    if last_tab == 1 then
        return true
    end
    -- only show log buffers in secondary tabs
    return (tab_num == last_tab and is_log) or (tab_num ~= last_tab and not is_log)
end

require('bufferline').setup {
    options = {
        right_mouse_command = 'vert sbuffer %d',
        middle_mouse_command = 'bdelete! %d',
        diagnostics = 'coc',
        diagnostics_indicator = diagnostics_indicator,
        diagnostics_update_in_insert = false,
        custom_filter = custom_filter,
        offsets = {
            {
                filetype = 'nerdtree',
                text = 'Explorer',
                highlight = 'PanelHeading',
                padding = 1,
            },
        },
    }
}
