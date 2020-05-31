require(foreign)
require(dplyr)
require(readr)

geospatial_coordinates_brazil <- read.dbf("BR_Localidades_2010_v1.dbf")

geospatial_coordinates_brazil %>%
  select(NM_UF, NM_MUNICIP, NM_MICRO, NM_LOCALID, LONG, LAT) %>% 
  mutate_all(list(~iconv(., from = "ISO8859-1", to = "UTF-8"))) %>% 
  filter(NM_UF == "RIO DE JANEIRO",
         grepl("LAGOS|SERRANA|ILHA GRANDE", NM_MICRO)) %>% View
  write_csv("geospatial_coordinates_brazil.csv")

#reference from data: ftp://geoftp.ibge.gov.br/organizacao_do_territorio/estrutura_territorial/localidades/Shapefile_SHP/


