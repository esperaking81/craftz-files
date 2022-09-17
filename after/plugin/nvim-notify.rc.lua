local installed, notify = pcall(require, 'notify')

if not installed then
  return
end

vim.notify = notify

notify.setup {
  stages = 'fade_in_slide_out',
  background_colour = 'FloatShadow',
  timeout = 3000,
}
