# new_git_repository(
#     name = "exceptxx",
#     build_file = "//3rd/build_files:exceptxx.BUILD.bzl",
#     commit = "728a61e30ea536e790216e8b5081834de09e3578",
#     remote = "https://github.com/SergiusTheBest/exceptxx.git",
# )

load("@rules_cc//cc:defs.bzl", "cc_library")

package(default_visibility = ["//visibility:public"])

cc_library(
    name = "exceptxx",
    hdrs = glob(["include/exceptxx/**/*.h"]),
    includes = ["include"],
)
