test_that("Tests généraux", {
  #Test la fonction avec la distance de Levenshtein.
  expect_equal(find_closest_name(
    name = c("Mavs"),
    list_name = c('Pacers', 'Warriors', 'Celtics')
  ), 'Pacers')
  #Suppression des doublons
  expect_equal(find_closest_name (list_name = c('Mavs', 'Mavs', 'Mavs'), c('Mavs')), 'Mavs')

  #Non prise en compte des majuscule
  expect_equal(find_closest_name(
    list_name = c('POUR', 'MAVS', 'POUR'),
    name = c('mavs')
  ), 'MAVS')

  #Renvoie la liste si le nom est vide.
  expect_equal(find_closest_name(
    list_name = c("warrios", "rockets"),
    name = c("")
  ),
  c("warrios", "rockets"))

  #Test de l'erreur sur la taille de chaine de caractères.
  expect_error(
    find_closest_name(list_name = 'One', name = c('one', 'two')),
    "Le nom ne doit contenir qu'une chaine de caractères."
  )
})




