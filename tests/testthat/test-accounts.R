context("accounts")

test_that("accounts are listed correctly", {
  accounts <- with_mock_API(get_accounts())

  expect_identical(length(accounts), 2L)
  expect_identical(length(accounts[[1]]), 6L)
  expect_identical(length(accounts[[2]]), 6L)

  expect_identical(accounts[[1]][["id"]], "71452118-efc7-4cc4-8780-a5e22d4baa53")
  expect_identical(accounts[[1]][["currency"]], "BTC")
  expect_identical(accounts[[1]][["balance"]], "0.0000000000000000")

  expect_identical(accounts[[2]][["available"]], "79.2266348066930000")
  expect_identical(accounts[[2]][["hold"]], "1.0035025000000000")
  expect_identical(accounts[[2]][["profile_id"]], "75da88c5-05bf-4f54-bc85-5c775bd68254")
})

test_that("single account is listed correctly", {
  id <- "a1b2c3d4"
  account <- with_mock_API(get_account(id))

  expect_identical(length(account), 6L)
  expect_identical(account[["id"]], id)
  expect_identical(account[["currency"]], "USD")
  expect_identical(account[["balance"]], "1.100")
  expect_identical(account[["available"]], "1.00")
  expect_identical(account[["hold"]], "0.100")
})

test_that("account history is listed correctly", {
  id <- "100"
  account_history <- with_mock_API(get_account_history(id))
  hist1 <- account_history[[1]]

  expect_identical(length(account_history), 1L)
  expect_identical(hist1[["id"]], id)
  expect_identical(hist1[["created_at"]], "2014-11-07T08:19:27.028459Z")
  expect_identical(hist1[["amount"]], "0.001")
  expect_identical(hist1[["balance"]], "239.669")
  expect_identical(hist1[["type"]], "fee")
  expect_identical(hist1[["details"]], list(
    "order_id" = "d50ec984-77a8-460a-b958-66f114b0de9b",
    "trade_id" = "74",
    "product_id" = "BTC-USD"
  ))
})

test_that("account holds are is listed correctly", {
  id <- "82dcd140-c3c7-4507-8de4-2c529cd1a28f"
  account_holds <- with_mock_API(get_account_holds(id))
  hold1 <- account_holds[[1]]

  expect_identical(length(account_holds), 1L)
  expect_identical(hold1[["id"]], id)
  expect_identical(hold1[["account_id"]], "e0b3f39a-183d-453e-b754-0c13e5bab0b3")
  expect_identical(hold1[["created_at"]], "2014-11-06T10:34:47.123456Z")
  expect_identical(hold1[["updated_at"]], "2014-11-06T10:40:47.123456Z")
  expect_identical(hold1[["amount"]], "4.23")
  expect_identical(hold1[["type"]], "order")
  expect_identical(hold1[["ref"]], "0a205de4-dd35-4370-a285-fe8fc375a273")
})



