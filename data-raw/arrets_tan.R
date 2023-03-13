#Importation de la base.
base <- jsonlite::fromJSON("https://open.tan.fr/ewp/arrets.json")
base <- base[,-3] #Conservations des colonnes: codeLieu, Libelle et ligne

#Arangements sur la base.
arrets_tan <- data.frame(codeLieu = character(), libelle = character(), ligne = character())
for (i in 1:nrow(base)) {
  dim_t_ligne <- dim(base[i, 3][[1]])
  if (dim_t_ligne[1] == 0) {
    arrets_tan <- rbind(arrets_tan, cbind(base[i, 1],base[i, 2],"NA"))
  }
  else {
    for (j in 1:dim_t_ligne[1]) {
      arrets_tan <- rbind(arrets_tan, cbind(base[i, 1], base[i, 2], base[i, 3][[1]][j, 1]))
    }
  }
}
colnames(arrets_tan)<-c("codeLieu","libelle","ligne")
#usethis::use_data(arrets_tan, overwrite = TRUE)



