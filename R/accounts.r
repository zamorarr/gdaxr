#' List Accounts
#'
#' Get a list of trading accounts.
#' @export
#' @family accounts
#' @references \url{https://docs.gdax.com/#list-accounts}
get_accounts <- function() {
  gdax_get("accounts")
}

#' Get an Account
#'
#' Information for a single account. Use this endpoint when you know the account_id.
#'
#' @param account_id Account Id
#' @export
#' @family accounts
#' @references \url{https://docs.gdax.com/#get-an-account}
get_account <- function(account_id) {
  endpoint <- paste("accounts", account_id, sep = "/")
  gdax_get(endpoint)
}

#' Get Account History
#'
#' List account activity. Account activity either increases or decreases your
#' account balance. Items are paginated and sorted latest first. See the
#' Pagination section for retrieving additional entries after the first page.
#'
#' @param account_id Account Id
#' @export
#' @family accounts
#' @references \url{https://docs.gdax.com/#get-account-history}
get_account_history <- function(account_id) {
  endpoint <- paste("accounts", account_id, "ledger", sep = "/")
  gdax_get(endpoint)
}

#' Get Holds
#'
#' Holds are placed on an account for any active orders or pending withdraw
#' requests. As an order is filled, the hold amount is updated. If an order is
#' canceled, any remaining hold is removed. For a withdraw, once it is
#' completed, the hold is removed.
#'
#' @param account_id Account Id
#' @export
#' @family accounts
#' @references \url{https://docs.gdax.com/#get-account-history}
get_account_holds <- function(account_id) {
  endpoint <- paste("accounts", account_id, "holds", sep = "/")
  gdax_get(endpoint)
}
