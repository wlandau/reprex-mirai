library(mirai)
daemons(
  n = 1L,
  url = "ws://127.0.0.1:0",
  dispatcher = TRUE,
  seed = NULL,
  token = TRUE,
  retry = TRUE
)
task <- mirai(TRUE)
url <- rownames(status()$daemons)
process <- processx::run(
  command = "R",
  args = c("-e", sprintf("'mirai::daemon(url = \"%s\")'", url)),
  cleanup = TRUE
)

print(task$data)

print(sessionInfo())
