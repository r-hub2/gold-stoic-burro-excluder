## ----include = FALSE----------------------------------------------------------
options(rmarkdown.html_vignette.check_title = FALSE)
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(excluder)

## -----------------------------------------------------------------------------
dplyr::glimpse(qualtrics_raw)
#
# Remove label rows and coerce metadata columns
df <- remove_label_rows(qualtrics_raw) %>%
  dplyr::glimpse()

## ----mark1--------------------------------------------------------------------
# Mark observations run as preview
df %>%
  mark_preview() %>%
  dplyr::glimpse()

## ----mark2--------------------------------------------------------------------
# Mark preview and incomplete observations
df %>%
  mark_preview() %>%
  mark_progress() %>%
  dplyr::glimpse()

## ----mark3--------------------------------------------------------------------
df %>%
  mark_preview() %>%
  mark_duration(min = 500) %>%
  unite_exclusions() %>%
  dplyr::relocate(exclusions, .before = StartDate)

## ----mark4--------------------------------------------------------------------
df %>%
  mark_preview() %>%
  mark_duration(min = 500) %>%
  unite_exclusions(separator = ";", remove = FALSE) %>%
  dplyr::relocate(exclusions, .before = StartDate)

## ----check1-------------------------------------------------------------------
# Check for rows with incomplete data
df %>%
  check_progress()

## ----check2-------------------------------------------------------------------
# Check for rows with durations less than 100 seconds
df %>%
  check_duration(min_duration = 100)

## ----check3-------------------------------------------------------------------
# Check for rows with durations less than 100 seconds in rows that did not complete the survey
df %>%
  check_progress() %>%
  check_duration(min_duration = 100)

## ----mark_check---------------------------------------------------------------
# Check for multiple criteria
df %>%
  mark_preview() %>%
  mark_duration(min = 500) %>%
  unite_exclusions() %>%
  dplyr::filter(exclusions != "")

## ----exclude1-----------------------------------------------------------------
# Exclude survey responses used to preview the survey
df %>%
  exclude_preview() %>%
  dplyr::glimpse()

## ----exclude2-----------------------------------------------------------------
# Exclude preview then incomplete progress rows then duplicate locations and IP addresses
df %>%
  exclude_preview() %>%
  exclude_progress() %>%
  exclude_duplicates(print = FALSE)

## ----quiet--------------------------------------------------------------------
# Turn off marking/checking messages with quiet = TRUE
df %>%
  check_progress(quiet = TRUE)

## ----silent-------------------------------------------------------------------
# Turn off exclusion messages with silent = TRUE
df %>%
  exclude_preview(silent = TRUE) %>%
  exclude_progress(silent = TRUE) %>%
  exclude_duplicates(silent = TRUE)

## ----printoff-----------------------------------------------------------------
# Turn off marking/checking printing data frame with print = FALSE
df %>%
  check_progress(print = FALSE)

## ----deidentify1--------------------------------------------------------------
# Exclude preview then incomplete progress rows
df %>%
  exclude_preview() %>%
  exclude_progress() %>%
  exclude_duplicates() %>%
  deidentify() %>%
  dplyr::glimpse()

## ----deidentify2--------------------------------------------------------------
# Exclude preview then incomplete progress rows
df %>%
  exclude_preview() %>%
  exclude_progress() %>%
  exclude_duplicates() %>%
  deidentify(strict = FALSE) %>%
  dplyr::glimpse()

