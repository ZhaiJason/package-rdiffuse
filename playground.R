








# S3 Class and Generic Methods

jason <- list(
    name = "Jason",
    country = "China",
    age = 11,
    grade = c(100, 99, 85, 98)
)

class(jason) <- "Student"

plot.Student <- function(obj) {
    plot(obj$grade)
}

plot(jason)

# S4 Class and Generic Methods
setClass("Student", slots = list(
    name = "character",
    country = "character",
    age = "numeric",
    grade = "numeric"
))

jason <- new(
    "Student",
    name = "Jason Zhai",
    country = "China",
    age = 11,
    grade = c(100, 97, 85, 99)
)

setMethod(
    "plot", "Student",
    function(obj) {
        plot(obj@grade)
    }
)

