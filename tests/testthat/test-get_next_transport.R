test_that("Différents tests", {
  #Test simple sur le fonctionnement
  expect_no_error(get_next_transport("Commerce"))
  #Test si la fonction renvoie un vecteurs d'éléments
  expect_no_error(get_next_transport('Morr'))
})

