test_that("Different tests", {
  #Test sur une station existante ne renvoie pas d'erreur
  expect_no_error(get_waiting_time('AMER'))
  #Test sur la prise en compte des majuscules
  expect_equal(get_waiting_time('AMer'),get_waiting_time('AMER'))
  #Test sur une station inexistante
  expect_error(get_waiting_time('AAZ'),".*")
})
