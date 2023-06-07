#usethis::edit_r_environ(
#  scope = "project"
#)

con <- DBI::dbConnect(
  RPostgres::Postgres(),
  host = Sys.getenv("DB_HOST"),
  port = Sys.getenv("DB_PORT"),
  user = Sys.getenv("DB_USER"),
  password = Sys.getenv("DB_PASS"),
  dbname = Sys.getenv("DB_NAME")
)


df <- DBI::dbGetQuery(
  con,
  "
SELECT
  filename,
  file_path,
  md5,
  year,
  procesado
FROM
  scraping_precios.a_procesar
WHERE
  procesado = 1 and year > 0
ORDER BY year DESC
"
)

#Equivalente
#
#library(magrittr)

df2 <- con %>%
  dplyr::tbl(
    dbplyr::in_schema(
      "scraping_precios"
      ,
      table = "a_procesar"
    )
  ) %>%
  dplyr::select(
    filename,
    file_path,
    md5,
    year,
    procesado
  ) %>%
  dplyr::filter(
    procesado == 1,
    year > 0
  ) %>%
  dplyr::arrange(
    - year
  )
