test_that("get_data validates input arguments", {
  expect_error(get_data(NULL))
  expect_error(get_data(123))
})
