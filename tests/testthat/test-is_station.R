test_that("Nom des arrêts qui existent ou non", {
  expect_false(is_station("TENNIS"),FALSE)
  expect_true(is_station("Bruneau"),TRUE)
  expect_true(is_station("bRuNeAu"),TRUE)
  expect_warning(is_station(1),"Il faut rentrer une chaine de caractères.")
})
