context("auth")

test_that("hmac works as expected", {
  actual <- digest::hmac("secret", "hello", "sha256", raw = FALSE)
  expected <- "88aab3ede8d3adf94d26ab90d3bafd4a2083070c3bcce9c014ee04a443847c0b"

  expect_equal(actual, expected)
})

test_that("access signature returns correct value", {
  timestamp <- "100"
  request_path <- "/fakeendpoint"

  actual <- withr::with_envvar(
    c("GDAX_SECRET" = "c2VjcmV0"), # base64enc::base64encode(charToRaw("secret"))
    access_signature(timestamp, request_path, method = "get"))
  expected <- "atTiWZobS4YinvcMW5EiZHioVyq7oBjJm60VXsFANTI="

  expect_equal(actual, expected)
})
