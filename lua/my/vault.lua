local VERBOSE_FMT = "%a %B %-d %Y"
local TERSE_FMT = "%a %B %-d"
local TIME_FMT = "%H:%M"
local DATE_FMT = "%Y-%m-%d"
local WEEK_FMT = "%Y-W%V" -- TODO: Need to use "%G" here rather than "%Y" for correctness.

local VAULT_ROOT = vim.fs.normalize(vim.fs.joinpath("~", "Documents", "Vault"))
local INBOX_NOTE = vim.fs.joinpath(VAULT_ROOT, "0 - Index", "Inbox.md")
local DAILY_DIR = vim.fs.joinpath(VAULT_ROOT, "1 - Journal", "Daily")
local WEEKLY_DIR = vim.fs.joinpath(VAULT_ROOT, "1 - Journal", "Weekly")
local FLEETING_NOTES_DIR = vim.fs.joinpath(VAULT_ROOT, "2 - Fleeting Notes")
local ATTACHMENTS_DIR = vim.fs.joinpath(VAULT_ROOT, "8 - Meta", "Attachments")
local TEMPLATES_DIR = vim.fs.joinpath(VAULT_ROOT, "8 - Meta", "Neovim Templates")

local format_date_of_note = function(ctx, fmt, delta_days)
  local epoch = vim.fn.strptime(ctx.template.stem:match("Week") and WEEK_FMT or DATE_FMT, tostring(ctx.target_note.id))
  local delta_secs = (delta_days or 0) * (60 * 60 * 24)
  return vim.fn.strftime(fmt, epoch + delta_secs)
end

return {
  root_dir = VAULT_ROOT,
  inbox_note = INBOX_NOTE,

  ---@module "obsidian"
  ---@type obsidian.workspace.WorkspaceSpec|{}
  personal = {
    name = "Vault",
    path = VAULT_ROOT,
    strict = true,
    ---@type obsidian.config.ClientOpts|{}
    overrides = {
      note_id_func = function(title) return title or vim.fn.strftime(DATE_FMT) end,
      note_path_func = function(spec)
        local filename = string.format("%s.md", spec.id)
        if vim.fn.strptime(DATE_FMT, spec.id) ~= 0 then return vim.fs.joinpath(DAILY_DIR, filename) end
        if vim.fn.strptime(WEEK_FMT, spec.id) ~= 0 then return vim.fs.joinpath(WEEKLY_DIR, filename) end
        return vim.fs.joinpath(FLEETING_NOTES_DIR, filename)
      end,
      disable_frontmatter = true,
      use_advanced_uri = true,
      ---@type obsidian.config.AttachmentsOpts|{}
      attachments = { img_folder = ATTACHMENTS_DIR },
      ---@type obsidian.config.DailyNotesOpts|{}
      daily_notes = { folder = DAILY_DIR, template = "Daily Template.md", workdays_only = false },
      ---@type obsidian.config.TemplateOpts|{}
      templates = {
        folder = TEMPLATES_DIR,
        date_format = DATE_FMT,
        time_format = TIME_FMT,
        substitutions = {
          pretty_date = function(ctx) return format_date_of_note(ctx, VERBOSE_FMT) end,
          week_1st_day = function(ctx) return format_date_of_note(ctx, TERSE_FMT) end,
          week_6th_day = function(ctx) return format_date_of_note(ctx, TERSE_FMT, 6) end,
          curr_iso_date = function(ctx) return format_date_of_note(ctx, DATE_FMT) end,
          prev_iso_date = function(ctx) return format_date_of_note(ctx, DATE_FMT, -1) end,
          next_iso_date = function(ctx) return format_date_of_note(ctx, DATE_FMT, 1) end,
          curr_iso_week = function(ctx) return format_date_of_note(ctx, WEEK_FMT) end,
          prev_iso_week = function(ctx) return format_date_of_note(ctx, WEEK_FMT, -7) end,
          next_iso_week = function(ctx) return format_date_of_note(ctx, WEEK_FMT, 7) end,
          curr_iso_week_number = function(ctx) return format_date_of_note(ctx, "%-V") end,
        },
      },
    },
  },
}
